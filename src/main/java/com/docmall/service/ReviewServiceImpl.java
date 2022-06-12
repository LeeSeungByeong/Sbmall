package com.docmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.docmall.domain.Criteria;
import com.docmall.domain.ReviewVO;
import com.docmall.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria cri, Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.getReviewListWithPaging(cri, pro_num);
	}

	@Override
	public int getTotalCount(Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(pro_num);
	}

	@Override
	public void reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		mapper.reviewInsert(vo);
	}

	@Override
	public void reviewEdit(ReviewVO vo) {
		// TODO Auto-generated method stub
		mapper.reviewEdit(vo);
	}

	@Override
	public void reviewDel(Integer rew_num) {
		// TODO Auto-generated method stub
		mapper.reviewDel(rew_num);
	}

}
