<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.ex {
		white-space: nowrap; /*不换行的*/
		overflow: hidden;/*超出范围隐藏*/
		text-overflow:ellipsis; /*超出用省略号 */
	
	}

</style>
		<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
			北京八维研修学院大数据1707E石晓楠打造    
		</div>
		<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
					      今	   						日						头						条
		</div>	
<title></title>
<body>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item active" aria-current="page" style="background-color: yellow">
    	 专		业		高		级		一		C		M		S		系		统
    </li>
  </ol>
</nav>

	<!-- top -->
	<div>
		<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	</div>
	<div class="container">
		<div class="row" style="margin-top: 5px">
			<!-- 左侧栏目菜单 -->
			<div class="col-md-2">
				<div class="list-group">
					<ul class="list-group text-center">
					<!-- 今日头条 -->
				<a class="navbar-brand mr-0" href="index.html"><button type="button" class="btn btn-outline-danger">今日头条</button></a>
				<img alt="" src="/resource/images/day.png" class="rounded-circle">
				
						<li
							class="list-group-item cms-list-group-item-action ${article.channelId==null?"cms-list-group-item-active":"" }">
							<a href="/" class="channel"> 热点 </a>
						</li>
						<!--遍历栏目 -->
						<c:forEach items="${channels}" var="c">
							<li
								class="list-group-item cms-list-group-item-action ${article.channelId==c.id?"cms-list-group-item-active":"" }"><a
								href="/?channelId=${c.id }" class="channel"> ${c.name } </a></li>

						</c:forEach>
					</ul>
				</div>

			</div>
			<!-- 中间内容显示区域 -->
			<div class="col-md-7 split min_h_500">

				<c:if test="${article.channelId==null }" >
				
					<!-- 默认显示轮播图 -->
					<div>
						<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleCaptions" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="/resource/pic/xxxx.jpg" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<p>蟹老板one</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/resource/pic/pppp.jpg" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<p>皮老板two</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/resource/pic/mmmm.jpg" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<p>海绵宝宝three</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/resource/pic/zzzz.jpg" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<p>章鱼哥four</p>
									</div>
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleCaptions"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>

					</div>
					<!-- 热点文章 -->
					<div>
						<hr>
						<c:forEach items="${info.list}" var="h">
							<div class="media">
								<img src="resource/pic/${h.picture}" class="mr-3" alt="..."
									style="height: 101px; width: 156px">
								<div class="media-body">
									<h3>
										<strong><a href="/article?id=${h.id }"
											target="_blank">${h.title }</a></strong>
									</h3>
									<p style="margin-top: 10px">
										${h.user.username}
										<fmt:formatDate value="${h.updated }"
											pattern="yyyy-MM-dd HH:mm:ss" />
											
									</p>
								</div>
							</div>
							<hr>
						</c:forEach>

						<jsp:include page="/WEB-INF/views/common/pages.jsp"></jsp:include>
					</div>

				</c:if>
				<!-- 栏目不为空时,显示栏目下的分类及分类文章 -->
				<c:if test="${article.channelId!=null }">
					<div>
						<!-- 分类 -->
						<div>
							<ul class="nav">
								<li class="nav-item"><a
									class="nav-link cms-list-group-item-action ${article.categoryId==null?"
									cms-list-group-item-active":"" }" href="/?channelId=${article.channelId}">全部</a>
									<c:forEach items="${categorys}" var="c">
										<li class="nav-item"><a
											class="nav-link cms-list-group-item-action ${article.categoryId==c.id?"
											cms-list-group-item-active":"" }" href="/?channelId=${article.channelId}&categoryId=${c.id}">${c.name}</a>
									</c:forEach>
							</ul>
						</div>
						<!-- 分类文章 -->
						<div>
							<hr>
							<c:forEach items="${info.list}" var="h">
								<div class="media">
									<img src="resource/pic/${h.picture}" class="mr-3" alt="..."
										style="height: 101px; width: 156px">
									<div class="media-body">
										<h3>
											<strong><a href="/article?id=${h.id }"
												target="_blank">${h.title }</a></strong>
										</h3>
										<p style="margin-top: 10px">
											${h.user.username}
											<fmt:formatDate value="${h.updated }"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</p>
									</div>
								</div>
								<hr>
							</c:forEach>

							<jsp:include page="/WEB-INF/views/common/pages.jsp"></jsp:include>
						</div>


					</div>


				</c:if>




			</div>
			<!-- 右侧边栏 -->
			<div class="col-md-3 split min_h_500">
				<!-- 最近发布的5篇文章 -->
				<div class="card" style="width: 18rem;">
					<div class="card-header">最新文章</div>
					<div class="card-body">
						<c:forEach items="${lastInfo.list}" var="a">
							<p class="ex"> 
								<a href="/article?id=${a.id }" target="_blank" title="${a.title }">${a.title }</a>

							</p>
						</c:forEach>
					</div>
				</div>
				<!-- 24小时热文 -->
				<div class="card" style="width: 18rem;">
					<div class="card-header">24小时热文</div>
					<div class="card-body">
						
					</div>
				</div>

	        <!-- 图片集 -->
				<div class="card" style="width: 18rem;">
					<div class="card-header">图片集</div>
					<div class="card-body">
						
					</div>
				</div>
				 <!-- 友情链接 -->
				<div class="card" style="width: 18rem;">
					<div class="card-header">友情链接</div>
					<div class="card-body">
						<a href="https://www.baidu.com/?tn=99669880_hao_pg">
						<button type="button" class="btn btn-outline-success">百度一下,你就知道---度娘带你飞</button></a>
						<a href="http://lcoc.top/">
						<button type="button" class="btn btn-outline-primary">蓝调，让你的眼球发亮</button></a>
					</div>
				</div>


			</div>

		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
	
		$("#myArticle").click();
		$("#center").load("my/selectByUser")
	

		//分页
		function goPage(page) {
			var url = "/?page=" + page+"&channelId="+'${article.channelId}'
			location = url;
		}
	</script>
	<div class="progress">
  <!-- <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div> -->
</div>
</body>
</html>