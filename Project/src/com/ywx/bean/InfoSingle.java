package com.ywx.bean;

public class InfoSingle {
	private int id;
	private int infoType;
	private String infoTitle;
	private String infoContent;
	private String infoLinkman;
	private String infoPhone;
	private String infoEmail;
	private String infoDate; 
	private String infoState;
	private String infoAttention;
	private int infoTypepid;
	private String infoUserid;
	
	
	public String getInfoUserid() {
		return infoUserid;
	}
	public void setInfoUserid(String infoUserid) {
		if(infoUserid!=null)
			this.infoUserid = infoUserid.trim();
		else{
			this.infoUserid = infoUserid;
		}
	}
	public int getInfoTypepid() {
		return infoTypepid;
	}
	public void setInfoTypepid(int i) {
		this.infoTypepid = i;
	}
	public String getInfoAttention() {
		return infoAttention;
	}
	public void setInfoAttention(String infoAttention) {
		this.infoAttention = infoAttention;
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInfoContent() {
		return infoContent;
	}
	public void setInfoContent(String infoContent) {
		if(infoContent!=null)
			this.infoContent = infoContent.trim();
		else{
			this.infoContent = infoContent;
		}
	}
	public String getInfoDate() {
		return infoDate;
	}
	public void setInfoDate(String infoDate) {
		this.infoDate = infoDate;
	}
	public String getInfoLinkman() {
		return infoLinkman;
	}
	public void setInfoLinkman(String infoLinkman) {
		this.infoLinkman = infoLinkman;
	}

	public String getInfoPhone() {
		return infoPhone;
	}
	public void setInfoPhone(String infoPhone) {
		this.infoPhone=infoPhone;
	}	
	public String getInfoEmail() {		
		return infoEmail;
	}
	public void setInfoEmail(String infoEmail) {
		this.infoEmail = infoEmail;
	}
	public String getInfoState() {
		return infoState;
	}
	public void setInfoState(String infoState) {
		this.infoState = infoState;
	}
	public String getInfoTitle() {
		return infoTitle;
	}
	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}
	public int getInfoType() {
		return infoType;
	}
	public void setInfoType(int infoType) {
		this.infoType = infoType;
	}
	public String getSubInfoTitle(int len){
		if(len<=0||len>this.infoTitle.length())
			len=this.infoTitle.length();
		return this.infoTitle.substring(0,len);		
	}
}
