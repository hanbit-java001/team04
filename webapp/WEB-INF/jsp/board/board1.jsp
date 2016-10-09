<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/static/plugins/startbootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/static/plugins/startbootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<link href="/static/plugins/startbootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="wrapper">
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
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>Task 1</strong> <span class="pull-right text-muted">40%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">40% Complete (success)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 2</strong> <span class="pull-right text-muted">20%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">20% Complete</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 3</strong> <span class="pull-right text-muted">60%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 60%">
										<span class="sr-only">60% Complete (warning)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 4</strong> <span class="pull-right text-muted">80%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100" style="width: 80%">
										<span class="sr-only">80% Complete (danger)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Tasks</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links --> <!-- 좌측 네비바 시작  -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<!-- /input-group -->
					</li>
					<li><a href="#"><i class="fa fa-dashboard fa-fw"></i>
							Dashboard</a></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i> Board<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">게시판1</a></li>
							<li><a href="#">게시판2</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
							Pages<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="blank.html">Blank Page</a></li>
							<li><a href="login.html">Login Page</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>

		<!-- 좌측 네비바 끝 --> <!-- /.navbar-static-side --> </nav>

</div>




<script src="/static/plugins/startbootstrap/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/static/plugins/startbootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/static/plugins/startbootstrap/vendor/metisMenu/metisMenu.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="/static/plugins/startbootstrap/data/morris-data.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<!-- 	<script src="/static/plugins/startbootstrap/vendor/raphael/raphael.min.js"></script> -->
<!-- 	<script	src="/static/plugins/startbootstrap/vendor/morrisjs/morris.min.js"></script> -->
	<script src="/static/plugins/startbootstrap/dist/js/sb-admin-2.js"></script>
</body>
</html>
</body>
</html>