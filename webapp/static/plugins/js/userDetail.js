$(document).ready(function(){

var name ="";
var userId="";
var age;
var confirmCount;
var writeCount;
var boardNum;
var modalTrigger = $('.cd-modal-trigger'),
transitionLayer = $('.cd-transition-layer'),
transitionBackground = transitionLayer.children(),
modalWindow = $('.cd-modal');
		

$(".btn-home").on("click",function(){
	location.href="/Home";
});


//첫페이지 만드는 메소드
function firstDetail(){

$.ajax({
	url:"/api/board/userDetail",
	method:"POST"
}).done(function(result){
	name =result.name;
	userId=result.userId;
	age = result.age;
	confirmCount = result.confirmCount;
	writeCount = result.writeCount;
	fileId= result.fileId;

	if(fileId.toUpperCase()!='NULL'){
		$(".img-responsive").attr("src","http://localhost:8081/file/"+fileId);
	}

	$(".name-top div:nth-child(2)").text(name).css("font-size", 20);
	var changeAge = Math.floor(age/10);
	$(".user-ages span:nth-child("+changeAge+")").css("opacity" , 1);
	$(".emp2>div").text(confirmCount+"건").css("font-size",45);
	$(".emp1>div").text(writeCount+"건").css("font-size" , 45);

}).fail(function(){
	alert('실패');
});
}


/////////////////// 작성한 글 메소드 // 이새끼 개 중요.
function writeViewMenu(){

	var boardIdx="";
	var boardTitle="";
	var boardContents="";
	var boardRegdate="";


	$.ajax({
		url:"/api/userDetail/writeContents",
		method:"POST",
	}).done(function(result){
		$(".write-container-body").html(result);
		var innerHtml="";

		$(".write-container>h2").text(userId+"님의 작성문서");

		$(".write-container-body td:nth-child(1)").text(boardIdx);
		for(var i = 0 ; i< result.board_idx.length; i++){
			innerHtml+="<tr class='"+i+"'><td data-num='"+result.board_idx[i].boardIdx+"'>"+result.board_idx[i].boardIdx+"</td><td><div class='portal'>"
			+result.board_idx[i].title+"</td></div><td class='hideContents'><input type='text' class='form-control'></td><td class='contents'>"+result.board_idx[i].contents+"</td><td>"
			+result.board_idx[i].regDate+"</td><td><i class='fa fa-file-o fa-2x' aria-hidden='true' data-num='"+i+
					"'></i>  " +
					"<i class='fa fa-trash fa-2x' data-num='"+result.board_idx[i].boardIdx+
					"' aria-hidden='true'></i></td></tr>";
			
		}

		$(".write-container-body").html(innerHtml);
		
		// 수정하기 아이콘
		$(".fa-file-o").on("click", function(){
			boardNum = Number($(this).attr("data-num"));
			console.log(boardNum);
			var michin = $(this).parent().parent("tr").html();
			console.log(michin);

			$(".write-container-body").html("");
			$(".write-container-body").html(michin);

			$(".contents").hide();
			$("i").parent("td").html("");

			$(".hideContents").show();

			var Html ="<button class='btn btn-primary btn-modify'>수정하기</button>     <button class='btn btn-default btn-exit'>나가기</button>"

			$(".write-container-body td:nth-child(6)").html(Html);
			$(".form-control").val(result.board_idx[boardNum].contents);
			$(".form-control").focus();
			$(".form-control").select();
			
			exitbtn();
			modifybtn();
		});
		
		// 쓰레기통 아이콘
		$(".fa-trash").on("click",function(){

			 boardNum = Number($(this).attr("data-num"));
			 console.log(boardNum);
				if(confirm("정말 삭제하시겠습니까?")){
					$.ajax({
						url:"/api/userDetail/deleteIcon",
						data:{
							boardNum:boardNum
						},
						method:"POST"
					}).done(function(result){
						firstDetail();
						writeViewMenu();
					}).fail(function(){
						alert('실패욤');
					});

				}else{
					alert('다시시도하시오');
				}

			});

			//
			// 포탈 버튼잼
				$(".portal").on('click', function(event){
					boardNum = $(this).parent().prev().text();
					dbtitle = $(this).parent().text();
					dbcontents = $(this).parent().next().next().text();
					
					console.log("click :"+dbtitle);
					console.log("click :"+dbcontents);
					console.log("click :"+boardNum);
					
					
					
					//open modal window
					console.log("아 뭐");
					
					$(".cd-main-content h1").text(dbtitle);
					$(".pclass").text(dbcontents);
					$(".modal").show();
					
					event.preventDefault();
					
					transitionLayer.addClass('visible opening');
					var delay = ( $('.no-cssanimations').length > 0 ) ? 0 : 600;
					setTimeout(function(){
						modalWindow.addClass('visible');
					}, delay);

				//close modal window
				modalWindow.on('click', '.modal-close', function(event){
					event.preventDefault();
					transitionLayer.addClass('closing');
					modalWindow.removeClass('visible');
					transitionBackground.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
						transitionLayer.removeClass('closing opening visible');
						transitionBackground.off('webkitAnimationEnd oanimationend msAnimationEnd animationend');
						location.href="/board/userDetail";
					});
				});

				});
				
			//포탈 끝남잼
			
	});
}
//////////////////////////////////

// 모달 모달








//////////////////나가기 버튼 누를시 액션
function exitbtn(){
	$(".btn-exit").click(function(){
		$(".write-container-body").html("");
		writeViewMenu();
//		$(".write-container-body").focus();
	})
}


////////////////////수정버튼 누를시액션
function modifybtn(){
$(".btn-modify").click(function(){
	var modifycontents = $(".form-control").val();
	boardNum =Number($(".write-container-body td:nth-child(1)").text());
//	console.log(boardNum);
	$.ajax({
		url:"/api/userDetail/modify",
		data:{
			contents:modifycontents,
			boardNum:boardNum
		},
		method:"POST"
	}).done(function(result){
		if(result.modify==1){
			alert('수정완료');
			writeViewMenu();
			$(".container").height();
			$(".container").scrollTop();
		}
	}).fail(function(){
		alert('망망');
	});
})
}

/////////////////////////
$(".btn-writeList").on("click", function(){
	$(".write-container").toggle();
	writeViewMenu();
	});
///////////////////////

























firstDetail();

});