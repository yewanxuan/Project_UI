<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s2"%>

<html>
<head><title>分页导航栏</title></head>
<body>
    <table border="0" width="100%" cellspacing="0">
        <tr>
        	<td width="60%"><s2:property escape="false" value="#request.createpage.PageInfo"/></td>
            <td align="center" width="40%"><s2:property escape="false" value="#request.createpage.PageLink"/></td>
        </tr>
    </table>
</body>
</html>