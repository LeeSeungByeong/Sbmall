package com.docmall.controller;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.docmall.service.UserProductService;

import lombok.extern.log4j.Log4j;


// basePackages = {"com.doccomsa.controller"} ? 공통 모델데이타를 참조하는 컨트롤러의 패키지 지정.
@Log4j
@ControllerAdvice(basePackages = {"com.docmall.controller"})
public class GlobalControllerAdvice {

	@Inject
	private UserProductService service;
	
	// 페이지에서 공통으로 보여주는 정보. 예)쇼핑몰 - 카테고리정보
	
	@ModelAttribute
	public void commonCategoryData(Model model) {
		
		log.info("공통모델 데이타 참조");
		
		model.addAttribute("userCategory", service.mainCategory());
	}
}
