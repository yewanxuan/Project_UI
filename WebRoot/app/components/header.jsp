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
                        <dd><a href="info_SearchShow.action?subsql=info_userid&type=all">我的管理</a></dd>
                        <dd><a href="log_Logout.action">退出登录</a></dd>
                    </dl>
                </c:if>
            </li>
            
            <span class="wd-nav-choise">
            	<s2:set name="types" value="#session.typeMap"/>
            	 <s2:if test="#types==null||#types.size()==0">没有信息类别可显示！</s2:if>
                    <s2:else>
                                 <li class="layui-nav-item"><a href = "index">首页</a></li>
                                <s2:iterator status="typesStatus" value="types">
                                	 <s2:if test="#typesStatus.index<11">
	                                  <li class="layui-nav-item"><a href="info_ListShow.action?infoType=<s2:property value='key'/>" ><s2:property value="value"/></a></li>
    	                                <s2:if test="#typesStatus.index==4"><br></s2:if>
									 </s2:if>
                                </s2:iterator>
                            </tr>                      
                        </table>
                    </s2:else>

            </span>
        </ul>
    </div>
</div>
