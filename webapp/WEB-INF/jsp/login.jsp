<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Material Login Form</title>


<link rel="stylesheet" href="/static/plugins/css/reset.css">

<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>

<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/plugins/css/login.css">
<style type="text/css">
body{
padding-top: 2%;
}
</style>
</head>

<body>
	<div class="rerun">
		<a href="">Rerun Pen</a>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Login</h1>
			<form>
				<div class="input-container">
					<input type="text" id="UserId" required="required" /> <label
						for="UserId">UserId</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="password" id="Password" required="required" /> <label
						for="Password">Password</label>
					<div class="bar"></div>
				</div>
				<div class="button-container front">
					<button>
						<span>Go</span>
					</button>
				</div>
				<div class="footer">
					<a href="#">Forgot your password?</a>
				</div>
			</form>
		</div>
		<div class="card alt">
			<div class="toggle"></div>
			<h1 class="title">
				Register
				<div class="close"></div>
			</h1>
			<form>
				<div class="input-container">
					<input type="text" id="CreateUserId" required="required" /> <label
						for="UserId">UserId</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="password" id="CreatePassword" required="required" /> <label
						for="Password">Password</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="text" id="CreateUserName" required="required" />
					<label for="UserName">UserName</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="text" id="CreateAge" required="required" />
					<label for="Age">Age</label>
					<div class="bar"></div>
				</div>
				<div class="button-container backend">
					<button>
						<span>Next</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<script src='/static/plugins/jquery/jquery-3.1.0.min.js'></script>

	<script type="text/javascript">
		$('.toggle').on('click', function() {
			$('.container').stop().addClass('active');
		});

		$('.close').on('click', function() {
			$('.container').stop().removeClass('active');
		});
		$(".front").on("click",function(){

			if(($("#UserId").val().trim()!="")&&($("#Password").val().trim()!="")){
			console.log("보낼거야"+$("#UserId").val()+" , "+$("#Password").val());
			var date = {userId:$("#UserId").val(),
					password:$("#Password").val()};
			$.ajax({
				url: "/api/logInfo",
				method: "POST",
				data: date
			}).done(function(result) {
					if(result==1){
						alert($("#UserId").val()+"님 반갑습니다");
						location.reload();
					}else{
						alert("누구세요");
						location.href = "/#";
					}
				});
			}
		})
		$(".backend").on("click",function(){
			var createUser={
					userId : $("#CreateUserId").val(),
					password : $("#CreatePassword").val(),
					age : $("#CreateAge").val(),
					name : $("#CreateUserName").val()
			}
			if(($("#CreateUserId").val().trim()!="")&&($("#CreatePassword").val().trim()!="")&&($("#CreateAge").val().trim()!="")&&($("#CreateUserName").val().trim()!="")){
				alert("check trim" +createUser.userName);
			$.ajax({
				url: "/api/Create/user",
				method: "POST",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				data: JSON.stringify(createUser)
			}).done(function(result) {
				if(result==1){
					alert($("#UserId").val()+"님 반갑습니다");
					location.href = "/list2";
				}else{
					alert("누구세요");
					location.href = "/#";
				}
				}).fail(function(){
					alert(createUser.userName);
				});

			}
		})
	</script>



</body>
</html>
