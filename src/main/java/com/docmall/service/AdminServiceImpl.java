package com.docmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.docmall.domain.AdminVO;
import com.docmall.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public AdminVO adminLogin(String ad_userid) {
		// TODO Auto-generated method stub
		return mapper.adminLogin(ad_userid);
	}

	@Override
	public int adminRegister(AdminVO vo) {
		// TODO Auto-generated method stub
		return mapper.adminRegister(vo);
	}

}
