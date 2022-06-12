package com.docmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.Criteria;
import com.docmall.domain.OrderVO;

public interface AdminOrderMapper {

	public List<OrderVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void orderStateChange(@Param("ord_code") Integer ord_code, @Param("ord_state") String ord_state);
}
