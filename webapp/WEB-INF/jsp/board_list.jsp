<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- 	<meta  charset="utf-8" /> -->
<title>Q&A 게시판</title>
<style type="text/css">
.btn pri ico{
/*  .set.red  */
/*     %a.btn.pri Delete  */
/*     %a.btn.pri.ico Delete  */

 }
</style>
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
<link href="/static/css/style-responsive.min.css" rel="stylesheet" />
<!-- <link href="/static/css/theme/default.css" id="theme" rel="stylesheet" /> -->
<link href="/static/css/button.css" rel="stylesheet" />

<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="/static/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="/static/plugins/pace/pace.min.js"></script>
<script src="/static/js/board-list.js"></script>
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
			<img src="/static/img/cover2.jpg" alt="" />
		</div>
		<!-- end bg-cover -->
		<!-- begin container -->
		<div class="container">
			<!-- begin breadcrumb -->
			<ul class="breadcrumb">
				<li class="active">&nbsp;</li>
			</ul>
			<!-- end breadcrumb -->
			<h1>질문하세요</h1>
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
					<!-- begin pagination -->
					<div class="text-right">

						<div class="btn pri ico" id="btnAdd">
							<a href="#">Add</a>
						</div>
						<div id="writeForContent"></div>
					</div>
					<!-- end pagination -->
					<!-- begin panel-forum -->
					<div class="panel panel-forum">
						<!-- begin forum-list -->
						<ul class="forum-list forum-topic-list">
							<c:forEach items="${articlePage.articleList}" var="article">
								<li>
									<!-- begin media -->
									<div class="media">
										<img src="/static/img/user-1.jpg" alt="" />
									</div> <!-- end media --> <!-- begin info-container -->
									<div class="info-container">
										<div class="info">
											<h4 class="title">
												<a href="read.do?bId=${article.bId}&rc=true">${article.bTitle}</a>
											</h4>
											<ul class="info-start-end">
												<li>작성자 <a href="read.do?bId=${article.bId}&rc=true">${article.bWriter}</a></li>
												<li>최근 답변자
													<a href="detail.html">
														<c:if test="${not empty article.lastCommentWriter}">
															${article.lastCommentWriter}
														</c:if>
														<c:if test="${empty article.lastCommentWriter}">
															none
														</c:if>
													</a>
												</li>
											</ul>
										</div>
										<div class="date-replies">
											<div class="time">${article.bDate.getTime()}</div>
											<div class="replies">
												<div class="total">${article.commentCount}</div>
												<div class="text">답변수</div>
											</div>
										</div>
									</div> <!-- end info-container -->
								</li>
							</c:forEach>
						</ul>
						<!-- end forum-list -->
					</div>
					<!-- end panel-forum -->

					<!-- begin pagination -->
					<div class="text-right">
						<ul class="pagination m-t-0">
							<c:forEach begin="${articlePage.startPage}" end="${articlePage.endPage}" var="page">
                        		<c:if test="${articlePage.requestPage == page}">
                           			<li class="active"><a href="boardMain.do?page=${page}">${page}</a></li>
                            	</c:if>
                            	<c:if test="${articlePage.requestPage != page}">
			                        <li><a href="boardMain.do?page=${page }">${page}</a></li>
                            	</c:if>
                            </c:forEach>
                            <c:if test="${articlePage.endPage<articlePage.totalPageCount}">
								<li class="text"><span>...</span></li>
								<li><a href="#">${articlePage.totalPageCount}</a></li>
								<li class="right"><a href="#"><i
									class="fa fa-chevron-right"></i></a></li>
                            </c:if>
						</ul>
					</div>
					<!-- end pagination -->
				</div>
				<!-- end col-9 -->
				<!-- begin col-3 -->
				<div class="col-md-3">
					<!-- begin panel-forum -->
					<div class="panel panel-forum">

					</div>
					<!-- end panel-forum -->
				</div>
				<!-- end col-3 -->
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
						<div class="latest-post">
							<c:forEach items="${currentArticleList}" var="article">
								<h4 class="title"><a href="read.do?bId=${article.bId}&rc=true">>>${article.bTitle}</a></h4>
								<p class="time">${article.bDate}</p><br>
							</c:forEach>
						</div>
					</div>
					<!-- end section-container -->
				</div>
				<!-- end col-4 -->
				<!-- begin col-4 -->
				<div class="col-md-4">
					<!-- begin section-container -->

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

	<!-- end theme-panel -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="/static/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="/static/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="/static/crossbrowserjs/html5shiv.js"></script>
		<script src="/static/crossbrowserjs/respond.min.js"></script>
		<script src="/static/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="/static/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- 	<script src="/static/js/apps.min.js"></script> -->
	<script src="/static/js/mam.js"></script>

	<!-- ================== END BASE JS ================== -->

	<script>
		$(document).ready(function() {
			console.log("check name 2: "+"${userName}");
// 			console.log("check session : "+"${sessionScope.isLoggedIn}");
// 			console.log("check session user id: "+"${sessionScope.getUserId}");
// 			App.init();
		});
	</script>
</body>
</html>