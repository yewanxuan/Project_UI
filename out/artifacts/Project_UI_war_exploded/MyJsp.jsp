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
<title>This is a test!</title>
</head>
<body>
<form name="frm">
	<select name="s1" onChange="redirec(document.frm.s1.options.selectedIndex)">
		<option selected>select please</option>
	    <c:forEach var="item" items="${sessionScope.typeMap}">
	         <c:if test="${item.key<=11}">
	             <option value="${item.key}">${item.value}</option>
	         </c:if>
	    </c:forEach>
	</select>
	
	<select name="s2">
		<option value="请选择" selected>请选择</option>
	</select>
</form>
<script language="javascript">
//获取一级菜单长度
	var select1_len = document.frm.s1.options.length;
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
	var temp = document.frm.s2;
	for (i=0;i<select2[x].length;i++)
	{ temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);}
	temp.options[0].selected=true;
	}
</script>
</body>
</html>
