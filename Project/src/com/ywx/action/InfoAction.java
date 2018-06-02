package com.ywx.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.TreeMap;
import java.lang.Integer;

import com.ywx.actionSuper.InfoSuperAction;
import com.ywx.bean.CreatePage;
import com.ywx.bean.InfoSingle;
import com.ywx.bean.UserSingle;
import com.ywx.dao.OpDB;
import com.ywx.tools.DoString;
import com.ywx.tools.OS;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

public class InfoAction extends InfoSuperAction {
	/**
	 * 
	 */


	public String Edit(){
		System.out.println("edit here");
		request.setAttribute("data", "nothing");
		OpDB myOp=new OpDB();
		String worktype = request.getParameter("worktype");
		String id = request.getParameter("id");
		String infoType = request.getParameter("infoType");
		String subsql="info_userid";
		UserSingle user = null;
		String sqlvalue = null;
		String opname=" = ";

		String type = "all";	
		if(session.get("loginUser")!=null){
			user = (UserSingle) session.get("loginUser");
			sqlvalue = user.getId();
		}
		else{
			sqlvalue = myOp.OpSingleShow("select * from tb_info where id = "+id+";", null).getInfoUserid();
		}
		System.out.println(sqlvalue);
		String param=sqlvalue;
		
		if(worktype.equals("refresh")){
			System.out.println(id);
			String sql = "update tb_info set info_date = ? where id = ?";
			String date=DoString.dateTimeChange(new java.util.Date());
			Object []params = {date,id};
			myOp.OpUpdate(sql,params);
		}
		if(worktype.equals("delete")){
			String sql = "delete from tb_info where id = ?";
			Object []params = {id};
			myOp.OpUpdate(sql,params);
		}
		if(worktype.equals("change")){
			String sql = "select * from tb_info where id = ?";
			Object []params = {id};
			InfoSingle infoSingle = myOp.OpSingleShow(sql, params);
			request.setAttribute("infoSingle", infoSingle);
			return "input";
		}
		if(session.get("loginUser")!=null){
			List_for_show(subsql,opname,sqlvalue,type,param,"");
			return "success";
		}
		else{
			return "refresh";
		}
	}
	
	
	public String ListShow(){

		OpDB myOp = new OpDB();
		String infoType = request.getParameter("infoType");
		String tiptop = request.getParameter("tiptop");
		Object []params = {infoType};
		String column = "info_type";
		String type_pid = null;
		InfoSingle tipSingle = null;
		if(tiptop!=null){
			Object [] tiptopparams = {tiptop};
			String sql="SELECT * from tb_info WHERE id = ?";
			tipSingle = myOp.OpSingleShow(sql, tiptopparams);
			request.setAttribute("tipSingle", tipSingle);
		}
		
		//只有直接选择一级目录的时候，才会出现infoType有值的情况
		if(Integer.valueOf(infoType)<= 11){
			type_pid = infoType;
			column = "info_typepid";
			System.out.println("now type_pid is "+infoType);
			Object [] sublevelparams = {type_pid};
			String sqlsublevel="SELECT * from tb_type WHERE type_pid = ?";
			TreeMap sublevelmap = myOp.OpGetListBox(sqlsublevel, sublevelparams);
			if(sublevelmap==null)
				sublevelmap=new TreeMap();
			session.put("sublevelmap", sublevelmap);
		}
		
		String attent= request.getParameter("attent");
		String info_attention = "";
		if(attent != null && attent != ""){
			info_attention = "AND (info_attention = '"+attent+"')"; 
		}
		
		/* 获取当前页要显示的免费信息 */
		String sqlFreeAll="SELECT * FROM tb_info WHERE ("+column+" = ?) AND (info_state='1') " 
				 + info_attention + "ORDER BY info_date DESC";		
		String sqlFreeSub="";
		int perR=20;
		String CurrentP = request.getParameter("showpage");
		String gowhich = null;
		gowhich = "info_ListShow.action?infoType="+infoType;
		CreatePage createPage=myOp.OpCreatePage(sqlFreeAll,params,perR,CurrentP,gowhich);
		
		System.out.println("*****"+createPage.getPerR()+"  "+createPage.getCurrentP());
	
		int top1=createPage.getPerR();
		int currentP=createPage.getCurrentP();		
		if(currentP==1){     		//设置显示第1页信息的SQL语句
			if (OS.getMacStatus()){
				sqlFreeSub="SELECT * FROM tb_info WHERE ("+column+" = ?) AND" +
						" (info_state = '1') " + info_attention + " ORDER BY info_date DESC LIMIT " + top1;
			}else{
				sqlFreeSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+column+" = ?) AND" +
						" (info_state = '1') " + info_attention + " ORDER BY info_date DESC";
			}
		}
		else{						//设置显示除第1页外，其他指定页码信息的SQl语句
			int top2=(currentP-1)*top1;
			if (OS.getMacStatus()){
				sqlFreeSub=	"SELECT * FROM tb_info i WHERE ("+column+" = ?) " +
						"AND (info_state = '1') " + info_attention + " AND (info_date < (SELECT MIN(info_date) " +
						"FROM (SELECT TOP "+top2+" (info_date) FROM tb_info WHERE ("+column+" = i."+column+") AND " +
						"(info_state = '1') " + info_attention + "ORDER BY info_date DESC) AS mindate)) " +
						"ORDER BY info_date DESC LIMIT " + top1;
			}else{
				sqlFreeSub=	"SELECT TOP "+top1+" * FROM tb_info i WHERE ("+column+" = ?) " +
						"AND (info_state = '1') " + info_attention + " AND (info_date < (SELECT MIN(info_date) " +
						"FROM (SELECT TOP "+top2+" (info_date) FROM tb_info WHERE ("+column+" = i."+column+") AND " +
						"(info_state = '1') " + info_attention + "ORDER BY info_date DESC) AS mindate)) " +
						"ORDER BY info_date DESC";
			}
			
		}
		
		List onelist = myOp.OpListShow(sqlFreeSub, params);
		onelist.add(0, tipSingle);
		request.setAttribute("attentionlist",onelist);
		request.setAttribute("createpage", createPage);//这个是最后一行用的上的东西
		

		return SUCCESS;
	}
	
	public String SingleShow(){
		request.setAttribute("mainPage","/pages/show/singleshow.jsp");
		String id = request.getParameter("id");
		String sql = "select *from tb_info where id = ? ";
		Object []params = {id};
		OpDB myOp=new OpDB();
		infoSingle = myOp.OpSingleShow(sql, params);
		if(infoSingle==null){
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("SingleShowNoExist",getText("Project.singleshow.no.exist"));
		}

		return SUCCESS;
	}
	/*
	* 进入编辑页面，同时拿到类别
	* */
	public String ShowAdd(){
		UserSingle userSingle = (UserSingle) session.get("loginUser");
		InfoSingle infoSingle = new InfoSingle();
		infoSingle.setInfoLinkman(userSingle.getName());
		infoSingle.setInfoPhone(userSingle.getPhone());
		infoSingle.setInfoEmail(userSingle.getEmail());
		request.setAttribute("infoSingle",infoSingle);
		return INPUT;
	}

	/*
	* 添加新的项目信息到数据库
	* */
	public String addInfo() throws UnsupportedEncodingException {
		OpDB myOp=new OpDB();

		Integer typepid = Integer.parseInt(request.getParameter("infoTypepid"));
		Integer type = Integer.parseInt(request.getParameter("infoType"));
		String title = request.getParameter("infoTitle");
		title=new String(title.getBytes("8859_1"), "utf8");
		String linkman = request.getParameter("infoPeople");
		linkman=new String(linkman.getBytes("8859_1"), "utf8");
		String phone = request.getParameter("infoPhone");
		String email = request.getParameter("infoEmail");
		String content = request.getParameter("infoContent");
		content=new String(content.getBytes("8859_1"), "utf8");
		String date=DoString.dateTimeChange(new java.util.Date());
		String state="1";
		String attention=request.getParameter("infoAttention");
		String id = request.getParameter("id");
		System.out.println("----------id is "+id+"--------------");
		UserSingle user = (UserSingle)session.get("loginUser");
		String userid = user.getId();

		int i;
		String sql = null;
		if(id==null||Integer.valueOf(id)==0){
			sql="insert into tb_info(info_type, info_title, info_content, info_linkman, info_phone, info_email, info_date, info_state, info_attention, info_typepid,info_userid) values(?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params={type,title,content,linkman,phone,email,date,state,attention,typepid,userid};
			i=myOp.OpUpdate(sql,params);
			if(i<=0){
				return INPUT;
			}else{
				return "insert success";
			}
		}
		else{
			sql="update tb_info set info_type = ?, info_title = ?, info_content = ?, info_linkman = ?, info_phone = ?, info_email = ?, info_date = ?, info_state = ?, info_attention = ?, info_typepid = ?,info_userid = ? where id = ?";
			Object[] params={type,title,content,linkman,phone,email,date,state,attention,typepid,userid,id};
			i=myOp.OpUpdate(sql,params);
			if(i<=0){
				return INPUT;
			}else{
				return "insert success";
			}
		}

	}
	

	public String SearchShow() throws UnsupportedEncodingException{

		OpDB myOp = new OpDB();
		String subsql=request.getParameter("subsql");
		String sqlvalue=request.getParameter("sqlvalue");
		String type=request.getParameter("type");
		
		if(subsql.equals("info_typepid")){
			String infoType = sqlvalue;
			String type_pid ;
			if(Integer.valueOf(infoType)<= 11){
				type_pid = infoType;
				Object [] sublevelparams = {type_pid};
				String sqlsublevel="SELECT * from tb_type WHERE type_pid = ?";
				TreeMap sublevelmap = myOp.OpGetListBox(sqlsublevel, sublevelparams);
				if(sublevelmap==null)
					sublevelmap=new TreeMap();
				session.put("sublevelmap", sublevelmap);
			}
		}
		
		
		UserSingle user = null;
		sqlvalue= new String(sqlvalue.getBytes("8859_1"),"UTF-8");

		
		String param="";
		String opname="";
		if(type.equals("like")){
			opname=" LIKE ";
			param="%"+sqlvalue+"%";			
		}
		else{		
			opname=" = ";
			param=sqlvalue;			
		}
		
		String attent= request.getParameter("attent");
		String info_attention = "";
		if(attent != null && attent != ""){
			info_attention = "AND (info_attention = '"+attent+"')"; 
		}
		
		List_for_show(subsql,opname,sqlvalue,type,param,info_attention);
		return "success";
	}
	
	

	private void List_for_show(String subsql,String opname,String sqlvalue,String type,String param,String info_attention){
		
		String sqlSearchAll="SELECT * FROM tb_info WHERE ("+subsql+opname+"?) ORDER BY info_date DESC";
		System.out.println(sqlSearchAll+param);

		String sqlSearchSub="";		
		Object[] params={param};		

		int perR=20;
		String strCurrentP=request.getParameter("showpage");
		String gowhich = "info_SearchShow.action?subsql="+subsql+"&sqlvalue="+sqlvalue+"&type="+type+"&showType=link";
		
		OpDB myOp=new OpDB();
		CreatePage createPage=myOp.OpCreatePage(sqlSearchAll, params,perR,strCurrentP,gowhich);			//����OpDB���е�OpCreatePage()����������ܼ�¼������ҳ�����������õ�ǰҳ�룬��Щ��Ϣ����װ����createPage������
		  
		int top1=createPage.getPerR();
		int currentP=createPage.getCurrentP();
		
		if(currentP==1){
			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname+"?)"+ info_attention +"ORDER BY info_date DESC";
			System.out.println(sqlSearchSub);
		}
		else{
			int top2=(currentP-1)*top1;  
			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname +"?)" + info_attention + "AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top2+" info_date FROM tb_info WHERE "+subsql+opname+"'"+param+"'" + info_attention +"ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
//			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname+"?) AND (info_date NOT IN (SELECT TOP "+top2+" info_date FROM tb_info WHERE "+subsql+opname+"'"+param+"' ORDER BY info_date DESC)) ORDER BY info_date DESC";				//��һ��ʵ�ַ�ҳ��ѯ��SQL���
		}

		List searchlist=myOp.OpListShow(sqlSearchSub, params);
		//因为在前端的一个复用导致的，详见request.tipSingle的意义 好吧我也很绝望我之后再想想办法
		request.setAttribute("attentionlist",searchlist);
		request.setAttribute("createpage", createPage);
		
	}
	
	
	
				

	public void validateSingleShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		String id=request.getParameter("id");
		if(id==null&&id.equals("")){
			addFieldError("SingleShowNoID",getText("Project.info.singleshow.no.id"));
		}
		else{
			try{
				Integer.parseInt(id);
			}catch(NumberFormatException e){
				addFieldError("SingleShowWrongID",getText("Project.info.singleshow.format.infoID"));
				e.printStackTrace();
			}
		}
	}
}