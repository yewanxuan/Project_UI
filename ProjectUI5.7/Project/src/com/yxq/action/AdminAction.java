package com.yxq.action;

import java.util.List;

import com.yxq.actionSuper.AdminSuperAction;
import com.yxq.dao.OpDB;
import com.yxq.bean.CreatePage;

public class AdminAction extends AdminSuperAction {

	/** 功能：管理员操作-进行列表显示信息 */
	public String ListShow(){
		request.setAttribute("mainPage","../info/listshow.jsp");
		session.remove("adminOP");	
		
		//这个是right.jsp选项框来决定的
		int infoType=showType.getInfoType();
		String stateType=showType.getStateType();
		String attentionType=showType.getAttentionType();

		session.put("infoType",Integer.valueOf(infoType));  				//保存已选择的“信息类别”的选项
		session.put("attentionType",attentionType);								
		//保存已选择的“付费状态”的选项 session中大小写存疑
		session.put("stateType",stateType);									//保存已选择的“审核状态”的选项		
		
		String sqlall="";
		String sqlsub="";
		Object[] params=null;
		String mark="";		
		int perR=8;
		
		if(!stateType.equals("all")&&!attentionType.equals("all")){			//没有同时选择“付费状态”与“审核状态”中的“全部”选项
			mark="1";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_Attention=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_Attention=?) ORDER BY info_date DESC";			
			params=new Object[3];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
			params[2]=attentionType;					
		}else if(stateType.equals("all")&&attentionType.equals("all")){		//同时选择了“付费状态”与“审核状态”中的“全部”选项
			mark="2";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";			
			params=new Object[1];
			params[0]=Integer.valueOf(infoType);
		}else if(attentionType.equals("all")){									//选择了“付费状态”中的“全部”选项，“审核状态”选项任意
			mark="3";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
		}
		else if(stateType.equals("all")){  									//选择了“审核状态”中的“全部”选项，“付费状态”选项任意
			mark="4";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_Attention=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_Attention=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=attentionType;
		}		
		
		String strCurrentP=request.getParameter("showpage");
		String gowhich="admin_ListShow.action";
		
		OpDB myOp=new OpDB();
		CreatePage createPage=myOp.OpCreatePage(sqlall, params,perR,strCurrentP,gowhich);			//调用OpDB类中的OpCreatePage()方法计算出总记录数、总页数，并且设置当前页码，这些信息都封装到了createPage对象中
		
		int currentP=createPage.getCurrentP();		
		if(currentP>1){
			int top=(currentP-1)*perR;
			if(mark.equals("1")){
				
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_Attention = ?) AND (info_state = ?) AND " +
							"(info_date < " +
								"(SELECT MIN(info_date) FROM " +
									"(SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_Attention = i.info_Attention) AND (info_state = i.info_state) " +
										"ORDER BY info_date DESC) AS mindate)" +
							 ")" +
						"ORDER BY info_date DESC";
			}
			else if(mark.equals("2")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("3")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_state = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_state = i.info_state) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("4")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_Attention = ?) AND " +
							"(info_date " +
								"< (SELECT MIN(info_date) FROM " +
									 "(SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_Attention = i.info_Attention) " +
										"ORDER BY info_date DESC) " +
										/*"AS mindate" +*/
								  ")" +
							 ")" +
						"ORDER BY info_date DESC";
			}				
		}

		List adminlistshow=myOp.OpListShow(sqlsub, params);
		request.setAttribute("adminlistshow",adminlistshow);
		request.setAttribute("createpage",createPage);
		return SUCCESS;
	}

	
	/** 功能：管理员操作-显示要审核的信息 */
	public String CheckShow(){
		request.setAttribute("mainPage","../info/checkshow.jsp");		
		comebackState();
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		String checkID=request.getParameter("checkID");
		if(checkID==null||checkID.equals(""))
			checkID="-1";
		Object[] params={checkID};
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//信息不存在
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("P.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** 功能：管理员操作-审核信息(更新数据库) */
	public String Check(){
		session.put("adminOP","Check");			//记录当前操作为“审核信息”			
		
		String checkID=request.getParameter("checkID");
		String sql="UPDATE tb_info SET info_state = 1 WHERE (id = ?)";
		Object[] params={checkID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//审核信息成功			
			return "checkSuccess";			
		}
		else{									//审核信息失败
			comebackState();
			addFieldError("AdminCheckUnSuccess",getText("city.admin.check.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：管理员操作-删除信息(更新数据库) */
	public String Delete(){
		
		session.put("adminOP","Delete");		//记录当前操作为“删除信息”			
		String deleteID=request.getParameter("deleteID");
		String sql="DELETE tb_info WHERE (id = ?)";
		Object[] params={deleteID};
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//删除信息成功			
			return "deleteSuccess";			
		}
		else{									//删除信息失败
			comebackState();
			addFieldError("AdminDeleteUnSuccess",getText("Project.admin.delete.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：管理员操作-显示要进行付费设置的信息 */
	public String SetAttentShow(){
		request.setAttribute("mainPage","../info/attentshow.jsp");		
		
		String attentID=request.getParameter("attentID");

		if(attentID==null||attentID.equals(""))
			attentID="-1";
		
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		Object[] params={attentID};
		
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//信息不存在
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("Project.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** 功能：管理员操作-设置已付费信息(更新数据库) */
	public String SetAttent(){		
		String attentID=request.getParameter("attentID");
		String attentYes=request.getParameter("attentYes");
		if(attentID==null||attentID.equals(""))
			attentID="-1";
		String sql;
		if(attentYes.equals("0")||attentYes=="0")
			sql="UPDATE tb_info SET info_attention='1' WHERE (id = ?)";
		else
			sql="UPDATE tb_info SET info_attention='0' WHERE (id = ?)";
		Object[] params={Integer.valueOf(attentID)};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//信息付费设置成功			
			addFieldError("AdminSetAttentSuccess",getText("Project.admin.setattent.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "setAttentSuccess";			
		}
		else{									//信息付费设置失败
			addFieldError("AdminSetAttentUnSuccess",getText("Project.admin.setattent.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：验证操作-后台进行列表显示信息时，验证是否选择了一种显示方式及信息类别 */
	public void validateListShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String adminOP=(String)session.get("adminOP");
		if(adminOP==null)
			adminOP="";
		if(adminOP.equals("Check")||adminOP.equals("Delete"))    //如果是进行了“通过审核”或“删除信息”操作后，再来调用ListShow()方法显示信息列表，则需要恢复之前选择的“显示方式”和“信息类别”状态，从而重新在ListShow()方法中查询出符合条件的记录
			comebackState();			
		else{
			int getInfoType=showType.getInfoType();			
			String getAttentionType=showType.getAttentionType();
			String getStateType=showType.getStateType();
			
			if(getInfoType<=0){
				if(session.get("infoType")!=null){
					getInfoType=(Integer)session.get("infoType");
					showType.setInfoType(getInfoType);
				}
			}			
			if(getAttentionType==null||getAttentionType.equals("")){
				getAttentionType=(String)session.get("AttentionType");
				showType.setAttentionType(getAttentionType);
			}
            if(getStateType==null||getStateType.equals("")){
            	getStateType=(String)session.get("stateType");
            	showType.setStateType(getStateType);
			}			
			
			if(getInfoType<=0){						//没有选择“信息类别”
				addFieldError("AdminListNoType",getText("Project.admin.list.no.infoType"));
			}
			else{
				if(getAttentionType==null||getAttentionType.equals("")){		//没有选择“付费状态”选项
					addFieldError("AdminListNoAttentionType",getText("Project.admin.list.no.AttentionType"));
				}
				if(getStateType==null||getStateType.equals("")){			//没有选择“审核状态”选项
					addFieldError("AdminListNoStateType",getText("Project.admin.list.no.stateType"));
				}
			}			
		}
	}
	
	/** 功能：验证操作-后台进行信息的付费设置操作时，验证是否输入了信息ID值和输入的ID值是否为数字格式 */
	public void validateSetAttentShow() {
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String attentID=request.getParameter("attentID");		
		if(attentID==null||attentID.equals("")){				//没有输入信息ID值
			addFieldError("attentIDError",getText("Project.admin.setattent.no.attentID"));
		}
		else{												//验证输入的信息ID值是否为数字格式			
			try{
				int id=Integer.parseInt(attentID);
				if(id<0)									//若ID为负数
					addFieldError("attentIDError",getText("Project.admin.setattent.attentID.0"));
			}catch(NumberFormatException e){
				addFieldError("attentIDError",getText("Project.admin.setattent.format.attentID"));
				e.printStackTrace();
			}
		}
	}
	
	/** 功能：恢复在“显示方式”中的选择状态 */
	private void comebackState(){
		/* 获取session中保存的选择状态。
		 * 将选择状态保存在session中，
		 * 是在管理员单击“显示”按钮请求列表显示时，
		 * 在ListShow()方法中实现的
		 */
		Integer getInfoType=(Integer)session.get("infoType");
		String getAttentionType=(String)session.get("attentionType");
		String getStateType=(String)session.get("stateType");
		
		 //恢复选择的状态 
		if(getAttentionType!=null&&getStateType!=null&&getInfoType!=null){			
			showType.setInfoType(getInfoType.intValue());	
			showType.setAttentionType(getAttentionType);
			showType.setStateType(getStateType);			
		}
	}
}
