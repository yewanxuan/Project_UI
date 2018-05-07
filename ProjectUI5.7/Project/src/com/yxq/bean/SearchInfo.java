package com.yxq.bean;

public class SearchInfo {
	//subsql为搜索字段，sqlvalue为这个字段对应的搜索值
	//type为all则全比配
	private String subsql;
	private String sqlvalue;
	private String type="all";

	public String getSqlvalue() {
		return sqlvalue;
	}
	public void setSqlvalue(String sqlvalue) {
		this.sqlvalue = sqlvalue;
	}
	public String getSubsql() {
		return subsql;
	}
	public void setSubsql(String subsql) {
		this.subsql = subsql;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
}
