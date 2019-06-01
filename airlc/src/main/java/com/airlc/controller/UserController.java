package com.airlc.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airlc.dto.MemberVO;
import com.airlc.service.MemberService;

@Controller
public class UserController {

	@Inject // byType으로 자동 주입
	MemberService service;

	// 로그인 폼을 띄우는 부분
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(){
		return "/login"; // /login.jsp를 띄움.
	}// end of loginForm
	
	// 로그인 처리하는 부분
	@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
	public String loginProcess(HttpServletRequest request,HttpSession session, Model model, MemberVO dto){
		
		String returnURL = "";
		if ( session.getAttribute("login") != null ){
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
//		System.out.println(id+"\n"+pw);
		// 로그인이 성공하면 UserVO 객체를 반환함.
		MemberVO vo = service.login(dto);
		
		if ( vo != null ){ // 로그인 성공
//			model.addAttribute("vo", vo);
			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈. 
			returnURL = "redirect:/home"; // 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고
		}else { // 로그인에 실패한 경우
			returnURL = "redirect:/login"; // 로그인 폼으로 다시 가도록 함
		}
		System.out.println(returnURL);
		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
//		return "redirect:/student1";
	}

	// 로그아웃 하는 부분
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
//		session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
		return "redirect:/login"; // 로그아웃 후 게시글 목록으로 이동하도록...함
	}
} // end of controller
