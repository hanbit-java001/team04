<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/static/plugins/startbootstrap/vendor/bootstrap/css/bootstrap.min.css" 	rel="stylesheet">
<link href="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.css" 	rel="stylesheet">
<link href="/static/plugins/startbootstrap/dist/css/sb-admin-2.css" 	rel="stylesheet">
<link href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" rel="stylesheet">
<link href="/static/plugins/startbootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/static/plugins/css/board.css" rel="stylesheet">

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<li class="navbar-brand">Dash Board</li>
		</div>
		<div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
					</a>
				<ul class="dropdown-menu dropdown-user">
					<li class="beforeLogin"><i class="fa fa-user fa-fw"></i>Login</li>
					<li class="afterLogin"><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a></li>
					<li class="afterLogin"><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
					<li class="afterLogin logout"><a href="#"><i class="fa fa-sign-out fa-fw"></i>Logout</a></li>
				</ul>
			</li>
		</ul>
	</div>
		<!-- /.navbar-header -->
		<!-- /.navbar-top-links --> <!-- 좌측 네비바 시작 -------------------------------------------------------------------- -->

		<!-- 좌측 네비바 끝 --> <!-- /.navbar-static-side --> </nav>

		<!--  가운데 아이콘 4개  시작 -------------------------------------------------------------------------------------->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"><i class="fa fa-area-chart" aria-hidden="true"></i>  Ranking Board</h1>
				</div>
			</div>
		<div class="row">
				<div class="col-sm-4">
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
				<div class="col-sm-4">
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
				<div class="col-sm-4">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-cc-paypal fa-5x" aria-hidden="true"></i></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13000$</div>
									<div>Total Donation</div>
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
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="row">
								<div class="col-sm-6 text-center">
									<label class="label label-success">Highest Ranker Top3</label>
									<div id="bar chart"></div>
								</div>
								<div class="col-sm-6 text-center">
									<label class="label label-success">Highest Ranker Top3</label>
									<div id="pie-chart"></div>
								</div>
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
			<div class="col-lg-12">
				<div class="panel-body replyBody">
				</div>
				<div class="page">
				</div>
			</div>

			<div class="panel-footer col-lg-9">
					<div class="input-group">
						<input id="btn-input" type="text" class="form-control input-sm"	placeholder="Type your message here..." />
						<span class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat">Send</button>
						</span>
					</div>
			</div>
		</div>
	</div>
</div>

<div class="form-group login-panel">
	<div class="loading"></div>
	<div class="pojoro">●</div>
		<div class="form-group inlogin-panel">
		<span class="label label-default">이름</span>
		<input type="text" class="form-control" placeholder="ID" id="submitId">
		</div>
		<div class="form-group inlogin-panel">
		<span class="label label-default">비밀번호</span>
		<input type="text" class="form-control" id="submitpassword" placeholder="비밀번호">
		</div>
		<div class="btn-line">
			<button class="btn btn-primary loginbtn">전송</button>
			<button class="btn btn-default canclebtn">취소</button>
		</div>
</div>
		<script src="/static/plugins/startbootstrap/vendor/jquery/jquery.min.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script src="/static/plugins/startbootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.js"></script>
		<!-- Morris Charts JavaScript -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<script src="/static/plugins/startbootstrap/data/morris-data.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
		<!-- 	<script src="/static/plugins/startbootstrap/vendor/raphael/raphael.min.js"></script> -->
		<!-- 	<script	src="/static/plugins/startbootstrap/vendor/morrisjs/morris.min.js"></script> -->
		<script src="/static/plugins/startbootstrap/dist/js/sb-admin-2.js"></script>
		<script src="/static/plugins/momentjs/moment.min.js"></script>
		<script src="/static/plugins/js/timeago.js"></script>
		<script src="/static/plugins/js/board0.js"></script>
</body>
</html>