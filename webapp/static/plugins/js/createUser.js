$(function(){

	// container is the DOM element;
	// userText is the textbox

	var container = $("#container");
	var	userText = $('#userText');
	var childDivList=["<div class='userId'></div>","<div class='userName'></div>","<div class='userPassword'></div>","<div class='userAge'></div>"];
	var childDivClass=["userId","userName","userPassword","userAge"];
	var userTextMsg=["아이디는 이메일 형태로 작성해주세요","이름은 한글과 영어만 가능해요","비밀번호는 숫자는 한개 이상 8글자 이상이요","나이는 숫자로"];
	var currentNum=1;
	var checkInvalid=true;

	function validateEmail(email) {
		  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		  return re.test(email);
		}
	function validatePassword(password){
	var passw=  /^(?=.*\d)[0-9a-zA-Z]{8,}$/;
//			(?=.*\d)                //should contain at least one digit
//			(?=.*[a-z])             //should contain at least one lower case
//			(?=.*[A-Z])             //should contain at least one upper case
//			[a-zA-Z0-9]{8,}         //should contain at least 8 from the mentioned characters
	return passw.test(password);
	}
	function validateAge(Age){
		var checkAge=  /^(?:[1-9]\d*|\d)$/;
		return checkAge.test(Age);
	}
	function validateName(Name){
		var checkName=  /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣a-zA-Z]{3,7}$/;
		return checkName.test(Name);
	}
	function successCommit(){
		console.log("안과장"+$(".userId").text());
		var createUser ={
				userId:$(".userId").text(),
				userName:$(".userName").text(),
				userPassword:$(".userPassword").text(),
				userAge:$(".userAge").text()
		}
		$.ajax({
			url: "/api/member/create",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			data: JSON.stringify(createUser)
		}).done(function(pagingMembers) {

			});
	}
	function moveBar(currentNum){

			  var bar = $(".mybar");
			  var id = setInterval(frame, 50);
			  var range = 25;
			  var startPer=(currentNum-1)*25;
			  var innerPer=startPer;
			  var endPer=currentNum*25;
			  function frame() {
			    if (innerPer >= 100) {
			      clearInterval(id);
					$(".mybar").css({"background-color":"#80bfff","border":"transparent"})
					$(".barstate").hide().empty().addClass("afterState").text("Successfully").fadeIn("slow").on("click",successCommit());
					$(".barstate").focus();
					$("#userText").attr("disabled","true");

			    }else if(innerPer>=endPer){
			    	clearInterval(id);
			    }
			    else {
			      innerPer++;
			      bar.width(innerPer + '%');
			      $(".barstateNum").text(innerPer);
			      console.log("innerPer"+innerPer);
			    }
			  }
	}
	// Shuffle the contents of container
	container.shuffleLetters();
	$(".textMsg").shuffleLetters({
			"text":	userTextMsg[currentNum-1]
	});
	// Bind events
	userText.click(function () {

	  userText.val("");

	}).bind('keypress',function(e){

		if(e.keyCode == 13){
			// The return key was pressed
//			container.shuffleLetters({
//				"text": ""
//			});
			if(currentNum==1&&checkInvalid){
			container.empty();}
			if(checkInvalid){
			container.append(childDivList[currentNum-1]);}
			checkInvalid=true;
			$("#container div:nth-child("+currentNum+")").css({"color":"#555"});
			var containerChild=$("#container div:nth-child("+currentNum+")");
			changeText=userText.val();
			console.log("checkemail : "+validateEmail(userText.val()));
			if(currentNum==1&&validateEmail(userText.val())){
				console.log("email success")
			}else if(currentNum==2&&validateName(userText.val())){
				console.log("name success")
			}else if(currentNum==3&&validatePassword(userText.val())){
				console.log("password success")
			}else if(currentNum==4&&validateAge(userText.val())){
				console.log("age success")
			}else{
			console.log("invalid data"+currentNum);
				changeText= childDivClass[currentNum-1]+" "+"error"
				$("#container div:nth-child("+currentNum+")").css("color","#ff3333");
			currentNum--;
			checkInvalid=false;
			}
			containerChild.shuffleLetters({
				"text": changeText
			});
			currentNum++;
			if(checkInvalid){
			$(".textMsg").shuffleLetters({
				"text":	userTextMsg[currentNum-1]
			});
			moveBar(currentNum-1);
			}
			userText.val("");
		}

	}).hide().focusout(function(){
		console.log("full : "+$("#container").html());
	});

	// Leave a 4 second pause

	setTimeout(function(){

		// Shuffle the container with custom text
		container.shuffleLetters({
			"text": "Please your Id"
		});
//		container.empty();
		userText.val("input yours").fadeIn();
	},2000);

});

/**
 * http://usejsdoc.org/
 */
