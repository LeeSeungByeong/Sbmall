package com.docmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.docmall.domain.CategoryVO;
import com.docmall.domain.Criteria;
import com.docmall.domain.ProductVO;
import com.docmall.mapper.AdminProuductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Service
public class AdminProuductServiceImpl implements AdminProuductService {

	@Setter(onMethod_ = @Autowired)
	private AdminProuductMapper mapper;
	
	@Override
	public int product_isnert(ProductVO vo) {
		// TODO Auto-generated method stub
		return mapper.product_isnert(vo);
	}

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
	public List<ProductVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public ProductVO product_modify(Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.product_modify(pro_num);
	}

	@Override
	public int product_modifyOk(ProductVO vo) {
		// TODO Auto-generated method stub
		return mapper.product_modifyOk(vo);
	}

	@Override
	public int product_delete(Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.product_delete(pro_num);
	}
	

	
}
