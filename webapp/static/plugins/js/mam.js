//$(function() {
//	
//	$.ajax({
//		url : "/api/data",
//		method : "POST"
//	}).done(function (resultData) {
//		
//		for (var i = 0; i < resultData.length; i++) {
//			var user = resultData[i].userId;
//			var contents = resultData[i].contents;
//			
////			var bongHTML = "";
////			bongHTML += "<div class = 'user'>"+user+"</div>";
////			bongHTML += "<div class = 'contents'>"+contents+"</div>";
//			
//			var bongHTML2 = "";
//			bongHTML2 += "<div class='panel2'>"
//			bongHTML2 += "<div class='v1'>"
//			bongHTML2 += user
//			bongHTML2 += "</div>"
//			bongHTML2 += "<div class='v2'>"
//			bongHTML2 += contents
//			bongHTML2 += "</div></div>"
//			
//			
//			$(".panel").append(bongHTML2);
//				
//		}
//		
//	})
//	
	$(".a1818").on("click", function(){
		location.href= "write";
	})
	
