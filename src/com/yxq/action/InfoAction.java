package com.yxq.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.TreeMap;
import java.lang.Integer;

import com.yxq.actionSuper.InfoSuperAction;
import com.yxq.dao.OpDB;
import com.yxq.bean.CreatePage;
import com.yxq.bean.InfoSingle;
import com.yxq.bean.UserSingle;
import com.yxq.tools.DoString;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

public class InfoAction extends InfoSuperAction {
	/**
	 * 
	 */
	public static TreeMap typeMap;

	public String Edit(){
		OpDB myOp=new OpDB();
		String worktype = request.getParameter("worktype");
		String id = request.getParameter("id");
		if(worktype.equals("refresh")){
			System.out.println(id);
			String sql = "update tb_info set info_date = ? where id = ?";
			String date=DoString.dateTimeChange(new java.util.Date());
			Object []params = {date,id};
			myOp.OpUpdate(sql,params);
		}
		if(worktype.equals("delete")){
			String sql = "delete from tb_info  where id = ?";
			Object []params = {id};
			myOp.OpUpdate(sql,params);
		}
		if(worktype.equals("change")){
			String sql = "select *from tb_info where id = ?";
			Object []params = {id};
			InfoSingle infoSingle = myOp.OpSingleShow(sql, params);
			request.setAttribute("infoSingle", infoSingle);
			return "input";
		}
		
		String subsql="info_userid";
		UserSingle user = (UserSingle) session.get("loginUser");
		String sqlvalue = user.getId();
		String opname=" = ";
		String param=sqlvalue;	
		String type = "all";	
		List_for_show(subsql,opname,sqlvalue,type,param);

		return "success";
	}
	
	
	public String ListShow(){
		request.setAttribute("mainPage","/pages/show/listshow.jsp");	
		OpDB myOp = new OpDB();
		String infoType = request.getParameter("infoType");
		Object []params = {infoType};
		String column = "info_type";
		String type_pid = null;
		//只有直接选择一级目录的时候，才会出现infoType有值的情况
		if(Integer.valueOf(infoType) <= 11){
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
				 + info_attention + "ORDER BY info_attention ASC,info_date DESC";		
		String sqlFreeSub="";
		int perR=4;
		String CurrentP = request.getParameter("showpage");
		String gowhich = null;
		gowhich = "info_ListShow.action?infoType="+infoType;
		CreatePage createPage=myOp.OpCreatePage(sqlFreeAll,params,perR,CurrentP,gowhich);
		
		System.out.println("*****"+createPage.getPerR()+"  "+createPage.getCurrentP());
	
		int top1=createPage.getPerR();
		int currentP=createPage.getCurrentP();		
		if(currentP==1){     		//设置显示第1页信息的SQL语句
			sqlFreeSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+column+" = ?) AND" +
					" (info_state = '1') " + info_attention + " ORDER BY info_date DESC";
		}
		else{						//设置显示除第1页外，其他指定页码信息的SQl语句
			int top2=(currentP-1)*top1;
			sqlFreeSub=	"SELECT TOP "+top1+" * FROM tb_info i WHERE ("+column+" = ?) " +
					"AND (info_state = '1') " + info_attention + " AND (info_date < (SELECT MIN(info_date) " +
					"FROM (SELECT TOP "+top2+" (info_date) FROM tb_info WHERE ("+column+" = i."+column+") AND " +
					"(info_state = '1') " + info_attention + "ORDER BY info_date DESC) AS mindate)) " +
							"ORDER BY info_date DESC";
			
		}
		
		List onelist = myOp.OpListShow(sqlFreeSub, params);
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
	public String addInfo() {
		OpDB myOp=new OpDB();
		String addtype = request.getParameter("addtype");
		System.out.println("addtype is "+addtype);
		//Integer type = Integer.parseInt(request.getParameter("infoType"));
		Integer typepid = Integer.parseInt(request.getParameter("infoTypepid"));
		Integer type = Integer.parseInt(request.getParameter("infoTypepid"));
		String title = request.getParameter("infoTitle");
		String linkman = request.getParameter("infoPeople");
		String phone = request.getParameter("infoPhone");
		String email = request.getParameter("infoEmail");
		String content = request.getParameter("infoContent");
		String date=DoString.dateTimeChange(new java.util.Date());
		String state="1";
		String attention=request.getParameter("infoAttention");
		UserSingle user = (UserSingle) session.get("loginUser");
		String userid = user.getId();
		System.out.println(userid);
		Object[] params={type,title,content,linkman,phone,email,date,state,attention,typepid,userid};
		String sql = null;
		sql="insert into tb_info(info_type, info_title, info_content, info_linkman, info_phone, info_email, info_date, info_state, info_attention, info_typepid,info_userid) values(?,?,?,?,?,?,?,?,?,?,?)";
		//sql="update tb_info set (info_type, info_title, info_content, info_linkman, info_phone, info_email, info_date, info_state, info_attention, info_typepid,info_userid) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		int i=myOp.OpUpdate(sql,params);
		if(i<=0){
			return INPUT;
		}else{
			return "insert success";
		}
	}
	

	public String SearchShow() throws UnsupportedEncodingException{

		String subsql=request.getParameter("subsql");
		String sqlvalue=null;

		if(subsql.equals("info_userid")){
			UserSingle user = (UserSingle) session.get("loginUser");
			sqlvalue = user.getId();
		}
		else{
			sqlvalue=request.getParameter("sqlvalue");	
		}
		String showType=request.getParameter("showType");
		String type=request.getParameter("type");
		if(showType==null)
			showType="";
		if(showType.equals("link")){
			try {
				sqlvalue=new String(sqlvalue.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {			
				sqlvalue="";
				e.printStackTrace();
			}
		}
		

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
		
		List_for_show(subsql,opname,sqlvalue,type,param);
		return "success";
	}
	
	private void List_for_show(String subsql,String opname,String sqlvalue,String type,String param){
		String sqlSearchAll="SELECT * FROM tb_info WHERE ("+subsql+opname+"?) ORDER BY info_date DESC";
		String sqlSearchSub="";		
		Object[] params={param};		

		int perR=8;
		String strCurrentP=request.getParameter("showpage");
		String gowhich = "info_SearchShow.action?subsql="+subsql+"&sqlvalue="+sqlvalue+"&type="+type+"&showType=link";
		
		OpDB myOp=new OpDB();
		CreatePage createPage=myOp.OpCreatePage(sqlSearchAll, params,perR,strCurrentP,gowhich);			//����OpDB���е�OpCreatePage()����������ܼ�¼������ҳ�����������õ�ǰҳ�룬��Щ��Ϣ����װ����createPage������
		  
		int top1=createPage.getPerR();
		int currentP=createPage.getCurrentP();
		
		if(currentP==1){
			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname+"?) ORDER BY info_date DESC";
		}
		else{
			int top2=(currentP-1)*top1;  
			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname+"?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top2+" info_date FROM tb_info WHERE "+subsql+opname+"'"+param+"' ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
//			sqlSearchSub="SELECT TOP "+top1+" * FROM tb_info WHERE ("+subsql+opname+"?) AND (info_date NOT IN (SELECT TOP "+top2+" info_date FROM tb_info WHERE "+subsql+opname+"'"+param+"' ORDER BY info_date DESC)) ORDER BY info_date DESC";				//��һ��ʵ�ַ�ҳ��ѯ��SQL���
		}
		System.out.println(sqlSearchSub);
		List searchlist=myOp.OpListShow(sqlSearchSub, params);
		request.setAttribute("attentionlist",searchlist);
		request.setAttribute("createpage", createPage);
		
	}
	public void validateListShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		String infoType=request.getParameter("infoType");
		if(infoType==null&&infoType.equals("")){
			addFieldError("ListShowNoType",getText("Project.info.listshow.no.infoType"));
		}
		else{
			try{
				Integer.parseInt(infoType);
			}
			catch(NumberFormatException e){
				addFieldError("ListShowWrongType",getText("Project.info.listshow.format.infoType"));
				e.printStackTrace();
			}
		}
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
	

	public void validateAdd(){
		request.setAttribute("mainPage","/pages/add/addInfo.jsp");
		String addType = request.getParameter("addType");
		if(addType == null ||addType.equals("")){
			addType="linkTo";
		}
		
		if(addType.equals("add")){			
			int type = infoSingle.getInfoType();
			String title = infoSingle.getInfoTitle();
			String content = infoSingle.getInfoContent();
			String phone=infoSingle.getInfoPhone();
			String linkman=infoSingle.getInfoLinkman();
			String email=infoSingle.getInfoEmail();			
			
			boolean mark=true;			
			if(type<=0){
				mark=false;
				addFieldError("typeError",getText("Project.info.no.infoType"));								
			}
			if(title==null||title.equals("")){
				mark=false;
				addFieldError("titleError",getText("Project.info.no.infoTitle"));
			}
			if(content==null||content.equals("")){
				mark=false;
				addFieldError("contentError",getText("Project.info.no.infoContent"));
			}
			if(phone==null||phone.equals("")){
				mark=false;
				addFieldError("phoneError",getText("Project.info.no.infoPhone"));
			}
			if(linkman==null||linkman.equals("")){
				mark=false;
				addFieldError("linkmanError",getText("Project.info.no.infoLinkman"));
			}
			if(email==null||email.equals("")){
				mark=false;
				addFieldError("emailError",getText("Project.info.no.infoEmail"));
			}
			if(mark){
				String phoneRegex="(\\d{3}-)\\d{8}|(\\d{4}-)(\\d{7}|\\d{8})|\\d{11}";
				if(phone.indexOf(",")<0){
					if(!infoSingle.getInfoPhone().matches(phoneRegex)){
						addFieldError("phoneError",getText("Project.info.format.infoPhone"));
					}					
				}
				else{
					String[] phones = phone.split(",");
					for(int i=0;i<phones.length;i++){
						if(!phones[i].matches(phoneRegex)){							
							addFieldError("phoneError",getText("Project.info.format.infoPhone"));							
							break;
						}
					}
				}
				String emailRegex="\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
				if(!infoSingle.getInfoEmail().matches(emailRegex)){
					addFieldError("emailError",getText("Project.info.format.infoEmail"));
				}				
			}
		}
	}

	public void validateSearchShow() {
/*		request.setAttribute("mainPage","/pages/error.jsp");
		String type=searchInfo.getType();
		String subsql=searchInfo.getSubsql();
		String sqlvalue=searchInfo.getSqlvalue();
		
		if(subsql==null||subsql.equals("")){
			addFieldError("SearchNoC",getText("Project.info.search.no.condition"));
		}
		if(sqlvalue==null||sqlvalue.equals("")){
			addFieldError("SearchNoV",getText("Project.info.search.no.value"));
		}
		if(type==null||type.equals("")){
			addFieldError("SearchNoT",getText("Project.info.search.no.type"));
		}
*/
	}
}
