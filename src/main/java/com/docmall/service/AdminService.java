package com.docmall.service;

import com.docmall.domain.AdminVO;

public interface AdminService {

	public AdminVO adminLogin(String ad_userid);
	
	public int adminRegister(AdminVO vo);
}
