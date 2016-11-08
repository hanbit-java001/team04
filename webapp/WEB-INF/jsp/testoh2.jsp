<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>API Demo: Post photo to KakaoStory - Kakao JavaScript SDK</title>

</head>
<style type="text/css">
#canvas {
	-webkit-transform: rotate(45);
	-moz-transform: rotate(45); -ms-transform : rotate( 45); -o-transform :
	rotate( 45);
	transform: rotate(45);
	-moz-transform: rotate(45);
	-ms-transform: rotate(45);
	-o-transform: rotate(45);
	-ms-transform: rotate(45);
	-o-transform: rotate(45);
}
}
</style>
<body>
	<input id="file" type="file" accept="image/*">
	<canvas id="myCanvas" width="200" height="100"></canvas>
	<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		if (window.File && window.FileReader && window.FormData) {
			var $inputField = $('#file');

			$inputField.on('change', function(e) {
				var file = e.target.files[0];

				if (file) {
					if (/^image\//i.test(file.type)) {
						readFile(file);
					} else {
						alert('Not a valid image!');
					}
				}
			});
		} else {
			alert("File upload is not supported!");
		}
		function readFile(file) {
			var reader = new FileReader();

			reader.onloadend = function() {
				processFile(reader.result, file.type);
			}

			reader.onerror = function() {
				alert('There was an error reading the file!');
			}

			reader.readAsDataURL(file);
		}
		function processFile(dataURL, fileType) {
			var maxWidth = 200;
			var maxHeight = 200;

			var image = new Image();
			image.src = dataURL;

			image.onload = function() {
				var width = image.width;
				var height = image.height;
				var shouldResize = (width > maxWidth) || (height > maxHeight);

				// 				if (!shouldResize) {
				// 					sendFile(dataURL);
				// 					return;
				// 				}

				var newWidth;
				var newHeight;

				if (width > height) {
					newHeight = height * (maxWidth / width);
					newWidth = maxWidth;
				} else {
					newWidth = width * (maxHeight / height);
					newHeight = maxHeight;
				}

				var canvas = document.getElementById("myCanvas");

				canvas.width = newWidth;
				canvas.height = newHeight;

				var context = canvas.getContext('2d');
// 				drawRotatedImage(this, 0, 0, 90,newWidth,newHeight,context);
context.translate(200, 0);
				context.rotate(Math.PI / 2); 
				context.drawImage(this, 0, 0, newWidth, newHeight);

				dataURL = canvas.toDataURL(fileType);

				// 				sendFile(dataURL);
			};

			image.onerror = function() {
				alert('There was an error processing your file!');
			};
		}
		////
		var TO_RADIANS = Math.PI/180; 
function drawRotatedImage(image, x, y, angle,width,height,context) { 
 
	// save the current co-ordinate system 
	// before we screw with it
	context.save(); 
 
	// move to the middle of where we want to draw our image
	context.translate(x, y);
 
	// rotate around that point, converting our 
	// angle from degrees to radians 
	context.rotate(angle * TO_RADIANS);
 
	// draw it up and to the left by half the width
	// and height of the image 
	context.drawImage(image, -(image.width/2), -(image.height/2),width,height);
 
	// and restore the co-ords to how they were when we began
	context.restore(); 
}

		///

		function sendFile(fileData) {
			var formData = new FormData();

			formData.append('imageData', fileData);

			$.ajax({
				type : 'POST',
				url : '/your/upload/url',
				data : formData,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data.success) {
						alert('Your file was successfully uploaded!');
					} else {
						alert('There was an error uploading your file!');
					}
				},
				error : function(data) {
					alert('There was an error uploading your file!');
				}
			});
		}
	</script>
</body>
</html>