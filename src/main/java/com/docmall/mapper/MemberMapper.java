package com.docmall.mapper;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);
	
	public String checkID(String mbsp_id);
	
	public MemberVO login(String mbsp_id);
	
	public int modify(MemberVO vo);
	
	public String searchPwByEmail(String mbsp_email);
	
	public int changePw(@Param("mbsp_email") String mbsp_email, @Param("mbsp_password") String mbsp_password);
	
	public String currentPwConfirm(String mbsp_id);
	
	public int changeNewPw(@Param("mbsp_id") String mbsp_id, @Param("change_mbsp_password") String change_mbsp_password);
	
	public int regDelete(String mbsp_id);
	
	
}
