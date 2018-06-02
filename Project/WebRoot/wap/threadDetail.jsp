<%--
  Created by IntelliJ IDEA.
  User: andy
  Date: 2018/5/22
  Time: 下午7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>项目信息网</title>
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/public/reset.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/public/public.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/threadDetail.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/wap/css/index.css">
</head>
<body>
    <jsp:include page="components/header.jsp"></jsp:include>
    <div class="container">
        <div class="layui-card">
            <div class="layui-card-header ad-card-header">${sessionScope.commentSingle.infoTitle}</div>
            <div class="layui-card-body ad-card-body">
                   <div class="wd-colla-center">${sessionScope.commentSingle.infoContent}</div>
                   <div class="wd-colla-bottom">
                          <div class="wd-bottom-area wd-person-area">
                                <span>联系人：</span>
                                <span>${sessionScope.commentSingle.infoLinkman}</span>
                          </div>
                          <div class="wd-bottom-area wd-person-area">
                               <span>联系电话：</span>
                               <span>${sessionScope.commentSingle.infoPhone}</span>
                          </div>
                          <div class="wd-bottom-area wd-person-area">
                               <span>E-mail：</span>
                               <span>${sessionScope.commentSingle.infoEmail}</span>
                          </div>
                          <div class="wd-bottom-area wd-person-area">
                               <span>发布时间：</span>
                               <span>${sessionScope.commentSingle.infoDate}</span>
                          </div>   	 
                   </div>
        	</div>
        </div>
        <%--评论输入框--%>
        <form class="layui-form" action="wapthread_sendComment.action">
            <div class="layui-form-item layui-form-text">
	                <div class="layui-input-block ad-input-block">
	                	<input type="hidden" name = "req_userid"  value = "${sessionScope.loginUserId}">
	                	<input type="hidden" name = "rsp_userid" value="${sessionScope.commentSingle.infoUserid}">
	                	<input type="hidden" name = "info_id" value = "${sessionScope.commentSingle.id}">
	                    <textarea name="detail" placeholder="请输入评论内容4-200字符"  lay-verify="required|detail" class="layui-textarea"></textarea>
	                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block ad-button-block">
                    <button class="layui-btn ad-layui-btn ad-btn-send-reply" lay-submit lay-filter="formComment">发 表</button>
                </div>
            </div>
        </form>
        <%--评论区域--%>
        <div class="site-title">
            <fieldset>
                <legend>
                    <a name="default">全部评论</a>
                </legend>
            </fieldset>
        </div>
        <ul class="comment" id="commentID">
        	 <c:forEach var="comm" items="${requestScope.commentlist}" varStatus="status">
	            <li class="comment-item">
	                <div class="com-header">
                        <span><font color="#4D4DFF">${comm.reqName}</font></span>
                        <span class="com-date">${comm.reqDate}</span>
                    </div>
	                <div class="com-body">
	                	<c:if test="${comm.rspUserid!='-1'}">
	                                                                                   回复<span><font color="#4D4DFF">${comm.rspName}:</font></span>
	                   </c:if>
	                   ${comm.detail}
	                </div>
                    <div class="com-reply">
                        <span class="reply-obj" onclick="showReplyFoo(${status.index})"><font color = "#009688">回复</font></span>
                    </div>
	                <div class="com-tail">
	                	<form class="layui-form" action="wapthread_sendComment.action">
		                	<input type="hidden" name = "req_userid" value="${sessionScope.loginUserId}">
		                	<input type="hidden" name = "info_id" value = "${sessionScope.commentSingle.id}">
		                	<input type="hidden" name = "rsp_userid" value="${comm.reqUserid}">
	                    	<textarea name="detail" placeholder="请输入评论内容4-200字符"  lay-verify="required|detail" class="layui-textarea ad-thread-textarea"></textarea>
	                    	<button class="layui-btn ad-layui-btn" lay-submit lay-filter="formReply">我要回复</button>
	                	    <div class="clearBoth"></div>
                        </form>
	                </div>
	            </li>
            </c:forEach>
        </ul>
    </div>
    <jsp:include page="components/footer.jsp"></jsp:include>

    <script src="<%= request.getContextPath()%>/wap/js/public/jquery-3.2.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/wap/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/wap/js/threadDetail.js"></script>
    <script>
               /*  */
    
    layui.use(['form', 'layedit', 'laydate','element'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit;
	  
	   $('.com-tail').hide(); 
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    detail: function(value){
	      if(value.length < 4){
	        return '评论至少4个字符';
	      }
	      if(value.length>200)
	      	return '评论最多200字符';
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
