package com.docmall.service;

import java.util.List;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;

public interface UserProductService {

	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri);
	
	public int getTotalCount(Integer cate_code);
	
	public ProductVO productDetail(Integer	pro_num);
	
	public List<ProductVO> productListByCategory(Integer cate_code);
}
