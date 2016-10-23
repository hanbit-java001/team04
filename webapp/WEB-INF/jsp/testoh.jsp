<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">


</style>
<title>Rounded Animated Navigation | CodyHouse</title>
</head>
<body>
<form action=""><input class="mytext" type="text" style="width: 200px"/>

<button class="mybutton" type="button">button</button>
</form>
</body>
<script src='/static/plugins/jquery/jquery-3.1.0.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".mytext").focusOut(
		function(){
			console.log("focusout");
		}
	})
	$(".mybutton").on("click",function(){
		console.log("click");
	})
})


</script>
</html>