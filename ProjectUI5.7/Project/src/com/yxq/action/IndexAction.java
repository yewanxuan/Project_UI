package com.yxq.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.OpDB;
import com.yxq.bean.InfoSingle;

public class IndexAction extends MySuperAction {	
	public static TreeMap typeMap;					
	public static TreeMap searchMap;
	public static TreeMap sublevelMap;
	/*
	* 这里的typeMap应该是为了拿到顶栏的项目分类吧
	* */
	static{
		OpDB myOp=new OpDB();
		String sql="select * from tb_type order by type_sign ";
		typeMap=myOp.OpGetListBox(sql,null);
		if(typeMap==null) {
			typeMap=new TreeMap();
		}
		searchMap=new TreeMap();
		searchMap.put("info_title", "项目标题");
		searchMap.put("info_content", "项目内容");
		searchMap.put("info_linkman", "联系人");
		searchMap.put("info_phone", "联系方式");
		searchMap.put("info_email", "邮件地址");
		
		sublevelMap =new TreeMap();
		
	}

	/*
	* homepage对应action，拿到列表信息和搜索条件
	*
	* */
	public String execute() throws Exception {
		/* 从数据库拿到教师的项目信息 */
		OpDB myOp=new OpDB();
		String sql1="select * from tb_info where (info_state='1') and (info_attention = '0') order by info_date desc";
		List list=myOp.OpListShow(sql1,null);
		request.setAttribute("attentionlist",list);
//		session.put("attentionlist",list);

		/* 从数据库中拿到学生的项目信息 */
		String sql2="select * from tb_info where (info_state='1') and (info_attention = '1') order by info_date desc";
		List list2=myOp.OpListShow(sql2,null);
		request.setAttribute("allsublist",list2);
//		session.put("allsublist",list2);

		session.put("typeMap",typeMap);
		session.put("searchMap",searchMap);
		session.put("sublevelmap", sublevelMap);
		return SUCCESS;
	}
}
