package com.ywx.bean;

import java.sql.Date;

public class CommentSingle {
	String reqUserid;
	String rspUserid;
	int id;
	int infoId;
	String detail;
	String reqDate;
	String rspName;
	String reqName;
	
	public String getReqName() {
		return reqName;
	}
	public void setReqName(String reqName) {
		System.out.println("reqName"+reqName);
		if(reqName == null || reqName == ""){
			this.reqName = "匿名";
		}
		else{
			this.reqName = reqName;
		}
	}
	public String getRspName() {
		return rspName;
	}
	public void setRspName(String rspName) {
		if(rspName == null || rspName == "")
			this.rspName = "匿名";
		else{
			this.rspName = rspName;
		}
	}
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
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	
	
}
