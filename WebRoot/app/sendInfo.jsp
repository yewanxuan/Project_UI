<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.yxq.action.*,com.yxq.bean.*,com.yxq.dao.DB"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目信息网</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/assets/layui/css/layui.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/reset.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/sendinfo.css"> 

</head>
<body>
	<%
 		TypeSingle typeSingle = new TypeSingle();
		List<TypeSingle> alltype = new ArrayList();
		DB mydb = new DB();
		String sql = "select * from tb_type order by id;";
		
		mydb.doPstm(sql,null);
		ResultSet rs= mydb.getRs();
	
		if(rs!=null){
				while(rs.next()){
					TypeSingle type=new TypeSingle();
					type.setId(rs.getInt("id"));
					type.setType_pid(rs.getInt("type_pid"));
					type.setType_name(rs.getString("type_name"));
					type.setType_sign(rs.getInt("type_sign"));
					alltype.add(type);
					System.out.println("TypeSingle is"+type.getId()+"  "+type.getType_pid()+type.getType_name());
				}
		}
		rs.close();
		
		System.out.println(alltype.size());
      	String[][] nameString=new String[12][12];//定义一个二维数组  
    	int[][] nameid=new int[12][12];  
    	for(int i = 1; i <= 11; i++){
    		int count = 0;
    		for(int j=0;j<alltype.size();j++){
    			
    			if(alltype.get(j).getType_pid()==i){
    				  nameString[i][count]=alltype.get(j).getType_name();  
    				  nameid[i][count]=alltype.get(j).getId();
    				  System.out.println("now pid ="+i+nameString[i][count]+nameid[i][count]);
    				  count++;
    			}
    		}
    	}  

		
	%>





    <div class="content">
        <hr class="clearBoth">
        <div class="headTitle"><i class="layui-icon">&#xe609;</i>发布信息</div>
        <form class="layui-form wd-form" action="info_addInfo.action" name="frm">

             <div class="layui-form-item">
                <label class="layui-form-label">信息类别</label>
                <div class="layui-input-block wd-select-block">
                    <select name="infoTypepid" id="first-level-select" lay-verify="required" lay-filter="level">
                        <option value="${requestScope.infoSingle.infoTypepid}" selected></option> 
                        <c:forEach var="item" items="${sessionScope.typeMap}">
                        	<c:if test="${item.key<=11}">
                            	<option value="${item.key}">${item.value}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">二级类别</label>
                <div class="layui-input-block wd-select-block">
                    <select name="infoType" id="second-level-select" lay-verify="required">
                        <option value="请选择" selected>请选择</option>
                    </select>
                </div>
            </div>  

            <div class="layui-form-item">
                <label class="layui-form-label">所属团队</label>
                <div class="layui-input-block wd-select-block">
                    <select name="infoAttention" lay-verify="required">
                        <option value="${requestScope.infoSingle.infoAttention}" selected></option> 
                        <c:forEach var="item" items="${sessionScope.attentMap}">
                            <option value="${item.key}">${item.value}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">信息标题</label>
                <div class="layui-input-block">
                    <input type="text" name="infoTitle"  required 
							      value = "${requestScope.infoSingle.infoTitle}"
								placeholder="请输入项目内容（0 ~ 40字符）" 
                     lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系人</label>
                <div class="layui-input-block">
                    <input type="text" name="infoPeople" required value="${requestScope.infoSingle.infoLinkman}" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="infoPhone" required value="${requestScope.infoSingle.infoPhone}" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">E-mail</label>
                <div class="layui-input-block">
                    <input type="text" name="infoEmail" required value="${requestScope.infoSingle.infoEmail}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">信息内容</label>
                <div class="layui-input-block">
                    <textarea name="infoContent" placeholder="请输入项目内容（0 ~ 500字符）" class="layui-textarea wd-textarea">
                      ${requestScope.infoSingle.infoContent}  
                    </textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-radius layui-btn-normal wd-button-submit" lay-submit lay-filter="formSend">提交</button>
                </div>
            </div>
        </form>
    </div>

    <script src="<%= request.getContextPath()%>/app/js/public/jquery-3.2.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/sendinfo.js"></script>

</body>
</html>
