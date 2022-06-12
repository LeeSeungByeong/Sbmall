package com.docmall.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	*/
	
	@RequestMapping("/")
	public String main() {
		
		/*
		  forward, redirect 차이
		  1)forward : 요청한 주소는 유지가되고, 실제 사용주소는 표시가 안됨. 요청주소와 실제주소의 메서드에서 request객체동일.
		  2)redirect: 요청한 주소는 표시가 안되고, 실제 사용주소가 표시가 됨.요청주소와 실제주소의 메서드에서 request객체다름.
		    참고> 실제주소가 클라이언트로 보내져, 브라우저에 의하여, 새로운 요청이 발생된다.
		 */
		
		
		
		
		return "forward:/product/productMain"; // forward, redirect 차이
	}
	
	
	
}
