package com.docmall.service;

import com.docmall.domain.MemberVO;

public interface MemberService {

	public int join(MemberVO vo);
	
	public String checkID(String mbsp_id);
	
	public MemberVO login(String mbsp_id);
	
	public int modify(MemberVO vo);
}
