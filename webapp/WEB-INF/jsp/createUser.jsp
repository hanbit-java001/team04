<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Shuffle Text Effect with jQuery | Tutorialzine Demo</title>

<!-- Our CSS stylesheet file -->
<link rel="stylesheet" href="/static/plugins/css/createUser.css" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300"
	type="text/css" />
<link rel="stylesheet"
	href="/static/plugins/font-awesome/css/font-awesome.min.css">
<style type="text/css">
.my-progress-container {
	margin-top: 5%;
}

.progress {
	border: 2px solid #a1a1a1;
	border-radius: 10px;
	background-color: #f5f5f5;
}

.mybar {
	border: none;
	border-radius: 10px;
	display: list-item;
	back
}

.barstateNum {
	display: inline-block;
}

.barstate {
	margin-top: 1%;
	text-align: center;
}

.afterState {
	border: 5px solid #9494b8;
	color: #e4e4e4;
	background-color: #9494b8;
	width: 15%;
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
	cursor: pointer;
}

.profile {
	width: 20vw;
	height: 20vw;
	top: 29%;
	left: 73%;
	transform: translate(-50%, -50%);
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
	font-size: 200%;
	transform:translateX(-5%);
	text-align: center;
	cursor: pointer;
}
.profile input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
</style>
</head>

<body>

	<div id="container">

		<div class="userId"></div>
		<div class="userName"></div>
		<div class="userPassword"></div>
		<div class="userAge"></div>

		Create your account!!
	</div>
	<div class="textMsg"></div>
	<input type="text" id="userText" />

	<div class="my-progress-container">
		<div class="progress">
			<div class="mybar" style="width: 0%; background-color: #ff3333">
			</div>
		</div>
		<div class="barstate">
			lording
			<div class="barstateNum">0</div>
			%
		</div>
	</div>
	<div class="profile" id="dropbox">
		<div class="profile-img"></div>
		<div class="profile-img-text">
			<i class="fa fa-plus" aria-hidden="true"></i>profile image
		</div>
		<input type="file"class="input-file">
	</div>
	<!-- JavaScript includes -->

	<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script>
	<script
		src="/static/plugins/jquery.shuffleLetters/assets/js/jquery.shuffleLetters.js"></script>
	<script src="/static/plugins/js/createUser.js"></script>


</body>
</html>