package com.airlc.dto;

import java.text.SimpleDateFormat;

public class DustVO {

	private Double ugm3;
	private String date;
	private String area;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Double getUgm3() {
		return ugm3;
	}

	public void setUgm3(Double ugm3) {
		this.ugm3 = ugm3;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}