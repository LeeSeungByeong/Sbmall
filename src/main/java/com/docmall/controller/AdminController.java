package com.docmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.docmall.domain.AdminVO;
import com.docmall.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor  // 모든필드를 파라미터로 하는 생성자메서드.  내부적으로 자동주입발생이 되어 어노테이션을 작업을 안한다.
@RequestMapping("/admin/*")
@Controller
public class AdminController {

	private AdminService service;
	
	private PasswordEncoder cryptPassEnc;  // 스프링시큐리티에서 제공하는 암호화클래스
	
	//관리자 로그인 폼
	@GetMapping("/logon")
	public void adLoginForm() {
		
	}
	
	
	// 관리자 로그인 인증
	@PostMapping("/logon")
	public String adLoginOk(String ad_userid, String ad_userpw, HttpSession session, RedirectAttributes rttr) {
		
		
		
		log.info("관리자 아이디: " + ad_userid);
		log.info("관리자 비번: " + ad_userpw);
		
		String redirectUrl = "";
		
		AdminVO vo = service.adminLogin(ad_userid);
		
		//아이디가 존재한다면
		if(!StringUtils.isEmpty(vo)) {
			
			// 비밀번호가 일치한다면(즉 인증성공)
			if(cryptPassEnc.matches(ad_userpw, vo.getAd_userpw())) {
			
				session.setAttribute("adminStatus", vo);
				redirectUrl = "/admin/main";
			}else {	// 비밀번호가 틀린 경우
				redirectUrl = "/admin/logon";
				rttr.addFlashAttribute("msg", "failPw");
			}
			
		}else {		// 아이디가 틀린 경우
			redirectUrl = "/admin/logon";
			rttr.addFlashAttribute("msg", "failId");
		}
		
		return "redirect:" + redirectUrl;
	}
	
	//관리자 로그온 후에 보여줄 메뉴페이지
	@GetMapping("/main")
	public void main() {
		
	}
	
	//관리자회원 추가 폼
	@GetMapping("/adminRegister")
	public void adminRegister() {
		
	}
	
	//관리자회원 저장
	@PostMapping("/adminRegister")
	public String adminRegister(AdminVO vo, RedirectAttributes rttr) {
		
		vo.setAd_userpw(cryptPassEnc.encode(vo.getAd_userpw()));
		
		int result = service.adminRegister(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", "success");
		}else {
			rttr.addFlashAttribute("msg", "fail");
		}
		
		return "redirect:/admin/adminRegister";
	}
	
	
}
