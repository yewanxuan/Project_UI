<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: wendy
  Date: 18/04/2018
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .header{
        position: fixed;
        z-index: 99;
        top: 0px;
        width: 100%;
        height: 60px;
        text-align: center;
        background-color: #393D49;
    }
    .nav-center{
        width: 1100px;
        height: 100%;
        margin: 0 auto;
    }
    .wd-nav-logo{
        float: left;
    }
    .wd-nav-login{
        float: right;
    }
    .wd-nav-choise{
        float: right;
    }
    .wd-user-avatar{
        position: relative;
        display: inline-block;
        cursor: pointer;
        font-size: 20px;
        color: #ffffff;
    }
</style>
<div class="header">
    <div class="nav-center">
        <ul class="layui-nav" lay-filter="">
            <li class="layui-nav-item wd-nav-logo">
                <a href="index.action">项目信息网</a>
            </li>
            <li class="layui-nav-item wd-nav-logo">
	             <c:if test="${sessionScope.loginAdmin == null}">
	                    <a href="log_isAdminLogin.action">管理员登录</a>
	                </c:if>
	                <c:if test="${sessionScope.loginAdmin != null}">
	                    <a href="javascript:;">
	                        <i class="layui-icon wd-user-avatar">&#xe612;</i>
	                    </a>
	                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
	                        <dd><a href="">查封账户</a></dd>
	                        <dd><a href="type_TypeShow.action">类别管理</a></dd>
	                        <dd><a href="log_AdminLogout.action">退出登录</a></dd>
	                    </dl>
	                </c:if>
            </li>
            <li class="layui-nav-item wd-nav-login">
                <c:if test="${sessionScope.loginUser == null}">
                    <a href="log_isLogin.action">登录</a>
                </c:if>
                <c:if test="${sessionScope.loginUser != null}">
                    <a href="javascript:;">
                        <i class="layui-icon wd-user-avatar">&#xe612;</i>
                    </a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="info_ShowAdd.action?addType=linkTo">发布信息</a></dd>
                        <dd><a href="info_SearchShow.action?subsql=info_userid&sqlvalue=${sessionScope.loginUser.id}&type=all">我的管理</a></dd>
                        <dd><a href="log_Logout.action">退出登录</a></dd>
                    </dl>
                </c:if>
            </li>

            <span class="wd-nav-choise">
                <c:forEach var="item" items="${sessionScope.typeMap}" end="4">
                    <li class="layui-nav-item"><a href="info_ListShow.action?infoType=${item.key}">${item.value}</a></li>
                </c:forEach>
                <li class="layui-nav-item">
                    <a href="javascript:;"> >> </a>
                    <dl class="layui-nav-child">
                        <c:forEach var="it" items="${sessionScope.typeMap}" begin="5" end="10">
                            <dd><a href="info_ListShow.action?infoType=${it.key}">${it.value}</a></dd>
                        </c:forEach>
                    </dl>
                </li>
            </span>
        </ul>
    </div>
</div>
