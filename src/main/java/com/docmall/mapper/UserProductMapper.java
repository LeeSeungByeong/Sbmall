package com.docmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;

public interface UserProductMapper {

	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(@Param("cate_code") Integer cate_code, @Param("cri") Criteria cri);
	
	public int getTotalCount(Integer cate_code);
	
	public ProductVO productDetail(Integer	pro_num);
	
	// Top:1, Pants:2, Shirts:3
	public List<ProductVO> productListByCategory(Integer cate_code);
}
