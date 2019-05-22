package com.airlc.controller;

import java.util.List;
import java.util.Locale;
import java.text.SimpleDateFormat;
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

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private DustService Dust_service;
	@Inject
	private TempService Temp_service;
	@Inject
	private HumService Hum_service;
	@Inject
	private DustService Dust_service2;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	/*@RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
	public String getSinglePage(@PathVariable("pageName") String pageName, Locale locale, Model model)
			throws Exception {
		logger.info(pageName);
		if (pageName.equals("home")) {
			List<MemberVO> memberList = service.selectMember();
			model.addAttribute("memberList", memberList);
		}
		else if (pageName.equals("tables")) {
			List<MemberVO> memberList = service.selectMember();
			model.addAttribute("memberList", memberList);
		}
		return "/" + pageName;*/
	@RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
	public String getSinglePage(@PathVariable("pageName")String pageName, Locale locale, Model model) throws Exception{
		if (pageName.equals("home")) {
			List<DustVO> dustList = Dust_service.selectDust();
			model.addAttribute("dustList", dustList);
			List<TempVO> tempList = Temp_service.selectTemp();
			model.addAttribute("tempList", tempList);
			List<HumVO> humList = Hum_service.selectHum();
			model.addAttribute("humList", humList);
			List<DustVO> dustList2 = Dust_service2.LatestDust();
			model.addAttribute("dustList2", dustList2);
		}
		return "/"+pageName;
	}
}