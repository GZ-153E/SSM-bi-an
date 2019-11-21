<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有图片</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table class="table table-bordered table-hover">
		<tr>
			<th>序号</th>
			<th>图片</th>
		</tr>
		<c:forEach items="${pojo}" var="p">
			<tr>
				<td>${p.pid}</td>
				<td>
					<c:if test="${p.pimage != null}">
						<img alt="" src="/image/${p.pimage}" id="images">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
  </body>
</html>
