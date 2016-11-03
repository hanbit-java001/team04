$(document).ready(function(){

var name ="";
var userId="";
var age;
var confirmCount;
var writeCount;


//console.log("작성해 보자:"+$(".col-xs-12 p").html());

$(".btn-home").on("click",function(){
	location.href="/Home";
});
firstDetail();

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

	$(".name-top div:nth-child(2)").text(name).css("font-size", 20);
	var changeAge = Math.floor(age/10);
	$(".user-ages span:nth-child("+changeAge+")").css("opacity" , 1);
	$(".emp2>div").text(confirmCount+"건").css("font-size",45);
	$(".emp1>div").text(writeCount+"건").css("font-size" , 45);

}).fail(function(){
	alert('실패');
});
}


// 작성한 글 메소드
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
			innerHtml+="<tr><td>"+result.board_idx[i].boardIdx+"</td><td><a href='/hyundo/board'>"
			+result.board_idx[i].title+"</a></td><td>"+result.board_idx[i].contents+"</td><td>"
			+result.board_idx[i].regDate+"</td><td><i class='fa fa-file-o fa-2x' aria-hidden='true'></i>  " +
					"<i class='fa fa-trash fa-2x' data-num='"+result.board_idx[i].boardIdx+
					"' aria-hidden='true'></i></td></tr>";
				if(i%10==0){
					
				}

		}
//		console.log(result.board_idx.length%10==0);

		$(".write-container-body").html(innerHtml);

		$(".fa-trash").on("click",function(){

			var boardNum = Number($(this).attr("data-num"));

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

	});
}


$(".btn-writeList").on("click", function(){

	$(".write-container").toggle();

	writeViewMenu();

	});
});

