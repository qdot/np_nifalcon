/*
 * Implementation file for Novint Falcon Max/Pd External
 *
 * Copyright (c) 2005-2009 Kyle Machulis/Nonpolynomial Labs <kyle@nonpolynomial.com>
 *
 * More info on Nonpolynomial Labs @ http://www.nonpolynomial.com
 *
 * Sourceforge project @ http://www.github.com/qdot/np_nifalcon
 *
 * Example code from flext tutorials. http://www.parasitaere-kapazitaeten.net/ext/flext/
 */


#ifndef FLEXT_THREADS
#define FLEXT_THREADS
#endif

// include flext header
#include <flext.h>

//god damnit, cycling '74.
#ifdef PI
#undef PI
#endif

#include "falcon/core/FalconDevice.h"
#include "falcon/grip/FalconGripFourButton.h"
#include "falcon/kinematic/FalconKinematicStamper.h"
#include "falcon/firmware/FalconFirmwareNovintSDK.h"
#include "falcon/util/FalconFirmwareBinaryNvent.h"

// check for appropriate flext version
#if !defined(FLEXT_VERSION) || (FLEXT_VERSION < 400)
#error You need at least flext version 0.4.0
#endif

// implementation file, just use the namespace and make life easier.
using namespace libnifalcon;

class np_nifalcon:
	// inherit from basic flext class
	public flext_base
{
	// obligatory flext header (class name,base class name)
	FLEXT_HEADER(np_nifalcon,flext_base)

	// Same as boost ScopedMutex, just using flext's mutex class.
	class ScopedMutex
	{
		ScopedMutex() {}
		
	public:
		ScopedMutex(ThrMutex& tm)
		{
			m = &tm;
			m->Lock();
		}
		
		~ScopedMutex()
		{
			m->Unlock();
		}
	private:
		ThrMutex* m;
	};

public:
	// constructor
	np_nifalcon() :
		m_deviceIndex(-1),
		m_runThread(false),
		m_isInited(false),
		m_inRawMode(true),
		m_errorCount(0),
		m_ledState(0),
		m_homingMode(false),
		m_showIOError(false),
		m_hasUpdated(false),
		m_alwaysOutput(false),
		m_falconDevice(new FalconDevice()),
		motor_changed(false),
		coordinate_changed(false),
		homing_state(false),
		button_state(0)
	{
		// object setup
		
		for(int i = 0; i < 3; ++i)
		{
			m_motorVectorForce[i] = 0;
			m_motorRawForce[i] = 0;
		}

		m_falconDevice->setFalconFirmware<FalconFirmwareNovintSDK>();
		m_falconDevice->setFalconGrip<FalconGripFourButton>();
		m_falconDevice->setFalconKinematic<FalconKinematicStamper>();

		// external setup
		AddInAnything("Command Input");
		AddInList("Motor - Raw input to motors (3 ints)");
		AddInList("Motor - Forces as cartesian vector (3 floats)");
		AddInList("LEDS (RGB, 3 Ints)");
		AddInInt("Homing Mode");
		AddOutBang("Bangs on successful connection/command");
		AddOutList("Encoder Values (Top, right, left when looking at front of falcon)");
		AddOutList("Cartesian Position (X, Y, Z of the end effector in relation to the fixed frame origin)");
		AddOutList("Buttons - Digital");
		AddOutList("Button - Analog");
		AddOutInt("Homing Status");

		FLEXT_ADDMETHOD_(0, "open", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "init", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "show_ioerror", nifalcon_anything);

		FLEXT_ADDMETHOD_(0, "auto_poll", nifalcon_auto_poll);
		FLEXT_ADDMETHOD_(0, "manual_poll", nifalcon_manual_poll);
		FLEXT_ADDMETHOD_(0, "start", nifalcon_start_thread);
		FLEXT_ADDMETHOD_(0, "update", nifalcon_update_loop);
		FLEXT_ADDMETHOD_(0, "output", nifalcon_output);
		FLEXT_ADDMETHOD_(0, "count", nifalcon_count);
		FLEXT_ADDMETHOD_(0, "nvent_firmware", nifalcon_nvent_firmware);
		FLEXT_ADDMETHOD_(0, "close", nifalcon_close);
		FLEXT_ADDMETHOD_(0, "stop", nifalcon_stop);
		FLEXT_ADDMETHOD_(0, "raw", nifalcon_raw);
		FLEXT_ADDMETHOD_(0, "vector", nifalcon_vector);

		FLEXT_ADDMETHOD(1, nifalcon_motor_raw);
		FLEXT_ADDMETHOD(2, nifalcon_motor_vector);
		FLEXT_ADDMETHOD(3, nifalcon_led);
		FLEXT_ADDMETHOD(4, nifalcon_homing_mode);

		post("Novint Falcon External v1.5");
		post("by Nonpolynomial Labs (http://www.nonpolynomial.com)");
		post("Updates at http://www.github.com/qdot/np_nifalcon");
		post("Compiled on " __DATE__ " " __TIME__);

	}

	
	virtual void Exit()
	{
		if(m_runThread)
		{
			post("np_nifalcon %d: Shutting down IO thread", m_deviceIndex);
			m_runThread = false;
			m_threadCond.Wait();
		}
		m_falconDevice->close();
		flext_base::Exit();
	}

	virtual ~np_nifalcon()
	{
		m_updateMutex.Unlock();
		m_ioMutex.Unlock();	   
	}

protected:
	boost::shared_ptr<FalconDevice> m_falconDevice;
	int m_deviceIndex;
	bool m_inRawMode;
	bool m_isInited;
	bool m_runThread;
	bool m_showIOError;
	int m_errorCount;
	int m_ledState;
	boost::array<double,3> m_motorVectorForce;
	boost::array<int,3> m_motorRawForce;
	bool m_homingMode;
	bool m_hasUpdated;
	bool m_alwaysOutput;
	ThrCond m_threadCond;
	ThrMutex m_updateMutex;
	ThrMutex m_ioMutex;
	t_atom motor_list[3];
	t_atom coordinate_list[3];
	t_atom button_list[4];
	bool motor_changed;
	bool coordinate_changed;
	bool homing_state;
	uint8_t button_state;

	void nifalcon_count()
	{
		unsigned int count;
		if(!m_falconDevice->getDeviceCount(count))
		{
			post("np_nifalcon: Error while counting devices");
			return;
		}
		post("np_nifalcon: Falcons Available: %d", count);
	}

	void nifalcon_auto_poll()
	{
		post("np_nifalcon %d: Turning on auto polling mode", m_deviceIndex);
		m_alwaysOutput = true;
	}

	void nifalcon_manual_poll()
	{
		post("np_nifalcon %d: Turning on manual polling mode", m_deviceIndex);
		m_alwaysOutput = false;
	}

	void nifalcon_raw()
	{
		post("np_nifalcon %d: Falcon force input now in raw mode", m_deviceIndex);
		m_inRawMode = true;
	}

	void nifalcon_vector()
	{
		post("np_nifalcon %d: Falcon force input now in vector mode", m_deviceIndex);
		m_inRawMode = false;			
	}

	void nifalcon_nvent_firmware()
	{
		if(!m_falconDevice->isOpen())
		{
			post("np_nifalcon: Falcon not open");
			return;
		}
		if(m_falconDevice->isFirmwareLoaded())
		{
			m_isInited = true;
			post("np_nifalcon %d: Firmware already loaded, no need to reload...", m_deviceIndex);
			return;
		}
		for(int i = 0; i < 10; ++i)
		{
			if(!m_falconDevice->getFalconFirmware()->loadFirmware(false, NOVINT_FALCON_NVENT_FIRMWARE_SIZE, const_cast<uint8_t*>(NOVINT_FALCON_NVENT_FIRMWARE)))
			{
				m_falconDevice->close();
				if(!m_falconDevice->open(0))
				{
					post("Cannot open falcon - Error: %d", m_falconDevice->getErrorCode());
					return;
				}
			}
			else
			{
				m_isInited = true;
				break;
			}
		}
		if(m_isInited)
			post("np_nifalcon: loading nvent firmware finished");
		else
			post("np_nifalcon: loading nvent firmware FAILED");		
	}

	void nifalcon_close()
	{
		if(!m_falconDevice->isOpen())
		{
			post("np_nifalcon: Falcon not open");
			return;
		}
		m_isInited = false;
		if(m_runThread)
		{
			m_runThread = false;
			m_threadCond.Wait();
		}
		m_falconDevice->close();
		post("np_nifalcon %d: Falcon closed", m_deviceIndex);
		m_deviceIndex = -1;
		return;
	}
	
	void nifalcon_anything(const t_symbol *msg,int argc,t_atom *argv)
	{
		ScopedMutex s(m_updateMutex);
		if(!strcmp(msg->s_name, "open"))
		{
			if(m_falconDevice->isOpen())
			{
				post("np_nifalcon %d: Falcon already open", m_deviceIndex);
				return;
			}
			int index = -1;
			if(argc == 1) index = GetInt(argv[0]);
			else index = 0;
			post("np_nifalcon: Opening first falcon found");
			if(!m_falconDevice->open(index))
			{
				post("np_nifalcon: Cannot open falcon %d - Error: %d", index, m_falconDevice->getErrorCode());
				return;
			}
			m_deviceIndex = index;
			post("np_nifalcon %d: Opened", m_deviceIndex);
			return;
		}
		else if (!strcmp(msg->s_name, "init"))
		{
			if(!m_falconDevice->isOpen())
			{
				post("np_nifalcon: Falcon not open");
				return;
			}
			if(m_falconDevice->isFirmwareLoaded())
			{
				m_isInited = true;
				post("np_nifalcon %d: Firmware already loaded, no need to reload...", m_deviceIndex);
				return;
			}
			if(!m_falconDevice->setFirmwareFile(GetString(argv[0])))
			{
				post("np_nifalcon %d: Cannot find firmware file %s", m_deviceIndex, GetString(argv[0]));
				return;
			}
			if(!m_falconDevice->loadFirmware(10, false))
			{
				post("np_nifalcon %d: Could not load firmware: %d", m_deviceIndex, m_falconDevice->getErrorCode());
				return;
			}
			m_isInited = true;
			post("np_nifalcon %d: Falcon init finished", m_deviceIndex);
		}
		else if (!strcmp(msg->s_name, "show_ioerror"))
		{
			if(!m_showIOError)
			{
				m_showIOError = true;
				post("np_nifalcon: Now showing IO errors");
			}
			else
			{
				m_showIOError = false;
				post("np_nifalcon: Now hiding IO errors");
			}
		}
		else
		{
			post("np_nifalcon: not a valid np_nifalcon message: %s", msg->s_name);
		}
	}

	void nifalcon_stop()
	{
		if(!m_falconDevice->isOpen())
		{
			post("np_nifalcon: Falcon not open");
			return;
		}
		if(!m_runThread)
		{
			post("np_nifalcon %d: No thread running", m_deviceIndex);
			return;
		}
		m_runThread = false;
		post("np_nifalcon %d: Waiting for thread stop", m_deviceIndex);
		m_threadCond.Wait();
		post("np_nifalcon %d: Input thread stopped", m_deviceIndex);
		return;
	}
	
	void nifalcon_update_loop()
	{
		if(m_falconDevice->runIOLoop(FalconDevice::FALCON_LOOP_FIRMWARE | FalconDevice::FALCON_LOOP_GRIP | (m_inRawMode ? 0 : FalconDevice::FALCON_LOOP_KINEMATIC)))
		{
			{
				//lock to make sure we don't try to bang out half updated information 
				ScopedMutex m(m_ioMutex);
				int i = 0, buttons = 0;
				//t_atom analog_list[];
				motor_changed = false;
				coordinate_changed = false;
				m_hasUpdated = true;
				//Output encoder values
				for(i = 0; i < 3; ++i)
				{
					if(GetInt(motor_list[i]) == (m_falconDevice->getFalconFirmware()->getEncoderValues())[i]) continue;
					motor_changed = true;
					SetInt(motor_list[i], m_falconDevice->getFalconFirmware()->getEncoderValues()[i]);
				}
				if(motor_changed && m_alwaysOutput) ToOutList(1, 3, motor_list);

				//Output kinematics values
				for(i = 0; i < 3; ++i)
				{
					if(GetFloat(coordinate_list[i]) == m_falconDevice->getPosition()[i]) continue;
					coordinate_changed = true;
					SetFloat(coordinate_list[i], m_falconDevice->getPosition()[i]);
				}
				if(coordinate_changed && m_alwaysOutput) ToOutList(2, 3, coordinate_list);
				
				//Output digital values
				buttons = m_falconDevice->getFalconGrip()->getDigitalInputs();
				if(button_state != buttons)
				{
					for(i = 0; i < 4; ++i)
					{
						SetInt(button_list[i], buttons & (1 << i));
					}
					button_state = buttons;
					if(m_alwaysOutput) ToOutList(3, 4, button_list);
				}			

				//Output analog values
				//We don't have analog values yet. Nothing will leave this output until I figured out analog. Implement later.
				
				//Output homing values
				if(m_falconDevice->getFalconFirmware()->isHomed() != homing_state)
				{
					homing_state = m_falconDevice->getFalconFirmware()->isHomed();
					if(m_alwaysOutput) ToOutInt(5, homing_state);
				}
				if(m_alwaysOutput) ToOutBang(0);
			}
			
			{
				//lock to make sure we don't try to update information from a patch while it's written to the device object 
				ScopedMutex t(m_updateMutex);
				//Now that we're done parsing what we got back, set the new internal values
				if(!m_inRawMode)
				{
					m_falconDevice->setForce(m_motorVectorForce);
				}
				else
				{
					m_falconDevice->getFalconFirmware()->setForces(m_motorRawForce);
				}
				
				m_falconDevice->getFalconFirmware()->setHomingMode(m_homingMode);
				
				m_falconDevice->getFalconFirmware()->setLEDStatus(m_ledState);
			}
		}
		else
		{
			++m_errorCount;
			if(m_showIOError) post("np_nifalcon: IO Loop Error %d : %d", m_errorCount, m_falconDevice->getErrorCode());
		}
		usleep(1000);
	}

	void nifalcon_output()
	{
		if(!m_hasUpdated) return;
		ScopedMutex s(m_ioMutex);
		if(motor_changed) ToOutList(1, 3, motor_list);
		if(coordinate_changed) ToOutList(2, 3, coordinate_list);
		ToOutList(3, 4, button_list);
		ToOutInt(5, homing_state);
		ToOutBang(0);
		m_hasUpdated = false;
	}
	
	void nifalcon_start_thread()
	{
		if(!m_falconDevice->isOpen())				
		{
			post("np_nifalcon: Falcon not open");
			return;
		}
		if(m_runThread)
		{
			post("Thread already running");
			return;
		}
		if(!m_isInited)
		{
			post("Falcon must be initialized to start");
			return;
		}
		m_runThread = true;

		while(m_runThread)
		{
			nifalcon_update_loop();
			m_threadCond.Signal();
		}
	}
	
	void nifalcon_motor_raw(int motor_1, int motor_2, int motor_3)
	{
		ScopedMutex s(m_updateMutex);
		if(!m_inRawMode)
		{
			post("np_nifalcon: Falcon in vector force mode, raw input ignored");
			return;
		}
		m_motorRawForce[0] = motor_1;
		m_motorRawForce[1] = motor_2;
		m_motorRawForce[2] = motor_3;

	}

	void nifalcon_motor_vector(float x, float y, float z)
	{
		ScopedMutex s(m_updateMutex);
		if(m_inRawMode)
		{
			post("np_nifalcon: Falcon in raw mode, vector force input ignored");
			return;
		}
		m_motorVectorForce[0] = x;
		m_motorVectorForce[1] = y;
		m_motorVectorForce[2] = z;
	}

	void nifalcon_led(int red, int green, int blue)
	{
		ScopedMutex s(m_updateMutex);
		if(red > 0) m_ledState |= FalconFirmware::RED_LED;
		else m_ledState &= ~FalconFirmware::RED_LED;
		if(green > 0) m_ledState |= FalconFirmware::GREEN_LED;
		else m_ledState &= ~FalconFirmware::GREEN_LED;
		if(blue > 0) m_ledState |= FalconFirmware::BLUE_LED;
		else m_ledState &= ~FalconFirmware::BLUE_LED;
	}

	void nifalcon_homing_mode(long t)
	{
		ScopedMutex s(m_updateMutex);
		m_homingMode = (t > 0);
	}

private:
	FLEXT_CALLBACK_A(nifalcon_anything)
	FLEXT_CALLBACK(nifalcon_raw)
	FLEXT_CALLBACK(nifalcon_vector)
	FLEXT_CALLBACK(nifalcon_manual_poll)
	FLEXT_CALLBACK(nifalcon_auto_poll)
	FLEXT_CALLBACK(nifalcon_count)
	FLEXT_CALLBACK(nifalcon_nvent_firmware)
	FLEXT_CALLBACK(nifalcon_stop)
	FLEXT_CALLBACK(nifalcon_close)
	FLEXT_CALLBACK(nifalcon_update_loop)
	FLEXT_CALLBACK(nifalcon_output)
	FLEXT_CALLBACK_III(nifalcon_motor_raw)
	FLEXT_CALLBACK_FFF(nifalcon_motor_vector)
	FLEXT_CALLBACK_III(nifalcon_led)
	FLEXT_CALLBACK_I(nifalcon_homing_mode)
	FLEXT_THREAD(nifalcon_start_thread)
};

FLEXT_NEW("np_nifalcon", np_nifalcon)



