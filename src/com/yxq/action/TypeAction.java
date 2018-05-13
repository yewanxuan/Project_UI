package com.yxq.action;

import java.util.List;
import java.util.TreeMap;

import javax.servlet.ServletRequest;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.bean.CreatePage;
import com.yxq.bean.TypeSingle;
import com.yxq.dao.OpDB;

public class TypeAction  extends MySuperAction{
	public String TypeShow(){
		OpDB myOp=new OpDB();
		String sql="select * from tb_type order by id";
		List typelist = myOp.OpListsublevel(sql,null);
		session.put("typelist",typelist);
		return "success";
		
	}
	

	public String Add(){
		OpDB myOp=new OpDB();
		String type_name = (String) request.getParameter("type_name");
		String type_pid =  (String) request.getParameter("type_pid");
		System.out.println(type_name+type_pid);
		String sql="insert into tb_type (type_name, type_pid) values (?,?)"; 
		Object []params = {type_name,type_pid};
		if(myOp.OpUpdate(sql, params)>0){
			TypeShow();
			return "success";
		}
		else
			return "error";
	}
	public String Edit(){
		OpDB myOp = new OpDB();
		String type_name = (String) request.getParameter("type_name");
		String id =  (String) request.getParameter("id");
		String worktype = request.getParameter("worktype");
		if(worktype.equals("change")){
			String sql="update tb_type set type_name = ? where id = ?";
			Object []params = {type_name,id};
			if(myOp.OpUpdate(sql, params)>0){
				TypeShow();
				return "success";
			}
			else
				return "error";
			
		}
		if(worktype.equals("delete")){
			String sql="delete from tb_type where id = ?";
			System.out.println(sql+id);
			Object []params = {id};
			if(myOp.OpUpdate(sql, params)>0){
				TypeShow();
				return "success";
			}
			else
				return "error";
		}
		return "success";

	}
}
