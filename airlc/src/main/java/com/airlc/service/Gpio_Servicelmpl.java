package com.airlc.service;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.PinState;
import com.pi4j.io.gpio.RaspiPin;

public class Gpio_Servicelmpl implements Gpio_Service {
	
	public static String pin_state;
	
	@Override
	public void Activate(String State) {
		if(State.equals("true")) {
			pin.low();
		}
		else if(State.equals("false")) {
			pin.high();
		}
	}
	@Override
	public String Pin_State() {
		pin_state = pin.getState().toString();
		return pin_state;
		
	}
}
