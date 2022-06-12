package com.docmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.CartListVO;
import com.docmall.domain.CartVO;
import com.docmall.domain.MemberVO;
import com.docmall.domain.ProductVO;
import com.docmall.service.CartService;
import com.docmall.util.UploadFileUtils;

@RequestMapping("/cart/*")
@Controller
public class CartController {

	@Resource(name = "uploadFolder")
	String uploadFolder; // d:\\dev\\upload */
	
	@Inject
	private CartService service;
	
	//로그인 인증된 경우에만 
	@ResponseBody
	@PostMapping("/cartAdd")
	public ResponseEntity<String> cart_add(Integer pro_num, int cart_amount, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		CartVO vo = new CartVO();
		vo.setPro_num(pro_num);
		vo.setCart_amount(cart_amount);
		
		// 인증된 사용자 정보
		vo.setMbsp_id(((MemberVO) session.getAttribute("loginStatus")).getMbsp_id());
		
		try {
			// 인증된 상태가 풀렸을때.(세션이 소멸시)
			service.cartAdd(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	
	//인증된 상태에서 호출되는메서드의 파라미터는 HttpSession session 사용.
	@GetMapping("/cartList")
	public void cart_list(HttpSession session, Model model) {
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		List<CartListVO> list = service.cartList(mbsp_id);
		
		// 슬래시를 역슬래시로 바꾸는 구문.
		for(int i=0; i<list.size(); i++) {
			CartListVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		
		model.addAttribute("cartList", list);
	}
	
	//상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")  // 클라이언트에서 보내는 특수문자중에 역슬래시 데이타를 스프링에서 지원하지 않는다. 
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName );
		
		return entity;
	}
	
	@ResponseBody  
	@PostMapping("/checkDelete")
	public ResponseEntity<String> checkDelete(@RequestParam("cart_codeArr[]") List<Integer> cart_codeArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i<cart_codeArr.size(); i++) {
								
				//장바구니테이블 삭제작업
				service.cartDel(cart_codeArr.get(i));
				
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	
	//장바구니 비우기
	@GetMapping("/cartAllDelete")
	public String cartAllDelete(HttpSession session) {
		
		String  mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		service.cartAllDel(mbsp_id);
		
		
		
		return "redirect:/cart/cartList";
	}
	
}
