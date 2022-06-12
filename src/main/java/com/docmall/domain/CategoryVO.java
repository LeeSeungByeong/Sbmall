package com.docmall.domain;

import lombok.Data;

@Data
public class CategoryVO {

	// cate_code, cate_prt_code, cate_name
	
	private Integer cate_code;	// 기본카테고리 코드
	private Integer cate_prt_code;	// 부모카테고리 코드
	private String cate_name;
}
