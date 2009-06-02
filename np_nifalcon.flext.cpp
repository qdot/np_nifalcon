/*
 * Implementation file for Novint Falcon Max/Pd External
 *
 * Copyright (c) 2005-2008 Kyle Machulis/Nonpolynomial Labs <kyle@nonpolynomial.com>
 *
 * More info on Nonpolynomial Labs @ http://www.nonpolynomial.com
 *
 * Sourceforge project @ http://www.sourceforge.net/projects/libnifalcon/
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
#if defined(NIFALCON_LIBFTDI)
#include "falcon/comm/FalconCommLibFTDI.h"
#elif defined(NIFALCON_LIBUSB)
#include "falcon/comm/FalconCommLibUSB.h"
#elif defined(NIFALCON_FTD2XX)
#include "falcon/comm/FalconCommFTD2XX.h"
#endif
#include "falcon/grip/FalconGripFourButton.h"
#include "falcon/kinematic/FalconKinematicStamper.h"
#include "falcon/firmware/FalconFirmwareNovintSDK.h"
#include "falcon/util/FalconFirmwareBinaryNvent.h"


#if !defined(FLEXT_VERSION) || (FLEXT_VERSION < 400)
#error You need at least flext version 0.4.0
#endif

using namespace libnifalcon;

// check for appropriate flext version

class np_nifalcon:
	// inherit from basic flext class
	public flext_base
{
	// obligatory flext header (class name,base class name)
	FLEXT_HEADER(np_nifalcon,flext_base)

	public:
	// constructor
	np_nifalcon() : m_runThread(false), m_isInited(false), m_inRawMode(true), m_errorCount(0), m_ledState(0), m_homingMode(false), m_showIOError(false)
	{
#if defined(NIFALCON_LIBFTDI)
		m_falconDevice.setFalconComm<FalconCommLibFTDI>();
#elif defined(NIFALCON_LIBUSB)
		m_falconDevice.setFalconComm<FalconCommLibUSB>();
#elif defined(NIFALCON_FTD2XX)
		m_falconDevice.setFalconComm<FalconCommFTD2XX>();
#endif
		m_falconDevice.setFalconFirmware<FalconFirmwareNovintSDK>();
		m_falconDevice.setFalconGrip<FalconGripFourButton>();
		m_falconDevice.setFalconKinematic<FalconKinematicStamper>();

		for(int i = 0; i < 3; ++i)
		{
			m_motorVectorForce[i] = 0;
			m_motorRawForce[i] = 0;
		}

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

		FLEXT_ADDMETHOD_(0, "start", nifalcon_update);
		FLEXT_ADDMETHOD_(0, "open", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "count", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "init", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "nvent_firmware", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "close", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "stop", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "raw", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "vector", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "show_ioerror", nifalcon_anything);
		FLEXT_ADDMETHOD(1, nifalcon_motor_raw);
		FLEXT_ADDMETHOD(2, nifalcon_motor_vector);
		FLEXT_ADDMETHOD(3, nifalcon_led);
		FLEXT_ADDMETHOD(4, nifalcon_homing_mode);

		post("Novint Falcon External v1.0.3");
		post("by Nonpolynomial Labs (http://www.nonpolynomial.com)");
		post("Updates at http://libnifalcon.sourceforge.net");
	}

	virtual void Exit()
	{
		shutdown();
		flext_base::Exit();
	}

	virtual ~np_nifalcon()
	{
	}

protected:
	FalconDevice m_falconDevice;
	bool m_inRawMode;
	bool m_isInited;
	bool m_runThread;
	bool m_showIOError;
	int m_errorCount;
	int m_ledState;
	boost::array<double,3> m_motorVectorForce;
	boost::array<int,3> m_motorRawForce;
	bool m_homingMode;
	ThrCond m_threadCond;
	ThrMutex m_threadMutex;

	void shutdown()
	{
		if(m_runThread)
		{
			post("Shutting down IO thread");
			m_runThread = false;
			m_threadCond.Wait();
		}
		m_falconDevice.close();
	}

	void nifalcon_post_error()
	{
		//post("np_nifalcon error: %d %s", mFalcon.falcon_status_code, nifalcon_get_error_string(&mFalcon));
	}

	void nifalcon_anything(const t_symbol *msg,int argc,t_atom *argv)
	{
		if(!strcmp(msg->s_name, "open"))
		{
			if(argc == 1)
			{
				post("np_nifalcon: Opening falcon %d", GetInt(argv[0]));
				if(!m_falconDevice.open(GetInt(argv[0])))
				{
					post("Cannot open falcon - Error: %d", m_falconDevice.getErrorCode());
					return;
				}
			}
			else
			{
				post("np_nifalcon: Opening first falcon found");
				if(!m_falconDevice.open(0))
				{
					post("Cannot open falcon - Error: %d", m_falconDevice.getErrorCode());
					return;
				}
			}
			post("np_nifalcon: Opened");
			return;
		}
		else if(!strcmp(msg->s_name, "count"))
		{
			unsigned int count;
			if(!m_falconDevice.getDeviceCount(count))
			{
				post("np_nifalcon: Error while counting devices");
			}
			post("np_nifalcon: Falcons Available: %d", count);
		}
		else if(!strcmp(msg->s_name, "stop"))
		{
			if(!m_runThread)
			{
				post("No thread running");
				return;
			}
			m_runThread = false;
			m_threadCond.Wait();
			post("Input thread stopped");
			return;
		}
		else if (!strcmp(msg->s_name, "init"))
		{
			if(m_falconDevice.isFirmwareLoaded())
			{
				m_isInited = true;
				post("np_nifalcon: Firmware already loaded, no need to reload...");
				return;
			}
			if(!m_falconDevice.setFirmwareFile(GetString(argv[0])))
			{
				post("np_nifalcon: Cannot find firmware file %s", GetString(argv[0]));
				return;
			}
			if(!m_falconDevice.loadFirmware(10, false))
			{
				post("np_nifalcon, Could not load firmware: %d");
				return;
			}
			m_isInited = true;
			post("np_nifalcon: Falcon init finished");
		}
		else if (!strcmp(msg->s_name, "nvent_firmware"))
		{
			if(m_falconDevice.isFirmwareLoaded())
			{
				m_isInited = true;
				post("np_nifalcon: Firmware already loaded, no need to reload...");
				return;
			}
			for(int i = 0; i < 10; ++i)
			{
				if(m_falconDevice.getFalconFirmware()->loadFirmware(false, NOVINT_FALCON_NVENT_FIRMWARE_SIZE, const_cast<uint8_t*>(NOVINT_FALCON_NVENT_FIRMWARE)))
				{
					m_falconDevice.close();
					if(!m_falconDevice.open(0))
				{
						post("Cannot open falcon - Error: %d", m_falconDevice.getErrorCode());
						return;
					}

					m_isInited = true;
					break;
				}
			}
			if(m_isInited)
				post("np_nifalcon: loading nvent firmware finished");
			else
				post("np_nifalcon: loading nvent firmware FAILED");
		}

		else if (!strcmp(msg->s_name, "close"))
		{
			m_isInited = false;
			if(m_runThread)
			{
				m_runThread = false;
				m_threadCond.Wait();
			}
			m_falconDevice.close();
			post("np_nifalcon: Falcon closed");
			return;
		}
		else if (!strcmp(msg->s_name, "raw"))
		{
			post("np_nifalcon: Falcon force input now in raw mode");
			m_inRawMode = true;
		}
		else if (!strcmp(msg->s_name, "vector"))
		{
			post("np_nifalcon: Falcon force input now in vector mode");
			m_inRawMode = false;
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
			post("not a valid np_nifalcon message: %s", msg->s_name);
		}
	}

	void nifalcon_update()
	{
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

		int i = 0, buttons = 0;
		bool homing_state = false;
		int16_t motor_state[3] = {0, 0, 0};
		float coordinate_state[3] = {0.0, 0.0, 0.0};
		uint8_t button_state = 0;

		t_atom motor_list[3];
		for(i = 0; i < 3; ++i) SetInt(motor_list[i], 0);
		t_atom coordinate_list[3];
		for(i = 0; i < 3; ++i) SetFloat(coordinate_list[i], 0);
		t_atom button_list[4];
		for(i = 0; i < 4; ++i) SetInt(button_list[i], 0);
		//t_atom analog_list[];
		bool motor_changed = false;
		bool coordinate_changed = false;

		while(1)
		{
			if(!m_runThread)
			{
				break;
			}

			m_threadMutex.Lock();

			if(!m_inRawMode)
			{
				m_falconDevice.setForce(m_motorVectorForce);
			}
			else
			{
				m_falconDevice.getFalconFirmware()->setForces(m_motorRawForce);
			}

			m_falconDevice.getFalconFirmware()->setHomingMode(m_homingMode);

			m_falconDevice.getFalconFirmware()->setLEDStatus(m_ledState);
			m_threadMutex.Unlock();

			if(m_falconDevice.runIOLoop(FalconDevice::FALCON_LOOP_FIRMWARE | FalconDevice::FALCON_LOOP_GRIP | (m_inRawMode ? 0 : FalconDevice::FALCON_LOOP_KINEMATIC)))
			{
				motor_changed = false;
				coordinate_changed = false;

				//Output encoder values
				for(i = 0; i < 3; ++i)
				{
					if(motor_state[i] != m_falconDevice.getFalconFirmware()->getEncoderValues()[i])
					{
						motor_state[i] = m_falconDevice.getFalconFirmware()->getEncoderValues()[i];
						SetInt(motor_list[i], motor_state[i]);
						motor_changed = true;
					}
				}
				if(motor_changed) ToOutList(1, 3, motor_list);

				//Output kinematics values
				for(i = 0; i < 3; ++i)
				{
					if(coordinate_state[i] != m_falconDevice.getPosition()[i])
					{
						coordinate_state[i] = m_falconDevice.getPosition()[i];
						SetFloat(coordinate_list[i], coordinate_state[i]);
						coordinate_changed = true;
					}
				}
				if(coordinate_changed) ToOutList(2, 3, coordinate_list);

				//Output digital values
				buttons = m_falconDevice.getFalconGrip()->getDigitalInputs();
				if(button_state != buttons)
				{
					for(i = 0; i < 4; ++i)
					{
						SetInt(button_list[i], buttons & (1 << i));
					}
					button_state = buttons;
					ToOutList(3, 4, button_list);
				}

				//Output analog values
				//We don't have analog values yet. Nothing will leave this output until I figured out analog. Implement later.

				//Output homing values
				if(m_falconDevice.getFalconFirmware()->isHomed() != homing_state)
				{
					homing_state = m_falconDevice.getFalconFirmware()->isHomed();
					ToOutInt(5, homing_state);
				}
				ToOutBang(0);
			}
			else
			{
				++m_errorCount;
				if(m_showIOError) post("np_nifalcon: IO Loop Error %d : %d", m_errorCount, m_falconDevice.getErrorCode());
			}
            flext::ThrYield();
		}
		m_threadCond.Signal();
	}

	void nifalcon_motor_raw(int motor_1, int motor_2, int motor_3)
	{
		m_threadMutex.Lock();
		if(!m_inRawMode) post("np_nifalcon: Falcon in vector force mode, raw input ignored");
		m_motorRawForce[0] = motor_1;
		m_motorRawForce[1] = motor_2;
		m_motorRawForce[2] = motor_3;
		m_threadMutex.Unlock();

	}

	void nifalcon_motor_vector(float x, float y, float z)
	{
		m_threadMutex.Lock();
		if(m_inRawMode) post("np_nifalcon: Falcon in raw mode, vector force input ignored");
		m_motorVectorForce[0] = x;
		m_motorVectorForce[1] = y;
		m_motorVectorForce[2] = z;
		m_threadMutex.Unlock();
	}

	void nifalcon_led(int red, int green, int blue)
	{
		m_threadMutex.Lock();
		if(red > 0) m_ledState |= FalconFirmware::RED_LED;
		else m_ledState &= ~FalconFirmware::RED_LED;
		if(green > 0) m_ledState |= FalconFirmware::GREEN_LED;
		else m_ledState &= ~FalconFirmware::GREEN_LED;
		if(blue > 0) m_ledState |= FalconFirmware::BLUE_LED;
		else m_ledState &= ~FalconFirmware::BLUE_LED;
		m_threadMutex.Unlock();
	}

	void nifalcon_homing_mode(long t)
	{
		m_threadMutex.Lock();
		m_homingMode = (t > 0);
		m_threadMutex.Unlock();
	}

private:
	FLEXT_CALLBACK_A(nifalcon_anything)
	FLEXT_CALLBACK_III(nifalcon_motor_raw)
	FLEXT_CALLBACK_FFF(nifalcon_motor_vector)
	FLEXT_CALLBACK_III(nifalcon_led)
	FLEXT_CALLBACK_I(nifalcon_homing_mode)
	FLEXT_THREAD(nifalcon_update)
};

FLEXT_NEW("np_nifalcon", np_nifalcon)



