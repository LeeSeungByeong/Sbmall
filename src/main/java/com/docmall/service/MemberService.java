package com.docmall.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.docmall.domain.MemberVO;

public interface MemberService {

	public int join(MemberVO vo);
	
	public String checkID(String mbsp_id);
	
	public MemberVO login(String mbsp_id);
	
	public int modify(MemberVO vo);
	
	public String searchPwByEmail(String mbsp_email);
	
	public int changePw(String mbsp_email, String mbsp_password);
	
	public String currentPwConfirm(String mbsp_id, PasswordEncoder cryptPassEnc, String cur_mbsp_password, String change_mbsp_password);
	
	public int regDelete(String mbsp_id, PasswordEncoder cryptPassEncm,String mbsp_password);
}
