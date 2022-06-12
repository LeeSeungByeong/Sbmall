package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	// ord_code, mbsp_id, ord_name, ord_zipcode, ord_addr_basic, ord_addr_detail, ord_tel, ord_price, ord_regdate
	private Integer ord_code;
	private String mbsp_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int ord_price;
	private String ord_message;
	private String ord_depositor;
	private String ord_state;
	private Date ord_regdate;
}
