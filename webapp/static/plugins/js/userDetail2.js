$(document).ready(function(){

var name ="";
var userId="";
var age;
var confirmCount;
var writeCount;


console.log("작성해 보자:"+$(".col-xs-12 p").html());

$(".btn-home").on("click",function(){
	location.href="/Home";
});

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

$(".btn-writeList").on("click", function(){

	$(".write-container").toggle();


	var boardIdx="";
	var boardTitle="";
	var boardContents="";
	var boardRegdate="";


	$.ajax({
		url:"/api/userDetail/writeContents1",
		method:"POST",
	}).done(function(result){
//		console.log(result);
		$(".write-container-body").html(result);
//		var innerHtml="";
//
//		$(".write-container>h2").text(userId+"님의 작성문서");
//
//		$(".write-container-body td:nth-child(1)").text(boardIdx);
//
//		for(var i = 0 ; i< result.board_idx.length; i++){
//			innerHtml+="<tr><td>"+result.board_idx[i].boardIdx+"</td><td><a href='/hyundo/board'>"+result.board_idx[i].title+"</a></td><td>"+result.board_idx[i].contents+"</td><td>"+result.board_idx[i].regDate+"</td><td><i class='fa fa-file-o fa-2x' aria-hidden='true'></i>  <i class='fa fa-trash fa-2x' data-num='"+result.board_idx[i].boardIdx+"' aria-hidden='true'></i></td></tr>";
//			$(".write-container-body").html(innerHtml);
////			console.log(innerHtml);
//		}
//
//		$(".fa-trash").on("click",function(){
//
//		var trueorfalse = confirm("정말 삭제하시겠습니까?");
//		var boardNum = $(this).attr("data-num");
//		console.log(boardNum);
//
//			if(trueorfalse==true){
//
//				return;
//			}
//			if(trueorfalse==false){
//				alert('다시시도하세요');
//			}

//			$.ajax({
//				url:"/api/userDetail/deleteIcon",
//				method:"POST",
//				data:{
//					boardIdx:
//				}
//			}).done(function(result){
//
//			}).fail(function(){
//				alert('실패욤');
//			});
		});


	}).fail(function(){
		alert('너실패');
	});
});