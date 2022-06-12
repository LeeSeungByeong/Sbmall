package com.docmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.docmall.domain.Criteria;
import com.docmall.domain.OrderVO;
import com.docmall.mapper.AdminOrderMapper;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Inject
	private AdminOrderMapper oMapper;
	
	@Override
	public List<OrderVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return oMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return oMapper.getTotalCount(cri);
	}

	@Override
	public void orderStateChange(Integer ord_code, String ord_state) {
		// TODO Auto-generated method stub
		oMapper.orderStateChange(ord_code, ord_state);
	}

}
