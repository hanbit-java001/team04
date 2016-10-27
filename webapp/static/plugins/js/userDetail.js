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


});