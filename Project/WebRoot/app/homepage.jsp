<%@ page import="java.util.Map,java.util.TreeMap" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    attentMap.put("2","企业团队"); 
    attentMap.put("1","学生团队");
    attentMap.put("0","教师团队"); 
    attentMap.put("","全部");
    session.setAttribute("attentMap",attentMap);
%>
<script>
function refreshReg(id){
     $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath }/info_Edit.action',
            data:{
                "id":id,
                "worktype":"refresh"
            },
            success:function(data){
                    alert("擦亮成功");
                    location.reload();                  
            }
    })
}

function deleteReg(id){
     $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath }/info_Edit.action',
            data:{
                "id":id,
                "worktype":"delete"
            },
            success:function(data){
                    alert("删除成功");
                    $("#tr_"+id).remove();//主要就是这个删除成功后移除这行数据
            }
    })
}



</script>
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
    <jsp:include page="components/header.jsp"></jsp:include>
    <div class="content">
        <div class="layui-carousel" id="test1">
            <div carousel-item>
            
                <img src="<%= request.getContextPath()%>/app/assets/images/slide/slide-1.png" alt="">
                <img src="<%= request.getContextPath()%>/app/assets/images/slide/slide-2.png" alt="">
                <img src="<%= request.getContextPath()%>/app/assets/images/slide/slide-3.png" alt="">
                <img src="<%= request.getContextPath()%>/app/assets/images/slide/slide-4.png" alt="">
                <img src="<%= request.getContextPath()%>/app/assets/images/slide/slide-5.png" alt="">
            </div>
        </div>

        <div class="contentLeft">
            <div class="site-title">
                <fieldset>
                    <legend>
                        <a name="default">搜索</a>
                    </legend>
                </fieldset>
            </div>
            <div class="searchArea">
                <form class="layui-form" action="info_SearchShow.action">
                    <div class="layui-form-item">
                        <label class="layui-form-label wd-form-label">关键字</label>
                        <div class="layui-input-block wd-input-block">
                            <input type="text" name="sqlvalue" required  lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label wd-form-label">条&nbsp;&nbsp;&nbsp;件</label>
                        <div class="layui-input-block wd-input-block">
                            <select name="subsql" lay-filter="aihao">
                                <option value=""></option>
                                <c:forEach var="item" items="${sessionScope.searchMap}">
                                    <option value="${item.key}">${item.value}</option>
                                </c:forEach>
                                <c:if test="${sessionScope.loginAdmin!=null}">
                                	<option value="info_userid">用户id</option>
                                	<option value="id">信息id</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label wd-form-label">方&nbsp;&nbsp;&nbsp;法</label>
                        <div class="layui-input-block wd-input-block">
                            <input type="radio" name="type" value="all" title="全字">
                            <input type="radio" name="type" value="like" title="模糊">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block wd-btn-block">
                            <button class="layui-btn layui-btn-fluid" lay-submit ><!-- lay-filter="formDemo" --> 搜&nbsp;&nbsp;&nbsp;索</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="contentRight">

            <%--筛选区域--%>
		    <div class="subListArea">
  				<form class="layui-form" action="info_SearchShow.action">
  					<input type = "hidden" name = "subsql" value = "info_type">
  					<input type = "hidden" name = "type" value = "all">
                    <div class="layui-form-item wd-search-form-item">
                        <label class="layui-form-label wd-form-label">团队</label>
                        <div class="layui-input-block wd-input-block">
                            <select name="attent" lay-filter="aihao">
                                <c:forEach var="item" items="${sessionScope.attentMap}" >
                                	<c:if test="${item.key==''}">
                                		<option value="${item.key}" selected>${item.value}</option>
                                	</c:if>
                                	<c:if test="${item.key!=''}">
                                    	<option value="${item.key}">${item.value}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item wd-search-form-item">
                        <label class="layui-form-label wd-form-label">方向</label>
                        <div class="layui-input-block wd-input-block">
                            <!-- <select name="sqlvalue" lay-filter="aihao"> -->
                            <select name="sqlvalue" lay-filter="aihao">
                                <c:forEach var="item" items="${sessionScope.sublevelmap}">
                                	<c:if test="${item.key<=11}">
                                    <option value="${item.key}" selected>全部</option>
                                    </c:if>
                                    <c:if test="${item.key>11}">
                                    	<option value="${item.key}">${item.value}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item wd-fileter-form-item">
                        <div class="layui-input-block wd-btn-block">
                            <button class="layui-btn layui-btn-fluid" lay-submit ><!-- lay-filter="formDemo" --> 筛&nbsp;&nbsp;&nbsp;选</button>
                        </div>
                    </div>
                </form>    
			</div>
        
            <%--各类别项目展示--%>            
            <div class="infoListArea">     
	            <div class="site-title">
		                <fieldset>
		                    <legend>
		                        <a name="default">最新信息</a>
		                    </legend>
		                </fieldset>
	            </div>

                <div class="layui-collapse wd-collapse">
                    <c:forEach var="teh" items="${attentionlist}" varStatus="status">
                        <div class="layui-colla-item" id="tr_${teh.id}">
                         	<h2 class="layui-colla-title" > 

	                            <c:forEach var="typeItem" items="${sessionScope.typeMap}">
	                                <c:if test="${typeItem.key == teh.infoType}">
	                                   <span class="typeLabel">【${typeItem.value}】</span>${teh.infoTitle}
	                                </c:if>
	                            </c:forEach>
								
		                        <a href = "thread_threadShow.action?threadId='${teh.id}'">
			                       <i class="layui-icon wd-user-avatar"><font color="#009688">&#xe63a;</font></i>
		                        </a>
                           	</h2>
						
							<c:choose>
							    <c:when test="${requestScope.tipSingle!=null&&status.index == 0}">
							       	<div class="layui-colla-content layui-show" >
							    </c:when>
							    <c:otherwise>
							       <div class="layui-colla-content" >
							    </c:otherwise>
							</c:choose>

                                <div class="wd-colla-top" id ="time_${teh.id}" >
                                	<c:forEach var="attentItem" items="${sessionScope.attentMap}">         		
			                             <c:if test="${attentItem.key == teh.infoAttention}">
			                                  ${attentItem.value}
			                             </c:if>
			                        </c:forEach>
                                    <span class="sendTime">${teh.infoDate}</span>
                                </div>
							    <div class="wd-colla-top">	
 									<c:if test="${sessionScope.loginAdmin!=null}">
 										 <span><a href=""><font color = "#009688">加精</font></a></span>
                                         <span><a href="info_Edit.action?worktype=delete&id=${teh.id}&infoType=${teh.infoType}"><font color ="#009688">删除</font></a></span>
                                    </c:if>
                                    <c:if test="${sessionScope.loginUserId!=null && sessionScope.loginUserId!='' && teh.infoUserid!='' && teh.infoUserid!=null}">
                                         <c:if test="${sessionScope.loginUserId==teh.infoUserid}">
                                            <span><a href="info_Edit.action?worktype=change&id=${teh.id}&infoType=${teh.infoType}"><font color ="#009688">修改   </font></a></span>
                                         	<span><a href="javascript:" onclick="refreshReg('${teh.id}')"><font color ="#009688">擦亮</font></a></span>
                                         	<span><a href="javascript:" onclick="deleteReg('${teh.id}')"><font color ="#009688">删除</font></a></span>
                                         </c:if>
                                    </c:if>   
	                            </div>
                                <div class="wd-colla-center">${teh.infoContent}</div>
                                <div class="wd-colla-bottom">
                                    <div class="wd-bottom-area wd-person-area">
                                        <span>联系人：</span>
                                        <span>${teh.infoLinkman}</span>
                                    </div>
                                    <div class="wd-bottom-area wd-person-area">
                                        <span>联系电话：</span>
                                        <span>${teh.infoPhone}</span>
                                    </div>
                                    <div class="wd-bottom-area wd-person-area">
                                        <span>E-mail：</span>
                                        <span>${teh.infoEmail}</span>
                                    </div>
	                             </div>   	 
                            </div>
                        </div>
                    </c:forEach>
                    <jsp:include page="/page.jsp"/>
                </div>

            </div>
            <%--首页展示--%>
            <div class="mainListArea">
                <div class="site-title">
                    <fieldset>
                        <legend>
                            <a name="default">教师团队</a>
                        </legend>
                    </fieldset>
                </div>
                <c:forEach var="typeitem" items="${sessionScope.typeMap}">
                    <c:forEach var="infoItem" items="${attentionlist}">
                        <c:if test="${typeitem.key == infoItem.infoTypepid}">
                            <%session.setAttribute("hasInfoType", true);%>
                        </c:if>
                    </c:forEach>
                    <c:if test="${sessionScope.hasInfoType}">
                        <div class="listArea">
                            <div class="wd-main-header">${typeitem.value}</div>
                            <ul class="wd-main-content info-content-ul">
                                <c:forEach var="item" items="${attentionlist}">
                                    <c:if test="${item.infoTypepid == typeitem.key}">
                                        <li onclick="viewInfoFun(${item.id}, ${item.infoTypepid})">
                                            <c:forEach var="typeItem" items="${sessionScope.typeMap}">
                                				<c:if test="${typeItem.key == item.infoType}">
                                  				 <span class="typeLabel">【${typeItem.value}】</span>${item.infoTitle}
                            					 </c:if>
                           			 		</c:forEach>
										</li>
									</c:if>
                                </c:forEach>
                            </ul>
                        </div>
                        <%session.setAttribute("hasInfoType", false);%>
                    </c:if>
                </c:forEach>
                <%session.setAttribute("hasInfoType", false);%>
                <div class="site-title">
                    <fieldset>
                        <legend>
                            <a name="default">学生团队</a>
                        </legend>
                    </fieldset>
                </div>
                <c:forEach var="typeitem" items="${sessionScope.typeMap}">
                    <c:forEach var="infoItem" items="${stusublist}">
                        <c:if test="${typeitem.key == infoItem.infoTypepid}">
                            <%session.setAttribute("hasInfoType", true);%>
                        </c:if>
                    </c:forEach>
                    <c:if test="${sessionScope.hasInfoType}">
                        <div class="listArea">
                            <div class="wd-main-header">${typeitem.value}</div>
                            <ul class="wd-main-content info-content-ul">
                                <c:forEach var="item" items="${stusublist}">
                                    <c:if test="${item.infoTypepid == typeitem.key}">
                                        <li onclick="viewInfoFun(${item.id}, ${item.infoTypepid})">
                                            <c:forEach var="typeItem" items="${sessionScope.typeMap}">
                                				<c:if test="${typeItem.key == item.infoType}">
                                  				 <span class="typeLabel">【${typeItem.value}】</span>${item.infoTitle}             					 </c:if>
                           			 		</c:forEach>
										</li>
									</c:if>
								</c:forEach>
							</ul>
                        </div>
                        <%session.setAttribute("hasInfoType", false);%>
                    </c:if>
                </c:forEach>
                
                <div class="site-title">
                    <fieldset>
                        <legend>
                            <a name="default">第三方团队</a>
                        </legend>
                    </fieldset>
                </div>
                <c:forEach var="typeitem" items="${sessionScope.typeMap}">
                    <c:forEach var="infoItem" items="${threesublist}">
                        <c:if test="${typeitem.key == infoItem.infoTypepid}">
                            <%session.setAttribute("hasInfoType", true);%>
                        </c:if>
                    </c:forEach>
                    <c:if test="${sessionScope.hasInfoType}">
                        <div class="listArea">
                            <div class="wd-main-header">${typeitem.value}</div>
                            <ul class="wd-main-content info-content-ul">
                                <c:forEach var="item" items="${threesublist}">
                                    <c:if test="${item.infoTypepid == typeitem.key}">
                                        <li onclick="viewInfoFun(${item.id}, ${item.infoTypepid})">
                                            <c:forEach var="typeItem" items="${sessionScope.typeMap}">
                                				<c:if test="${typeItem.key == item.infoType}">
                                  				 <span class="typeLabel">【${typeItem.value}】</span>${item.infoTitle}             					 </c:if>
                           			 		</c:forEach>
										</li>
									</c:if>
								</c:forEach>
							</ul>
                        </div>
                        <%session.setAttribute("hasInfoType", false);%>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <br class="clearBoth">
    </div>
    <jsp:include page="components/footer.jsp"></jsp:include>

    <script src="<%= request.getContextPath()%>/app/js/public/jquery-3.2.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/app/assets/layui/layui.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/index.js"></script>
    <script src="<%= request.getContextPath()%>/app/js/homepage.js"></script>
    
    
</body>
</html>