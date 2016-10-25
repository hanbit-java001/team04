<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google web fonts -->
		<link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel='stylesheet' />

<style type="text/css">
#dropbox {
    width: 300px;
    height: 200px;
    border: 1px solid gray;
    border-radius: 5px;
    padding: 5px;
    color: gray;
}
</style>
<title>보드</title>
</head>
<body>
 <div id="dropbox">Drag and drop a file here...</div>
        <div id="status"></div>
<script src="/static/plugins/hyundo/js/jquery-3.0.0.min.js"type="text/javascript"></script>

<script type="text/javascript">
window.onload = function() {
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
    var files = event.dataTransfer.files;

    for (var i = 0; i < files.length; i++) {
        upload(files[i]);
    }
}

function upload(file) {
    document.getElementById("status").innerHTML = "Uploading " + file.name;

    var data = new FormData();
    data.append("title", title);
	data.append("contents", contents);
    data.append("file", file);
////바꿀 부분
    $.ajax({
		url: "/api/board/add",
		method: "POST",
		data: data,
		contentType: false,
		processData: false
	}).done(function(result) {
		var name = result.name;

		alert(name + "님 환영합니다.");

		location.href = "/";
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

</script>
</body>
</html>