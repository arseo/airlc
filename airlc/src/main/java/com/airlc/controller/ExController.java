//package com.airlc.controller;
// 
//import javax.inject.Inject;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
// 
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.Controller;
//
//import com.airlc.service.Gpio_Servicelmpl;
//
//import org.springframework.web.bind.annotation.RequestMapping; import org.springframework.web.bind.annotation.RequestMethod;
//import java.util.Locale;
//import org.springframework.web.servlet.ModelAndView;
//
//public class ExController implements Controller {
// 
//    @RequestMapping(value="/Test.jsp")
//       
//        ModelAndView mav = new ModelAndView();
//        
//        Gpio_Servicelmpl Gpio_service = new Gpio_Servicelmpl();
//        mav.addObject("Gpio_service", Gpio_service);
//        mav.setViewName("/home");
//        
//        return mav;
//    }
//}