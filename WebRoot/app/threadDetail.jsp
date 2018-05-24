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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/reset.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/public/public.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/css/threadDetail.css">
</head>
<body>
    <jsp:include page="components/header.jsp"></jsp:include>
    <div class="container">
        <div class="layui-card">
            <div class="layui-card-header ad-card-header">${sessionScope.commentSingle.infoTitle}</div>
            <div class="layui-card-body ad-card-body">${sessionScope.commentSingle.infoContent}</div>
        </div>
        <%--评论输入框--%>
        <form class="layui-form" action="thread_sendComment.action">
            <div class="layui-form-item layui-form-text">
	                <div class="layui-input-block ad-input-block">
	                	<input type="hidden" name = "req_userid"  value = "${sessionScope.loginUserId}">
	                	<input type="hidden" name = "rsp_userid" value="${sessionScope.commentSingle.infoUserid}">
	                	<input type="hidden" name = "info_id" value = "${sessionScope.commentSingle.id}">
	                    <textarea name="detail" placeholder="请输入评论内容" class="layui-textarea"></textarea>
	                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block ad-button-block">
                    <button class="layui-btn ad-layui-btn" lay-submit lay-filter="formComment">发 表</button>
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
        <div class="comment">
        	 <c:forEach var="comm" items="${requestScope.commentlist}" >
	            <div class="comment-item">
	                <div class="com-header">${comm.reqUserid}回复 ${comm.rspUserid}</div>
	                <div class="com-body">${comm.detail}</div>
	                <div class="com-tail">
	                	<form class="layui-form" action="thread_sendComment.action">
		                	<input type="hidden" name = "req_userid" value="${sessionScope.loginUserId}">
		                	<input type="hidden" name = "info_id" value = "${sessionScope.commentSingle.id}">
		                	<input type="hidden" name = "rsp_userid" value="${comm.reqUserid}">
	                    	<textarea name="detail" placeholder="请输入评论内容" class="layui-textarea"></textarea>
	                    	<button class="layui-btn ad-layui-btn" lay-submit lay-filter="formComment">我要回复</button>
	                	</form>
	                </div>
	            </div>
            </c:forEach>

        </div>
    </div>
    <jsp:include page="components/footer.jsp"></jsp:include>

    <script src="<%= request.getContextPath()%>/app/js/public/jquery-3.2.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/threadDetail.js"></script>
    <script>
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formComment)', function(data){
                layer.msg(JSON.stringify(data.field));
                // return false;
            });
        });
    </script>
</body>
</html>
