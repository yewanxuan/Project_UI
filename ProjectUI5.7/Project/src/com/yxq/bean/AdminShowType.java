package com.yxq.bean;

public class AdminShowType{
	//疑问 为什么要单独弄出来 attention不是就在infoType里面么
	private int infoType;
	private String attentionType;
	private String stateType;

	public String getStateType() {
		return stateType;
	}
	public void setStateType(String stateType) {
		this.stateType = stateType;
	}
	public int getInfoType() {
		return infoType;
	}
	public void setInfoType(int infoType) {
		this.infoType = infoType;
	}
	public String getAttentionType() {
		return attentionType;
	}
	public void setAttentionType(String attentionType) {
		this.attentionType = attentionType;
	}

	
}