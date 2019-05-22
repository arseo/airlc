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

import com.airlc.dto.MemberVO;
import com.airlc.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MemberService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	@RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
	public String getSinglePage(@PathVariable("pageName") String pageName, Locale locale, Model model)
			throws Exception {
		logger.info(pageName);
		if (pageName.equals("home")) {
			List<MemberVO> memberList = service.selectMember();
			model.addAttribute("memberList", memberList);
		}
		return "/" + pageName;
	}
}

/*
 * import java.util.List; import java.util.Locale;
 * 
 * import javax.inject.Inject;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.PathVariable;
 * 
 * import org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.airlc.dto.MemberVO; import com.airlc.service.MemberService;
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * @Controller public class HomeController {
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(HomeController.class);
 * 
 * @Inject private MemberService service;
 * 
 * 
 * 
 * @RequestMapping(value = "/{pageName}", method = RequestMethod.GET) public
 * String getSinglePage(@PathVariable("pageName") String pageName) { return "/"
 * + pageName; } public String home(Locale locale, Model model) throws Exception
 * {
 * 
 * logger.info("home");
 * 
 * List<MemberVO> memberList = service.selectMember();
 * 
 * model.addAttribute("memberList", memberList);
 * 
 * return "home"; }
 * 
 * 
 * }
 */