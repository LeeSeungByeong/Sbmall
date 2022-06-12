package com.docmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.OrderDetail;
import com.docmall.domain.OrderInfoVO;
import com.docmall.domain.OrderVO;

public interface OrderMapper {

	public List<OrderInfoVO> orderInfo(String mbsp_id);
	
	public List<OrderInfoVO> directOrderInfo(@Param("pro_num") Integer pro_num, @Param("ord_amount") Integer ord_amount);
	
	public void orderInsert(OrderVO vo);
	
	public void orderDetailInsert(OrderDetail vo);
	
	
}
