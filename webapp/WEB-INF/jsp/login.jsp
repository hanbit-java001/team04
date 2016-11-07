<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

.profile {
	width: 20vw;
	height: 20vw;
	top: 50%;
	left: 15%;
	transform: translate(-50%, -50%);
	z-index: -1;
	position: fixed;
	display: none;
}

.profile-img {
	width: 80%;
	height: 80%;
	background-size: cover;
	border: 2px solid;
	border-radius: 50%;
	padding: 1vw;
}

.profile-img-text {
	text-align: center;
}

.add-profile {
	cursor: pointer;
	position: absolute;
	right: 120px;
	display: inline;
	color: #ffffff;
	font-size: 40px;
	font-weight: 400;
}
/* .add-profile .add-tooltip:before { */
/*   bottom: -20px; */
/*   content: " "; */
/*   display: block; */
/*   height: 20px; */
/*   left: 0; */
/*   position: absolute; */
/*   width: 100%; */
/* } */

/* CSS Triangles - see Trevor's post */
/* .add-profile .add-tooltip:after { */
/* 	border-left: solid transparent 10px; */
/* 	border-right: solid transparent 10px; */
/* 	border-top: solid #1496bb 10px; */
/* 	bottom: -10px; */
/* 	content: " "; */
/* 	height: 0; */
/* 	left: 50%; */
/* 	margin-left: -13px; */
/* 	position: absolute; */
/* 	width: 0; */
/* } */
.add-tooltip {
	background: #1496bb;
	bottom: 100%;
	color: #fff;
	display: block;
	left: -64px;
	margin-bottom: 15px;
	opacity: 0;
	padding: 15px;
	pointer-events: none;
	position: absolute;
	width: 100%;
	font-size: 15px;
	-webkit-transform: translateY(10px);
	-moz-transform: translateY(10px);
	-ms-transform: translateY(10px);
	-o-transform: translateY(10px);
	transform: translateY(10px);
	-webkit-transition: all .25s ease-out;
	-moz-transition: all .25s ease-out;
	-ms-transition: all .25s ease-out;
	-o-transition: all .25s ease-out;
	transition: all .25s ease-out;
	-webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
	-moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
	-ms-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
	-o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
	box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
	-webkit-transform: translateY(10px);
}

.filebox label {
	display: inline-block;
	padding: 1%;
	color: #999;
	font-size: 90%;
	/*   line-height: normal; */
	/*   vertical-align: middle; */
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	top: 0;
	margin-top: 10px;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.return-home {
	display: inline-block;
}
</style>
</head>

<body>
	<div class="rerun">
		<a href="">Rerun Pen</a>
		<!-- 		<div class="return-home" onclick="window.history.back()"}><a >Home</a></div> -->
		<div class="return-home">
			<a href="/Home">Home</a>
		</div>
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
				<div class="filebox">
					<label for="ex_file" class="add-profile" id="dropbox">업로드</label>
					<div class="add-tooltip">Add profile img</div>
					<input type="file" id="ex_file">
				</div>
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
				<div class="profile">
					<div class="profile-img"></div>
					<div class="profile-img-text"></div>
				</div>
			</form>
		</div>
	</div>

	<script src='/static/plugins/jquery/jquery-3.1.0.min.js'></script>


	<script type="text/javascript">
		function init() {
			console.log("check navigator.userAgent" + navigator.userAgent);
			console.log("check jquery" + $.browser);
			// 			console.log("back check : "+window.history.back());
			if ($(window).width() <= 500) {
				$("body").css({
// 					"background-color" : "red",
					"overflow" : "hidden"
				});
				$(".alt").css({
					"right" : "15px"
				})
				$(".rerun").css({
					"position" : "fixed",
					"top" : "63%",
					"right" : "33%",
					"text-align" : "center",
					"z-index" : "1"
				})
				$(".close").css({
					"right" : "28px"
				})
				$(".add-profile").css({
					"right" : "74px",
					"font-size" : "72%"
				})
				$(".title").css({
					"transform" : "translateY(-50%)",
					"margin": "0 0 5px"
				});
				$(".backend-form").css({
					"transform" : "translateY(-10%)"
				});
				$("#CreateUserId").next().css({
					"width" : "100%"
				})
				$(".backend-form .input-container").css({
					"margin" : "0px 25px 15px 40px"
				})
				$(".front-form .input-container").css({
					"margin" : "0 45px 40px"
				})
				$(".backend-form .title").css({
					"padding" : "10px 0 10px 40px"
				})
				$(".add-profile").text("UP");
				$(".profile").css({
					"left" : "84%",
					"top" : "4%"
				})
				$(".profile-img-text").css({
					"font-size" : "10px",
					"position" : "absolute",
					"width" : "200%",
					"left" : "50%",
					"transform" : "translateX(-50%)"
				})
				$(".footer").css({
					"margin" : "20px 0 0"
				})
				$(".card.alt .toggle").css({
					"width" : "100px",
					"height" : "100px",
					"left" : "15%",
					"line-height" : "100px"
				})

			} else {
				$("body").css("background-color", "#FFFFFF");
			}
		}
		init();
		var imgfile = null;
		var userTextMsg = [ "아이디는 이메일 형태로 작성해주세요", "비밀번호는 숫자 1개 + 7글자 이상",
				"이름은 한글또는 영어만", "나이는 숫자로" ];
		var createState = [ "fail", "fail", "fail", "fail", "fail" ];
		$('.toggle').on('click', function() {
			$('.container').stop().addClass('active');
		});

		$('.close').on('click', function() {
			$('.container').stop().removeClass('active');
			$(".profile").fadeOut();
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
				"click",
				function() {
					console.log("check start");
					if (($("#CreateUserId").val().trim() != "")
							&& ($("#CreatePassword").val().trim() != "")
							&& ($("#CreateAge").val().trim() != "")
							&& ($("#CreateUserName").val().trim() != "")) {

						var data = new FormData();
						data.append("userId", $("#CreateUserId").val());
						data.append("password", $("#CreatePassword").val());
						data.append("age", $("#CreateAge").val());
						data.append("name", $("#CreateUserName").val());
						console.log("age : " + $("#CreateUserName").val());
						if (imgfile != null) {
							for (var i = 0; i < imgfile.length; i++) {
								data.append("Contents_img", imgfile[i]);
							}
						}
						$.ajax({
							url : "/api/Create/user",
							method : "POST",
							data : data,
							contentType : false,
							dataType : "json",
							processData : false
						}).done(function(result) {

							console.log(result + "님 환영합니다.");
							$("#dropbox").html("Complete");
							setTimeout(function() {
								$(".close").click();
							}, 1000);

						});
					}
				})

		$("#ex_file").change(
				function(event) {
					imgfile = event.target.files;
					console.log("click event check");
					var file = imgfile[0];
					var reader = new FileReader();
					reader.onloadend = function() {
						$('.profile-img').css('background-image',
								'url("' + reader.result + '")');
					}
					if (file) {
						reader.readAsDataURL(file);
					} else {
					}
					if ($(window).width() <= 500) {
						$(".profile-img-text").text(imgfile[0].name);
					} else {
						$(".profile-img-text").text(
								"Uploading " + imgfile[0].name);
					}
					$(".profile").fadeIn();
				});
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
		$(".backend-form div input").one(
				"mousedown",
				function() {
					if ($(this).attr("id") == "CreatePassword") {
						changeText(this, "17px");
					} else {
						if ($(window).width() <= 500
								&& $(this).attr("id") == "CreateUserId") {
							changeText(this, "15px");
						} else {
							changeText(this, "20px");
						}

					}

				}).on(
				"focusout",
				function() {
					if ($(this).attr("id") == "CreateUserId"
							&& validateEmail($(this).val())
							&& createState[0] == "fail") {
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
								$(".backend button").attr("disabled", "true");
							} else {
								seccesOrfail(this, "success", "#ffffff");
								createState[4] = "success";
								$(".backend button").attr("disabled", "false");
							}
						});
					} else if ($(this).attr("id") == "CreatePassword"
							&& validatePassword($(this).val())
							&& createState[1] == "fail") {
						seccesOrfail(this, "success", "#ffffff");
					} else if ($(this).attr("id") == "CreateUserName"
							&& validateName($(this).val())
							&& createState[2] == "fail") {
						seccesOrfail(this, "success", "#ffffff");
					} else if ($(this).attr("id") == "CreateAge"
							&& validateAge($(this).val())
							&& createState[3] == "fail") {
						seccesOrfail(this, "success", "#ffffff");
					} else {
						seccesOrfail(this, "fail", "#660066");
					}

					console.log(createState);

				})
		// 		$("#CreateAge").bind("keypress", function(e) {
		// 			if (e.keyCode == 13) {
		// 				$(".backend button").click();
		// 				console.log("check but click");
		// 			}
		// 			if(createState[0]=="success"&&createState[1]=="success"&&createState[2]=="success"&&validateAge($(this).val())){
		// 				$(".backend button").attr("type", "button");
		// 				console.log("check createAge");
		// 			}
		// 		});

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
					if (createState[0] == "success"
							&& createState[1] == "success"
							&& createState[2] == "success"
							&& validateAge($(this).val())) {
						$(".backend button").attr("type", "button");
						console.log("check createAge");
					}
					if ($(this).attr("id") == "CreateAge") {
						if (e.keyCode == 13) {
							$(".backend >button").click();
							console.log("check but click");
						}
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
		dropBoxMaker();
		function dropBoxMaker() {
			var dropbox = document.getElementById("dropbox");
			dropbox.addEventListener("dragenter", noop, false);
			dropbox.addEventListener("dragexit", noop, false);
			dropbox.addEventListener("dragover", noop, false);
			dropbox.addEventListener("drop", dropUpload, false);
		}

		function noop(event) {
			event.stopPropagation();
			event.preventDefault();
		}

		function dropUpload(event) {
			noop(event);
			imgfile = event.dataTransfer.files;
			console.log(imgfile[0].name);

			var file = imgfile[0];
			var reader = new FileReader();
			reader.onloadend = function() {
				$('.profile-img').css('background-image',
						'url("' + reader.result + '")');
			}
			if (file) {
				reader.readAsDataURL(file);
			} else {
			}
			if ($(window).width() <= 500) {
				$(".profile-img-text").text(imgfile[0].name);
			} else {
				$(".profile-img-text").text("Uploading " + imgfile[0].name);
			}
			$(".profile").fadeIn();

		}

		function uploadProgress(event) {
			// Note: doesn't work with async=false.
			var progress = Math.round(event.loaded / event.total * 100);
			document.getElementById("status").innerHTML = "Progress "
					+ progress + "%";
		}

		function uploadComplete(event) {
			document.getElementById("status").innerHTML = event.target.responseText;
		}
	</script>



</body>
</html>
