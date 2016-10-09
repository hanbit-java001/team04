<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
// $("#dashboardHome").on("click" , function(){
// 	location.href = "/member/join";
// });

$(document).ready(function() {
	 var i ={
			subject:"sub",
			content:"con"
	 };
	
	$.ajax({
		url:"/api/board/start",
		method:"POST"		
		contentType: "application/json; charset=utf-8",
		data:JSON.stringify(i),
		dataType: "json"
	}).done(function(IdeaVo){
		alert(IdeaVo.content);
	}).fail(function(){
		alert("실패");
	});
	
});

</script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link
	href="/static/plugins/startbootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/static/plugins/startbootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<!-- Custom Fonts -->
<link
	href="/static/plugins/startbootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<li class="navbar-brand">Ranking Board</li>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
					<i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
				
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user -->
			</li>
		</ul>
		<!-- /.navbar-top-links --> <!-- 좌측 네비바 시작 -------------------------------------------------------------------- -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li>
						<a href="#"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
					</li>
					
					<li>
						<a href="#"><i class="fa fa-table fa-fw"></i> Board<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">게시판1</a></li>
							<li><a href="#">게시판2</a></li>
						</ul> <!-- /.nav-second-level -->
					</li>
					<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">KaKao Page</a></li>
							<li><a href="#">Login Page</a></li>
						</ul> <!-- /.nav-second-level -->
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>

		<!-- 좌측 네비바 끝 --> <!-- /.navbar-static-side -->
	 </nav>


		<!--  가운데 아이콘 4개  시작 -------------------------------------------------------------------------------------->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Ranking Board</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tag fa-5x" aria-hidden="true"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">12</div>
									<div>New Tasks!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-krw fa-5x" aria-hidden="true"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13</div>
									<div>Donation</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
<!-- 						<div class="panel-heading"> -->
<!-- 							<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example -->
<!-- 							<div class="pull-right"> -->
<!-- 								<div class="btn-group"> -->
<!-- 									<button type="button" -->
<!-- 										class="btn btn-default btn-xs dropdown-toggle" -->
<!-- 										data-toggle="dropdown"> -->
<!-- 										Actions <span class="caret"></span> -->
<!-- 									</button> -->
<!-- 									<ul class="dropdown-menu pull-right" role="menu"> -->
<!-- 										<li><a href="#">Action</a></li> -->
<!-- 										<li><a href="#">Another action</a></li> -->
<!-- 										<li><a href="#">Something else here</a></li> -->
<!-- 										<li class="divider"></li> -->
<!-- 										<li><a href="#">Separated link</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="morris-area-chart"></div>
						</div>
					</div>
		<!-- 하단  시작 ----------------------------------------------------------------------------------------------------------------------->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-clock-o fa-fw"></i> 실시간 반응
						</div>
					</div>
				</div>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix">
						<span class="chat-img pull-left"><img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" /></span>
						<div class="chat-body clearfix">
							<div class="header">
								<strong class="primary-font">Jack Sparrow</strong> 
								<small class="pull-right text-muted"> 
								<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
								</small>
							</div>
							<p>하하</p>
							</div>
					</li>
					<li class="left clearfix">
						<span class="chat-img pull-left"><img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" /></span>
						<div class="chat-body clearfix">
							<div class="header">
								<strong class="primary-font">Jack Sparrow</strong> 
								<small class="pull-right text-muted"> 
								<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
								</small>
							</div>
							<p>하하</p>
							</div>
					</li>
					<li class="left clearfix">
						<span class="chat-img pull-left"><img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" /></span>
						<div class="chat-body clearfix">
							<div class="header">
								<strong class="primary-font">Jack Sparrow</strong> 
								<small class="pull-right text-muted"> 
								<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
								</small>
							</div>
							<p>하하</p>
							</div>
					</li>
					<li class="left clearfix">
						<span class="chat-img pull-left"><img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" /></span>
						<div class="chat-body clearfix">
							<div class="header">
								<strong class="primary-font">Jack Sparrow</strong> 
								<small class="pull-right text-muted"> 
								<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
								</small>
							</div>
							<p>하하</p>
							</div>
					</li>
				</ul>
			</div>
			<!-- /.panel-body -->
			<div class="panel-footer">
				<div class="input-group">
					<input id="btn-input" type="text" class="form-control input-sm"
						placeholder="Type your message here..." /> <span
						class="input-group-btn">
						<button class="btn btn-warning btn-sm" id="btn-chat">
							Send</button>
					</span>
				</div>
			</div>
			<!-- /.panel-footer -->
		</div>
		<!-- /.panel .chat-panel -->
	</div>
	<!-- /.col-lg-4 -->
	</div>
	<!-- /.row -->
	</div>

	<!-- 가운데 아이콘4개 -->
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<script
		src="/static/plugins/startbootstrap/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="/static/plugins/startbootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.js"></script>
	<!-- Morris Charts JavaScript -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="/static/plugins/startbootstrap/data/morris-data.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<!-- 	<script src="/static/plugins/startbootstrap/vendor/raphael/raphael.min.js"></script> -->
<!-- 	<script	src="/static/plugins/startbootstrap/vendor/morrisjs/morris.min.js"></script> -->
	<!-- Custom Theme JavaScript -->
	<script src="/static/plugins/startbootstrap/dist/js/sb-admin-2.js"></script>
	


</body>
</html>