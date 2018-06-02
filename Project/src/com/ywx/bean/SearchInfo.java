package com.ywx.bean;

public class SearchInfo {
	//subsqlΪ�����ֶΣ�sqlvalueΪ����ֶζ�Ӧ������ֵ
	//typeΪall��ȫ����
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
