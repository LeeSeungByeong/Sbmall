package com.docmall.service;

import java.util.List;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;

public interface AdminProuductService {

	public int product_isnert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public ProductVO product_modify(Integer pro_num);
	
	public int product_modifyOk(ProductVO vo);
	
	public int product_delete(Integer pro_num);
}
