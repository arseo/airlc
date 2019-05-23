package com.airlc.dto;
import java.text.SimpleDateFormat;

public class TempVO {
	 
    private Double temp;
    private String date;
    
    public Double getTemp() {
    	return temp;
    }
    public void setTemp(Double temp) {
    	this.temp = temp;
    }
    public String getDate() {
        return date;
    }
 
    public void setDate(String date) {
        this.date = date;
    }
 
}