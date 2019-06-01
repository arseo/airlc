package com.airlc.controller;

import java.util.List;
import java.util.Locale;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;

import com.airlc.dto.DustVO;
import com.airlc.service.DustService;
import com.airlc.dto.TempVO;
import com.airlc.service.TempService;
import com.airlc.dto.HumVO;
import com.airlc.service.HumService;
import com.airlc.service.Gpio_Service;
import com.airlc.service.Gpio_Servicelmpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private DustService Dust_service;
	@Inject
	private TempService Temp_service;
	@Inject
	private HumService Hum_service;
	@Inject
	private DustService Dust_service2;
	@Inject
	private TempService Temp_service2;
	@Inject
	private HumService Hum_service2;
	private Gpio_Servicelmpl Gpio_service = new Gpio_Servicelmpl();
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String goHome(Locale locale, Model model) throws Exception {
		List<DustVO> dustList = Dust_service.selectDust();
		model.addAttribute("dustList", dustList);
		List<TempVO> tempList = Temp_service.selectTemp();
		model.addAttribute("tempList", tempList);
		List<HumVO> humList = Hum_service.selectHum();
		model.addAttribute("humList", humList);
		List<DustVO> dustList2 = Dust_service2.LatestDust();
		model.addAttribute("dustList2", dustList2);
		List<TempVO> tempList2 = Temp_service2.LatestTemp();
		model.addAttribute("tempList2", tempList2);
		List<HumVO> humList2 = Hum_service2.LatestHum();
		model.addAttribute("humList2", humList2);
		model.addAttribute("Gpio_service", Gpio_service.Pin_State());

		return "/home";
	}
	@RequestMapping(value = "/home_controll", method = RequestMethod.GET)
	public String goHome_btn(HttpServletRequest httpServletRequest, Model model) throws Exception {
		String act = httpServletRequest.getParameter("act");
		Gpio_service.Activate(act);
		model.addAttribute("Gpio_service",Gpio_service.Pin_State());
		return "redirect:/home";
	}

	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String goCharts(Locale locale, Model model) throws Exception {
		List<DustVO> dustList = Dust_service.selectDust();
		model.addAttribute("dustList", dustList);
		List<TempVO> tempList = Temp_service.selectTemp();
		model.addAttribute("tempList", tempList);
		List<HumVO> humList = Hum_service.selectHum();
		model.addAttribute("humList", humList);
		model.addAttribute("Gpio_service",Gpio_service.Pin_State());
		
		return "/charts";
	}
	@RequestMapping(value = "/charts_controll", method = RequestMethod.GET)
	public String goCharts_controll(HttpServletRequest httpServletRequest, Model model) throws Exception {
		String act = httpServletRequest.getParameter("act");
		Gpio_service.Activate(act);
		model.addAttribute("Gpio_service",Gpio_service.Pin_State());
		
		return "redirect:/charts";
	}

	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String goTables(Locale locale, Model model) throws Exception {
		List<DustVO> dustList = Dust_service.selectDust();
		model.addAttribute("dustList", dustList);
		List<TempVO> tempList = Temp_service.selectTemp();
		model.addAttribute("tempList", tempList);
		List<HumVO> humList = Hum_service.selectHum();
		model.addAttribute("humList", humList);

		return "/tables";
	}

}