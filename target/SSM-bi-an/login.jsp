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
    
    <title>登陆页</title>
    
	<link href="${path}/css/style.css" rel="stylesheet"/>
	<link href="${path}/css/login.css" rel="stylesheet"/>
	<link href="${path}/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${path}/jquery-3.3.1/jquery-3.3.1.js"></script>
	<script src="${path}/bootstrap-3.3.7/js/bootstrap.js"></script>
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
        	描述：登陆
        -->
		<div id="login" >
			<div class="reghead" style="text-align: center;">
				<h2 style="font-family: '微软雅黑';">彼岸图网账号登陆</h2>
			</div>
			<div class="col-sm-6 col-md-offset-3">
				<div class="leftlogin col-sm-5">
					<div class="col-sm-10 col-md-offset-1">
					  	 <h3><font><font color="red">新用户</font></font></h3>
						 <p><font><font>通过在我们的网页中创建帐户，您可以更快地完成图片下载，收藏图片，查看和订阅自己喜欢的图片集。</font></font></p>
						 <div class="acount-btn"><a href="register.jsp"><font color="white">创建一个帐户</font></a></div>
				   	</div>
				</div>
				<div class="rightlogin col-sm-7 loginMod">
					<form class="form-horizontal col-md-offset-2" action="javascript:;">
					  <div class="form-group">
					    <label for="firstname" class="col-sm-2 control-label">邮箱:</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control"name="email" id="email" placeholder="请输入邮箱账号">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lastname" class="col-sm-2 control-label">密码:</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control"name="password" id="password" placeholder="请输入密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default" id="login-btn">登录</button>
					    </div>
					  </div>
					</form>
				</div>
			</div>
		</div>
		<input type="text" id="userOut" value="${userOut}" style="display: none">
		<script type="text/javascript">
			
			$("#login-btn").click(function(){
				var email = $("#email").val();
				var pass = $("#password").val();
				
				if(email==null || email==""){
					alert("邮箱账号不能为空！");
					return false;
				}else if(pass==null || pass==""){
					alert("密码不能为空！");
					return false;
				}
				$.ajax({
					url:"${path}/user/userLogin",
					type:"POST",
					data:$("#login form").serialize(),
					success:function(result){
						if(result.code == 100){
							//alert("登陆成功！");
							//$("#in").remove();
							window.location.href="main.jsp";
						}
						if(result.code == 200){
							alert(result.extend.user);
							//window.location.href="login.jsp";
						}
					}
				});
			});
			
			$(function(){
				var u = $("#userOut").val();
				if(u!=""){
					alert(u);
				}
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
