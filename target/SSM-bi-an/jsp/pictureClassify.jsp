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
		<jsp:include page="../jsp/header.jsp"/>
		
		<div class="main">
			<div class="classify">
            	<a href="${path }/picture/getByClassify?classifyID=1">4k风景</a>
            	<a href="">4k美女</a>
            	<a href="">4k游戏</a>
            	<a href="${path }/picture/getByClassify?classifyID=4">4k动漫</a>
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
        		<c:forEach items="${pageInfo.list }" var="p">
        			<li>
	        			<a href="picture/get?id=${p.id }">
	        				<img src="${p.pictureurl }" title="${p.picturetitle }" />
	        			</a>
	        			<div>
	        				<c:if test="${ !empty sessionScope.authorID}">
	        					<c:if test="${!empty uid}">
	        						<c:forEach items="${uid }" var="u">
			        					<c:if test="${p.id == u.pictureID}">
			        						<button class="btn btn-success qxsc-btn" del-id="${p.id }">取消收藏</button>
			        					</c:if>
			        					<c:if test="${p.id != u.pictureID}">
			        						<button class="btn btn-primary sc-btn" del-id="${p.id }">收藏</button>
			        					</c:if>
			        				</c:forEach>
	        					</c:if>
		        				<c:if test="${empty uid}">
		        					<button class="btn btn-primary sc-btn" del-id="${p.id }">收藏</button>
		        				</c:if>
	        				</c:if>
	        				<c:if test="${empty sessionScope.authorID}">
	        					<button class="btn btn-primary sc-btn" del-id="${p.id }">收藏</button>
	        				</c:if>
	        				  下载量
	        			</div>
        			</li>
        		</c:forEach>
        		<!-- <li>
        			<a href="tpview.jsp">
        				<img src="img/fj/f1.jpg" title="桂林山水风景图片，桂林山水全景图，桂林山水风景图6K高清大图" />
        			</a>
        			<div><a href="#"><span class="glyphicon glyphicon-heart">收藏</span></a>  下载量</div>
        		</li> -->
        	</ul>
        </div>
        ${empty sessionScope.authorID}
        <div>
        	
        	<br>
        	<p align="center">当前: 第${pageInfo.pageNum }页，共：${pageInfo.pages }页，共：${pageInfo.total }张图片</p>
        	
        	<div style="margin-left: 950px;">
        	
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li
			  		<c:if test="${pageInfo.hasPreviousPage == false }">
			  			class="disabled"
			  		</c:if>  >
			  		
			  		<a 
			  			<c:if test="${pageInfo.hasPreviousPage != false }">
			  				href="${path }/picture/getByClassify?picturetitle=${picturetitle}&classifyID=${classifyID }&size=${size }"
			  			</c:if>  >首页
			  		</a>
			  	</li>
			  	<!-- 上一页 -->
			    <li
			    	<c:if test="${pageInfo.hasPreviousPage == false }">
			  			class="disabled"
			  		</c:if>  >
					<a aria-label="Previous"
						<c:if test="${pageInfo.pageNum != pageInfo.firstPage}"> 
							href="${path }/picture/getByClassify?pn=${pageInfo.pageNum - 1 }&picturetitle=${picturetitle}&classifyID=${classifyID }&size=${size }"
						</c:if> 
			            <c:if test="${pageInfo.pageNum == pageInfo.firstPage}"> 
							 class="disabled"
						</c:if> >
						<span aria-hidden="true">&laquo;</span>
					</a>
			    </li>
			    
			    <!-- 页数 -->
				<c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
					<li
						<c:if test="${status.count == pageInfo.pageNum}">
								class="active"
						</c:if>  >
		                <a href="${path}/picture/getByClassify?pn=${status.count }&picturetitle=${picturetitle}&classifyID=${classifyID }&size=${size }" 
		                    <c:if test="${status.count == pageInfo.pageNum}">
								class="disabled"
							</c:if>
							>${status.count }
						</a>
					</li>
	            </c:forEach>
				<!-- 下一页 -->
			    <li
			    	<c:if test="${pageInfo.hasNextPage == false }">
			  			class="disabled"
			  		</c:if>  >
			  		
					<a aria-label="Next"
						<c:if test="${pageInfo.pageNum == pageInfo.lastPage}">
							class="disabled"
						</c:if> 
			            <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">
							href="${path }/picture/getByClassify?pn=${pageInfo.pageNum + 1 }&picturetitle=${picturetitle}&classifyID=${classifyID }&size=${size }"
						</c:if> ><span aria-hidden="true">&raquo;</span>
					</a>
			    </li>
			    <li
			    	<c:if test="${pageInfo.hasNextPage == false }">
			  			class="disabled"
			  		</c:if>  >
			  		
			  		<a 
			  			<c:if test="${pageInfo.hasNextPage != false }">
			  				href="${path }/picture/getByClassify?pn=${pageInfo.pages }&picturetitle=${picturetitle}&classifyID=${classifyID }&size=${size }"
			  			</c:if>  >末页
			  		</a>
			    </li>
			  </ul>
			</nav>
        
        	</div>
			<!--<a
				<c:if test="${pageInfo.pageNum != pageInfo.firstPage}"> 
					href="${path }/picture/getByClassify?pn=${pageInfo.pageNum - 1 }&classifyID=${classifyID }"
				</c:if> 
	            <c:if test="${pageInfo.pageNum == pageInfo.firstPage}"> 
					 class="disabled"
				</c:if> >
				上一页
			</a>
			
			<c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                 <a href="${path}/picture/getByClassify?pn=${status.count }&classifyID=${classifyID }" 
                    <c:if test="${status.count == pageInfo.pageNum}">class="select"</c:if>>
					${status.count }
				</a>
            </c:forEach>
			
			<a 
				<c:if test="${pageInfo.pageNum == pageInfo.lastPage}">
					class="disabled"
				</c:if> 
	            <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">
					href="${path}/picture/getByClassify?pn=${pageInfo.pageNum + 1 }&classifyID=${classifyID }"
				</c:if> >下一页
			</a>-->
		</div>
        
        
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：分界线
        -->
        <jsp:include page="../jsp/link.jsp"/>
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：低部
        -->
		<jsp:include page="../jsp/footer.jsp"/>
		
		<!-- 收藏模态框 -->
		<jsp:include page="../jsp/scModal.jsp"/>
		
		<script>
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
							alert("已取消收藏！");
							to_page();//去当前页
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
					data: "userID="+userID+"&listID="+listID+"&pictureID="+pictureID,
					type: "POST",
					success:function(result){
						if(result.code ==100){
							location.reload(true);
							alert("收藏成功");
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
