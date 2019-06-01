package com.airlc.service;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.PinState;
import com.pi4j.io.gpio.RaspiPin;

public interface Gpio_Service {
	
	public static GpioController gpio = GpioFactory.getInstance();;
	public static GpioPinDigitalOutput pin = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_02);
	
	
	public void Activate(String State);
	public String Pin_State();
	public String toString();
}
