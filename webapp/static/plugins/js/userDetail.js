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
	$(".write-container").show();

	var boardIdx="";
	var boardTitle="";
	var boardContents="";
	var boardRegdate="";
	
	$.ajax({
		url:"/api/userDetail/writeContents",
		method:"POST",
	}).done(function(result){
		for(var i = 0; i< result.board_idx.length; i++){
			boardIdx =result.board_idx[i].boardIdx;
			boardTitle = result.board_idx[i].title;
			boardContents = result.board_idx[i].contents;
			boardRegdate = result.board_idx[i].regDate;
		}
		
		console.log(boardIdx);
		
		$(".write-container>h2").text(userId+"님의 작성문서")
		$(".write-container-body td:nth-child(1)").text(boardIdx);
		
	}).fail(function(){
		alert('너실패');
	});
})


});