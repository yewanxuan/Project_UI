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

</head>
<body>
    <div class="loginFrame">
        <div class="loginArea">
            <div class="loginTitle"><span class="userLogin blueFont">登录</span> / <span class="userRegister">注册</span></div>
			<s2:form action="log_UserLogin.action" theme="simple" >
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.id" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="user.password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="wd-input-block wd-forget">
                 		       忘记密码？
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
        <div class="registerArea">
            <div class="registerTitle"><span class="userLogin">登录</span> / <span class="userRegister blueFont">注册</span></div>
            <s2:form action="log_UserAdd.action" theme="simple" >
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.id" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="user.password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="repeatpassword" required  lay-verify="required" placeholder="请再次确认密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <button lay-submit class="layui-btn layui-btn-radius layui-btn-normal layui-btn-fluid" lay-filter="formLogin">注 册</button>
                        <button class="layui-btn layui-btn-radius layui-btn-fluid layui-btn-primary" onclick="showLoginArea">返回登录</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
            </s2:form>
        </div>
    </div>

    <script src=" <%= request.getContextPath()%>/app/js/public/jquery-3.2.1.min.js"></script>
    <script src=" <%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src=" <%= request.getContextPath()%>/app/js/login.js"></script>
    <script>
        layui.use('form', function(){
            var form = layui.form;
            form.render();
            form.on('submit(formLogin)', function(data){
                //  layer.msg(JSON.stringify(data.field));
            });
        });
    </script>
</body>
</html>
