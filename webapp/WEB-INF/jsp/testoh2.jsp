<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="/static/plugins/3d-curtain-template/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="/static/plugins/3d-curtain-template/css/style.css"> <!-- Resource style -->
	<script src="/static/plugins/3d-curtain-template/js/modernizr.js"></script> <!-- Modernizr -->
<style type="text/css">

</style>
	<title>3D Curtain Template | Codyhouse</title>
</head>
<body>
	test  중입니다.
	<div> 뭐라고 쓸까</div>
<script src="/static/plugins/3d-curtain-template/js/jquery-2.1.1.js"></script>
<script src="/static/plugins/3d-curtain-template/js/main.js"></script> <!-- Resource jQuery -->
<script type="text/javascript">
$(document).ready(function(){
	var sheet = document.createElement('style')
	sheet.innerHTML = "div {border: 2px solid black; background-color: red;}";
	document.body.appendChild(sheet);
	$("body").append("<div> 뭐라고 쓸까2</div>");

})
</script>

</body>
</html>