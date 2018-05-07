package com.yxq.action;

import java.util.List;

import com.yxq.actionSuper.AdminSuperAction;
import com.yxq.dao.OpDB;
import com.yxq.bean.CreatePage;

public class AdminAction extends AdminSuperAction {

	/** ���ܣ�����Ա����-�����б���ʾ��Ϣ */
	public String ListShow(){
		request.setAttribute("mainPage","../info/listshow.jsp");
		session.remove("adminOP");	
		
		//�����right.jspѡ�����������
		int infoType=showType.getInfoType();
		String stateType=showType.getStateType();
		String attentionType=showType.getAttentionType();

		session.put("infoType",Integer.valueOf(infoType));  				//������ѡ��ġ���Ϣ��𡱵�ѡ��
		session.put("attentionType",attentionType);								
		//������ѡ��ġ�����״̬����ѡ�� session�д�Сд����
		session.put("stateType",stateType);									//������ѡ��ġ����״̬����ѡ��		
		
		String sqlall="";
		String sqlsub="";
		Object[] params=null;
		String mark="";		
		int perR=8;
		
		if(!stateType.equals("all")&&!attentionType.equals("all")){			//û��ͬʱѡ�񡰸���״̬���롰���״̬���еġ�ȫ����ѡ��
			mark="1";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_Attention=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_Attention=?) ORDER BY info_date DESC";			
			params=new Object[3];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
			params[2]=attentionType;					
		}else if(stateType.equals("all")&&attentionType.equals("all")){		//ͬʱѡ���ˡ�����״̬���롰���״̬���еġ�ȫ����ѡ��
			mark="2";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";			
			params=new Object[1];
			params[0]=Integer.valueOf(infoType);
		}else if(attentionType.equals("all")){									//ѡ���ˡ�����״̬���еġ�ȫ����ѡ������״̬��ѡ������
			mark="3";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
		}
		else if(stateType.equals("all")){  									//ѡ���ˡ����״̬���еġ�ȫ����ѡ�������״̬��ѡ������
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
		CreatePage createPage=myOp.OpCreatePage(sqlall, params,perR,strCurrentP,gowhich);			//����OpDB���е�OpCreatePage()����������ܼ�¼������ҳ�����������õ�ǰҳ�룬��Щ��Ϣ����װ����createPage������
		
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

	
	/** ���ܣ�����Ա����-��ʾҪ��˵���Ϣ */
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
		if(infoSingle==null){			//��Ϣ������
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("P.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** ���ܣ�����Ա����-�����Ϣ(�������ݿ�) */
	public String Check(){
		session.put("adminOP","Check");			//��¼��ǰ����Ϊ�������Ϣ��			
		
		String checkID=request.getParameter("checkID");
		String sql="UPDATE tb_info SET info_state = 1 WHERE (id = ?)";
		Object[] params={checkID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//�����Ϣ�ɹ�			
			return "checkSuccess";			
		}
		else{									//�����Ϣʧ��
			comebackState();
			addFieldError("AdminCheckUnSuccess",getText("city.admin.check.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ�����Ա����-ɾ����Ϣ(�������ݿ�) */
	public String Delete(){
		
		session.put("adminOP","Delete");		//��¼��ǰ����Ϊ��ɾ����Ϣ��			
		String deleteID=request.getParameter("deleteID");
		String sql="DELETE tb_info WHERE (id = ?)";
		Object[] params={deleteID};
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//ɾ����Ϣ�ɹ�			
			return "deleteSuccess";			
		}
		else{									//ɾ����Ϣʧ��
			comebackState();
			addFieldError("AdminDeleteUnSuccess",getText("Project.admin.delete.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ�����Ա����-��ʾҪ���и������õ���Ϣ */
	public String SetAttentShow(){
		request.setAttribute("mainPage","../info/attentshow.jsp");		
		
		String attentID=request.getParameter("attentID");

		if(attentID==null||attentID.equals(""))
			attentID="-1";
		
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		Object[] params={attentID};
		
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//��Ϣ������
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("Project.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** ���ܣ�����Ա����-�����Ѹ�����Ϣ(�������ݿ�) */
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
		if(i>0){								//��Ϣ�������óɹ�			
			addFieldError("AdminSetAttentSuccess",getText("Project.admin.setattent.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "setAttentSuccess";			
		}
		else{									//��Ϣ��������ʧ��
			addFieldError("AdminSetAttentUnSuccess",getText("Project.admin.setattent.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ���֤����-��̨�����б���ʾ��Ϣʱ����֤�Ƿ�ѡ����һ����ʾ��ʽ����Ϣ��� */
	public void validateListShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String adminOP=(String)session.get("adminOP");
		if(adminOP==null)
			adminOP="";
		if(adminOP.equals("Check")||adminOP.equals("Delete"))    //����ǽ����ˡ�ͨ����ˡ���ɾ����Ϣ����������������ListShow()������ʾ��Ϣ�б�����Ҫ�ָ�֮ǰѡ��ġ���ʾ��ʽ���͡���Ϣ���״̬���Ӷ�������ListShow()�����в�ѯ�����������ļ�¼
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
			
			if(getInfoType<=0){						//û��ѡ����Ϣ���
				addFieldError("AdminListNoType",getText("Project.admin.list.no.infoType"));
			}
			else{
				if(getAttentionType==null||getAttentionType.equals("")){		//û��ѡ�񡰸���״̬��ѡ��
					addFieldError("AdminListNoAttentionType",getText("Project.admin.list.no.AttentionType"));
				}
				if(getStateType==null||getStateType.equals("")){			//û��ѡ�����״̬��ѡ��
					addFieldError("AdminListNoStateType",getText("Project.admin.list.no.stateType"));
				}
			}			
		}
	}
	
	/** ���ܣ���֤����-��̨������Ϣ�ĸ������ò���ʱ����֤�Ƿ���������ϢIDֵ�������IDֵ�Ƿ�Ϊ���ָ�ʽ */
	public void validateSetAttentShow() {
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String attentID=request.getParameter("attentID");		
		if(attentID==null||attentID.equals("")){				//û��������ϢIDֵ
			addFieldError("attentIDError",getText("Project.admin.setattent.no.attentID"));
		}
		else{												//��֤�������ϢIDֵ�Ƿ�Ϊ���ָ�ʽ			
			try{
				int id=Integer.parseInt(attentID);
				if(id<0)									//��IDΪ����
					addFieldError("attentIDError",getText("Project.admin.setattent.attentID.0"));
			}catch(NumberFormatException e){
				addFieldError("attentIDError",getText("Project.admin.setattent.format.attentID"));
				e.printStackTrace();
			}
		}
	}
	
	/** ���ܣ��ָ��ڡ���ʾ��ʽ���е�ѡ��״̬ */
	private void comebackState(){
		/* ��ȡsession�б����ѡ��״̬��
		 * ��ѡ��״̬������session�У�
		 * ���ڹ���Ա��������ʾ����ť�����б���ʾʱ��
		 * ��ListShow()������ʵ�ֵ�
		 */
		Integer getInfoType=(Integer)session.get("infoType");
		String getAttentionType=(String)session.get("attentionType");
		String getStateType=(String)session.get("stateType");
		
		 //�ָ�ѡ���״̬ 
		if(getAttentionType!=null&&getStateType!=null&&getInfoType!=null){			
			showType.setInfoType(getInfoType.intValue());	
			showType.setAttentionType(getAttentionType);
			showType.setStateType(getStateType);			
		}
	}
}
