<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的收藏</title>
    <link href="${path }/css/wdsc.css" rel="stylesheet"/>
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
		
		<!-- 内容 -->
    	<div class="wdsc">
			<div class="wdz">
				<ul>
					<h3>收藏列表</h3>
					<li><a href="${path }/collection/collectionBylist">查看全部</a></li>
					<c:forEach items="${ulist }" var="l">
						<li>
							<a href="${path }/collection/collectionBylist?listID=${l.listname }">${l.listname }</a>
							
						</li>
					</c:forEach>
					<li><a href="">添加列表</a></li>
					<li><a href="${path }/data/allData">浏览历史</a></li>
				</ul> 
			</div>
			<div class="wdy">
				<div class="wdyx">
					<h3>${ts}</h3>
					<ul class="tp">
						<c:if test="${!empty data}">
							<c:forEach items="${data}" var="da">
								<li>
									<a href="picture/get?id=${da.pictureID }">
			        					<img src="/image/${da.url }" title="${da.title }"/>
			        				</a>
			        				<div>
			        					<c:if test="${uid.contains(da.pictureID) }">
			        							<button class="btn btn-success qxsc-btn" del-id="${da.pictureID }">取消收藏</button>
			        					</c:if>
			        					<c:if test="${!uid.contains(da.pictureID) }"><!--contains检查是否包含  -->
			        						<button class="btn btn-primary sc-btn" del-id="${da.pictureID }">收藏</button>
			        					</c:if>
			        					<a href="${path }/data/deleteData?pictureID=${da.pictureID }"><button class="btn btn-primary" >删除历史</button></a>
			        				</div>
								</li>
							</c:forEach>
						</c:if>
						
						<c:if test="${!empty mylist}">
							<c:forEach items="${mylist }" var="d">
								<li>
									<a href="picture/get?id=${d.pictureID }">
			        					<img src="/image/${d.url }" title="${d.title }" />
			        				</a>
			        				<div><button class="btn btn-success qxsc-btn" del-id="${d.pictureID }">取消收藏</button></div>
								</li>
							</c:forEach>
						</c:if>
						<!-- <li>
							<a href="tpview.html">
	        					<img src="img/fj/f1.jpg" title="桂林山水风景图片，桂林山水全景图，桂林山水风景图6K高清大图" />
	        				</a>
	        				<div><button class="btn btn-success">取消收藏</button></div>
						</li>-->
						
					</ul>
				</div>
				<div class="silderBar"><span></span></div>
			</div>
		</div>
		
		
		<!--
        	作者：offline
        	时间：2019-05-07
        	描述：低部
        -->
		<jsp:include page="jsp/footer.jsp"/>
		
		<!-- 收藏模态框 -->
		<jsp:include page="jsp/scModal.jsp"/>
  </body>
  	<link href="${path }/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${path }/bootstrap-3.3.7/js/bootstrap.js"></script>
	<script src="jquery-3.3.1/jquery.mousewheel.min.js"></script>
	
<script>
	${llsc}
	
	$(function() {
    var Box_Height = $(".wdy").outerHeight();
    var content_Height = $(".wdyx").outerHeight();
    var bar_Height = $(".silderBar").outerHeight();
    var isMouseDown = false;
    var distance = 0;
 
    //滚动条初始高度；
    var n = Box_Height / content_Height * bar_Height
    $(".silderBar span").css("height", n)
    $(".silderBar").mousedown(down);
    $(window).mousemove(move);
    $(window).mouseup(up);

    function down(event) {
        isMouseDown = true;
    }

    function move(event) {
        event.preventDefault();
        distance = event.pageY - $(".silderBar").offset().top;
        if (isMouseDown == true) {
            scroll(distance)
        }
    }

    function up() {
        isMouseDown = false;
    }
    // 滚轮事件；
    $(".wdy").bind('mousewheel', function(event, delta) {
        event.preventDefault()
        var dir = delta > 0 ? 'Up' : 'Down',
            vel = delta
        distance = $(".silderBar span").offset().top - $(".wdy").offset().top; 
        vel > 0 ? distance -= 20 : distance += 20;
        if(content_Height>1200){
        	scroll(distance);
        }
        
    });

    function scroll(distance) {
        if (distance < 0) {
            distance = 0
        } else if (distance > bar_Height - $(".silderBar span").outerHeight()) {
            distance = bar_Height - $(".silderBar span").outerHeight();
        }
        $(".silderBar span").css("top", distance)
        // 滚动距离 = 滑块移动距离 ÷ 窗口高度 x 页面长度
        // var roat = distance / (bar_Height - $(".silderBar span").outerHeight())
        // var scroll_distance = parseInt(roat * (content_Height - Box_Height))
        var scroll_distance = parseInt(distance / Box_Height * content_Height)
        $(".wdyx").css("margin-top", -scroll_distance);
        // alert(-scroll_distance);
    }
})

	$(document).on("click", ".qxsc-btn", function() {//取消收藏
		var pictureID = $(this).attr("del-id");
		$.ajax({
			url : "${path}/collection/deleteCollection/" + pictureID,
			type : "DELETE",
			success : function(result) {
				if (result.code == 100) {
					alert("已取消收藏！");
					//to_page(currentPage);//去当前页
					window.location.reload();
				}
				if (result.code == 200) {
					alert("意外失败！");
				}
			}
		});
	});
	
	$(document).on("click",".sc-btn",function(){//收藏
				var userID = "<%=session.getAttribute("authorID")%>";
				var id = $(this).attr("del-id");
				
				getID(id);//查询图片信息
				getList(userID);//查询有用户的收藏列表
				
				$("#scModal").modal({
					backdrop:"static"//弹出模态框
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
							alert("收藏成功");
							//to_page(currentPage);//去当前页
							window.location.reload();
						}
						if(result.code ==200){
							alert("收藏失败");
						}
					}
				});
			}
	
	
</script>
</html>
