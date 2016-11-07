<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>게시글이름</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link href="/static/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/static/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="/static/css/animate.min.css" rel="stylesheet" />
<link href="/static/css/style.min.css" rel="stylesheet" />
<link href="/static/css/bong.css" rel="stylesheet" />
<link href="/static/css/style-responsive.min.css" rel="stylesheet" />
<link href="/static/css/theme/default.css" id="theme" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<link
	href="/static/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"
	rel="stylesheet" />
<!-- ================== END PAGE LEVEL STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="/static/plugins/pace/pace.min.js"></script>
<script src="/static/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="/static/js/detail.js"></script>
<!-- <script src="/static/js/board-list.js"></script> -->
<!-- 		<script src="/static/plugins/js/board-list.js"></script> -->
<!-- ================== END BASE JS ================== -->
</head>
<body>
	<!-- begin #header -->
	<div id="header" class="header navbar navbar-default navbar-fixed-top">
		<!-- begin container -->
		<div class="container">
			<!-- begin navbar-header -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#header-navbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<!-- end navbar-header -->

			<!-- begin #home-navbar -->
			<div class="collapse navbar-collapse" id="header-navbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="/boardMain.do"><button>돌아가기</button></a>
				</ul>
			</div>
			<!-- end #home-navbar -->

			<!-- begin #header-navbar -->

			<!-- end #header-navbar -->
		</div>
		<!-- end container -->
	</div>
	<!-- end #header -->

	<!-- begin page-title -->
	<div class="page-title has-bg">
		<!-- begin bg-cover -->
		<div class="bg-cover">
			<img src="/static/img/cover3.jpg" alt="" />
		</div>
		<!-- end bg-cover -->
		<!-- begin container -->
		<div class="container">
			<!-- begin breadcrumb -->

			<!-- end breadcrumb -->
			<h1>${article.bTitle }</h1>
		</div>
		<!-- end container -->
	</div>
	<!-- end page-title -->

	<!-- begin content -->
	<div class="content">
		<!-- begin container -->
		<div class="container">
			<!-- begin row -->
			<div class="row">
				<!-- begin col-9 -->
				<div class="col-md-9">


					<!-- begin forum-list -->
					<ul class="forum-list forum-detail-list">
						<li>
							<!-- begin media -->
							<div class="media">
								<img src="/static/img/user-1.jpg" alt="" /> <span
									class="label label-danger">글쓴이</span>
							</div> <!-- end media --> <!-- begin info-container -->
							<div class="info-container">
								<div class="post-user">
									<a href="read.do?bId=${article.bId}&rc=true">${article.bWriter}</a>
									<small>SAYS</small>
								</div>
								<div class="post-content">${article.bContent}</div>

								<div class="post-time">${article.bDate.getTime()}</div>
								<div class="delete-btn">Delete</div>
							
							</div> <!-- end info-container -->
						</li>
						<hr />
						이 아래는 댓글들
						<hr />
						<c:forEach items="${article.commentList}" var="comment">
							<li>
								<!-- begin media -->
								<div class="media">
									<img src="/static/img/user-2.jpg" alt="" /> <span
										class="label label-inverse">USER</span>
								</div> <!-- end media --> <!-- begin info-container -->
								<div class="info-container">
									<div class="post-user">
										<a href="#">${comment.bcWriter}</a> <small>SAYS</small>
									</div>
									<div class="post-content">${comment.bcContent}</div>
									<div class="post-time">${comment.bcDate.getTime()}</div>
								</div> <!-- end info-container -->
							</li>
						</c:forEach>
					</ul>
					<!-- end forum-list -->

					<!-- begin comment-section -->

					<form action="writeComment.do" name="wysihtml5" method="POST">
						<div class="panel panel-forum">
							<div class="panel-heading">
								<span class="panel-title">작성자</span><input type="text"
									class="textarea form-control" id="wysihtml5" placeholder=""
									name="bcWriter" />
									
							</div>
							<div class="panel-heading">
								<h4 class="panel-title">내용</h4>
							</div>
							<div class="panel-body">
								<textarea class="textarea form-control" id="wysihtml5"
									placeholder="" rows="12" name="bcContent"></textarea>
								<div class="m-t-10">
									<button type="submit" class="btn btn-theme">
										확인<i class="fa fa-paper-plane"></i>
									</button>
								</div>
								<input type="hidden" name="bId" value="${article.bId}">
							</div>
						</div>
					</form>
					<!-- end comment-section -->
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end content -->

	<!-- begin #footer -->
	<div id="footer" class="footer">
		<!-- begin container -->
		<div class="container">
			<!-- begin row -->
			<div class="row">

				<!-- begin col-4 -->
				<div class="col-md-4">
					<!-- begin section-container -->
					<div class="section-container">
						<h4>최근 게시물</h4>
						<ul class="latest-post">
							<c:forEach items="${currentArticleList}" var="article">
								<li>
									<h4 class="title">
										<a href="read.do?bId=${article.bId}&rc=true">${article.bTitle}</a>
									</h4>
									<p class="time">${article.bDate}</p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end section-container -->
				</div>
				<!-- end col-4 -->
				<!-- begin col-4 -->
				<div class="col-md-4">
					<!-- begin section-container -->
					<div class="section-container">
						<h4>새로운 가입자</h4>
						<ul class="new-user">
							<li><a href="#"><img src="/static/img/user-1.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-2.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-3.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-4.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-5.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-6.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-7.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-8.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/static/img/user-9.jpg" alt="" /></a></li>
						</ul>
					</div>
					<!-- end section-container -->
				</div>
				<!-- end col-4 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end #footer -->
	<!-- begin #footer-copyright -->
	<div id="footer-copyright" class="footer-copyright">
		<div class="container">
			&copy; 2014 - 2015 SeanTheme All Right Reserved <a href="#">Contact
				Us</a> <a href="#">Knowledge Base</a>
		</div>
	</div>
	<!-- end #footer-copyright -->
	<!-- begin theme-panel -->
	<
	<!-- end theme-panel -->

	<!-- ================== BEGIN BASE JS ================== -->

	<script src="/static/plugins/jquery/jquery-1.9.1.min.js"></script>
	<!-- 	<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script> -->
	<script src="/static/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="/static/crossbrowserjs/html5shiv.js"></script>
		<script src="/static/crossbrowserjs/respond.min.js"></script>
		<script src="/static/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="/static/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- 	<script src="/static/js/apps,min.js"></script> -->
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<!-- 	<script -->
<!-- 		src="/static/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script> -->
<!-- 	<script -->
<!-- 		src="/static/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script> -->
<!-- 	<script src="/static/js/forum-details-page.min.js"></script> -->
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		$(document).ready(function() {
// 			App.init();
// 			ForumDetailsPage.init();
		});
	</script>
</body>
</html>
