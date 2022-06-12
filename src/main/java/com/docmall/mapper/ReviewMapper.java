package com.docmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.Criteria;
import com.docmall.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getReviewListWithPaging(@Param("cri") Criteria cri,  @Param("pro_num") Integer pro_num);
	
	public int getTotalCount(Integer pro_num);
	
	public void reviewInsert(ReviewVO vo);
	
	public void reviewEdit(ReviewVO vo);
	
	public void reviewDel(Integer rew_num);
}
