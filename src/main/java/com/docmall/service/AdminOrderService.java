package com.docmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.Criteria;
import com.docmall.domain.OrderVO;

public interface AdminOrderService {

	public List<OrderVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void orderStateChange(Integer ord_code, String ord_state);
}
