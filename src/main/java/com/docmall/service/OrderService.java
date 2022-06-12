package com.docmall.service;

import java.util.List;

import com.docmall.domain.OrderDetailList;
import com.docmall.domain.OrderInfoVO;
import com.docmall.domain.OrderVO;

public interface OrderService {

	public List<OrderInfoVO> orderInfo(String mbsp_id);
	
	public void orderInsert(OrderVO vo, OrderDetailList vo2);
	
	public List<OrderInfoVO> directOrderInfo(Integer pro_num, Integer ord_amount);
}
