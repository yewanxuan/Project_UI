<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 23/04/2018
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<html>
<head>
    <title>项目信息网</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/assets/layui/css/layui.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/reset.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/login.css"> 
    
    
    <link rel="stylesheet" href="/app/assets/layui/css/layui.css">
    <link rel="stylesheet" href="/app/css/public/reset.css">
    <link rel="stylesheet" href="/app/css/login.css">
</head>
<body>
    <div class="loginFrame">
        <div class="loginArea">
            <div class="loginTitle">登录 </div>

			<s2:form action="log_AdminLogin.action" theme="simple" >
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="admin.userName" required  lay-verify="required" placeholder="请输入管理员账户" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="admin.userPassword" required  lay-verify="required" placeholder="请输入管理员" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <button lay-submit class="layui-btn layui-btn-radius layui-btn-normal layui-btn-fluid" lay-filter="formLogin">登 录</button>
                        <button type="reset" class="layui-btn layui-btn-radius layui-btn-fluid layui-btn-primary">重 置</button>
                    </div>
                </div>
            </s2:form>
        </div>
    </div>
    <script src="/app/assets/layui/layui.js"></script>

    
    <script src=" <%= request.getContextPath()%>/app/assets/layui/layui.js"></script>


</body>
</html>
