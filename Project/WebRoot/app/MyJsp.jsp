<%@ page import="java.util.Map,java.util.TreeMap" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s2"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String mainPage = (String)request.getAttribute("mainPage");
  if(mainPage != null && mainPage.equals("")) {
      response.sendRedirect(mainPage);
  }
  session.setAttribute("hasInfoType", false);
  
  
  TreeMap searchType=new TreeMap();
  searchType.put("like","模糊");
  searchType.put("all","全字");
  request.setAttribute("searchType",searchType);
  
    Map attentMap=new TreeMap();
    attentMap.put("2","第三方团队"); 
    attentMap.put("1","学生团队");
    attentMap.put("0","教师团队"); 
    attentMap.put("","全部");
    session.setAttribute("attentMap",attentMap);
%>

<html>
<head>
    <title>项目信息网</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/assets/layui/css/layui.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/reset.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/public.css"> 
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/index.css"> 

</head>
<body>

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
                        	<c:if test="${item.key!=''}">
	                            <option value="${item.key}">${item.value}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">信息标题</label>
                <div class="layui-input-block">
                    <input type="text" name="infoTitle"  required  value = "写死测试"
								placeholder="请输入项目内容（4 ~ 40字符）" 
                     lay-verify="required|title" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系人</label>
                <div class="layui-input-block">
                    <input type="text" name="infoPeople" required value="叶婉璇" 
                    	lay-verify="required|name"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="infoPhone" required value="13105959869" lay-verify="required|phone"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">E-mail</label>
                <div class="layui-input-block">
                    <input type="text" name="infoEmail" required value="6197945@qq.com" lay-verify="email|(^$)" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">信息内容</label>
                <div class="layui-input-block">
                    <textarea name="infoContent" placeholder="我也不知道能不能成功" 
                       class="layui-textarea wd-textarea">${requestScope.infoSingle.infoContent}</textarea>
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
	    ,title: function(value){
	      if(value.length < 2){
	        return '标题至少4个字符';
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