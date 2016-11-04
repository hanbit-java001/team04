<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>게시글이름</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="/static/css/animate.min.css" rel="stylesheet" />
	<link href="/static/css/style.min.css" rel="stylesheet" />
	<link href="/static/css/style-responsive.min.css" rel="stylesheet" />
	<link href="/static/css/theme/default.css" id="theme" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="/static/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="/static/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>
<body>
    <!-- begin #header -->
    <div id="header" class="header navbar navbar-default navbar-fixed-top">
        <!-- begin container -->
        <div class="container">
            <!-- begin navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>
            <!-- end navbar-header -->
            
            <!-- begin #home-navbar -->
            <div class="collapse navbar-collapse" id="header-navbar">
                <ul class="nav navbar-nav navbar-left">
					<li>
						<a href="/boardMain.do"><button>Main</button></a>
				
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
                    <!-- begin pagination -->
<!--                     <div class="text-right"> -->
<!--                         <ul class="pagination m-t-0 m-b-15"> -->
<%--                         	<c:forEach begin="${articlePage.startPage}" end="${articlePage.endPage}" var="page"> --%>
<%--                         		<c:if test="${articlePage.requestPage == page}"> --%>
<%--                            			<li class="active"><a href="#">${page}</a></li> --%>
<%--                             	</c:if> --%>
<%--                             	<c:if test="${articlePage.requestPage == page}"> --%>
<%-- 			                        <li><a href="#">${page}</a></li> --%>
<%--                             	</c:if> --%>
<%--                             </c:forEach> --%>
<%--                             <c:if test="${articlePage.endPage<articlePage.totalPageCount}"> --%>
<!--                             <li class="text"><span>...</span></li> -->
<!--                             <li class="right"><a href="#"><i class="fa fa-chevron-right"></i></a></li> -->
<%--                             </c:if> --%>
<!--                         </ul> -->
<!--                     </div> -->
                    <!-- end pagination -->
                    
                    <!-- begin forum-list -->
                    <ul class="forum-list forum-detail-list">
                        <li>
                            <!-- begin media -->
                            <div class="media">
                                <img src="/static/img/user-1.jpg" alt="" />
                                <span class="label label-danger">글쓴이</span>
                            </div>
                            <!-- end media -->
                            <!-- begin info-container -->
                            <div class="info-container">
                                <div class="post-user"><a href="#">Radomit Grigor</a> <small>SAYS</small></div>
                                <div class="post-content">
                                    ${article.bContent}
                                </div>
                                <div class="post-time">4 hours ago</div>
                            </div>
                            <!-- end info-container -->
                        </li>
                        <hr/>
                        		이 아래는 댓글들
                        <hr/>
                            <c:forEach items="${article.commentList}" var="comment">
                        <li>
                            <!-- begin media -->
                            <div class="media">
                                <img src="/static/img/user-2.jpg" alt="" />
                                <span class="label label-inverse">USER</span>
                            </div>
                            <!-- end media -->
                            
                            <!-- begin info-container -->
                            <div class="info-container">
                                <div class="post-user"><a href="#">${comment.bcWriter}</a> <small>SAYS</small></div>
                                <div class="post-content">
                                    ${comment.bcContent}
                                </div>
                                <div class="post-time">5 hours ago</div>
                                
                            </div>
                            <!-- end info-container -->
                        </li>
                            </c:forEach>
<!--                         <li> -->
<!--                             begin media -->
<!--                             <div class="media"> -->
<!--                                 <img src="/static/img/user-3.jpg" alt="" /> -->
<!--                                 <span class="label label-primary">STAFF</span> -->
<!--                             </div> -->
<!--                             end media -->
<!--                             begin info-container -->
<!--                             <div class="info-container"> -->
<!--                                 <div class="post-user"><a href="#">Cruz Erwann</a> <small>SAYS</small></div> -->
<!--                                 <div class="post-content"> -->
<!--                                     Sed lacinia nec odio eu maximus! -->
<!--                                 </div> -->
<!--                                 <div class="post-time">5 hours ago</div> -->
<!--                             </div> -->
<!--                             end info-container -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             begin media -->
<!--                             <div class="media"> -->
<!--                                 <img src="/static/img/user-4.jpg" alt="" /> -->
<!--                                 <span class="label label-inverse">USER</span> -->
<!--                             </div> -->
<!--                             end media -->
<!--                             begin info-container -->
<!--                             <div class="info-container"> -->
<!--                                 <div class="post-user"><a href="#">Boyce</a> <small>SAYS</small></div> -->
<!--                                 <div class="post-content"> -->
<!--                                     Aliquam sit amet justo accumsan, pulvinar purus vel, aliquet dolor. Cras tempus magna sit amet est sagittis, a egestas ligula fringilla.  -->
<!--                                     Nunc volutpat metus non turpis cursus faucibus. Aliquam molestie arcu et ipsum placerat, et porta orci euismod. <br /><br /> -->
<!--                                     Nam sed magna at turpis imperdiet ornare. Maecenas tincidunt iaculis ligula quis ultrices. Nunc id elit vel nulla efficitur ultrices in at nunc.  -->
<!--                                     Fusce imperdiet urna vitae lectus aliquet lobortis.<br /><br /> -->
<!--                                     Aenean non felis non leo dignissim egestas id id tellus. Nulla at elit sed lectus suscipit tempus.  -->
<!--                                     Sed non tellus nunc. Curabitur metus ipsum, luctus sed mi at, ullamcorper laoreet tortor.  -->
<!--                                     Sed nec sem fringilla erat consectetur vestibulum et rutrum augue. Mauris non ultrices velit. <br /><br /> -->
<!--                                     Duis rutrum turpis sed ipsum auctor blandit. Phasellus iaculis at augue id commodo. Praesent euismod vel nisl sed eleifend.  -->
<!--                                     Vestibulum malesuada vehicula viverra. Pellentesque maximus semper suscipit. Morbi eget dignissim urna, sit amet tempor nisl. <br /><br /> -->
<!--                                     Integer vel ipsum ut enim rutrum lacinia. Fusce sapien nunc, vulputate ac cursus in, luctus ac turpis. -->
<!--                                 </div> -->
<!--                                 <div class="post-time">Just Now</div> -->
<!--                             </div> -->
<!--                             end info-container -->
<!--                         </li> -->
                    </ul>
                    <!-- end forum-list -->
                    
                    <!-- begin comment-section -->
                    
                    <form action="writeComment.do" name="wysihtml5" method="POST">
                    <div class="panel panel-forum">
                    	<div class="panel-heading">
                            <span class="panel-title">작성자</span>
                                <input type="text" class="textarea form-control" id="wysihtml5" placeholder="" name="bcWriter"/>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">내용</h4>
                        </div>
                        <div class="panel-body">
                                <textarea class="textarea form-control" id="wysihtml5" placeholder="" rows="12" name="bcContent"></textarea>
                                <div class="m-t-10">
                                    <button type="submit" class="btn btn-theme">확인<i class="fa fa-paper-plane"></i></button>
                                </div>
                                <input type="hidden" name="bId" value="${article.bId}">
                        </div>
                    </div>
                    </form>
                    <!-- end comment-section -->
                </div>
                <!-- end col-9 -->
                <!-- begin col-3 -->
<!--                 <div class="col-md-3"> -->
                    <!-- begin panel-forum -->
<!--                     <div class="panel panel-forum"> -->
<!--                         <div class="panel-heading"> -->
<!--                             <h4 class="panel-title">Active Threads</h4> -->
<!--                         </div> -->
                        <!-- begin threads-list -->
<!--                         <ul class="threads-list"> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">Browser Local Storage Tutorial</a></h4> -->
<!--                                 last reply by <a href="#">Anatoliy</a> 1 minutes ago -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">How to create live push notification with HTML5 web socket</a></h4> -->
<!--                                 last reply by <a href="#">Nasim</a> 8 minutes ago -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">Help! How to fire an ajax call while bootstrap modal is loading.</a></h4> -->
<!--                                 last reply by <a href="#">Ural</a> 15 minutes ago -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">Migrate from jQuery 1.9.x to 2.x.x</a></h4> -->
<!--                                 last reply by <a href="#">Arnold</a> 1 hour ago -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">Angular JS IE8 compatibility issues</a></h4> -->
<!--                                 last reply by <a href="#">Mayeso</a> 4 hours ago -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h4 class="title"><a href="detail.html">How to use FontAwesome Cheatsheet?</a></h4> -->
<!--                                 last reply by <a href="#">Cepheus Herman</a> 1 day ago -->
<!--                             </li> -->
<!--                         </ul> -->
                        <!-- end threads-list -->
<!--                     </div> -->
                    <!-- end panel-forum -->
<!--                 </div> -->
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
                        <ul class="latest-post">
                        <c:forEach items="${currentArticleList}" var="article">
                            <li>
                                <h4 class="title"><a href="read.do?bId=${article.bId}&rc=true">${article.bTitle}</a></h4>
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
            &copy; 2014 - 2015 SeanTheme All Right Reserved
            <a href="#">Contact Us</a> 
            <a href="#">Knowledge Base</a>
        </div>
    </div>
    <!-- end #footer-copyright -->
    <!-- begin theme-panel -->
    <div class="theme-panel">
        <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
        <div class="theme-panel-content">
            <ul class="theme-list clearfix">
                <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Purple">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Blue">&nbsp;</a></li>
                <li class="active"><a href="javascript:;" class="bg-green" data-theme="default" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Default">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Orange">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-red" data-theme="red" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Red">&nbsp;</a></li>
            </ul>
        </div>
    </div>
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
	<script src="/static/js/apps,min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="/static/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
	<script src="/static/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
	<script src="/static/js/forum-details-page.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>    
	    $(document).ready(function() {
	        App.init();
	        ForumDetailsPage.init();
	    });
	</script>
</body>
</html>
