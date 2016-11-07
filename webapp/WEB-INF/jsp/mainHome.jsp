<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery Coverflow</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- jQuery/jQueryUI (hosted) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.js"></script>

<!-- Optional: Reflection -->
<script type="text/javascript"
	src="/static/plugins/coverflow/reflection.js"></script>

<!-- interpolate, depends on jQ 1.8.0+ -->
<script src="/static/plugins/coverflow/jquery.interpolate.min.js"></script>

<!-- Coverflow -->
<script src="/static/plugins/coverflow/jquery.coverflow.js"></script>
<link rel="stylesheet" href="/static/plugins/css/mainHome.css">
<style type="text/css">
.dream {
	position: fixed;
	bottom: 13%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 300%;
}


</style>

</head>
<body>
	<div class="photos" tabindex="-1">
		<div class="cover">
			<img class="reflected select-img" data-name="게시판 입니다"
				data-url="/board/list_oh"
				src="/static/image/to-do-list-icon-buy-this-icon-for--0-48-1.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="dash board입니다"
				data-url="/list2"
				src="/static/image/business-intelligence-dashboard-icon_75274.png">
		</div>
		
		<div class="cover">
			<img class="reflected select-img" data-name="Idea board입니다."
				data-url="/hyundo/board" src="/static/image/PurpleCircle.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="home입니다" data-url=""
				src="/static/image/main_img.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="ranking board입니다"
				data-url="/hyundo_rank" src="/static/image/Ranking_icon_m.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="user입니다"
				data-url="/user/create"
				src="/static/image/KakaoTalk_20161011_215624504.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="Q&A 입니다"
				data-url="/boardMain.do" src="/static/image/lion.png">
		</div>
	</div>
	<div id="photos-info">
		<div id="photos-name"></div>
	</div>
	<div class="dream">당신의 꿈을 평가해주겠어!!!</div>
	<script src="/static/plugins/js/mainHome.js"></script>

</body>
</html>