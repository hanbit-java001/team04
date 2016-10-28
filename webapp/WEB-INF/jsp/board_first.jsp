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
<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
<!-- Resource style -->
<link rel="stylesheet" href="/static/plugins/css/board_first.css">

<script src="/static/plugins/rounded-ani/js/modernizr.js"></script>
<!-- Modernizr -->
<style type="text/css">
.addContent{
position: fixed;
top: 18px;
  right: 11%;
  height: 44px;
  width: 44px;
  font-size: 100%;
  cursor: pointer;
  background-color: #091d23;
  border-radius: 50%;
/*   z-index: 5; */
/*   /* image replacement */ */
/*   overflow: hidden; */
/*   text-indent: 100%; */
/*   white-space: nowrap; */

}
.addDiv{
position: absolute;
    left: 50%;
    top: 50%;
    bottom: auto;
    right: auto;
    display: inline-block;
    background-color: #ffffff;
    z-index: 10;
    transform: translateX(-50%) translateY(-50%);
}
.plus1{
	width: 20px;
	height: 5px;
}
.plus2{
	width: 5px;
	height: 20px;

}
.addContent img{
height: 100%;
width: 100%;
}
.like-font{
  text-align: center;
  background-color: #87c057;
  font-family: Lato, sans-serif;
  font-weight: 100;
  font-size: 20px;
}
.add-list{
position: fixed;
width: 50%;
height: 50%;
text-align: center;
background-color: #001F3F;
color: white;
z-index: 50;
top: 20%;
margin-left: 25%;
margin-right: 25%;
display: none;
padding-top: 2%;
}
.rotate {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
    -moz-transform: rotate(-45deg);
    -o-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
    transform: rotate(-45deg);
    /*transform: rotate(180deg);*/
    transition: .3s;
    background-color: #ffb441;
}
.rotate-reset {
    transform: rotate(0deg);
    -webkit-transform: rotate( 0deg);
    -moz-transform: rotate( 0deg);
    -o-transform: rotate( 0deg);
    -ms-transform: rotate( 0deg);
    transform: rotate( 0deg);
    transition: .3s;
}
input[type=text] {
display: inline-block;
    border-bottom: 2px solid white;

    -webkit-box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    -moz-box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    padding: 15px;
    background: #001f3f;
    margin: 0 5% 10px 5%;

    width: 60%;
    right: 0%;
}
input[type=text]:focus {
background: rgba(255,255,255,0.8);
    border: 3px solid #555;
}
input[type=button]{
	border: 5px solid white;
    -webkit-box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    -moz-box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    box-shadow:
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1);
    padding: 15px;
    background: rgba(255,255,255,0.5);
    margin: 0 5% 10px 5%;
    width: 25%;
	bottom: 5%;
	margin-right: auto;
	position: absolute;
}
.add-list label{
display: inline-block;
width: 25%;
margin-left: 4%;
}
#dropbox {
    width: 35%;
    height: 40%;
    border: 1px solid gray;
    border-radius: 5px;
    padding: 5px;
    color: gray;
    margin-top:3%;
    margin-left: 10%;
}
select {
    width: 85%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
    margin-left: 10%;
	font-size: 24px;
}
.detail-view{
 position:fixed;
 width: 50%;
 height: 100%;
 left: 0%;
 top:0%;
 background-color: red;
/*   display: none; */
 z-index: 100;

/* position: fixed; */
/* width: 50%; */
/* height: 50%; */
/* text-align: center; */
/* background-color: #001F3F; */
/* color: white; */
/* z-index: 500; */
/* top: 20%; */
/* margin-left: 25%; */
/* margin-right: 25%; */
/* /* display: none; */ */
/* padding-top: 2%; */
}


</style>
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
		<i class="fa fa-arrow-right" aria-hidden="true" text="right"></i>
	</div>
	<!-- cd-overlay-content -->
	<div class ="addContent"><div class="addDiv plus1"></div><div class="addDiv plus2"></div></div>
	<div class="add-list like-font"><form action="#">

    <label for="title">title</label>
    <input type="text" id="title" >

    <label for="content">content</label>
    <input type="text" id="content" >
 <select name="age" id="age">
    <option value="10">10대</option>
    <option value="20">20대</option>
    <option value="30">30대</option>
    <option value="40">40대</option>
    <option value="50">50대</option>
  </select>



  </form><div id="dropbox">Drag and drop a file here...</div>
    <input type="button" value="글쓰기" class="createContent">
  </div>
<div class="detail-view"></div>
	<a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>
	<script src="/static/plugins/rounded-ani/js/jquery-2.1.1.js"></script>
	<script src="/static/plugins/js/board_first.js"></script>
	<script src="/static/plugins/rounded-ani/js/velocity.min.js"></script>
	<script src="/static/plugins/rounded-ani/js/main.js"></script>
	<!-- Resource jQuery -->
	<script src="/static/plugins/3d-curtain-template/js/main.js"></script>
	<script type="text/javascript">
	var imgfile=null;
		$(".addContent").on("click",function(){
			 $.ajax({
					url: "/api/check/admin",
					method: "GET"
				}).done(function(result) {

					console.log( + "님 환영합니다.");
					if(result){
					if($(this).hasClass("rotate")){
						$(this).removeClass("rotate");
						$(this).addClass("rotate-reset");
						$(".add-list").fadeOut("slow");
						$("#title").val("");
						$("#content").val("");
						$("#age").val($("#age option:first").val());
						$("#dropbox").html("Drag and drop a file here...");
						imgfile=null;

					}else{
						$(this).removeClass("rotate-reset");
						$(this).addClass("rotate");
						$(".add-list").fadeIn("slow");
						dropBoxMaker();
					}}else{
						alert("글작성은 관리자만 가능합니다.");
						$(".addContent").fadeOut();
					}
				});

		})
		$(".createContent").on("click",function(){
			upload(imgfile)

			})
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
    $("#dropbox").text("Uploading " + imgfile[0].name);
console.log("img file name "+imgfile[0].name);

}

function upload(myFile) {
    var data = new FormData();
    data.append("title", $("#title").val());
	data.append("contents", $("#content").val());
	data.append("age",$("#age").val());
	console.log("age : "+$("#age").val());
	if(myFile!=null){
	for (var i=0;i<myFile.length;i++) {
		data.append("Contents_img", myFile[i]);
		var progress = Math.round(i / myFile.length * 100);
		$("#dropbox").html("Progress " + progress + "%");
	}}
    $.ajax({
		url: "/api/board/add",
		method: "POST",
		data: data,
		contentType: false,
		dataType: "json",
		processData: false
	}).done(function(result) {

		console.log( + "님 환영합니다.");
		$("#dropbox").html("Complete");
		setTimeout(function(){ $(".addContent").click(); }, 1000);

	});
}

function uploadProgress(event) {
    // Note: doesn't work with async=false.
    var progress = Math.round(event.loaded / event.total * 100);
    document.getElementById("status").innerHTML = "Progress " + progress + "%";
}

function uploadComplete(event) {
    document.getElementById("status").innerHTML = event.target.responseText;
}

		// 	$(document).ready(function(){
		// 		setTimeout(function(){
		// 			 $('body,html').animate({scrollTop: $(".is-visible").next().position().top}, 800);
		// 		}, 1000);
		// 	})
	</script>
</body>
</html>