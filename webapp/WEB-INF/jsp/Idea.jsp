<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="msapplication-tap-highlight" content="no" />
<title>idea 입니다.</title>
<link rel="stylesheet"
	href="/static/plugins/bootstrap/css/bootstrap.min.css">
<style type="text/css">
body {
	margin: 5%;
}

.main-con div {
	display: inline-block;
	width: 100%;
}

.main-con div div {
	width: 30%;
	transform: translateY(-100%);
}

.mybtn {
	position: fixed;
	left: 40%;
}

.inputbtn {
	position: fixed;
	left: 20%;
}
</style>
</head>
<body>
	<div class="main-con">
		<div>
			<div class="key-filde">private String userId;</div>
			<textarea class="value-filde-userid" cols="30%"> </textarea>
		</div>
		<div>
			<div class="key-filde">private String subject;</div>
			<textarea class="value-filde-subject" cols="30%"> </textarea>
		</div>
		<div>
			<div class="key-filde">private String content;</div>
			<textarea class="value-filde-content" cols="30%"> </textarea>
		</div>
		<div>
			<div class="key-filde">private String confirm;</div>
			<textarea class="value-filde-confirm" cols="30%"> </textarea>
		</div>
		<div>
			<div class="key-filde">private String date;</div>
			<textarea class="value-filde-date" cols="30%"> </textarea>
		</div>
		<div>
			<div class="key-filde">private int likeCount;</div>
			<textarea class="value-filde-likeCount" cols="30%"> </textarea>
		</div>
		<div>
			<button class="mybtn">버튼입니다</button>
			<button class="inputbtn">데이터받기</button>

		</div>


	</div>
	<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		var data = {}

		$(document).ready(function() {

			$(".mybtn").on("click", function() {
				data = {
					userId : $(".value-filde-userid").val(),
					subject : $(".value-filde-subject").val(),
					content : $(".value-filde-content").val(),
					confirm : $(".value-filde-confirm").val(),
					date : $(".value-filde-date").val(),
					likeCount : $(".value-filde-likeCount").val()
				}
				$.ajax({
					url : "/api/insertdata/",
					method : "POST",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : JSON.stringify(data)
				}).done(function(ideaVo) {
					alert(ideaVo);

				}).fail(function() {
					alert("사용자가 폭주하여 잠시 후 사용해주세요.");
				});
			})
			$(".inputbtn").on("click", function() {
				$.ajax({
					url : "/api/selectdata/",
					method: "GET",
		    		data: {
		    			pageNum:"1"
		    		}
				}).done(function(ideaVOs) {
					alert(ideaVOs[0].userId);

				}).fail(function() {
					alert("사용자가 폭주하여 잠시 후 사용해주세요.");
				});
			})
		})
	</script>


</body>
</html>