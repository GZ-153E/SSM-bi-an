<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<%request.setCharacterEncoding("UTF-8");%> 
<%
        String classifyID = request.getParameter("classifyID"); 
        String picturetitle = request.getParameter("picturetitle"); 
        String size = request.getParameter("size"); 
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图片分类查询</title>
    <link href="${path }/css/style.css" rel="stylesheet"/>
	<script src="${path }/jquery-3.3.1/jquery-3.3.1.js"></script>
	

  </head>
  <body>
    	<!--
        	作者：offline
        	时间：2019-05-07
        	描述：导航条
        -->
		<jsp:include page="jsp/header.jsp"/>
		
		<div class="main">
			<div class="classify">
            	<a href="${path }/pictureClassify.jsp?classifyID=1">4k风景</a>
            	<a href="">4k美女</a>
            	<a href="">4k游戏</a>
            	<a href="${path }/pictureClassify.jsp?classifyID=4">4k动漫</a>
            	<a href="">4K影视</a>
            	<a href="">4k明星</a>
            	<a href="">4k汽车</a>
            	<a href="">4k动物</a>
            	<a href="">4k人物</a>
            	<a href="">4k美食</a>
            	<a href="">4k宗教</a>
            	<a href="">4k背景</a>
            </div>
		</div>
		
		<!--
        	作者：offline
        	时间：2019-05-07
        	描述：图片
        -->
        <div class="slist">
        	<ul class="clearfix">
        		
        		<!-- <li>
        			<a href="tpview.jsp">
        				<img src="img/fj/f1.jpg" title="桂林山水风景图片，桂林山水全景图，桂林山水风景图6K高清大图" />
        			</a>
        			<div><a href="#"><span class="glyphicon glyphicon-heart">收藏</span></a>  下载量</div>
        		</li> -->
        	</ul>
        </div>
        <div class="row" style="width: 1200px;margin: auto;">
        	<!--分页文字信息  -->
			<div class="col-md-5 col-md-offset-5" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-5 col-md-offset-4" id="page_nav_area"></div>
		</div>
        
        
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：分界线
        -->
        <jsp:include page="jsp/link.jsp"/>
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：低部
        -->
		<jsp:include page="jsp/footer.jsp"/>
		
		<!-- 收藏模态框 -->
		<jsp:include page="jsp/scModal.jsp"/>
		
		<script>
			classifyID="<%=classifyID%>";
			if(<%=classifyID%>==null){
				classifyID="";
			}
			picturetitle="<%=picturetitle%>";
			if("<%=picturetitle%>"=="null"){
				picturetitle="";
			}
			size="<%=size%>";
			if("<%=size%>"=="null"){
				size="";
			}
			$(function(){
				//去首页
				to_page(1,picturetitle,classifyID,size);
			});
			
			function to_page(pn,picturetitle,classifyID,size) {
				
				$.ajax({
					url : "${path }/picture/getByClassify?picturetitle="+picturetitle+"&classifyID="+classifyID+"&size="+size,
					data:"pn="+pn,
					type : "GET",
					success : function(result) {
						//console.log(result);
						//1、解析并显示图片数据
						build_emps_table(result);
						//2、解析并显示分页信息
						build_page_info(result);
						//3、解析显示分页条数据
						build_page_nav(result);
					}
				});
			}
			
			function build_emps_table(result) {
				//清空table表格
				$(".clearfix").empty();
				var Astu = result.extend.pageInfo.list;
				
				var userID = "<%=session.getAttribute("authorID")%>";   
				
				$.each(Astu, function(index, item) {
				
					var img = $("<img/>");
					img.attr("src","/image/"+item.pictureurl);
					img.attr("title",item.picturetitle);
					
					var a = $("<a></a>").attr("href","picture/get?id="+item.id);
					a.append(img);
					var a1 = $("<button></button>")
							.addClass("btn btn-primary sc-btn")
							.append("收藏")
							.attr("del-id",item.id);
					
					if(userID!=0){
						var uid = result.extend.uid;//收藏图片id
						$.each(uid,function(index,u){
							if(item.id==u.pictureID){
								a1.attr("class","btn btn-success qxsc-btn");
								a1.empty();
								a1.append("取消收藏");
							}
						});
					}
					
					
					var div = $("<div></div>").append(a1).append("&nbsp;&nbsp;下载量");
					
					$("<li></li>").append(a).append(div).appendTo(".clearfix");
				});
			}
			//解析显示分页信息
			function build_page_info(result) {
				$("#page_info_area").empty();
				$("#page_info_area").append(
						"当前" + result.extend.pageInfo.pageNum + "页,总"
								+ result.extend.pageInfo.pages + "页,总"
								+ result.extend.pageInfo.total + "张图片");
				totalRecord = result.extend.pageInfo.total;
				currentPage = result.extend.pageInfo.pageNum;
			}
			//解析显示分页条，点击分页要能去下一页....
			function build_page_nav(result) {
				//page_nav_area
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");

				//构建元素
				var firstPageLi = $("<li></li>").append(
						$("<a></a>").append("首页"));
				var prePageLi = $("<li></li>").append(
						$("<a></a>").append("&laquo;"));
				if (result.extend.pageInfo.hasPreviousPage == false) {
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				} else {
					//为元素添加点击翻页的事件
					firstPageLi.click(function() {
						to_page(1);
					});
					prePageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum - 1);
					});
				}

				var nextPageLi = $("<li></li>").append(
						$("<a></a>").append("&raquo;"));
				var lastPageLi = $("<li></li>").append(
						$("<a></a>").append("末页"));
				if (result.extend.pageInfo.hasNextPage == false) {
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				} else {
					nextPageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum + 1);
					});
					lastPageLi.click(function() {
						to_page(result.extend.pageInfo.pages);
					});
				}

				//添加首页和前一页 的提示
				ul.append(firstPageLi).append(prePageLi);
				//1,2，3遍历给ul中添加页码提示
				$.each(result.extend.pageInfo.navigatepageNums, function(index,item) {
					var numLi = $("<li></li>")
							.append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active");
					}
					numLi.click(function() {
						to_page(item,picturetitle,classifyID,size);
					});
					ul.append(numLi);
				});
				//添加下一页和末页 的提示
				ul.append(nextPageLi).append(lastPageLi);

				//把ul加入到nav
				var navEle = $("<nav></nav>").append(ul);
				navEle.appendTo("#page_nav_area");
			}
		
		
			$(document).on("click",".sc-btn",function(){//收藏
				var uname = "<%=session.getAttribute("uname")%>";
				var userID = "<%=session.getAttribute("authorID")%>";
				if(uname=="null"){
					alert("未登录，请登录！");
					window.location.href="${path}/login.jsp";
					return false;
				}
				var id = $(this).attr("del-id");
				
				getID(id);//查询图片信息
				getList(userID);//查询有用户的收藏列表
				
				$("#scModal").modal({
					backdrop:"static"//弹出模态框
				});
			});
			$(document).on("click",".qxsc-btn",function(){//取消收藏
				var pictureID = $(".qxsc-btn").attr("del-id");
				$.ajax({
					url:"${path}/collection/deleteCollection/"+pictureID,
					type:"DELETE",
					success:function(result){
						if(result.code == 100){
							//location.reload(true);//刷新
							alert("已取消收藏！");
							to_page(currentPage,picturetitle,classifyID,size);//去当前页
						}
						if(result.code == 200){
							alert("意外失败！");
						}
					}
				});
			});
			
			function getID(id){
				var uname = "<%=session.getAttribute("uname")%>";
				var uhead = "<%=session.getAttribute("uhead")%>";
				
				$("#scModal .myh img").attr("src",uhead);
				$("#scModal .myh span").empty();
				$("#scModal .myh span").append(uname);
				$.ajax({
					url:"${path}/picture/getSrc",
					data:"id="+id,
					type:"GET",
					success:function(result){
						var pr = result.extend.pageInfo;
						if(result.code == 100){
							$("#scModal .tan-img img").attr("src",pr.pictureurl).attr("title",pr.picturetitle);
							url=pr.pictureurl;
							title=pr.picturetitle;
							$("#sc-btn").attr("del-id",id);
						}
						if(result.code ==200){
							alert("意外！");
						}
					}
				});
			}
			function getList(userid){//收藏列表
				$("#listname").empty();
				$.ajax({
					url:"${path}/wdsc/allListByid",
					data:"userID="+userid,
					type:"GET",
					success:function(result){
						var ul = result.extend.ul
						if(result.code ==100){
							$.each(ul,function(){
								var optionEle = $("<option></option>").append(this.listname).attr("value",this.listname);
								optionEle.appendTo("#listname");
							});
							$("#wus").attr("disabled","disabled");
						}
						if(result.code == 200){
							$("#wus").removeAttr("disabled");
						}
					}
				});
			}
			
			function sc(){//收藏
				var userID = "<%=session.getAttribute("authorID")%>";
				var listID = $("#listname").val();
				var pictureID = $("#sc-btn").attr("del-id");
				$.ajax({
					url:"${path}/collection/saveCollection",
					data: "userID="+userID+"&listID="+listID+"&url="+url+"&title="+title+"&pictureID="+pictureID,
					type: "POST",
					success:function(result){
						if(result.code ==100){
							//location.reload(true);
							alert("收藏成功");
							to_page(currentPage,picturetitle,classifyID,size);//去当前页
						}
						if(result.code ==200){
							alert("收藏失败");
						}
					}
				});
			}
		</script>
  </body>
  	<link href="${path }/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${path }/bootstrap-3.3.7/js/bootstrap.js"></script>
</html>
