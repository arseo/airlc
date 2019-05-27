package com.airlc.controller;

import java.util.List;
import java.util.Locale;
import javax.inject.Inject;

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

	@RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
	public String getSinglePage(@PathVariable("pageName") String pageName, Locale locale, Model model)
			throws Exception {
		if (pageName.equals("home")) {
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
		} else if (pageName.equals("charts")) {
			List<DustVO> dustList = Dust_service.selectDust();
			model.addAttribute("dustList", dustList);
			List<TempVO> tempList = Temp_service.selectTemp();
			model.addAttribute("tempList", tempList);
			List<HumVO> humList = Hum_service.selectHum();
			model.addAttribute("humList", humList);
		} else if (pageName.equals("tables")) {
			List<DustVO> dustList = Dust_service.selectDust();
			model.addAttribute("dustList", dustList);
			List<TempVO> tempList = Temp_service.selectTemp();
			model.addAttribute("tempList", tempList);
			List<HumVO> humList = Hum_service.selectHum();
			model.addAttribute("humList", humList);
		}
		return "/" + pageName;
	}
	
}