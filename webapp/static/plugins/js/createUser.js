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
	var imgfile = null;
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
		if (($(".userId").text().trim() != "")
				&& ($(".userPassword").text().trim() != "")
				&& ($(".userAge").text().trim() != "")
				&& ($(".userName").text().trim() != "")) {

			var data = new FormData();
			data.append("userId", $(".userId").text());
			data.append("password", $(".userPassword").text());
			data.append("age", $(".userAge").text());
			data.append("name", $(".userName").text());
			console.log("age : " + $("#CreateUserName").val());
			if (imgfile != null) {
				for (var i = 0; i < imgfile.length; i++) {
					data.append("Contents_img", imgfile[i]);
				}
			}
			$.ajax({
				url : "/api/Create/user",
				method : "POST",
				data : data,
				contentType : false,
				dataType : "json",
				processData : false
			}).done(function(result) {

				console.log(result+"님 환영합니다.");
				$("#dropbox").html("Complete");
				setTimeout(function(){
					location.href="/Home";
				}, 1500);

			});
	}}
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
					$(".barstate").hide().empty().addClass("afterState").text("Successfully").fadeIn("slow").on("click",function(){successCommit()});
					$(".barstate").focus();
					$("#userText").attr("disabled","true");
					$(".profile").fadeIn();
					dropBoxMaker();
			    }else if(innerPer>=endPer){
			    	clearInterval(id);
			    }
			    else {
			      innerPer++;
			      bar.width(innerPer + '%');
			      $(".barstateNum").text(innerPer);
//			      console.log("innerPer"+innerPer);
			    }
			  }
	}
	$(".input-file").change(function(event) {
		imgfile = event.target.files;
		console.log("click event check");
		var file = imgfile[0];
		var reader = new FileReader();
		reader.onloadend = function() {
			$('.profile-img').css('background-image',
					'url("' + reader.result + '")');
		}
		if (file) {
			reader.readAsDataURL(file);
		} else {
		}
		$(".profile-img-text").text(
				"Uploading " + imgfile[0].name);
//		$(".profile").fadeIn();
	});
	function dropBoxMaker() {
		var dropbox = document.getElementById("dropbox");
		dropbox.addEventListener("dragenter", noop, false);
		dropbox.addEventListener("dragexit", noop, false);
		dropbox.addEventListener("dragover", noop, false);
		dropbox.addEventListener("drop", dropUpload, false);
	}

	function noop(event) {
		event.stopPropagation();
		event.preventDefault();
	}

	function dropUpload(event) {
		noop(event);
		imgfile = event.dataTransfer.files;
		console.log(imgfile[0].name);

		var file = imgfile[0];
		var reader = new FileReader();
		reader.onloadend = function() {
			$('.profile-img').css('background-image',
					'url("' + reader.result + '")');
		}
		if (file) {
			reader.readAsDataURL(file);
		} else {
		}
		$(".profile-img-text").text(
				"Uploading " + imgfile[0].name);
//		$(".profile").fadeIn();

	}


	function uploadProgress(event) {
		// Note: doesn't work with async=false.
		var progress = Math.round(event.loaded / event.total * 100);
		document.getElementById("status").innerHTML = "Progress "
				+ progress + "%";
	}

	function uploadComplete(event) {
		document.getElementById("status").innerHTML = event.target.responseText;
	}

	$(".profile-img-text").on("click",function(){
		console.log("check text0000");
		$(".input-file").click();
	})
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
			console.log(changeText);
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
		setTimeout(function(){
			userText.click().focus();
		},1000);

	},2000);


});

/**
 * http://usejsdoc.org/
 */
