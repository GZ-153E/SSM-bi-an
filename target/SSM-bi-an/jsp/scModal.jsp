<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收藏</title>
    
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
    <!-- 收藏模态框 -->
<div class="modal fade" id="scModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">收藏框</h4>
      </div>
      <div class="modal-body">
      	<div class="myh">
      		<img src="" class="img-circle">
      		<div>
      			用户名：<span></span>
      		</div>
      	</div>
      	<hr>
      	<div class="form-group tan-img">
      		<img src="" width="100%"height="100%"/>
      	</div>
      	<hr>
        <br>
        <div class="form-group ">
        	<p><b>请选择收藏列表</b></p>
        	<select class="form-control" name="listname"  id="listname">
			</select>
			<br>
			<button type="button" class="btn btn-primary" id="wus" >添加收藏列表</button>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="sc-btn" onclick="sc()" data-dismiss="modal">收藏</button>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
