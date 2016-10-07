<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%
	String myid = "648ac95412531a5ffeff344ff4f22b24";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>API Demo: Post link to KakaoStory - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<a id="kakao-login-btn"></a>
	<div>
		<p id="post-result"></p>
	</div>
	<script type='text/javascript'>
		//<![CDATA[
		// ����� ���� JavaScript Ű�� ������ �ּ���.
		Kakao.init('648ac95412531a5ffeff344ff4f22b24');
		Kakao.Auth
				.createLoginButton({
					container : '#kakao-login-btn',
					success : function() {
						// �α��� ������, API�� ȣ���մϴ�.
						Kakao.API
								.request({
									url : '/v1/api/story/linkinfo',
									data : {
										url : 'http://203.236.209.179:8180/kakao'
									}
								})
								.then(function(res) {
									// ���� API ȣ���� ������ ��� ���� API�� ȣ���մϴ�.
									return Kakao.API.request({
										url : '/v1/api/story/post/link',
										data : {
											link_info : res
										}
									});
								})
								.then(function(res) {
									return Kakao.API.request({
										url : '/v1/api/story/mystory',
										data : {
											id : res.id
										}
									});
								})
								.then(
										function(res) {
											document
													.getElementById('post-result').innerHTML = JSON
													.stringify(res);
										}, function(err) {
											alert(JSON.stringify(err));
										});
					},
					fail : function(err) {
						alert(JSON.stringify(err))
					}
				});
		//]]>
	</script>

</body>
</html>