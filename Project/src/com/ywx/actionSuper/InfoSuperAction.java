package com.ywx.actionSuper;

import com.ywx.bean.InfoSingle;
import com.ywx.bean.SearchInfo;

public class InfoSuperAction extends MySuperAction {
	protected InfoSingle infoSingle;
	protected SearchInfo searchInfo;

	public InfoSingle getInfoSingle() {
		return infoSingle;
	}
	public void setInfoSingle(InfoSingle infoSingle) {
		this.infoSingle = infoSingle;
	}
	public SearchInfo getSearchInfo() {
		return searchInfo;
	}
	public void setSearchInfo(SearchInfo searchInfo) {
		this.searchInfo = searchInfo;
	}	
}
