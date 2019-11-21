<%@ page language="java" import="java.util.*,cn.bian.bean.User" pageEncoding="UTF-8"%>
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
    
    <title></title>
    <link href="${path }/css/style.css" rel="stylesheet"/>
    <script src="${path}/jquery-3.3.1/jquery-3.3.1.js"></script>
  </head>
  
  <body>
    	<div class="header">
			<div class="head">
				<a href="main.jsp"class="logo"></a>
				<ul class="navs" >
					<li><a href="${path }/pictureClassify.jsp" class="navs-link">最新</a></li>
					<li class="nas-li">
						<a href="#" class="navs-link">分类</a>
						<div class="ul">
							<a href="${path }/pictureClassify.jsp?classifyID=1">4k风景</a>
							<a href="">4k美女</a><a href="">4k游戏</a>
							<a href="${path }/pictureClassify.jsp?classifyID=4">4k动漫</a>
							<a href="">4k影视</a>
							<a href="">4k明星</a>
							<a href="">4k汽车</a>
							<a href="">4k动物</a>
							<a href="">4k人物</a>
							<a href="">4k美食</a>
							<a href="">4k宗教</a>
							<a href="">4k背景</a>
						</div>
					</li>
					<li class="nas-li">
						<a href="#" class="navs-link">尺寸</a>
						<div class="ul" style="height: 170px;width: 350px;">
							<a href="${path }/pictureClassify.jsp?picturetitle=4K壁纸">4K壁纸</a>
							<a href="${path }/pictureClassify.jsp?size=3840x2160">3840x2160壁纸</a>
							<a href="${path }/pictureClassify.jsp?picturetitle=带鱼屏壁纸">带鱼屏壁纸</a>
							<a href="${path }/pictureClassify.jsp?size=3440x1440">3440x1440壁纸</a>
							<a href="${path }/pictureClassify.jsp?picturetitle=5K壁纸">5K壁纸</a>
							<a href="${path }/pictureClassify.jsp?size=5120x2880">5120x2880壁纸</a>
							<a href="${path }/pictureClassify.jsp?picturetitle=8K壁纸">8K壁纸</a>
							<a href="${path }/pictureClassify.jsp?size=7680x4320">7680x4320壁纸</a>
							<a href="${path }/pictureClassify.jsp?picturetitle=手机壁纸">手机壁纸</a>
							<a href="${path }/pictureClassify.jsp?size=1920x1080">1920x1080壁纸</a>
						</div>
					</li>
					<li><a href="#" class="navs-link">4K动漫</a></li>
					<li><a href="#" class="navs-link">4K游戏</a></li>
					<li><a href="#" class="navs-link" style="color: #FFA800;">1元会员</a></li>
				</ul>
<script>
	$(".nas-li").mouseover(function() {
		$(this).find(".ul").show();
	}).mouseleave(function() {
		$(this).find(".ul").hide();
	});
</script>
				
				<div class="search">
					<form action="${path }/pictureClassify.jsp" method="get" id="search">
						<input type="text" class="searchtxt" name="picturetitle" style="color: white;font-size: 17px;"/>
						<input name="submit" type="submit" value="搜索" class="sub"/>
					</form>
				</div>
				<div class="loginbar">
					<a href="register.jsp" class="register" style="width: 100px;">注册</a>
					<a href="login.jsp" class="in" id="in">登陆</a>
				</div>
			</div>
			
				<div class="btn-group yh" style="display: none;">
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				    	
				        <span class="caret"></span>
				    </button>
				    <img src="" class="img-circle">
				    <ul class="dropdown-menu" role="menu">
				        <li>
				            <a href="#">个人中心</a>
				        </li>
				        <li>
				            <a href="${path }/data/allData">我的收藏</a>
				        </li>
				        <li>
				            <a href="${path}/user/userOut">退出</a>
				        </li>
				    </ul>
				</div>
		</div>
		<script type="text/javascript">
			//输出用户名
			$(function(){
				var uname = "<%=session.getAttribute("uname")%>";
				var uhead = "<%=session.getAttribute("uhead")%>";
				if(uname != "null"){
					$(".yh").css("display","block");
					$(".in").css("display","none");
					//alert(uname+uhead);
					$(".yh button").append(uname);
					$(".yh img").attr("src",uhead);
				}else{
					$(".yh").css("display","none");
				}
				
			});
		</script>
  </body>
</html>
