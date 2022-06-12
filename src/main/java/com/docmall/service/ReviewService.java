package com.docmall.service;

import java.util.List;

import com.docmall.domain.Criteria;
import com.docmall.domain.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> getReviewListWithPaging(Criteria cri,  Integer pro_num);
	
	public int getTotalCount(Integer pro_num);
	
	public void reviewInsert(ReviewVO vo);
	
	public void reviewEdit(ReviewVO vo);
	
	public void reviewDel(Integer rew_num);
}
