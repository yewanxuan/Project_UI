package com.yxq.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.DB;
import com.yxq.dao.OpDB;
import com.yxq.bean.UserSingle;
import com.yxq.tools.win;

public class LogInOutAction extends MySuperAction {	
	protected UserSingle user;
	
	public UserSingle getUser() {
		return user;
	}
	public void setUser(UserSingle user) {
		this.user = user;
	}
	
	public String isLogin(){
		Object user = session.get("loginUser");
		if(user == null||!(user instanceof UserSingle)){
			System.out.println("loginuser is null");
			return INPUT;
		}
		else{
			System.out.println("loginuser is not null");
			return LOGIN;
		}
	}

	public String UserLogin() {
		String sql = "";
		String sqls = "";
		if (win.isAndy){
			sql = "select * from tb_user where name = '" + request.getParameter("user.id") +
					"'and password='"+ request.getParameter("user.password") +"';";
		} else {
			sql = "select * from tb_user where id = '" + user.getId() +
					"'and password='"+ user.getPassword() +"';";
		}
		OpDB myOp= new OpDB();
		Object []params = {};

		if(myOp.LogOn(sql, params)){
			if (win.isAndy) {
				sqls = "select * from tb_user where name = '" + request.getParameter("user.id")+"';" ;
			} else {
				sqls = "select * from tb_user where id = '" + user.getId()+"';" ;
			}
			user = myOp.OpUser(sqls, params);
			System.out.println(user.getId());
			session.put("loginUser",user);
			session.put("loginUserId", user.getId());
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/*
	* 此方法有毒，一运行就出错，我重写了一个userLogin()方法，在上边  待定
	* */
	public String Login(){
		System.out.println("login action");
		String sql = "select * from tb_user where user_name = '"+user.getId()+
				"'and user_password='"+user.getPassword()+"';";
		OpDB myOp= new OpDB();
		Object []params = {};

		if(myOp.LogOn(sql, params)){
			session.put("loginUser",user);//记得保存
			return LOGIN;
		}
		else{
			addFieldError("loginE",getText("Project.login.wrong.input"));
			return INPUT;
		}
		 
	}
	
	public String Logout(){
		session.clear();
		return "logout";
	}
	
	public void validateLogin(){
//		String username = user.getUserName();
//		String password = user.getUserPassword();
//		System.out.println("username:"+username+password);
//		if(username==null||username==""){
//			addFieldError("nameError",getText("Project.login.no.name"));
//		}
//		if(password==null||password==""){
//			addFieldError("passwordError",getText("Project.login.no.password"));
//		}
	}
	
}