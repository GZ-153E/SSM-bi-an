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
<div class="modal fade" id="bjModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑框</h4>
      </div>
      <div class="modal-body">
					<form class="form-horizontal">
						<input type="hidden" name="id" id="id">
						<div class="form-group">
							<div class="pictureurl">	
								<img src="" id="pictureurl" class="col-md-offset-1 col-sm-10"/>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">标题</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="picturetitle"
									id="picturetitle"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">图片类型</label>
							<div class="col-sm-4">
								<select class="form-control" name="classifyID" id="classify">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">尺寸</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="size"
									id="size"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">大小</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="volume"
									id="volume"> <span class="help-block"></span>
							</div>
						</div>

					</form>
		</div>
						
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="bjs-btn"  onclick="bj()" data-dismiss="modal">修改</button>
      </div>
    </div>
  </div>
</div>
	
  </body>
</html>
