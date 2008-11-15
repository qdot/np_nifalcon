/*
 * Implementation file for NovInt Falcon Max/MSP External
 *
 * Copyright (c) 2007 Kyle Machulis/Nonpolynomial Labs <kyle@nonpolynomial.com>
 *
 * More info on Nonpolynomial Labs @ http://www.nonpolynomial.com
 *
 * Sourceforge project @ http://www.sourceforge.net/projects/libnifalcon
 *
 * This library is covered by the LGPL, read LICENSE for details.
 */

#include "ext.h"
#include "nifalcon.h"

#define MAXSIZE 256

typedef struct _max_nifalcon
{
	struct object m_ob;
	t_atom m_args[MAXSIZE];
	falcon_device dev;
	falcon_packet input;
	falcon_packet output;
	
	void *m_encoder[3];
	void *m_button[4];
} t_max_nifalcon;

void *max_nifalcon_class;

void *max_nifalcon_new(t_symbol *s, short ac, t_atom *av);

void max_nifalcon_anything(t_max_nifalcon* x, t_symbol *msg, short argc, t_atom *argv);
void max_nifalcon_motor1(t_max_nifalcon* x, long t);
void max_nifalcon_motor2(t_max_nifalcon* x, long t);
void max_nifalcon_motor3(t_max_nifalcon* x, long t);
void max_nifalcon_led_r(t_max_nifalcon* x, long t);
void max_nifalcon_led_g(t_max_nifalcon* x, long t);
void max_nifalcon_led_b(t_max_nifalcon* x, long t);
void max_nifalcon_poll(t_max_nifalcon* x);
void max_nifalcon_assist(t_max_nifalcon *x, void *b, long m, long a, char *s);

void main()
{
	setup((t_messlist **)&max_nifalcon_class, (method)max_nifalcon_new,0L, (short)sizeof(t_max_nifalcon), 0L, A_GIMME, 0);
	addbang((method)max_nifalcon_poll);
	//Inlets index left to right
	addinx((method)max_nifalcon_motor1,6);
	addinx((method)max_nifalcon_motor2,5);
	addinx((method)max_nifalcon_motor3,4);
	addinx((method)max_nifalcon_led_r,3);
	addinx((method)max_nifalcon_led_g,2);
	addinx((method)max_nifalcon_led_b,1);
	addmess((method)max_nifalcon_anything, "anything", A_GIMME, 0);
	addmess((method)max_nifalcon_assist,"assist", A_CANT, 0);
}

void *max_nifalcon_new(t_symbol *s, short ac, t_atom *av)
{
	t_max_nifalcon *x;
	int i = 0;
	x = (t_max_nifalcon *)newobject(max_nifalcon_class);
	x->dev = NULL;
	for(i = 1; i < 7; ++i)
	{
		intin(x, i);
	}
	for(i = 3; i >= 0; --i)
	{
		x->m_button[i] = intout(x);
	}
	for(i = 2; i >= 0; --i)
	{
		x->m_encoder[i] = intout(x);
	}

	nifalcon_init_packet(&(x->input));
	nifalcon_init_packet(&(x->output));
	return x;
}

void max_nifalcon_anything(t_max_nifalcon* x, t_symbol *msg, short argc, t_atom *argv)
{
	if(!strcmp(msg->s_name, "open"))
	{
		if(argc == 1)
		{
			post("Opening falcon %d", argv[0].a_w.w_long);
			nifalcon_open(&(x->dev), argv[0].a_w.w_long);
		}
		else
		{
			post("Opening first falcon found");
			nifalcon_open(&(x->dev), 0);
		}
	}
	else if (!strcmp(msg->s_name, "init"))
	{
		if(x->dev)
		{
			int i = nifalcon_init(x->dev);
			if(i < 0)
			{
				post("Can't find novint.bin file");
			}
			else if (i > 0)
			{
				post("FTDI Error");
			}
			else
			{
				post("Falcon init finished");
			}
		}
	}
	else if (!strcmp(msg->s_name, "close"))
	{
		if(x->dev)
		{
			nifalcon_close(x->dev);
			post("Falcon closed");
		}
	}
	else
	{
		post("not open: %s", msg->s_name);
	}
}

void max_nifalcon_poll(t_max_nifalcon* x)
{
	if(!x->dev) return;
	
	nifalcon_send_struct(x->dev, &(x->input));
	nifalcon_receive_struct(x->dev, &(x->output));
	outlet_int(x->m_encoder[0], x->output.motor[0]);
	outlet_int(x->m_encoder[1], x->output.motor[1]);
	outlet_int(x->m_encoder[2], x->output.motor[2]);
}

void max_nifalcon_motor1(t_max_nifalcon* x, long t)
{
	x->input.motor[0] = t;
}

void max_nifalcon_motor2(t_max_nifalcon* x, long t)
{
	x->input.motor[1] = t;
}

void max_nifalcon_motor3(t_max_nifalcon* x, long t)
{
	x->input.motor[2] = t;
}

void max_nifalcon_led_r(t_max_nifalcon* x, long t)
{
	if(t) x->input.info |= NOVINT_LED_RED;
	else x->input.info &= ~(NOVINT_LED_RED);
}

void max_nifalcon_led_g(t_max_nifalcon* x, long t)
{
	if(t) x->input.info |= NOVINT_LED_GREEN;
	else x->input.info &= ~(NOVINT_LED_GREEN);
}

void max_nifalcon_led_b(t_max_nifalcon* x, long t)
{
	if(t) x->input.info |= NOVINT_LED_BLUE;
	else x->input.info &= ~(NOVINT_LED_BLUE);
}

void max_nifalcon_assist(t_max_nifalcon *x, void *b, long m, long a, char *s)
{
	if (m==ASSIST_INLET) {
		switch (a) {
			default:
				sprintf(s, "Input");
		}
	}
	else {
		sprintf(s,"Output");
	}
}
