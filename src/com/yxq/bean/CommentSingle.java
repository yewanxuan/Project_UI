package com.yxq.bean;

import java.sql.Date;

public class CommentSingle {
	String reqUserid;
	String rspUserid;
	int id;
	int infoId;
	String detail;
	Date reqDate;
	public String getReqUserid() {
		return reqUserid;
	}
	public void setReqUserid(String reqUserid) {
		this.reqUserid = reqUserid;
	}
	public String getRspUserid() {
		return rspUserid;
	}
	public void setRspUserid(String rspUserid) {
		this.rspUserid = rspUserid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInfoId() {
		return infoId;
	}
	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	
	
}
