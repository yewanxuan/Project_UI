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
        width: 100%;
        height: 100%;
        margin: 0 auto;
    }
    .wd-nav-logo{
        float: left;
    }
    .wd-nav-login{
        float: right;
    }
    .clearBoth{
        clear: both;
    }
    .wd-nav-choise{
        position: fixed;
        width: 100%;
        text-align: center;
        background-color: white;
        z-index: 99;
        height: 0;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0,0,0,.12);
        -webkit-transition: all .5s;
        -moz-transition: all .5s;
        -ms-transition: all .5s;
        -o-transition: all .5s;
        transition: all .5s;
    }
    .wd-nav-choise-anim{
        height: 120px;
    }
    .wd-nav-choise-div{
        margin: 10px auto;
        padding-left: 8px;
    }
    .wd-nav-choise li{
        float: left;
        margin: 0 auto;
        padding: 8px 12px;
    }
    .wd-nav-choise li a{
        color: #a6a6a6;
    }
    .wd-user-avatar{
        position: relative;
        display: inline-block;
        cursor: pointer;
        font-size: 20px;
        color: #ffffff;
    }
    .wd-nav-icon{
        float: right;
        font-size: 20px;
    }
    .wd-nav-icon i{
        font-size: 20px;
    }
</style>
<div class="header">
    <div class="nav-center">
        <ul class="layui-nav" lay-filter="">
            <li class="layui-nav-item wd-nav-logo">
				<c:if test="${sessionScope.loginUser == null}">
                    <a href="wapLog_isLogin.action">登录</a>
                </c:if>
                <c:if test="${sessionScope.loginUser != null}">
                    <a href="javascript:;">
                        <i class="layui-icon wd-user-avatar">&#xe612;</i>
                    </a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="info_ShowAdd.action?addType=linkTo">发布信息</a></dd>
                        <dd><a href="info_SearchShow.action?subsql=info_userid&sqlvalue=${sessionScope.loginUser.id}&type=all">我的管理</a></dd>
                        <dd><a href="wapLog_Logout.action">退出登录</a></dd>
                    </dl>
                </c:if>
            </li>
            <li class="layui-nav-item wd-nav-logo"><a href="wapIndex.action">首页</a></li>
            <li class="layui-nav-item wd-nav-icon wa-nav-items-list"><i class="layui-icon">&#xe668;</i></li>
            <div class="clearBoth"></div>
        </ul>
    </div>
</div>
<div class="wd-nav-choise">
    <div class="wd-nav-choise-div">
        <c:forEach var="item" items="${sessionScope.typeMap}" end="11">
            <li class="layui-nav-item"><a href="info_ListShow.action?infoType=${item.key}">${item.value}</a></li>
        </c:forEach>
        <div class="clearBoth"></div>
    </div>
</div>

<script src="<%= request.getContextPath()%>/wap/js/public/jquery-3.2.1.min.js"></script>
<script>
    $(function () {
       $(".wa-nav-items-list").click(function () {
           $('.wd-nav-choise').toggleClass('wd-nav-choise-anim');
       })
    })
</script>
