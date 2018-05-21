package com.yxq.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.DB;
import com.yxq.dao.OpDB;
import com.yxq.tools.DoString;
import com.yxq.bean.AdminSingle;
import com.yxq.bean.UserSingle;

public class LogInOutAction extends MySuperAction {	
	protected UserSingle user;
	protected AdminSingle admin;
	public UserSingle getUser() {
		return user;
	}
	public void setUser(UserSingle user) {
		this.user = user;
	}
	
	public AdminSingle getAdmin() {
		return admin;
	}
	public void setAdmin(AdminSingle admin) {
		this.admin = admin;
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

	public String isAdminLogin(){
		Object admin = session.get("loginAdmin");
		if(admin == null||!(admin instanceof AdminSingle)){
			System.out.println("loginadmin is null");
			return "admininput";
		}
		else{
			System.out.println("loginadmin is not null");
			return "adminlogin";
		}
	}
	
	public String UserLogin() {

		String sql = "select * from tb_user where id = '" + user.getId() +
				"'and password='"+ user.getPassword() +"';";
		OpDB myOp= new OpDB();
		Object []params = {};

		if(myOp.LogOn(sql, params)){
			String sqls = "select * from tb_user where id = '" + user.getId()+"';" ;
			user = myOp.OpUser(sqls, params);
			session.put("loginUser",user);
			session.put("loginUserId", user.getId());
			return SUCCESS;
		} else {
			request.setAttribute("suggest", "您输入的账号或密码不正确");
			return INPUT;
		}
	}

	/*
	* 此方法有毒，一运行就出错，我重写了一个userLogin()方法，在上边  待定
	* */
	public String AdminLogin(){
		System.out.println("login action");
		String sql = "select * from tb_admin where admin_name = '"+admin.getUserName()+
				"'and admin_password='"+admin.getUserPassword()+"';";
		System.out.println(sql);
		
		OpDB myOp= new OpDB();
		Object []params = {};

		if(myOp.LogOn(sql, params)){
			System.out.println("true");
			session.put("loginAdmin",admin);//记得保存
			return "adminlogin";
		}
		else{
			addFieldError("loginE",getText("Project.login.wrong.input"));
			return "admininput";
		}
		 
	}
	
	public String UserAdd(){
		OpDB myOp=new OpDB();

		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String id = request.getParameter("id");

		String sql = "select *from tb_user where id = '"+id+"';";
		if(myOp.UserLogOn(sql, null)==false){
			sql= "insert into  tb_user (id,password,email,phone,name) values (?,?,?,?,?);" ;
			Object []params = {id,password,email,phone,name};
			int i=myOp.OpUpdate(sql,params);
			if(i<=0){
				return INPUT;
			}else{
				request.setAttribute("suggest", "注册成功，欢迎登录");
				return "login";
			}
		}
		else{
			
			request.setAttribute("suggest", "该账户已存在，请直接登录");
			return "login";
		}
	}
	
	public String AdminLogout(){
		//session.evict(admin);
		session.clear();
		return "logout";
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
