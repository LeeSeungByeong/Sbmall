package com.docmall.mapper;

import java.util.List;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;

public interface AdminProuductMapper {

	public int product_isnert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	//수정폼
	public ProductVO product_modify(Integer pro_num);
	//수정저장
	public int product_modifyOk(ProductVO vo);
	
	public int product_delete(Integer pro_num);
}
