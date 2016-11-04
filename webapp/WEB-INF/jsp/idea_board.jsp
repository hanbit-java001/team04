<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="/static/plugins/hyundo/js/modernizr.js"></script>
	<link rel="stylesheet" href="/static/plugins/hyundo/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="/static/plugins/hyundo/css/style.css"> <!-- Resource style -->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style  class="myStyle"type="text/css">
.cd-3d-portfolio .projects .row > li.project-1 .project-image::before {
/*   set project background image */
  background-image: url(../images/photo-1.jpg);
}
.cd-3d-portfolio .projects .row > li.project-2 .project-image::before {
  background-image: url(../images/photo-2.jpg);
}
.cd-3d-portfolio .projects .row > li.project-3 .project-image::before {
  background-image: url(../images/photo-3.jpg);
}
.cd-3d-portfolio .projects .row > li.project-4 .project-image::before {
  background-image: url(../images/photo-4.jpg);
}
.cd-3d-portfolio .projects .row > li.project-5 .project-image::before {
  background-image: url(../images/photo-5.jpg);
}
.cd-3d-portfolio .projects .row > li.project-6 .project-image::before {
  background-image: url(../images/photo-6.jpg);
}
.cd-3d-portfolio .projects .row > li.project-7 .project-image::before {
  background-image: url(../images/photo-7.jpg);
}
.cd-3d-portfolio .projects .row > li.project-8 .project-image::before {
  background-image: url(../images/photo-8.jpg);
}
.cd-3d-portfolio .projects .row > li.project-9 .project-image::before {
  background-image: url(../images/photo-9.jpg);
}
</style>
<title>보드</title>
</head>
<body>
	<div class="main-panel">
	<div class="moveBar">
		<div class="insertBtn">WRITE</div>
		<div class="moveBtn">MOVE</div>
		</div>
		<div class="cd-3d-portfolio">

			<div class="projects"></div>
			<a href="#0" class="cd-top">Top</a>
		</div>


		<div class="modal">
			<div class="cd-modal">
				<div class="cd-main-content">
					<div class="center"></div>
				</div>
				<div class="modal-content">
					<div id="page-wrap">
						<h1>글을 작성해보자</h1>
						<br />
						<div id="contact-area">
<!-- 							<form method="post" action="contactengine.php"> -->
								<label for="userId">NAME:</label>
								<input type="text"	name="userId" id="userId" disabled="disabled" />
								<label for="title">TITLE:</label>
								<input type="text" name="title" id="title" />

								<div>
								<label for="file">FILE:</label>
							<form id="upload" method="post">
								<div id="dropbox">
								<input type="file" id="fileId"/>
								</div>
								<ul>
									<!-- The file uploads will be shown here -->
								</ul>

							</form>
							</div>


							<div class="textAndbut">
							<label for="contents">CONTENTS:</label><br />
									<textarea name="contents" rows="20" cols="20" id="contents"></textarea>
									<div class="IdeaBtns">
										<div class=IdeaInsertBtn>승인</div>
										<div class=IdeaCancelBtn>취소</div>
									</div>
								</div>
<!-- 							</form> -->

							<div style="clear: both;"></div>

						</div>

					</div>
				</div>

				<a href="#0" class="modal-close">Close</a>
			</div>

			<div class="cd-transition-layer">
				<div class="bg-layer"></div>
			</div>
		</div>








	</div>
	<script type="text/javascript"
		src="/static/plugins/hyundo/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript"
		src="/static/plugins/hyundo/js/ideaBoard2.js"></script>
<!-- 		<script type="text/javascript" -->
<!-- 		src="/static/plugins/hyundo/js/file/script.js"></script> -->
</body>
</html>