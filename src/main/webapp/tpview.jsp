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
    
    <title>图片信息页</title>
    <link href="css/style.css" rel="stylesheet"/>
	<link href="css/tpview.css" rel="stylesheet"/>
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
        	描述：图片详情
        -->
		<div class="photo">
			<div class="view">
				<div class="photo-hd">
					<span>${pr.picturetitle }</span>
				</div>
				<div class="photo-pic">
					<img src="/image/${pr.pictureurl }" title="${pr.picturetitle }" del-id="${pr.id }"/>
					<div class="bdshare-button-style0-32">
						<a href="#" class="bds_more" title="收藏"></a>
						<a href="#" class="bds_qzone"  title="分享到QQ空间"></a>
						<a href="#" class="bds_tsina"  title="分享到新浪微博"></a>
						<a href="#" class="bds_weixin" title="分享到微信"></a>
						<a href="#" class="bds_huaban" title="分享到花瓣"></a>
					</div>
				</div>
				<div class="photo-txt">
					彼岸图网是全网最好的4K壁纸站，提供精美好看的4K高清壁纸免费下载，4K,5K,6K,7K,8K壁纸图片素材，本次壁作品分类是4K动漫，壁纸来源网络和网友分享，图片版权归原作者所有，若有侵权问题敬请告知，我们会立即处理。客服QQ:123456789
				</div>
				<div class="photo-tags">热门搜索：
					<a href="" target="_blank">星空壁纸</a>
					<a href="" target="_blank">带鱼屏壁纸</a>
					<a href="" target="_blank">4K壁纸</a>
					<a href="" target="_blank">5K壁纸</a>
					<a href="" target="_blank">8K壁纸</a>
					<a href="" target="_blank">手机壁纸</a>
				</div>
			</div>
			<div class="side">
				<div class="downpic">
					<a href="${path }/picture/pictureDownload?filename=${pr.pictureurl}&id=${pr.id}" >下载原图(${pr.size })</a>
				</div>
				<div class="infor">
					<p>分类 <span> <a target="_blank" href="">${pr.classify.classifyname }</a> </span> </p>
					<p>尺寸<span>${pr.size }</span></p>
					<p>体积 <span>${pr.volume }</span></p>
					<p>上传时间<span>${pr.time }</span></p>
					<p>点击量<span>${pr.clickvolume }</span></p>
					<p>下载量<span>${pr.downloadvolume }</span></p>
				</div>
			</div>
			
			
		</div>
		<!--
        	作者：offline
        	时间：2019-05-10
        	描述：评论区
        -->
        
		<div class="photopx">
			<div class="photopx-form">
				<form action="${path }/comment/saveComment?pictureID=${pr.id }&authorID=<%=session.getAttribute("authorID")%>" method="POST">
					<h3>对其评论：</h3>
					<input type="text" name="commentvalue" id="commentvalue"  placeholder="对他说点什么" class="srk form-control"/>
					<br />
					<button type="submit" class="btn btn-default" id="comment-btn">发表评论</button>
				</form>
			</div>
			<div class="comment">
				<ul class="comment-ul">
					<!--<li>
						<img src="img/tou.jpg"/>
						<div class="ptp">
							<p><b>发发汗</b>  <span>31654646</span></p>
							<div class="pltxt">
								法式咖啡哈是否发违法啊福娃瑟夫无法哇服务而非哇发我分为发文访问发文发问ffewfw aef发违法微
								服务服务为访问发违法微服务阿尔法威风威风发涩发而非哇
							</div>
						</div>
						<div class="pp">
							<a href=""><span class="glyphicon glyphicon-thumbs-up">点赞</span>(12)</a>
						</div>
					</li>-->
				</ul>
			</div>
			<!-- 显示分页信息 -->
			<div class="row" style="margin-bottom: 30px;">
				<!--分页文字信息  -->
				<div class="col-md-3 col-md-offset-0" id="page_info_area"></div>
				<!-- 分页条信息 -->
				<div class="col-md-5 col-md-offset-1" id="page_nav_area"></div>
			</div>
		</div>
		<script type="text/javascript">
			${comment}
			$(function(){
				//去首页
				to_page(1);
			});
			
			//发表评论
			$("#comment-btn").click(function(){
				var authorID = "<%=session.getAttribute("authorID")%>";
				var commentvalue = $("#commentvalue").value;
				
				if(authorID=="null"){
					alert("未登录,请登录！");
					window.location.href="${path}/login.jsp";
					return false;
				}
				if(commentvalue==null && commentvalue==""){
					alert("评论不能为空");
					return false;
				}
				return true;
				
			});
			
			function to_page(pn) {
				var empId = $(".photo-pic img").attr("del-id");
				$.ajax({
					url : "${path}/comment/getCommentByid",
					data : "pn="+pn+"&id="+empId,
					type : "GET",
					success : function(result) {
						//console.log(result);
						//1、解析并显示评论数据
						build_emps_table(result);
						//2、解析并显示分页信息
						build_page_info(result);
						//3、解析显示分页条数据
						build_page_nav(result);
					}
				})
			}
			
			function build_emps_table(result) {
				//清空table表格
				$(".comment-ul").empty();
				var Astu = result.extend.pageInfo.list;
				var userID = "<%=session.getAttribute("authorID")%>";
				
				$.each(Astu, function(index, item) {
				
					var img = $("<img/>").attr("src",item.user.head);
					
					var b = $("<b></b>").append(item.user.username);
					var span1 = $("<span class='time'></span>").append(item.commenttime);
					var p = $("<p></p>").append(b).append(span1);
					
					var divpl = $("<div class='pltxt'></div>").append(item.commentvalue);
					var divptp = $("<div class='ptp'></div>").append(p).append(divpl);
					
					var span2 = $("<span class='glyphicon glyphicon-thumbs-up'></span>");
					
					var aspan = $("<button></button>")
						.append(span2)
						.append("点赞("+item.praise+")")
						.attr("del-id",item.id)
						.attr("class","btn btn-default btn-sm dz-btn");
					if(userID!=0){
						var plist = result.extend.plist;//用户点赞记录
						$.each(plist,function(index,plist){
							if(item.id==plist.commentID){
								aspan.empty();
								aspan.append("已赞("+item.praise+")");
								aspan.attr("class","btn btn-success qxdz-btn")
								.attr("del-id",item.id);
							}
						});
					}
					var divpp = $("<div class='pp'></div>").append(aspan);
					
					$("<li></li>").append(img).append(divptp).append(divpp).appendTo(".comment-ul");
				});
			}
			//解析显示分页信息
			function build_page_info(result) {
				$("#page_info_area").empty();
				$("#page_info_area").append(
						"当前" + result.extend.pageInfo.pageNum + "页,总"
								+ result.extend.pageInfo.pages + "页,总"
								+ result.extend.pageInfo.total + "条记录");
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
				$.each(result.extend.pageInfo.navigatepageNums, function(index,
						item) {

					var numLi = $("<li></li>")
							.append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active");
					}
					numLi.click(function() {
						to_page(item);
					});
					ul.append(numLi);
				});
				//添加下一页和末页 的提示
				ul.append(nextPageLi).append(lastPageLi);

				//把ul加入到nav
				var navEle = $("<nav></nav>").append(ul);
				navEle.appendTo("#page_nav_area");
			}
			
			//点赞
			$(document).on("click",".dz-btn",function(){
				var uname = "<%=session.getAttribute("uname")%>";
				var commentID = $(this).attr("del-id");
				if(uname=="null"){
					alert("未登录，请登录！");
					window.location.href="${path}/login.jsp";
					return false;
				}
				dz_qxdz("add",commentID);//点赞
			});
			//取消点赞
			$(document).on("click",".qxdz-btn",function(){
				var commentID = $(this).attr("del-id");
				dz_qxdz("Reduce",commentID);
			});
			
			function dz_qxdz(ar,commentID) {
				
				$.ajax({
					url:"${path}/comment/savePraise",
					data:"commentID="+commentID+"&ar="+ar,
					type:"POST",
					success:function(result){
						if(result.code == 100){
							to_page(currentPage);//评论的当前页
						}
						if(result.code == 200){
							alert(result.extend.pi);
						}
					}
				});
			}
		</script>
        <!--
        	作者：offline
        	时间：2019-05-07
        	描述：低部
        -->
		<jsp:include page="jsp/footer.jsp"/>
  </body>
</html>
