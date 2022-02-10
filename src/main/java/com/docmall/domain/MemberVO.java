package com.docmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	// mbsp_id, mbsp_password, mbsp_name, mbsp_email, mbsp_zipcode, mbsp_addr, mbsp_deaddr, mbsp_phone, mbsp_receive,
	// mbsp_point, mbsp_datesub, mbsp_updatedate, mbsp_lastlogin
	
	private	String mbsp_id;
	private String mbsp_password;
	private String mbsp_name;
	private String mbsp_email;
	private String mbsp_zipcode;
	private String mbsp_addr;
	private String mbsp_deaddr;
	private String mbsp_phone;
	private String mbsp_receive;
	private int	 mbsp_point;
	private Date mbsp_datesub;
	private Date mbsp_updatedate;
	private Date mbsp_lastlogin;
	
}
