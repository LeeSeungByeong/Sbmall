package com.docmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.MemberVO;
import com.docmall.domain.PageDTO;
import com.docmall.domain.ReviewVO;
import com.docmall.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/review/*")
//@RestController : 메서드의 리턴값을 클라이언트에게 보내는 용도.
@Controller    // 메서드가 실행시 해당 jsp가 실행이 된 결과를 클라이언트에게 보내는 용도.
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	
	//상품후기목록, 페이징구현정보
	@GetMapping("/productReview")
	public void product_review(@ModelAttribute("cri") Criteria cri,  
								@RequestParam("pro_num") Integer pro_num, Model model) {
		
		log.info("productReview");
		
		cri.setAmount(2);
		
		int total = service.getTotalCount(pro_num);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("reviewListVO", service.getReviewListWithPaging(cri, pro_num));
	}
	
	//상품후기등록
	@ResponseBody
	@PostMapping("/productReviewWrite") // 400에러
	public ResponseEntity<String> productReviewWrite(ReviewVO vo, HttpSession session){
		
		log.info("상품후기: " + vo);
		
		vo.setMbsp_id(((MemberVO) session.getAttribute("loginStatus")).getMbsp_id());
		
		
		
		ResponseEntity<String> entity = null;
		
		
		try {
			service.reviewInsert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
				
		
		return entity;
	}
	
	//상품후기수정
	@ResponseBody
	@PostMapping("/productReviewEdit") // 400에러
	public ResponseEntity<String> productReviewEdit(ReviewVO vo, HttpSession session){
		
		log.info("상품후기: " + vo);
		
		vo.setMbsp_id(((MemberVO) session.getAttribute("loginStatus")).getMbsp_id());
		
		
		
		ResponseEntity<String> entity = null;
		
		
		try {
			service.reviewEdit(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
				
		
		return entity;
	}
	
	//상품후기삭제
	@ResponseBody
	@PostMapping("/productReviewDel") // 400에러
	public ResponseEntity<String> productReviewDel(Integer rew_num){
		
		
		ResponseEntity<String> entity = null;
		
		
		try {
			service.reviewDel(rew_num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
				
		
		return entity;
	}
}
