<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Material Login Form</title>


<link rel="stylesheet" href="/static/plugins/css/reset.css">

<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>

<link rel="stylesheet"
	href="/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/plugins/css/login.css">
<style type="text/css">
body {
	padding-top: 2%;
}

.profile-img {

    width: 20vw;
    height: 20vw;
    position: fixed;
    top: 45%;
    left: 39%;
    transform: translate(-50%, -50%);
    background-color: aqua;
    z-index: -1;
    
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
			<form class="front-form">
				<div class="input-container">
					<input type="text" id="UserId" class="login_input"
						required="required" /> <label for="UserId">UserId</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="password" id="Password" class="login_input"
						required="required" /> <label for="Password">Password</label>
					<div class="bar"></div>
				</div>
				<div class="button-container front">
					<button type="button">
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
			<form class="backend-form">
				<div class="input-container">
					<input type="text" id="CreateUserId" required="required" /> <label
						for="UserId">UserId</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="password" id="CreatePassword" required="required" />
					<label for="Password">Password</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="text" id="CreateUserName" required="required" /> <label
						for="UserName">UserName</label>
					<div class="bar"></div>
				</div>
				<div class="input-container">
					<input type="text" id="CreateAge" required="required" /> <label
						for="Age">Age</label>
					<div class="bar"></div>
				</div>
				<div class="button-container backend">
					<!-- 				<div class="backend"> -->
					<button>
						<span>Next</span>
					</button>
				</div>
			</form>
			<div class="profile-img">프로필추가</div>
		</div>
	</div>

	<script src='/static/plugins/jquery/jquery-3.1.0.min.js'></script>

	<script type="text/javascript">
		var userTextMsg = [ "아이디는 이메일 형태로 작성해주세요", "비밀번호는 숫자 1개 + 7글자 이상",
				"이름은 한글또는 영어만", "나이는 숫자로" ];
		var createState = [ "fail", "fail", "fail", "fail", "fail" ];
		$('.toggle').on('click', function() {
			$('.container').stop().addClass('active');
		});

		$('.close').on('click', function() {
			$('.container').stop().removeClass('active');
		});
		// 		$(".front-form div input").on("focusout",function(){
		// 			console.log("input check log"+$("#UserId").val());
		// 			if(validateEmail($("#UserId").val())&&validatePassword($("#Password").val())){
		// 				console.log("check log");
		// 				$(".front button").attr("type","button");
		// 			}

		// 		})
		$(".login_input").bind("keypress", function(e) {
			if (e.keyCode == 13 && $(this).attr("id") == "Password") {
				$(".front button").attr("type", "button");
				submit_login();
			}
		});

		$(".front button").on("click", function() {
			submit_login()
		});

		$(".backend").on(
				"mousedown",
				function() {
					var createUser = {
						userId : $("#CreateUserId").val(),
						password : $("#CreatePassword").val(),
						age : $("#CreateAge").val(),
						name : $("#CreateUserName").val()
					}
					if (($("#CreateUserId").val().trim() != "")
							&& ($("#CreatePassword").val().trim() != "")
							&& ($("#CreateAge").val().trim() != "")
							&& ($("#CreateUserName").val().trim() != "")) {
						$.ajax({
							url : "/api/Create/user",
							method : "POST",
							contentType : "application/json; charset=utf-8",
							dataType : "json",
							data : JSON.stringify(createUser)
						}).done(function(result) {
							if (result == 1) {
								alert($("#CreateUserId").val() + "님 반갑습니다");
								location.href = "/list2";
							}
						}).fail(function() {
						});

					}
				})
		function changeText(that, font_size) {
			$(that).next("label").fadeOut().text(
					userTextMsg[$(".backend-form .input-container").index(
							$(that).parent())]).css({
				"font-size" : font_size,
				"color" : "#ffff00"
			}).fadeIn();
		}
		function validateEmail(email) {
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(email);
		}
		function validatePassword(password) {
			var passw = /^(?=.*\d)[0-9a-zA-Z]{8,}$/;
			return passw.test(password);
		}
		function validateAge(Age) {
			var checkAge = /^(?:[1-9]\d*|\d)$/;
			return checkAge.test(Age);
		}
		function validateName(Name) {
			var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣a-zA-Z]{3,7}$/;
			return checkName.test(Name);
		}
		function seccesOrfail(that, textMsg, color) {
			$(that).next("label").fadeOut().text(textMsg).css({
				"font-size" : "24px",
				"color" : color
			}).fadeIn();
			if (textMsg == "success" || textMsg == "fail") {
				createState[$(".backend-form .input-container").index(
						$(that).parent())] = textMsg;
			}
		}
		function checkState() {
			for (var i = 0; i < createState.length; i++) {
				if (createState[i] == "fail") {
					return false;
				}
			}
			return true;
		}
		$(".backend-form div input").one("mousedown", function() {
			if ($(this).attr("id") == "CreatePassword") {
				changeText(this, "17px");
			} else {
				changeText(this, "20px");
			}
		}).on(
				"focusout",
				function() {
					if ($(this).attr("id") == "CreateUserId"
							&& validateEmail($(this).val())) {
						seccesOrfail(this, "success", "#ffffff");
						$.ajax({
							url : "/api/CheckId",
							method : "GET",
							data : {
								checkingId : $(this).val()
							}
						}).done(function(result) {
							if (result == 1) {
								seccesOrfail(this, "중복된 id가 있어요", "#ffffff");
								createState[4] = "fail";
								$(".backend button").attr("disabled", "ture");
							} else {
								seccesOrfail(this, "success", "#ffffff");
								createState[4] = "success";
								$(".backend button").attr("disabled", "false");
							}
						});
					} else if ($(this).attr("id") == "CreatePassword"
							&& validatePassword($(this).val())) {
						seccesOrfail(this, "success", "#ffffff");
					} else if ($(this).attr("id") == "CreateUserName"
							&& validateName($(this).val())) {
						seccesOrfail(this, "success", "#ffffff");
					} else if ($(this).attr("id") == "CreateAge"
							&& validateAge($(this).val())) {
						seccesOrfail(this, "success", "#ffffff");
					} else {
						seccesOrfail(this, "fail", "#660066");
					}

					console.log(createState);

				})
		$("#CreateAge").bind("keypress", function(e) {
			if (e.keyCode == 13) {
				$(".backend button").attr("type", "button");
			}
		});

		$(".backend-form div input").bind(
				'keypress',
				function(e) {
					console.log("check index : "
							+ $(".backend-form .input-container").index(
									$(this).parent()));
					if (e.keyCode == 13) {
						var currentCheckVal = $(this).val();
						if ($(this).attr("id") == "CreateUserId"
								&& validateEmail(currentCheckVal)) {
							console.log("check email type id");
						} else if ($(this).attr("id") == "CreatePassword"
								&& validatePassword(currentCheckVal)) {
							console.log("check password");
						}
						console.log("check keypress enter" + $(this).val());
						console
								.log("check html"
										+ $(this).next("label").text());
					}
				})

		function submit_login() {
			console.log("check login submit");
			var date = {
				userId : $("#UserId").val(),
				password : $("#Password").val()
			};
			if (($("#UserId").val().trim() != "")
					&& ($("#Password").val().trim() != "")) {
				console.log("보낼거야" + $("#UserId").val() + " , "
						+ $("#Password").val());
				$.ajax({
					url : "/api/logInfo",
					method : "POST",
					data : date
				}).done(function(result) {
					if (result == 1) {
						alert($("#UserId").val() + "님 반갑습니다");
						location.reload();
					} else {
						alert("누구세요");
						location.href = "/login";
					}
				});
			}
		}
	</script>



</body>
</html>
