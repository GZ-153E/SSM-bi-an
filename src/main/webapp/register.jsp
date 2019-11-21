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
    
    <title>彼岸网注册页</title>
	<link href="css/register.css" rel="stylesheet"/>
	<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="jquery-3.3.1/jquery-3.3.1.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.js"></script>
  </head>
  
  <body>
    	<!--
        	作者：offline
        	时间：2019-05-07
        	描述：导航条
        -->
        <jsp:include page="jsp/header.jsp"/>
        
        
        <!--
        	作者：offline
        	时间：2019-05-08
        	描述：注冊
        -->
		<div id="reg">
			<div class="reg">
				<div class="reghead" style="text-align: center;">
					<h2 style="font-family: '微软雅黑';">彼岸图网账号注册</h2>
				</div>
					<form class="form-horizontal col-md-offset-3">
					  <div class="form-group">
					    <label for="firstname" class="col-sm-2 control-label">昵称:</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="username" name="username" placeholder="请填写名字">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">邮箱:</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control"name="email" id="email" placeholder="请填写邮箱">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">密码:</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control"name="password1" id="password1" placeholder="请填写密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">确认密码:</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control" name="password" id="password" placeholder="请再次填写密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">喜欢图片种类:</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control"name="likeT" id="likeT" placeholder="描述喜欢图片种类">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">头像:</label>
					    <div class="col-sm-5">
					      <input type="file" name="file">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default" id="register-btn">注册</button>
					      <button type="reset" class="btn btn-default">重置</button>
					    </div>
					  </div>
					</form>
			</div>
		</div>
        
        <script type="text/javascript">
        	$("#email").change(function(){
        		var e = $("#email").val();
        		$.ajax({
        			url:"${path}/user/userTest",
	     			data:"email="+e,
	     			type:"POST",
	     			success:function(result){
	     				if(result.code == 200){
	     					alert(e+"邮箱已被注册！")
	     					$("#register-btn").attr("disabled","disabled");
	     					return false;
	     				}else{
	     					$("#register-btn").removeAttr("disabled");
	     				}
	     			}
        		})
        	})
        	function yanform(){
        		var name = $("#username").val();
        		var email = $("#email").val();
        		var p1 = $("#password1").val();
        		var p2 = $("#password").val();// /^[0-9A-Za-z\u4e00-\u9fa5]{2,6}$/
        		var em = /^[0-9A-Za-z\u4e00-\u9fa5_-]{2,10}$/;
        		var reg = /^[a-zA-Z0-9]{5,20}@qq\.com$/;
        		if(!em.test(name) || name==null){
        			alert("名字必须为2-6位字母数字汉字和_ -，且不能为空！");
        			return false;
        		}
        		if(!reg.test(email) || email==null){
        			alert("邮箱只能为12位以上位QQ邮箱,且不能为空！");
        			return false;
        		}
        		if(p1==null || p1==""){
        			alert("密码不能为空！");
        			return false;
        		}
        		if(p2==null || p2==""){
        			alert("再次输入密码不能为空！");
        			return false;
        		}
        		if(p1!==p2){
        			alert("两次输入密码不一致！");
        			return false;
        		}
        		return true;
        	}
        	
        	$("#register-btn").click(function(){
        		if(!yanform()){
        			return false;
        		}
        		$.ajax({
			      	url:"${path}/user/userRegister",
					type:"POST",
					data:$("#reg form").serialize(),
					success:function(result){
						if(result.code == 100){
								alert("注册成功！请登录");
								window.location.href="login.jsp";
						}
						if(result.code == 200){
								alert("注册失败！");
								window.location.href="register.jsp";
						}
				 	}
				});
        	});
        	
        </script>
        <!--
        	作者：offline
        	时间：2019-05-08
        	描述：友情链接
        -->
        <jsp:include page="jsp/link.jsp"/>
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：低部
        -->
        <jsp:include page="jsp/footer.jsp"/>
  </body>
</html>
