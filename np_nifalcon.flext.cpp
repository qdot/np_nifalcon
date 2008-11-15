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
#include "falcon/core/FalconDevice.h"
#include "falcon/comm/FalconCommLibFTDI.h"
#include "falcon/grip/FalconGripFourButton.h"
#include "falcon/kinematic/FalconKinematicStamper.h"
#include "falcon/firmware/FalconFirmwareNovintSDK.h"

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
	np_nifalcon() : m_runThread(false), m_isInited(false), m_inRawMode(true), m_errorCount(0)
	{
		m_falconDevice.setFalconComm<FalconCommLibFTDI>();
		m_falconDevice.setFalconFirmware<FalconFirmwareNovintSDK>();
		m_falconDevice.setFalconGrip<FalconGripFourButton>();

		AddInAnything("Command Input");		
		AddInInt("Motor 1 - Torque");
		AddInInt("Motor 2 - Torque");
		AddInInt("Motor 3 - Torque");
		AddInInt("LED - Red");
		AddInInt("LED - Green");
		AddInInt("LED - Blue");
		AddInInt("Homing Mode");
		AddOutBang("Bangs on successful connection/command");
		AddOutInt("Motor 1 - Encoder");
		AddOutInt("Motor 2 - Encoder");
		AddOutInt("Motor 3 - Encoder");
		AddOutInt("Button 1");
		AddOutInt("Button 2");
		AddOutInt("Button 3");
		AddOutInt("Button 4");		
		AddOutInt("Homing Status");

		FLEXT_ADDMETHOD_(0, "start", nifalcon_update);
		FLEXT_ADDMETHOD_(0, "open", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "count", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "init", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "close", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "stop", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "raw", nifalcon_anything);
		FLEXT_ADDMETHOD_(0, "kinematic", nifalcon_anything);
		FLEXT_ADDMETHOD(1, nifalcon_motor1);
		FLEXT_ADDMETHOD(2, nifalcon_motor2);
		FLEXT_ADDMETHOD(3, nifalcon_motor3);
		FLEXT_ADDMETHOD(4, nifalcon_led_r);
		FLEXT_ADDMETHOD(5, nifalcon_led_g);
		FLEXT_ADDMETHOD(6, nifalcon_led_b);
		FLEXT_ADDMETHOD(7, nifalcon_homing_mode);

		post("Novint Falcon External, by Nonpolynomial Labs. Based on Flext");
	} 
	 
	virtual ~np_nifalcon()
	{
		//nifalcon_close(&mFalcon);
		m_falconDevice.close();
	}
	 
protected:
	FalconDevice m_falconDevice;
	volatile bool m_inRawMode;
	volatile bool m_isInited;
	volatile bool m_runThread;
	volatile int m_errorCount;
	double m_motorForce[3];
	
	ThrCond m_threadCond;
	
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
			int8_t count;
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
				post("np_nifalcon: Firmware already loaded, skipping...");
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
			if(m_inRawMode) return;
			if(m_runThread)
			{
				post("np_nifalcon: I/O THREAD STOPPED");
				m_runThread = false;
				m_threadCond.Wait();
			}
			m_falconDevice.removeFalconKinematic();
			m_inRawMode = true;
			post("np_nifalcon: Raw mode set");
			return;
		}
		else if (!strcmp(msg->s_name, "kinematic"))
		{
			if(!m_inRawMode) return;
			if(m_runThread)
			{
				post("np_nifalcon: I/O THREAD STOPPED");
				m_runThread = false;
				m_threadCond.Wait();
			}
			m_falconDevice.setFalconKinematic<FalconKinematicStamper>();
			m_inRawMode = false;
			post("np_nifalcon: Kinematic mode set");
			return;
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
		while(1)
		{			
			if(!m_runThread)
			{
				break;
			}
			if(!m_inRawMode)
			{
				m_falconDevice.setForce(m_motorForce);
			}
			int i, buttons;
			bool homing_state;
			int16_t motor_state[3];
			float coordinate_state[3];
			uint8_t button_state;
			if(m_falconDevice.runIOLoop())
			{
				if(m_inRawMode)
				{
					for(i = 0; i < 3; ++i)
					{
						if(motor_state[i] != m_falconDevice.getFalconFirmware()->getEncoderValues()[i])
						{
							motor_state[i] = m_falconDevice.getFalconFirmware()->getEncoderValues()[i];
							ToOutInt(i+1, motor_state[i]);
						}
					}
				}
				else
				{
					for(i = 0; i < 3; ++i)
					{
						if(coordinate_state[i] != m_falconDevice.getPosition()[i])
						{
							coordinate_state[i] = m_falconDevice.getPosition()[i];
							ToOutInt(i+1, coordinate_state[i]);
						}
					}
				}
				buttons = m_falconDevice.getFalconGrip()->getDigitalInputs();
				if(button_state != buttons)
				{
					for(i = 0; i < 4; ++i)
					{
						if((buttons & (1 << i)) != (button_state & (1 << i)))
						{							
							ToOutInt(4 + i, (buttons & (1 << i)));
						}
					}
					button_state = buttons;
				}
				if(m_falconDevice.getFalconFirmware()->isHomed() != homing_state)
				{
					homing_state = m_falconDevice.getFalconFirmware()->isHomed();
					ToOutInt(8, homing_state);
				}
			}
			else
			{
				++m_errorCount;
				post("np_nifalcon: IO Loop Error %d",m_errorCount);
			}
            flext::ThrYield();
		}
		m_threadCond.Signal();
	}

	void nifalcon_motor1(double d)
	{
		m_motorForce[0] = d;
	}
	
	void nifalcon_motor2(double d)
	{
		m_motorForce[1] = d;
	}
	
	void nifalcon_motor3(double d)
	{
		m_motorForce[2] = d;
	}
	
	void nifalcon_led_r(long t)
	{
		u_int8_t led = m_falconDevice.getFalconFirmware()->getLEDStatus();
		if(t) led |= FalconFirmware::RED_LED;
		else led &= ~FalconFirmware::RED_LED;
		m_falconDevice.getFalconFirmware()->setLEDStatus(led);
	}
	
	void nifalcon_led_g(long t)
	{
		u_int8_t led = m_falconDevice.getFalconFirmware()->getLEDStatus();
		if(t) led |= FalconFirmware::GREEN_LED;
		else led &= ~FalconFirmware::GREEN_LED;
		m_falconDevice.getFalconFirmware()->setLEDStatus(led);
	}
	
	void nifalcon_led_b(long t)
	{
		u_int8_t led = m_falconDevice.getFalconFirmware()->getLEDStatus();
		if(t) led |= FalconFirmware::BLUE_LED;
		else led &= ~FalconFirmware::BLUE_LED;
		m_falconDevice.getFalconFirmware()->setLEDStatus(led);
	}

	void nifalcon_homing_mode(long t)
	{
		if(t) m_falconDevice.getFalconFirmware()->setHomingMode(true);
		else m_falconDevice.getFalconFirmware()->setHomingMode(false);
	}
		
private:
	FLEXT_CALLBACK_A(nifalcon_anything)
	FLEXT_CALLBACK_F(nifalcon_motor1)
	FLEXT_CALLBACK_F(nifalcon_motor2)
	FLEXT_CALLBACK_F(nifalcon_motor3)
	FLEXT_CALLBACK_I(nifalcon_led_r)
	FLEXT_CALLBACK_I(nifalcon_led_g)
	FLEXT_CALLBACK_I(nifalcon_led_b)
	FLEXT_CALLBACK_I(nifalcon_homing_mode)
	FLEXT_THREAD(nifalcon_update)
};

FLEXT_NEW("np_nifalcon", np_nifalcon)



