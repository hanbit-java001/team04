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
<link rel="stylesheet" href="/static/plugins/css/createUserAfter.css" />
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
		<input id ="file" type="file"class="input-file">
	</div>
	<!-- JavaScript includes -->

	<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script>
	<script
		src="/static/plugins/jquery.shuffleLetters/assets/js/jquery.shuffleLetters.js"></script>
	<script src="/static/plugins/js/createUser.js"></script>


</body>
</html>