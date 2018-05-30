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
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/public/reset.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/login.css">

</head>
<body>
    <div class="loginFrame">
        <div class="loginArea">
            <div class="loginTitle"><span class="userLogin blueFont">登录</span> / <span class="userRegister">注册</span></div>
			<s2:form action="log_UserLogin.action" theme="simple" >
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="user.id" required  lay-verify="required" placeholder="请输入学工号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="user.password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="wd-input-block wd-forget">
                 		     ${requestScope.suggest}
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
            <form  class="layui-form" action="log_UserAdd.action"  name = "reg"  > <!-- onsubmit="return test()" -->
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="id" required  lay-verify="required|id" placeholder="请输入学工号" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="password" required lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="password" name="repassword" required  lay-verify="required|repassword"  placeholder="请再次确认密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="name" required  lay-verify="required|name" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="phone" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <input type="text" name="email" required  lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-input-block wd-input-block">
                        <button lay-submit class="layui-btn layui-btn-radius layui-btn-normal layui-btn-fluid" lay-filter="formRegister">注 册</button>
                        <button class="layui-btn layui-btn-radius layui-btn-fluid layui-btn-primary" onclick="showLoginArea">返回登录</button>
                    </div>
                </div>
            </form>    
        </div>
    </div>

    <script src=" <%= request.getContextPath()%>/wap/js/public/jquery-3.2.1.min.js"></script>
    <script src=" <%= request.getContextPath()%>/wap/assets/layui/layui.js"></script>
    <script src=" <%= request.getContextPath()%>/wap/js/login.js"></script>
    <script>

    
    layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit;
	  
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    name: function(value){
      if(value.length < 2){
        return '姓名至少2个字符';
      }
    }
    ,id: [/\d{6,12}/, '账号必须为学工号']
	,repassword:function(value){
		var passwordValue = $('input[name=password]').val();
		if(value != passwordValue){
			return '两次输入的密码不一致!';
		}	
	}
  });
  
	 form.render();
	  //监听提交
     form.on('submit(formRegister)', function(data){
           // layer.msg(JSON.stringify(data.field));
           // return false;
     });
  });
    
</script>
</body>
</html>
