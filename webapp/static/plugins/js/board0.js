	$(document).ready(function() {

//		$("time.timeago").timeago();
//		$(".timeago").attr("datetime","2008-07-13");
		var top3Name;
		var top3Num;
		console.log();

//		$("#beforeLogin").hide();

		/////////////////////// 그래프 시작 //////////////////////////////
			$.ajax({
					url : "/api/board/start",
					method : "POST",
					dataType : "json"
					}).done(function(result) {
						top3Name = {
							top1:result[0].userId,
							top2:result[1].userId,
							top3:result[2].userId
						};
						top3Num ={
								top1:result[0].hitCnt,
								top2:result[1].hitCnt,
								top3:result[2].hitCnt
						};
						console.log("check ing : "+top3Num.top1+" , "+top3Num.top2+" , "+top3Num.top3+" check ing : "+top3Name.top1,+" , "+top3Name.top2+" , "+top3Name.top3);
						drawDonutGraph(top3Num , top3Name);
						drawBarGraph(top3Num ,top3Name)
					}).fail(function() {
						alert("그래프 가져오기 실패");
				});

				//////// 그래프 끝  //////////////////////////////

		function drawBarGraph(top3Num){

			Morris.Bar({
				element: 'bar chart',     // bar를 넣을 div의 아이디를 적어주세요.
				data: [                                // bar를 넣을 x축과 y축의 데이터를 적어줍니다.
				{ y: top3Name.top1, a: top3Num.top1},
				{ y: top3Name.top2, a: top3Num.top2},
				{ y: top3Name.top3, a: top3Num.top3}
				],
				xkey: 'y',                          //x축에 들어갈 이름을 넣은 data이름을 넣어줍니다
				ykeys: ['a'],                //y축에 들어갈 이름을 넣은 data이름을 넣어줍니다
				labels: ['좋아요 현황'] // 라벨칸에 나타날 이름을 적어줍니다.
				});

				}

				function drawDonutGraph(top3Num) {
					Morris.Donut({
						  element: 'pie-chart',
						  data: [
						    {label:  top3Name.top1, value:top3Num.top1},
						    {label:  top3Name.top2, value: top3Num.top2},
						    {label:  top3Name.top3, value: top3Num.top3},
						  ]
						});
				}

			$("#btn-chat").on("click", function(){

				alert(currentPage);

				$.ajax({

					url:"/api/board/chatinsert",
					method:"POST",
					data:{
						page:currentPage
					}
				}).done(function(result){
					alert(result.page);
				}).fail(function(){
					alert('망');
				});

				})

				function getReply(pageNum){
					$.ajax({
						url:"/api/board/replyinsert",
							method:"POST",
						data:{
							page:pageNum
						}
					}).done(function(result){
						console.log(currentPage);
						$(".replyBody").empty();

						for(var i =0 ; i<result.replyLists.length; i++){
							var reply = result.replyLists[i];
							var replyDb = reply.contents;
							var userId=	reply.userId;
							var replyDate = reply.regDate;
							console.log(reply);
							addReply(userId,replyDb,replyDate);
						}
						var totalCount = result.totalCount;

						drawNumber(totalCount);
					});
				}

				function addReply(userId,replyDb,replyDate){

					var ReplyHtml = "";

					ReplyHtml+="<ul class='chat'>";
					ReplyHtml+="<li class='left clearfix'>";
					ReplyHtml+="<span class='chat-img pull-left'>";
					ReplyHtml+="<img src='http://placehold.it/50/55C1E7/fff' alt='User Avatar' class='img-circle' />";
					ReplyHtml+="</span>";
					ReplyHtml+="<div class='chat-body clearfix'>";
					ReplyHtml+="<div class='header'>";
					ReplyHtml+="<strong class='primary-font'>"+userId+"</strong>";
					ReplyHtml+="<small class='pull-right text-muted'>";
					ReplyHtml+="<i class='fa fa-clock-o fa-fw'></i>";
					ReplyHtml+="<time class='timeago' datatime='2016-10-14T17:24:17Z'></time>";
					ReplyHtml+="</small>";
					ReplyHtml+="</div>";
					ReplyHtml+="<div>"+replyDb+"</div>";
					ReplyHtml+="</div>";
					ReplyHtml+="</li>";
					ReplyHtml+="</ul>";

					$(".replyBody").append(ReplyHtml);
//					$("time.timeago").timeago();
//					console.log($(".timeage").first().text());
				}

				function drawNumber(totalCount){

					firstPage = parseInt((currentPage-1)/pageRange)*pageRange+1;
					lastPage = firstPage+pageRange-1;
					totalPage = parseInt(totalCount/itemsPerPage)+(totalCount%itemsPerPage > 0 ? 1 : 0);

					console.log(firstPage);
					console.log(lastPage);
					console.log(totalPage);

					$(".page").empty();

					var pageHtml = "";
					pageHtml += "<div class='page-number page-previous'>";
					pageHtml +="<button type='button' class='btn btn-default btn-num'>이전</button>";
					pageHtml +="</div>";

					$(".page").append(pageHtml);

					for(var i =firstPage; i<=lastPage; i++){

						if(i>totalPage){
							break;
						}

						pageHtml ="<div class='page-number";

						if(i==currentPage){
							pageHtml+=" page-currentPage";
						}
						pageHtml+="'>";
						pageHtml+="<button type='button' class='btn btn-default btn-num'>"+i+"</div>";

						$(".page").append(pageHtml);

					}
//						$(".page-currentPage button").removeClass("btn-default").addClass("btn-primary");

						pageHtml="<div class='page-number'><button type='button' class='btn btn-default btn-num'>다음</div>";

						$(".page").append(pageHtml);
						ajaxafter();
				}

				function ajaxafter(){
				$(".btn-num").on("click" , function(){
					var pageText = $(this).text();
					var pageNum = 0;

					if(pageText=="이전"){

						pageNum = currentPage-1;

						if(pageNum<0){
							return;
						}

					}else if(pageText=="다음"){

						pageNum=lastPage+1;

						if(pageNum>totalPage){
							return;
						}

					}else{
						pageNum=Number(pageText);
					}
					currentPage = pageNum;
					getReply(pageNum);
				});
			}



		function showUserMenu(loggedIn) {
			if(loggedIn){
				$(".afterLogin").show();
				$(".beforeLogin").hide();
			}
			else{
				$(".afterLogin").hide();
				$(".beforeLogin").show();
			}
		}

		function showLoginPanel(){
			$(".login-panel").show();
		}

		function hideLoginPanel(){
			$(".login-panel").hide();
		}

		$(".beforeLogin").on("click", function(){
			$(".login-panel").show();
		});

		$(".canclebtn").on("click",function(){
			$(".login-panel").hide();
		});

		$(".loginbtn").on("click",function(){
			var userId= $("#submitId").val();
			var password=$("#submitpassword").val();

			if(userId==""){
				alert('이름 마저 채워');
			}
			else if(password==""){
				alert('비번 마져채워');
			}

			$.ajax({
				url:"/api/board/gologin",
				data:{
					userId:userId,
					password:password
				}
			}).done(function(result){
				alert('환영합니다: '+result.userId+"님");
				$("#submitId").val("");
				$("#submitpassword").val("");
				hideLoginPanel();
				showUserMenu(true);
			}).fail(function(){
					alert('없는 계정이용')
				});

		});

		$(".logout").on("click" , function(){
			location.href="/board/logout";
		});


		//시작시 AJAX 돌아서 세션에 로그인 유무 확인
		$.ajax({
			url:"/api/isLogin",
			method:"POST",
		}).done(function(result){
			if(result.userId==""){
				showUserMenu(false);
			}
			else {
				showUserMenu(true);
			}
		}).fail(function(){
			alert('fail');
		});

				var lastPage;
				var firstPage;
				var totalPages;
				var currentPage = 1;
				var pageRange = 5;
				var itemsPerPage=3;

				getReply(currentPage);

//				setTimeout(function(){
//					  jQuery("time.timeago").timeago();
//				  },1000);

	});