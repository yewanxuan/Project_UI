<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
    
    
    <link rel="stylesheet" href="/app/assets/layui/css/layui.css">
    <link rel="stylesheet" href="/app/css/public/reset.css">
    <link rel="stylesheet" href="/app/css/sendinfo.css">
</head>
<body>

<script language="javascript">
//获取一级菜单长度
	var select1_len = document.frm.infoTypepid.options.length;
	var select2 = new Array(select1_len);
	//把一级菜单都设为数组
	for (i=0; i<select1_len; i++)
		{ select2[i] = new Array();}
	//定义基本选项
	
	select2[0][0] = new Option("please", " ");
	var list = '${sessionScope.typeMap}';

	
	select2[1][0] = new Option("PHP", " ");
	select2[1][1] = new Option("ASP", " ");
	select2[1][2] = new Option("JSP", " ");
	
	select2[2][0] = new Option("C/C++", " ");
	select2[2][1] = new Option("Java", " ");
	select2[2][2] = new Option("C#", " ");
	
	select2[3][0] = new Option("Perl", " ");
	select2[3][1] = new Option("Ruby", " ");
	select2[3][2] = new Option("Python", " ");
	//联动函数
	function redirec(x)
	{
	var temp = document.frm.infoType;
	for (i=0;i<select2[x].length;i++)
	{ temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);}
	temp.options[0].selected=true;
	}
</script>
    
    


    <div class="content">
        <hr class="clearBoth">
        <div class="headTitle"><i class="layui-icon">&#xe609;</i>发布信息</div>
        <form class="layui-form wd-form" action="info_addInfo.action" name="frm">
            <div class="layui-form-item">
                <label class="layui-form-label">信息类别</label>
                <div class="layui-input-block wd-select-block">
                    <select name="infoTypepid" lay-verify="required"   onChange="redirec(document.frm.infoTypepid.options.selectedIndex)"> 
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
                    <select name="infoType" lay-verify="required"> 
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

    <script src="/app/assets/layui/layui.js"></script>
    <script src="/app/js/sendinfo.js"></script>
    <script src="/app/js/test.js"></script>
    <script src="<%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/sendinfo.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/test.js"></script>
</body>
</html>
