package com.docmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor  // 모든필드를 파라미터로 하는 생성자메서드.  내부적으로 자동주입발생이 되어 어노테이션을 작업을 안한다.
@RequestMapping("/admin/*")
@Controller
public class AdminController {

	
	@GetMapping("/logon")
	public void adLoginForm() {
		
	}
	
	@PostMapping("/logon")
	public String adLoginOk() {
		
		
		return "redirect:/admin/main";
	}
	
	//관리자 로그온 후에 보여줄 메뉴페이지
	@GetMapping("/main")
	public void main() {
		
	}
}
