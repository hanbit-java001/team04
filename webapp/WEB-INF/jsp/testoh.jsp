<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="/static/plugins/rounded-ani/css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="/static/plugins/rounded-ani/css/style.css">
<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
<!-- css font -->
<link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" rel="stylesheet" type="text/css">
<!-- Resource style -->
<style type="text/css">
html {
	font-size: 62.5%;
}

body::before {
	/* never visible - this is used in jQuery to check the current MQ */
	content: 'mobile';
	display: none;
}

@media only screen and (min-width: 1170px) {
	body::before {
		/* never visible - this is used in jQuery to check the current MQ */
		content: 'desktop';
	}
}

@media only screen and (min-width: 1170px) {
	.cd-section {
		height: 100vh;
	}
}

.cd-section h1 {
	position: relative;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	font-size: 2.6rem;
}

@media only screen and (min-width: 768px) {
	.cd-section h1 {
		font-size: 3.2rem;
	}
}

@media only screen and (min-width: 1170px) {
	.cd-section h1 {
		font-size: 4.2rem;
	}
}

.cd-block, .cd-half-block {
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.cd-block {
	-webkit-transform-origin: center center;
	-moz-transform-origin: center center;
	-ms-transform-origin: center center;
	-o-transform-origin: center center;
	transform-origin: center center;
}

.cd-section:first-of-type .cd-block {
	visibility: visible;
	height: 100vh;
	background-color: #263b40;
}

@media only screen and (min-width: 1170px) {
	.cd-block {
		position: fixed;
		width: 100%;
		min-height: 100vh;
		top: 0;
		left: 0;
		height: 100vh;
		box-shadow: 0 0 40px rgba(0, 0, 0, 0.7);
		visibility: hidden;
	}
	.cd-section:first-of-type .cd-block {
		visibility: visible;
	}
	.cd-block>* {
		visibility: visible;
	}
}

.cd-half-block {
	background: #ffffff;
	color: #263b40;
}

.cd-half-block:nth-of-type(1) {
	height: 60vh;
	background-color: #263b40;
	background-position: center center;
	background-repeat: no-repeat;
}

.cd-half-block:nth-of-type(2) {
	padding: 4em 10%;
}

.cd-half-block p {
	font-size: 1.8rem;
	line-height: 1.8;
}

.cd-section:nth-of-type(1) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-1.jpg");
	background-size: cover;
}
.cd-section:nth-of-type(2) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-1.jpg");
	background-size: cover;
}

.cd-section:nth-of-type(3) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-2.jpg");
	background-size: cover;
}

.cd-section:nth-of-type(4) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-3.jpg");
	background-size: cover;
}

.cd-section:nth-of-type(5) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-3.jpg");
	background-size: cover;
}
.cd-section:nth-of-type(6) .cd-half-block:first-of-type {
	background-image:
		url("/static/plugins/3d-curtain-template/img/img-3.jpg");
	background-size: cover;
}

@media only screen and (min-width: 1170px) {
	.cd-half-block {
		height: 100vh !important;
		width: 50%;
		position: absolute;
		top: 0;
	}
	.cd-half-block p {
		position: absolute;
		left: 50%;
		top: 50%;
		bottom: auto;
		right: auto;
		-webkit-transform: translateX(-50%) translateY(-50%);
		-moz-transform: translateX(-50%) translateY(-50%);
		-ms-transform: translateX(-50%) translateY(-50%);
		-o-transform: translateX(-50%) translateY(-50%);
		transform: translateX(-50%) translateY(-50%);
		width: 100%;
		padding: 0 30%;
		font-size: 2.4rem;
	}
	.cd-section:nth-of-type(even) .cd-half-block:first-of-type, .cd-section:nth-of-type(odd) .cd-half-block:nth-of-type(2)
		{
		left: 0;
		-webkit-transform: translateX(-100%);
		-moz-transform: translateX(-100%);
		-ms-transform: translateX(-100%);
		-o-transform: translateX(-100%);
		transform: translateX(-100%);
	}
	.cd-section:nth-of-type(odd) .cd-half-block:first-of-type, .cd-section:nth-of-type(even) .cd-half-block:nth-of-type(2)
		{
		right: 0;
		-webkit-transform: translateX(100%);
		-moz-transform: translateX(100%);
		-ms-transform: translateX(100%);
		-o-transform: translateX(100%);
		transform: translateX(100%);
	}
}

.cd-vertical-nav {
	position: fixed;
	z-index: 1;
	right: 3%;
	top: 50%;
	bottom: auto;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	display: none;
}

.cd-vertical-nav a {
	display: block;
	height: 40px;
	width: 40px;
	/* image replace */
	overflow: hidden;
	text-indent: 100%;
	white-space: nowrap;
	background: transparent
		url(/static/plugins/3d-curtain-template/img/cd-icon-arrow.svg)
		no-repeat center center;
	-webkit-transition: opacity 0.2s 0s, visibility 0.2s 0s;
	-moz-transition: opacity 0.2s 0s, visibility 0.2s 0s;
	transition: opacity 0.2s 0s, visibility 0.2s 0s;
}

.cd-vertical-nav a.cd-prev {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg);
	margin-bottom: 10px;
}

.cd-vertical-nav a.inactive {
	visibility: hidden;
	opacity: 0;
	-webkit-transition: opacity 0.2s 0s, visibility 0s 0.2s;
	-moz-transition: opacity 0.2s 0s, visibility 0s 0.2s;
	transition: opacity 0.2s 0s, visibility 0s 0.2s;
}

@media only screen and (min-width: 1170px) {
	.cd-vertical-nav {
		display: block;
	}
}

.page-number {
	position: fixed;
	bottom: 10%;
	width: 30%;
	height: 5%;
	z-index: 5;
	margin-left: 35%;
	margin-right: 35%;
}

.page-number div {
	display: inline-block;
	width: 14%;
	float:left;
	height: 100%;
	text-align: center;
	border: 2px solid rgba(256, 256, 256, 0.3);
	font-size: 40px;
	background-color: rgba(0, 0, 0, 0.3);
	color: white;
	border-radius: 10px;
}
.page-number div:first-of-type{
margin-left: 14%;
}
.page-number i {
	display: inline-block;
	width: 11%;
	height: 100%;
	text-align: center;
	font-size: 40px;
	transform: translateY(-10%);
	text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
}
.fa-arrow-left{
position: absolute;
left:0px;
}
.fa-arrow-right{
position : absolute;
right: 0px;
}
.table-container:nth-child(even){
    -webkit-transform: rotate(5deg);
	-moz-transform: rotate(5deg);
	-ms-transform: rotate(5deg);
	-o-transform: rotate(5deg);
	transform: rotate(5deg);
}
.table-container:nth-child(odd){
    -webkit-transform: rotate(-5deg);
	-moz-transform: rotate(-5deg);
	-ms-transform: rotate(-5deg);
	-o-transform: rotate(-5deg);
	transform: rotate(-5deg);
}
.table-container{
width:80%;
height:30%;
background-color: #fff780;
 border: 2px solid rgba(0, 0, 0, 0.3);
 margin-left: auto;
 margin-right: auto;
}
.round-clip{
width: 20px;
height: 20px;
margin-left:auto;
margin-right:auto;
background-color: red;
box-shadow: 4px 4px 2px #888888;
border-radius: 10px;

}
.table-container ul li{
font-size: 40px;
font-family:"Reenie Beanie",arial,sans-serif;
padding-left: 7%;
}
.table-container:hover,.table-container:focus{
  -moz-box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);
  box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -webkit-transform: scale(1.25);
  -moz-transform: scale(1.25);
  -o-transform: scale(1.25);
  position:relative;
  z-index:5;
}
</style>
<script src="/static/plugins/rounded-ani/js/modernizr.js"></script>
<!-- Modernizr -->

<title>Rounded Animated Navigation | CodyHouse</title>
</head>
<body>
	<header>
		<a class="cd-logo" href="#0"><img src="/static/image/cd-logo.svg"
			alt="Logo"></a>
	</header>

	<nav>
		<ul class="cd-primary-nav">
			<li><a href="#0">The team</a></li>
			<li><a href="#0">Our services</a></li>
			<li><a href="#0">Our projects</a></li>
			<li><a href="#0">Start a project</a></li>
			<li><a href="#0">Join In</a></li>
			<li><a href="#0">Create an account</a></li>
		</ul>
	</nav>

	<main class="cd-content"> <!-- your content here -->
	<section class="cd-section">
		<div class="cd-block cd-intro">
			<h1>page start</h1>
		</div>
	</section>
	<!-- .cd-section -->

	<section class="cd-section">
		<div class="cd-block">
			<div class="cd-half-block"></div>
			<div class="cd-half-block">
				<div class="table-container">
				<div class="round-clip"></div>
					<ul>
						<li>title</li>
						<li>content</li>
						<li>writer</li>
						<li>date</li>
					</ul>
				</div>

			</div>
		</div>
	</section>
	<!-- .cd-section -->

	<section class="cd-section">
		<div class="cd-block">
			<div class="cd-half-block"></div>

			<div class="cd-half-block">
				<p>page#2</p>
			</div>
		</div>
	</section>
	<!-- .cd-section -->

	<section class="cd-section">
		<div class="cd-block">
			<div class="cd-half-block"></div>

			<div class="cd-half-block">
				<p>page#3</p>
			</div>
		</div>
	</section>
	<!-- .cd-section -->
	<section class="cd-section">
		<div class="cd-block">
			<div class="cd-half-block"></div>

			<div class="cd-half-block">
				<p>page#4</p>
			</div>
		</div>
	</section>
	<!-- .cd-section -->

	<nav class="cd-nav">
		<ul class="cd-vertical-nav">
			<li><a href="#0" class="cd-prev inactive">Next</a></li>
			<li><a href="#0" class="cd-next">Prev</a></li>
		</ul>
	</nav>
	<!-- .cd-vertical-nav --> </main>
	<!-- cd-content -->

	<div class="cd-overlay-nav">
		<span></span>
	</div>
	<!-- cd-overlay-nav -->

	<div class="cd-overlay-content">
		<span></span>
	</div>
	<div class="page-number">
		<i class="fa fa-arrow-left" aria-hidden="true" text="left"></i>
		<div>1</div>
		<div>2</div>
		<div>3</div>
		<div>4</div>
		<div>5</div>
		<i class="fa fa-arrow-right" aria-hidden="true" text="right"></i>
	</div>
	<!-- cd-overlay-content -->

	<a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>
	<script src="/static/plugins/rounded-ani/js/jquery-2.1.1.js"></script>

	<script type="text/javascript">
		var defaultPageNum = 1;
		var totalPage;
		var currentPage=defaultPageNum;
		var PageInNum=defaultPageNum;


		$(document).ready(function() {
// 			$(".cd-section:nth-child(even)").remove();
			listLord(defaultPageNum);

			$(".fa").on('click', function() {
				if ($(this).attr("text") == "left") {
					prev();
				} else {
					next();
				}
				clickbtn();
			})
			function clickbtn(){
				$(".page-number div").on('click', function() {
					console.log($(this).text());
					$(".cd-section").remove();
					listLord($(this).text());
				})
			}

			function prev() {
				if ($(".fa").next().text() == 1) {
					location.href = "/mytestoh";
				} else {
					PageInNum-=5;
					//여기 확인
					pageNumCreate(PageInNum-1);
				}
			}
			function next() {
				if (($(".page-number div").last().text())%5 == 0&&totalPage>$(".page-number div").last().text()*15) {
					PageInNum+=5;
					pageNumCreate(PageInNum-1);
					console.log("다음 번호 생성");
				} else {
					console.log("더이상 갈곳이 없어  "+($(".page-number div").last().text())%5);
				}
			}
			function pageNumCreate(pageNum){
				$(".page-number div").remove();

				var innerhtml="";
			for(var i=(pageNum-pageNum%5)+1;(i<pageNum-pageNum%5+6)&&(i<=totalPage/12+1);i++){
				innerhtml+="<div>"+i+"</div>";
			}
			console.log("check html : "+innerhtml);
			console.log($(".page-number").html());
				$(innerhtml).insertBefore(".fa-arrow-right");
			}
			function listLord(pageNum) {
				currentPage=pageNum;

				$.ajax({
					url : "/data/list" + pageNum
				}).done(function(myresult) {
// 					console.log(myresult);
					var result= myresult.list;
					totalPage=myresult.totoalPage;
					var appendhtml="";
					if(pageNum==1){
					$(".cd-section:not(:nth-child(1))").remove();}
					for(var i=0;i<result.length;i++){
						if(i%3==0){
						appendhtml += "<section class='cd-section'>"+
						"<div class='cd-block'>"+
							"<div class='cd-half-block'></div>"+
							"<div class='cd-half-block'>";}
						appendhtml+= "<div class='table-container'>"+
								"<div class='round-clip'></div>"+
									"<ul>"+
										"<li>"+result[i].SUB+"</li>"+
										"<li>"+result[i].CON+"</li>"+
										"<li>"+result[i].ID+"</li>"+
										"<li>"+result[i].REG+"</li>"+
									"</ul>"+
								"</div>";

							if(i%3==2){
								appendhtml+="</div>"+
								"</div>"+
					"</section>";}
					}
// 					console.log(appendhtml);
						$(appendhtml).insertBefore(".cd-nav");

						pageNumCreate(currentPage-1);
						clickbtn();
						$(".cd-section").first().addClass('is-visible');
						$('body,html').animate({scrollTop: $(".is-visible").position().top}, 1000);
				});
			}

		})
	</script>

	<script src="/static/plugins/rounded-ani/js/velocity.min.js"></script>
	<script src="/static/plugins/rounded-ani/js/main.js"></script>
	<!-- Resource jQuery -->
	<script src="/static/plugins/3d-curtain-template/js/main.js"></script>
	<script type="text/javascript">
		// 	$(document).ready(function(){
		// 		setTimeout(function(){
		// 			 $('body,html').animate({scrollTop: $(".is-visible").next().position().top}, 800);
		// 		}, 1000);
		// 	})
	</script>
</body>
</html>