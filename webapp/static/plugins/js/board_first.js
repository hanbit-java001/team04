		var defaultPageNum = 1;
		var totalPage;
		var currentPage=defaultPageNum;
		var PageInNum=defaultPageNum;
		var result_list;

		$(document).ready(function() {
			listLord(defaultPageNum);

			$(".fa").on('click', function() {
				if ($(this).attr("text") == "left") {
					prev();
				} else {
					next();
				}

			})
			function clickbtn(){
				$(".page-number div").on('click', function() {
					$(".cd-section").remove();
					console.log("clickbtn : " + $(this).text())
					listLord($(this).text());
				})
			}

			function prev() {
				if ($(".fa-arrow-left").next().text() == 1) {
//					location.href = "/mytestoh";
					$(".fa-arrow-left").fadeOut("slow");
				} else {
					PageInNum-=5;
					pageNumCreate(PageInNum-1);
				}
				$(".fa-arrow-right").show();
				clickbtn();
			}
			function next() {
				if (($(".page-number div").last().text())%5 == 0&&totalPage>$(".page-number div").last().text()*15) {
					PageInNum+=5;
					pageNumCreate(PageInNum-1);
					console.log("다음 번호 생성");
					clickbtn();
				} else {
					console.log("더이상 갈곳이 없어  "+($(".page-number div").last().text())%5+" Page : "+PageInNum );
					$(".fa-arrow-right").fadeOut("slow");
				}
			}
			function pageNumCreate(pageNum){
				$(".page-number div").remove();

				var innerhtml="";
			for(var i=(pageNum-pageNum%5)+1;(i<pageNum-pageNum%5+6)&&(i<=totalPage/15+1);i++){
				innerhtml+="<div>"+i+"</div>";
			}
			console.log("check html : "+innerhtml);
			console.log($(".page-number").html());
				$(innerhtml).insertBefore(".fa-arrow-right");
			}
			function listLord(pageNum) {
				currentPage=pageNum;

				$.ajax({
					url : "/data/list" + pageNum
				}).done(function(myresult) {
// 					console.log(myresult);
					var result= myresult.list;
					result_list=result;
					totalPage=myresult.totoalPage;
					var appendhtml="";
					if(pageNum==1){
					$(".cd-section:not(:nth-child(1))").remove();}
					for(var i=0;i<result.length;i++){
						if(i%3==0){
						appendhtml += "<section class='cd-section'>"+
						"<div class='cd-block'>"+
							"<div class='cd-half-block'></div>"+
							"<div class='cd-half-block'>";}
						appendhtml+= "<div class='table-container'>"+
								"<div class='round-clip'></div>"+
									"<ul>"+
										"<li>"+result[i].TITLE+"</li>"+
										"<li>"+result[i].CONTENTS+"</li>"+
										"<li>"+result[i].REGDATE+"</li>"+
										"<li>"+result[i].AGE_GROUP+"</li>"+
									"</ul>"+
								"</div>";

							if(i%3==2){
								appendhtml+="</div>"+
								"</div>"+
					"</section>";}
					}
// 					console.log(appendhtml);
						$(appendhtml).insertBefore(".cd-nav");
						$('section').hide();
						pageNumCreate(currentPage-1);
						clickbtn();
						$(".cd-section").first().addClass('is-visible');
						$('section').fadeIn(1000);
						$('body,html').animate({scrollTop: $(".is-visible").position().top}, 1000);
						$(".table-container").on("click",function(){
							if($( ".cd-section" ).index( $(this).parent().parent().parent() )%2<1){
								$(".detail-view").removeClass("detail-view-left");
								$(".detail-view").addClass("detail-view-right");
							}else{
								$(".detail-view").removeClass("detail-view-right");
								$(".detail-view").addClass("detail-view-left");
							}
							if($(".detail-view").css("display")!="none"){
								$(".detail-view").fadeOut("fast");
							}



							if(result_list[$( ".table-container" ).index( this )].FILE_ID=="null"||result_list[$( ".table-container" ).index( this )].FILE_ID===undefined){
								$(".detail-gallery img").hide();
								$(".img-text").text("no-picture");
							}else{
								console.log(result_list[$( ".table-container" ).index( this )].FILE_ID);
								$(".detail-gallery img").attr("src","http://localhost:8180/file/"+result_list[$( '.table-container' ).index( this )].FILE_ID);
								$(".detail-gallery img").show();
							}
							$(".detail-title").text("Title / "+result_list[$( ".table-container" ).index( this )].TITLE);
							$(".detail-regdate input").val(result_list[$( ".table-container" ).index( this )].REGDATE);
							$(".detail-contents textarea").text(result_list[$( ".table-container" ).index( this )].CONTENTS);
							$(".detail-ageGroup").text(result_list[$( ".table-container" ).index( this )].AGE_GROUP+" 대");
							$(".detail-hitCnt").text("조회수 : "+result_list[$( ".table-container" ).index( this )].HITCNT);
							$(".detail-view").fadeIn("slow");
							$(".detail-view").on("click",function(){
								console.log("check body click");
								$(".detail-view").fadeOut("fast");
							})
							$( window ).scroll(function() {
								$(".detail-view").fadeOut("fast");
								});
							});

				});
			}

		})
