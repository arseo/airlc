package com.airlc.controller;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.bind.annotation.RequestMapping; import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Locale;
import org.springframework.web.servlet.ModelAndView;

public class ExController implements Controller {
 
    @Override
    public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
        // TODO Auto-generated method stub
//        어떤 데이터를 가지고 어느 jsp로 보낼지를 결정
//        기존방법, 직접 Request객체에 setAttribute하고
//        직접 Request 객체를 이용해 특정 jsp페이지로 포워드 했었음
        
        ModelAndView mav = new ModelAndView();
        String msg = arg0.getParameter("id");
        if(msg.equals(null))
        	msg="On";
        mav.addObject("msg", msg);
        mav.setViewName("/home");
        
        return mav;
    }
}