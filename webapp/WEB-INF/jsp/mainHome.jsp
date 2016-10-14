<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery Coverflow</title>
<meta name="viewport" content="width=device-width">
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

<style>
.photos {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 90%;
	outline-style: none;
}
.cover {
	width: 30%;
}
img {
	width: 100%;
}

#photos-info {
	display: none;
	position: absolute;
	width: 98%;
	text-align: center;
	text-shadow: 0 0 15px white;
	bottom: 25%;
	position: absolute;
}

#photos-name {
	font-size: 200%;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="photos" tabindex="-1">
		<div class="cover">
			<img class="reflected select-img" data-name="게시판입니다" data-url="/board/list1"
				src="/static/image/to-do-list-icon-buy-this-icon-for--0-48-1.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="dashboard입니다" data-url=""
				src="/static/image/business-intelligence-dashboard-icon_75274.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="home입니다" data-url=""
				src="/static/image/main_img.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="samsung입니다" data-url=""
				src="/static/image/logo-square-letter.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="LG입니다" data-url=""
				src="/static/image/d14c8c035b3c8f8d7c74085ce761c24e-lg.png">
		</div>
		<div class="cover">
			<img class="reflected select-img" data-name="user입니다" data-url=""
				src="/static/image/KakaoTalk_20161011_215624504.png">
		</div>
	</div>
	<div id="photos-info">
		<div id="photos-name"></div>
	</div>
	<script>
		$(function() {
			$("img").reflect();
			$('.photos').coverflow(
					{
						easing : 'easeOutElastic',
						duration : 'slow',
						index : 2,	//시작 이미지 넘버 0번 부터시작
						width : 320,
						height : 240,
						visible : 'density',
						selectedCss : {
							opacity : 1
						},
						outerCss : {
							opacity : .1
						},

						confirm : function() {
							console.log('Confirm');
						},

						change : function(event, cover, index) {
							$('#photos-name').text(
									$(cover).children().children('img').data(
											'name')
											|| 'unknown');

						},
						select:function(event, cover, index){
							$(cover).click(function(){
								location.href = $(cover).children().children('img').data('url');
							})
						}

					});

			$(".photos").hover(function() {
				$("body").animate({'background-color' : 'rgba(0,0,0,0.9)','outline-color' : 'black'}, 'slow');
				$("#photos-info").fadeIn();
			}, function() {
				$("body").animate({
					'background-color' : 'rgba(255,255,255,1)',
					'outline-color' : 'white'
				}, 'slow');
				$("#photos-info").fadeOut();
			});

			function csshover() {
				$("body").animate({
					'background-color' : rgba(0, 0, 0, 0.5)
				}, 'slow');
			}


		})
	</script>
</body>
</html>