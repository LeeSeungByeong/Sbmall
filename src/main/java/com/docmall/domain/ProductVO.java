package com.docmall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {

	// pro_num, cate_code, pro_name, pro_price, pro_discount, pro_publisher, pro_content, pro_img, pro_amount, pro_buy, pro_date, pro_updatedate
	
	private Integer	pro_num;
	private Integer	cate_prt_code;	//1차 카테고리 코드
	private Integer	cate_code;	//2차 카테고리 코드
	private String pro_name;
	private int	pro_price; //
	private int pro_discount;
	private String pro_publisher;
	private String pro_content;
	private String pro_img;	//파일이미지는 업로드에서 파일이름을 가져와 처리해야 한다..
	private String pro_uploadpath;  // 날짜폴더. 추가
	private int pro_amount;
	private String pro_buy;
	private Date pro_date;
	private Date pro_updatedate;
	
	// <input type="file" id="upload" name="upload">
	private MultipartFile upload;
}
