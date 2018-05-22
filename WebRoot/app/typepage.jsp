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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/index.css"> 

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
	                     <input type="text" name="type_name"  placeholder="请输入二级目录类别"  required  lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
	            </div>
	            <div class="layui-form-item">
                    <button class="layui-btn layui-btn-radius layui-btn-normal wd-button-submit" lay-submit lay-filter="formSend">添加</button>
                </div>
	         </form>
			
			<c:forEach var="i" begin="1" end="11" step="1">  
                 <c:forEach var="typ" items="${typelist}">
						<c:if test ="${typ.type_pid == i}" >
							<c:if test = "${typ.id == i}">
							   
				                    <fieldset>
				                        <legend>
				                           <span>${typ.type_name}</span>
				                        </legend>
				                    </fieldset>
				                
							</c:if>
							<c:if test =  "${typ.id != i}">
								<form class="layui-form wd-form" action="type_Edit.action">
									<div class="layui-container">
										<div class="layui-row">
										    <div class="layui-col-md3">
								                    <input type="text" name="type_name"  required value = "${typ.type_name}"
								                     	lay-verify="required" autocomplete="off" class="layui-input">
								                     <input type = "hidden" name ="id" value="${typ.id}" >
								                     <input type = "hidden" name ="worktype" value="change" >
										    </div>
										    <div class="layui-col-md3">
 												<button class="layui-btn layui-btn-radius layui-btn-normal wd-button-submit" lay-submit>修改</button>
						            			<span class="layui-btn layui-btn-radius layui-btn-normal wd-button-submit" ><a href="type_Edit.action?worktype=delete&id=${typ.id}">删除</a></span>
										    </div>
										    <div class="layui-col-md4">
										    </div>
										</div>
						            </div>
								 </form>

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
