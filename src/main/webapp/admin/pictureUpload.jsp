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
    
    <title>图片上传</title>
    
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
    <center>
    	<form action="${path }/admin/pictureUpload" method="post"enctype="multipart/form-data">
    		<table>
    			<tr>
    				<td>标题：</td>
    				<td><input tyep="text" name="picturetitle"/></td>
    			</tr>
    			<tr>
    				<td>类型：</td>
    				<td>
    					<select name="classifyID">
						  <option value ="1">4K风景</option>
						  <option value="3">4K游戏</option>
						  <option value="4">4K动漫</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td>尺寸：</td>
    				<td><input type="text" name="size"/></td>
    			</tr>
    			<tr>
    				<td>大小：</td>
    				<td><input type="text" name="volume"/></td>
    			</tr>
    			<tr>
    				<td>图片：</td>
    				<td><input type="file" name="file"></td>
    			</tr>
    			
    			<tr>
    				<td></td>
    				<td>
    					<input type="reset" value="重置"/>
    					<input type="submit" value="上传"/>
    				</td>
    			</tr>
    		</table>
    	</form>
    	<br>
	    <div><a href="${path }/admin/adminmain.jsp">主页</a></div><br>
	    <div><a href="${path }/admin/picturelist">所有图片</a></div><br>

	    <script type="text/javascript">
	    	${news }
	    </script>
    </center>
  </body>
</html>
