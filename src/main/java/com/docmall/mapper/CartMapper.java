package com.docmall.mapper;

import java.util.List;

import com.docmall.domain.CartListVO;
import com.docmall.domain.CartVO;

public interface CartMapper {

	public void cartAdd(CartVO vo);
	
	public List<CartListVO> cartList(String mbsp_id );
	
	public void cartDel(Integer cart_code);
	
	public void cartAllDel(String mbsp_id);
	
}
