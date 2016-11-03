<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 	 Kakao.init('648ac95412531a5ffeff344ff4f22b24'); -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>API Demo: Post photo to KakaoStory  - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<style type='text/css'>
  /* <![CDATA[ */
    #file-input-wrapper {
    	display: none;
    	margin-top: 50px;
    }
  /* ]]> */
</style>
<a id="kakao-login-btn"></a>
<div id="file-input-wrapper">
<p>Post image to KakaoStory:</p>
<input id="file-input" type="file" multiple=""/>
</div>
<div>
<p id="post-result"></p>
<img id="post-image" src=""/>
</div>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('648ac95412531a5ffeff344ff4f22b24');
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function() {
        document.getElementById('file-input-wrapper').style.display = "block";
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      }
    });
    document.getElementById('file-input').onchange = function (event) {
      Kakao.Auth.getStatus(function(statusObj) {
        if (statusObj.status == "not_connected") {
          alert('You should log in first.');
        } else {
          // API를 호출합니다.
          Kakao.API.request({
            url: '/v1/api/story/upload/multi',
            files: event.target.files
          }).then(function (res) {
            // 이전 API 호출이 성공한 경우 다음 API를 호출합니다.
            return Kakao.API.request({
              url: '/v1/api/story/post/photo',
              data: {
                image_url_list: res
              }
            });
          }).then(function (res) {
            return Kakao.API.request({
              url: '/v1/api/story/mystory',
              data: { id: res.id }
            });
          }).then(function (res) {
            document.getElementById('post-result').innerHTML = JSON.stringify(res);
            document.getElementById('post-image').src = res.media[0].original;
          }, function(err) {
            alert(JSON.stringify(err));
          });
        }
      });
    };
  //]]>
</script>

</body>
</html>