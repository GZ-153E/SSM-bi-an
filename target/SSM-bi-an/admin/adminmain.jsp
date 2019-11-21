<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员主页</title>

  </head>
  
  <body>
    <center>
    	<h3><a href="${path }/admin/picturelist">所有图片</a></h3><br><br>
    	<h3><a href="${path }/admin/pictureUpload.jsp">上传图片</a></h3><br><br>
    	<h3><a href=""></a></h3><br><br>
    	<h3><a href=""></a></h3><br><br>
    	<h3><a href=""></a></h3><br><br>
    </center>
  </body>
</html>
