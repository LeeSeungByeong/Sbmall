package com.docmall.mapper;

import com.docmall.domain.AdminVO;

public interface AdminMapper {

	public AdminVO adminLogin(String ad_userid);
	
	public int adminRegister(AdminVO vo);
}
