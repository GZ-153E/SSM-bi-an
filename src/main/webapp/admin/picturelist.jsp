<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有图片</title>
    <link href="${path }/css/style.css" rel="stylesheet"/>
    <script src="${path }/jquery-3.3.1/jquery-3.3.1.js"></script>
    
  </head>
  
  <body>
  	<div><h2>图片管理-->所有图片</h2></div>
  	<div><a href="${path }/admin/adminmain.jsp">返回主页</a></div>
    <div class="slist">
        	<ul class="clearfix">
        		<c:forEach var="p" items="${pageInfo.list}">
        			<li>
	        			<img src="/image/${p.pictureurl }" title="${p.picturetitle }" />
	        			<div>
	        				<button class="btn btn-primary bj-btn" del-id="${p.id }">编辑</button>
	        				<button class="btn btn-success sc-btn" del-id="${p.id }">删除</button>
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
			  				href="${path }/admin/picturelist"
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
							href="${path }/admin/picturelist?pn=${pageInfo.pageNum - 1 }"
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
		                <a href="${path }/admin/picturelist?pn=${status.count }" 
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
							href="${path }/admin/picturelist?pn=${pageInfo.pageNum + 1 }"
						</c:if> ><span aria-hidden="true">&raquo;</span>
					</a>
			    </li>
			    <li
			    	<c:if test="${pageInfo.hasNextPage == false }">
			  			class="disabled"
			  		</c:if>  >
			  		
			  		<a 
			  			<c:if test="${pageInfo.hasNextPage != false }">
			  				href="${path }/admin/picturelist?pn=${pageInfo.pages }"
			  			</c:if>  >末页
			  		</a>
			    </li>
			  </ul>
			</nav>
        
        	</div>
		</div>
		<script type="text/javascript">
			$(".sc-btn").click(function(){
				var id = $(this).attr("del-id");
				$.ajax({
					url:"${path}/admin/pictureDelete/"+id,
					type:"delete",
					success:function(result){
						if(result.code == 100){
							alert("删除成功！");
							location.reload(true);
						}
						if(result.code ==200){
							alert("意外！");
						}
					}
				});
			});
	
			$(".bj-btn").click(function(){//收藏
				var id = $(this).attr("del-id");
				
				getClassify();//图片类型
				getID(id);//查询图片信息
				
				$("#bjModal").modal({
					backdrop:"static"//弹出模态框
				});
			});
			
			function getClassify() {
				$("#classify").empty();
				$.ajax({
					url:"${path}/picture/getClass",
					type:"GET",
					success:function(result){
						var classify = result.extend.classify;
						if(result.code == 100){
							$.each(classify,function(){
								var optionEle = $("<option></option>").append(this.classifyname).attr("value",this.id);
								optionEle.appendTo("#classify");
							});
						}
					}
				});
			}

			function getID(id){
				
				$.ajax({
					url:"${path}/picture/getSrc",
					data:"id="+id,
					type:"GET",
					success:function(result){
						var pr = result.extend.pageInfo;
						if(result.code == 100){
							$("#id").val(pr.id);
							$("#bjModal img").attr("src","/image/"+pr.pictureurl).attr("title",pr.picturetitle);
							$("#picturetitle").val(pr.picturetitle);
							$("#classify").val([pr.classifyID]);
							$("#size").val(pr.size);
							$("#volume").val(pr.volume);
							$("#bj-btn").attr("del-id",id);
						}
						if(result.code ==200){
							alert("意外！");
						}
					}
				});
			}
			
			
			function bj(){//编辑
				//var id = $(this).attr("del-id");
				
				$.ajax({
					url:"${path}/picture/pictureUpdate",
					type:"PUT",
					data:$("#bjModal form").serialize(),
					success:function(result){
						if(result.code == 100){
							alert(result.extend.news);
						}else{
							alert(result.extend.news);
						}
					}
				});
			};
		</script>
		
		<!-- 编辑模态框 -->
		<jsp:include page="bjModal.jsp"/>
		
		<link href="${path }/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="${path }/bootstrap-3.3.7/js/bootstrap.js"></script>
  </body>
  	
</html>
