package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;
import com.docmall.mapper.UserProductMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor // 필드를 이용한 생성자메서드 생성. 파라미터를 이용한 생성자메서드가 존재하면 자동주입
@Service
public class UserProductServiceImpl implements UserProductService {

	private UserProductMapper mapper;
	
	@Override
	public List<CategoryVO> mainCategory() {
		// TODO Auto-generated method stub
		return mapper.mainCategory();
	}

	@Override
	public List<CategoryVO> subCategory(Integer cate_code) {
		// TODO Auto-generated method stub
		return mapper.subCategory(cate_code);
	}

	@Override
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cate_code, cri);
	}

	@Override
	public int getTotalCount(Integer cate_code) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cate_code);
	}

	@Override
	public ProductVO productDetail(Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.productDetail(pro_num);
	}

	@Override
	public List<ProductVO> productListByCategory(Integer cate_code) {
		// TODO Auto-generated method stub
		return mapper.productListByCategory(cate_code);
	}

}
