package com.yxq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import com.yxq.bean.CommentSingle;
import com.yxq.bean.TypeSingle;
import com.yxq.bean.InfoSingle;
import com.yxq.bean.CreatePage;
import com.yxq.bean.UserSingle;
import com.yxq.tools.DoString;



public class OpDB {
	private DB mydb;
	public OpDB(){
		mydb = new DB();
	}
	
	public int OpUpdate(String sql,Object[]params){
		int i = -1;
		mydb.doPstm(sql, params);
		System.out.println(sql);
		try{
			i = mydb.getCount();
			System.out.println(i+"has been changed");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			mydb.closed();
		}
		return i;
	}
	
	@SuppressWarnings("null")
	public CreatePage OpCreatePage
		(String sql,Object[]params,int perR,String strCurrentP,String gowhich){
		CreatePage page=new CreatePage();
		page.setPerR(perR);
		if(sql!=null&&!sql.equals("")){
			DB mydb=new DB();
			mydb.doPstm(sql,params);			
			try {
				ResultSet rs=mydb.getRs();				
				if(rs!=null&&rs.next()){
					rs.last();					
					page.setAllR(rs.getRow());
					page.setAllP();
					page.setCurrentP(strCurrentP);
					page.setPageInfo();
					page.setPageLink(gowhich);
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{				
				mydb.closed();
			}
		}		
		return page;
		
		
	}
	
	public List OpListShow(String sql,Object[] params){
		//从数据库中拿到项目信息
		List onelist=new ArrayList();
		mydb.doPstm(sql, params);
		try{
			ResultSet rs=mydb.getRs();
			if(rs!=null){
				while(rs.next()){
					InfoSingle infoSingle=new InfoSingle();
					infoSingle.setId(rs.getInt("id"));
					infoSingle.setInfoType(rs.getInt("info_type"));
					infoSingle.setInfoTitle(rs.getString("info_title"));
					infoSingle.setInfoContent(rs.getString("info_content"));
					infoSingle.setInfoLinkman(rs.getString("info_linkman"));
					infoSingle.setInfoPhone(rs.getString("info_phone"));
					infoSingle.setInfoEmail(rs.getString("info_email"));
					infoSingle.setInfoDate(DoString.dateTimeChange(rs.getTimestamp("info_date")));
					infoSingle.setInfoState(rs.getString("info_state"));
					infoSingle.setInfoAttention(rs.getString("info_attention"));
					infoSingle.setInfoTypepid(rs.getInt("info_typepid"));
					if(rs.getString("info_userid")!=null){
						infoSingle.setInfoUserid(rs.getString("info_userid").trim());
					}
					onelist.add(infoSingle);
				}
			}
			rs.close();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			mydb.closed();			
		}
		return onelist;		
	}
	
	public List OpListsublevel(String sql, Object[] sublevelparams){
		List subtypelist = new ArrayList();
		mydb.doPstm(sql, sublevelparams);
		try{
			ResultSet rs=mydb.getRs();
			if(rs!=null){
				while(rs.next()){
					TypeSingle type=new TypeSingle();
					System.out.println(""+rs.getInt("id")+rs.getInt("type_pid")+rs.getString("type_name"));
					type.setId(rs.getInt("id"));
					type.setType_pid(rs.getInt("type_pid"));
					type.setType_name(rs.getString("type_name"));
					type.setType_sign(rs.getInt("type_sign"));
					//System.out.println("TypeSingle is"+type.getId()+"  "+type.getType_pid()+type.getType_name());
					subtypelist.add(type);					
				}
			}
			rs.close();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			mydb.closed();			
		}
		return subtypelist;	
		
	}
	
	public List OpListComment(String sql, Object[] sublevelparams){
		List commentlist = new ArrayList();
		mydb.doPstm(sql, sublevelparams);
		try{
			ResultSet rs=mydb.getRs();
			if(rs!=null){
				while(rs.next()){
					CommentSingle comment=new CommentSingle();
					//System.out.println(""+rs.getInt("id")+rs.getInt("type_pid")+rs.getString("type_name"));
					comment.setId(rs.getInt("id"));
					comment.setReqUserid(rs.getString("req_userid"));
					comment.setRspUserid(rs.getString("rsp_userid"));
					comment.setInfoId(rs.getInt("info_id"));
					comment.setDetail(rs.getString("detail"));
					comment.setReqDate(rs.getDate("req_date"));
					System.out.println("CommentSingle is"+comment.getId()+comment.getReqUserid()+comment.getRspUserid()+comment.getDetail()+comment.getReqDate()+comment.getInfoId());
					commentlist.add(comment);					
				}
			}
			rs.close();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			mydb.closed();			
		}
		return commentlist;	
		
	}
	
	
	public TreeMap OpGetListBox(String sql,Object []params){
		TreeMap typeMap = new TreeMap();
		mydb.doPstm(sql, params);
	
		try {
			ResultSet rs = mydb.getRs();
			while(rs.next()){
				typeMap.put(rs.getInt("id"), rs.getString("type_name"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			mydb.closed();			
		}
		return typeMap;
	}
	
	public boolean LogOn(String sql,Object[] params){
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			boolean mark=(rs==null||!rs.next()?false:true);
			rs.close();
			System.out.println(mark);
			return mark;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			mydb.closed();
		}
	}
	
	
	public boolean UserLogOn(String sql,Object[] params){
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			boolean mark=(rs==null||!rs.next()?false:true);
			rs.close();
			System.out.println(mark);
			return mark;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			mydb.closed();
		}
	}
	
	public UserSingle OpUser(String sql,Object []params){
		mydb.doPstm(sql, params);
		UserSingle userSingle = null;
		try {
			ResultSet rs = mydb.getRs();
			if(rs.next()){
				userSingle=new UserSingle();
				userSingle.setId(rs.getString("id"));
				userSingle.setName(rs.getString("name"));
				userSingle.setPhone(rs.getString("phone"));
				userSingle.setPassword(rs.getString("password"));
				userSingle.setEmail(rs.getString("email"));
				System.out.println("UserSingle is "+userSingle.getId()+userSingle.getName()
						+userSingle.getPassword()+userSingle.getEmail());
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally{
			mydb.closed();
		}
		return  userSingle;
	}
	
	public InfoSingle OpSingleShow(String sql, Object [] params){
		mydb.doPstm(sql, params);
		InfoSingle infoSingle = null;
		try {
			ResultSet rs = mydb.getRs();
			if(rs.next()){
				infoSingle=new InfoSingle();
				infoSingle.setId(rs.getInt("id"));
				infoSingle.setInfoType(rs.getInt("info_type"));
				infoSingle.setInfoTitle(rs.getString("info_title"));
				infoSingle.setInfoContent(rs.getString("info_content").trim());
				infoSingle.setInfoLinkman(rs.getString("info_linkman"));
				infoSingle.setInfoPhone(rs.getString("info_phone"));
				infoSingle.setInfoEmail(rs.getString("info_email"));
				infoSingle.setInfoDate(DoString.dateTimeChange(rs.getTimestamp("info_date")));
				infoSingle.setInfoState(rs.getString("info_state"));
				infoSingle.setInfoAttention(rs.getString("info_attention"));
				infoSingle.setInfoUserid(rs.getString("info_userid"));
			}
			System.out.println("InfoSingle is "+infoSingle.getId()+infoSingle.getInfoContent());
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally{
			mydb.closed();
		}
		return  infoSingle;
	}
}
