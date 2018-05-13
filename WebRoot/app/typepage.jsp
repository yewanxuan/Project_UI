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

</head>
<body>

    <div class="content">
        <hr class="clearBoth">
        <div class="headTitle"><i class="layui-icon">&#xe609;</i>类别显示</div>
		<div>
			<form class="layui-form wd-form" action="type_Add.action">
	            <div class="layui-form-item">
	                <label class="layui-form-label">信息类别</label>
	                <div class="layui-input-block wd-select-block">
	                    <select name="type_pid" lay-verify="required" >
	                        <c:forEach var="item" items="${sessionScope.typeMap}">
	                        	<c:if test="${item.key<=11}">
	                            	<option value="${item.key}">${item.value}</option>
	                            </c:if>
	                        </c:forEach>
	                    </select>
	                     <input type="text" name="type_name" required  lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
	            </div>
	            <div class="layui-form-item">
                    <button class="layui-btn layui-btn-radius layui-btn-normal wd-button-submit" lay-submit lay-filter="formSend">添加</button>
                </div>
	         </form>
			
			<c:forEach var="i" begin="1" end="11" step="1">  
                 <c:forEach var="typ" items="${typelist}">
						<c:if test =  "${typ.type_pid == i}" >
							<c:if test = "${typ.id == i}">
								<span>${typ.type_name}:</span><br>
							</c:if>
							<c:if test =  "${typ.id != i}">
								<span>${typ.type_name}</span>
								 <span><a href="type_Edit.action?worktype=change&id=${typ.id}">修改</a></span>
								 <span><a href="type_Edit.action?worktype=delete&id=${typ.id}">删除</a></span>
								 <br>
							</c:if>
						</c:if>
                </c:forEach>	
                <br>
            </c:forEach> 
        </div>    
	</div>

    <script src="<%= request.getContextPath()%>/app/js/public/jquery-3.2.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/sendinfo.js"></script>

</body>
</html>
