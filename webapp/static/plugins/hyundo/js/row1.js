$(function(){
	
	var rowHTML = "";

	for (var i = 1; i < 4; i++) {
		rowHTML += "<ul class='row'>" 
		for (var j = 1; j < 4; j++) {
			var result = (j - 1) * 3 + i;

			rowHTML += "<li class='front-face selected project-"+j+"'>";
			rowHTML += "<div class='project-wrapper'>";
			rowHTML += "<div class='project-image'>";
			rowHTML += "<div class='project-title'>";
			rowHTML += "<h2>Project "+result+"</h2>";
			rowHTML += "</div>";
			rowHTML += "</div>";
			rowHTML += "<div class='project-content'>";
			rowHTML += "<div>";
			rowHTML += "<p>"+result+"번내용</p>";
			rowHTML += "</div>";
			rowHTML += "</div>";
			rowHTML += "<a href='#0' class='close-project'>Close</a>";
			rowHTML += "</div> ";
			rowHTML += "</li>";
		}
		rowHTML += "</ul>";
		$(".projects").append(rowHTML);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	rowHTML += "";
	rowHTML += "";
		
	
	
	
})