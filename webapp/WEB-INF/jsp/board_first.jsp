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

    width: 60%;
    right: 0%;
}
input[type=text]:focus {
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

    width: 30%;
}
.add-list label{
display: inline-block;
width: 25%;
margin-left: 4%;
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

    <label for="mname">First Name</label>
    <input type="text" id="lname" name="firstname">

    <label for="nname">Last Name</label>
    <input type="text" id="nname" name="lastname">

    <input type="button" value="Submit">
  </form> </div>

	<a href="#0" class="cd-nav-trigger">Menu<span class="cd-icon"></span></a>
	<script src="/static/plugins/rounded-ani/js/jquery-2.1.1.js"></script>
	<script src="/static/plugins/js/board_first.js"></script>
	<script src="/static/plugins/rounded-ani/js/velocity.min.js"></script>
	<script src="/static/plugins/rounded-ani/js/main.js"></script>
	<!-- Resource jQuery -->
	<script src="/static/plugins/3d-curtain-template/js/main.js"></script>
	<script type="text/javascript">
		$(".addContent").on("click",function(){
			if($(this).hasClass("rotate")){
				$(this).removeClass("rotate");
				$(this).addClass("rotate-reset");
				$(".add-list").fadeOut("slow");

			}else{
				$(this).removeClass("rotate-reset");
				$(this).addClass("rotate");
				$(".add-list").fadeIn("slow");
			}
		})

		// 	$(document).ready(function(){
		// 		setTimeout(function(){
		// 			 $('body,html').animate({scrollTop: $(".is-visible").next().position().top}, 800);
		// 		}, 1000);
		// 	})
	</script>
</body>
</html>