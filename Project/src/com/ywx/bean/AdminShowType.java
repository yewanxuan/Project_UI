package com.ywx.bean;

public class AdminShowType{
	//���� ΪʲôҪ����Ū���� attention���Ǿ���infoType����ô
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