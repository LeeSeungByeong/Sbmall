package com.docmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.docmall.domain.MemberVO;
import com.docmall.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.join(vo);
	}

	@Override
	public String checkID(String mbsp_id) {
		// TODO Auto-generated method stub
		return mapper.checkID(mbsp_id);
	}

	@Override
	public MemberVO login(String mbsp_id) {
		// TODO Auto-generated method stub
		return mapper.login(mbsp_id);
	}

	@Override
	public int modify(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.modify(vo);
	}

	@Override
	public String searchPwByEmail(String mbsp_email) {
		// TODO Auto-generated method stub
		return mapper.searchPwByEmail(mbsp_email);
	}

	@Override
	public int changePw(String mbsp_email, String mbsp_password) {
		// TODO Auto-generated method stub
		return mapper.changePw(mbsp_email, mbsp_password);
	}
	
	
	@Override
	public String currentPwConfirm(String mbsp_id, PasswordEncoder cryptPassEnc, String cur_mbsp_password, String change_mbsp_password) {
		// TODO Auto-generated method stub
		
		// 로그 안먹음.
//		log.info("파라미터: " + mbsp_id);
//		log.info("파라미터: " + cur_mbsp_password);
//		log.info("파라미터: " + change_mbsp_password);
		
		
//		System.out.println("파라미터: " + mbsp_id);
//		System.out.println("파라미터: " + cur_mbsp_password);
//		System.out.println("파라미터: " + change_mbsp_password);
		
		String result = "noPw";
		
		// 디비의 암호화된 비밀번호가 사용자가 입력한 평문암호(현재비밀번호)로 생성된것인지 여부체크
		if(cryptPassEnc.matches(cur_mbsp_password, mapper.currentPwConfirm(mbsp_id))){
			mapper.changeNewPw(mbsp_id, change_mbsp_password);
			result = "success";
		}
		
		return result;
	}

	@Override
	public int regDelete(String mbsp_id, PasswordEncoder cryptPassEnc, String mbsp_password) {
		
		int count = 0;
		
//		System.out.println("일치여부: " + cryptPassEnc.matches(mbsp_password, mapper.currentPwConfirm(mbsp_id)));
//		System.out.println("count? " + mapper.regDelete(mbsp_id));
		// 디비의 암호화된 비밀번호가 사용자가 입력한 평문암호(현재비밀번호)로 생성된것인지 여부체크
		
		if(cryptPassEnc.matches(mbsp_password, mapper.currentPwConfirm(mbsp_id))){
			count = mapper.regDelete(mbsp_id);
		}
		
		
		return count;
	}

	@Override
	public String searchIdByEmail(String mbsp_email) {
		// TODO Auto-generated method stub
		return mapper.searchIdByEmail(mbsp_email);
	}

}
