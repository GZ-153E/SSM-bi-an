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
    
    <title></title>
    
	<link href="${path }/css/style.css" rel="stylesheet"/>
  </head>
  
  <body>
    <div id="footer">
			<div class="w">
					<p>彼岸图网为用户免费分享产生,若发现您的权利被侵害,我们尽快处理 客服QQ:123456789
					<a target="_blank" href=""><img border="0" src="img/button_111.jpg" alt="点击这里给我发消息" title="点击这里给我发消息"></a>（工作时间：9:00-23:00）4K壁纸QQ群：123456789、123456789</p>
					<p>Copyright © 2019 <span class="sitename"><a href="" title="彼岸图网">彼岸图网</a></span> 闽ICP备123456123号
					<a href="" target="_blank" title="壁纸">壁纸</a>
					<a href="" title="4k">4k</a>
					<a href="" title="4k壁纸">4k壁纸</a>
					<a href="" target="_blank" title="壁纸">壁纸</a>
					<a href="" target="_blank" title="高清壁纸">高清壁纸</a> 关注:
					<a href="" target="_blank">新浪微博</a>			
					</p>
			</div>
	</div>
  </body>
</html>
