$(function() {
	$(document).click(function(event) {
	    var text = $(event.target).text();
	    if($(event.target).hasClass("confirm")){
	    	console.log("success1");
	    	confirmClick($(event.target));
	    	console.log("success2");
	    }
	});
	var totCnt=0;
	var CrntPageNum = 1;
	var totPageNum;
	//////////////////////////////////
	var dbtitle;
	var dbcontents;
	///////////////////////////
	var imgfile=null;
	/////
	var IdxNum;
	/////
	var CrntuserId;
	//////
	var modalTrigger = $('.cd-modal-trigger'),
	transitionLayer = $('.cd-transition-layer'),
	transitionBackground = transitionLayer.children(),
	modalWindow = $('.cd-modal');

	/// 총 숫자 가져오는 애
	function getTotalCnt(){
	$.ajax({
		url : "/api/totCnt",
		method : "POST"
		}).done(function(totalCnt){
			totCnt = totalCnt;
			totPageNum = totCnt/9==0?totCnt/9 : Math.floor(totCnt/9)+1;
			console.log(totPageNum+" : "+totCnt);
		});
	}





	////////////////////////////////////
	// 버튼 그려주는애
	function makeBtn(CrntPageNum){

		var PgOne = (CrntPageNum-1)*3+1;
		var PgTwo = PgOne+1;
		var PgThree = PgTwo+1;

		var wrapperHTML = "";
		    wrapperHTML += "<div class='cd-3d-portfolio-navigation'>";
		    wrapperHTML +="<div class='cd-wrapper'>";
			wrapperHTML += "<h1>IDEA BOARDS</h1>";
			wrapperHTML += "<ul class='ex'>";
			wrapperHTML += "<div class='prevBtn'><<</div>";
			wrapperHTML += "<li><a href='#0' class='selected'> PAGE "+PgOne+" </a></li>";
			wrapperHTML += "<li><a href='#0'>PAGE "+PgTwo+"</a></li>";
			wrapperHTML += "<li><a href='#0'>PAGE "+PgThree+"</a></li>";
			wrapperHTML += "<div class='aftBtn'>>></div>";
			wrapperHTML += "</ul>";
			wrapperHTML += "</div>";
			wrapperHTML += "</div>";
		$(".cd-3d-portfolio").append(wrapperHTML);
		mainjs();
	}


		/////////////////////////////////////////////////////////
	// vo 9개 가져와서 그려주는 애
	function makeView(CrntPageNum){
	$.ajax({
				url : "/api/datas",
				method : "POST",
				data : {
					pageNum : CrntPageNum
				}
			}).done(function(result) {
//						alert(result.list.length);

						var rowHTML = "";
						var cls = [
								"<li class='front-face selected project-1'>",
								"<li class='right-face project-2'>",
								"<li class='right-face project-3'>",
								"<li class='front-face selected project-4'>",
								"<li class='right-face project-5'>",
								"<li class='right-face project-6'>",
								"<li class='front-face selected project-7'>",
								"<li class='right-face project-8'>",
								"<li class='right-face project-9'>"
								];

						var k = 0;
						rowHTML += "<div class='projects'>"
							var not_default=[];

						for (var i = 1, innerNum=1; i < 4; i++) {
							console.log((result.list.length));
							rowHTML += "<ul class='row'>"
							for (var j = 1; j < 4; j++,innerNum++) {
								var trnsNum = ((j - 1) * 3 + i) - 1;

								if(result.list.length > trnsNum){
									dbhitcnt = result.list[trnsNum].hitCnt;
									dbtitle = result.list[trnsNum].title;
									dbuserId = result.list[trnsNum].userId;
									dbcontents = result.list[trnsNum].contents;
									dbfileId = result.list[trnsNum].fileId;
									dbIdx = result.list[trnsNum].boardIdx;
									dbconfirm = result.list[trnsNum].confirm;
									if(dbfileId==null||dbfileId=="NULL"||dbfileId==undefined){
										not_default.push("default");
									}else{
										not_default.push(trnsNum);
									}

								}else{
									dbtitle = "default";
									dbcontents = "default";
									not_default.push("default");
									$(".cd-3d-portfolio .projects .row > li.project-"+innerNum+" .project-image::before ").css("background-image","url(../images/photo-"+innerNum+".jpg)");
								}

								rowHTML += cls[k];
								rowHTML += "<div class='project-wrapper'>";
								rowHTML += "<div class='project-image'>"; // style='background-image:+"dbfileId"+ '
								rowHTML += "<div class='project-title'>";
								rowHTML += "<h2";
									if(dbconfirm=="N"&&CrntuserId=="admin"){
										rowHTML +=  " style='color:gray;' ";
									}
										rowHTML += ">  " + dbtitle + "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp :: "+dbuserId+"</h2>"
								rowHTML += "</div>";
								rowHTML += "</div>";
								rowHTML += "<div class='project-content'>";
								rowHTML += "<div class='hitdiv' style='color:#999' data-num='"+dbIdx+"'><br></br> &nbsp;&nbsp; HITCNT : "+dbhitcnt+"</div> ";
								rowHTML += "<div class='confirm ";
								if(dbconfirm=="Y"){
									rowHTML +=  "confirmed";
								}else{
									rowHTML +=  "needconfirm";
								}
								rowHTML += "'> &nbsp;&nbsp;[CONFIRM]&nbsp;&nbsp;</div>"
								rowHTML += "<p> contents : "
										+ dbcontents + "</p>";
								rowHTML += "</div>";
								rowHTML += "<a href='#0' class='close-project'>Close</a>";
								rowHTML += "</div> ";
								rowHTML += "</li>";
								k++;


							}
							rowHTML += "</ul>";

						}
						rowHTML += "</div>"
						$(".cd-3d-portfolio").append(rowHTML);
						$(".myStyle").text("");
						for(var i=0;i<not_default.length;i++){
							if(not_default[i]=="default"){
								console.log(not_default[i]);
								$(".myStyle").append(".cd-3d-portfolio .projects .row > li.project-"+(i+1)+" .project-image::before {  background-image: url(http://203.236.209.187:8180/static/plugins/hyundo/images/photo-"+(i+1)+".jpg)}");
							}else{
								console.log(not_default[i]);
								$(".myStyle").append(".cd-3d-portfolio .projects .row > li.project-"+(i+1)+" .project-image::before {  background-image: url(http://203.236.209.187:8180/file/"+result.list[not_default[i]].fileId+")}");
//								$(".cd-3d-portfolio .projects .row > li.project-"+(i+1)+" .project-image::before").css("background-image","url(http://203.236.209.187:8180/file/"+result.list[not_default[i]].fileId+")");
							}
						}

						console.log("check : "+CrntuserId);
//						console.log("confirm check : "+dbconfirm);
//						console.log(CrntuserId);
						console.log(not_default);
						Btnmovement();
						mainjs();
						if(CrntuserId=="admin"){
							$(".confirm").css({"display":"inline-block"});
							$(".confirmed").css({"display":"none"});
						}
						$("body").fadeIn("slow");
					})
	}


	// 버튼 움직이자
	function Btnmovement(){
	$(".aftBtn").on("click", function(){
		if(CrntPageNum == totPageNum){
			$(this).off();
		}else{
			CrntPageNum++;
			$(".cd-3d-portfolio").fadeOut("slow",function(){
				$(this).html("");
				makeView(CrntPageNum);
				makeBtn(CrntPageNum);
		}).fadeIn("slow");
		}
	})
	$(".prevBtn").on("click", function(){
		if(CrntPageNum==1){
			$(this).off();
		}else{
		CrntPageNum--;
		$(".cd-3d-portfolio").fadeOut("slow",function(){
			$(this).html("");
			makeView(CrntPageNum);
			makeBtn(CrntPageNum);
		}).fadeIn("slow");
		}
	})
	}


	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 원래 있던 js 불러주는 애
	function mainjs() {
		var isPreserve3DSupported = ($('.preserve3d').length > 0), isTransitionSupported = ($('.csstransitions').length > 0), backToTopBtn = $('.cd-top');

		function Portfolio3D(element) {
			// define a Portfolio3D object
			this.element = element;
			this.navigation = this.element
					.children('.cd-3d-portfolio-navigation');
			this.rowsWrapper = this.element.children('.projects');
			this.rows = this.rowsWrapper.children('.row');
			this.visibleFace = 'front';
			this.visibleRowIndex = 0;
			this.rotationValue = 0;
			// animating variables
			this.animating = false;
			this.scrolling = false;
			// bind portfolio events
			this.bindEvents();
		}

		Portfolio3D.prototype.bindEvents = function() {
			var self = this;


			this.navigation.on('click', 'a:not(.selected)', function(event) {
				// update visible projects when clicking on the filter
				event.preventDefault();
				if (!self.animating) {
					self.animating = true;
					var index = $(this).parent('li').index();
					console.log("check index : "+ index);
					// update filter
					$(this).addClass('selected').parent('li').siblings('li')
							.find('.selected').removeClass('selected');
					// show new projects
					self.showNewContent(index-1);
				}
			});

			this.rows
					.on(
							'click',
							'li.selected',
							function(e) {
								// open a new project 여기가 그것인거 같다!! 히트카운트!!
								IdxNum = Number($(this).find(".confirm").prev().attr("data-num"));

//								if(dbconfirm=="Y"){
//									$("#conFirm").css({"color":"red"});
//									$("#conFirm").text("confirmed");
//								}
//								if(CrntuserId=="admin"){
//									$("#conFirm").css("display","inline-block");
//								}


								console.log(IdxNum);
								console.log(CrntuserId);

								if (!self.animating
										&& !$(this).hasClass('open')) {
									self.animating = true;
									self.rowsWrapper
											.addClass('project-is-open project-has-transition');

									$(this)
											.addClass('open')
											.one(
													'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
													function() {
														// wait for the end of
														// the transition and
														// set the animating
														// variable to tru
														self.animating = false;
														$(this)
																.off(
																		'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
														hitCount();
													});

									if (!isTransitionSupported)
										self.animating = false;
								}
							});

			this.element
					.on(
							'click',
							'.close-project',
							function(event) {
								event.preventDefault();
								// close a project
								if (!self.animating) {
									self.animating = true;
									self.rowsWrapper
											.removeClass('project-is-open');

									self.rows
											.find('li.open')
											.find('.project-title')
											.one(
													'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
													function() {
														// wait until the
														// project is clodes and
														// remove classes/set
														// animating to false
														$(this)
																.off(
																		'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
														self.resetProjects();
													});

									if (!isTransitionSupported)
										self.resetProjects();
								}
							});

			this.rowsWrapper.find('.project-wrapper').on('scroll', function() {
				// detect scroll incide an open project - hide/show back to top
				var scrollValue = $(this).scrollTop();
				if (!self.scrolling) {
					self.scrolling = true;
					(!window.requestAnimationFrame) ? setTimeout(function() {
						self.checkScroll(scrollValue);
					}, 250) : window.requestAnimationFrame(function() {
						self.checkScroll(scrollValue);
					});
				}
			});
		};

		Portfolio3D.prototype.resetProjects = function() {
			this.rows.find('li.open').removeClass('open');
			this.rowsWrapper.removeClass('project-has-transition');
			this.animating = false;
		};

		Portfolio3D.prototype.checkScroll = function(scrollValue) {
			(scrollValue > 300) ? backToTopBtn.addClass('is-visible')
					: backToTopBtn.removeClass('is-visible cd-fade-out');
			this.scrolling = false;
		}

		Portfolio3D.prototype.showNewContent = function(index) {
			var self = this, direction = (index > self.visibleRowIndex) ? 'rightToLeft'
					: 'leftToRight', rotationParams = this
					.getRotationPrameters(direction), newVisibleFace = rotationParams[0], rotationY = rotationParams[1], translateZ = $(
					window).width() / 2;

			this.rows.each(function() {
				$(this).children('li').addClass('hidden').removeClass(
						'selected').eq(index).removeClass(
						'hidden left-face right-face back-face front-face')
						.addClass(newVisibleFace + '-face selected').end().eq(
								self.visibleRowIndex).removeClass(
								'hidden selected');
			});

			// if preserve3D is supported -> rotate projects
			isPreserve3DSupported ? this.setTransform(rotationY, translateZ)
					: self.animating = false;
			this.visibleFace = newVisibleFace;
			this.visibleRowIndex = index;
			this.rotationValue = rotationY;
		};

		Portfolio3D.prototype.getRotationPrameters = function(direction) {
			var newVisibleFace, rotationY;
			if (this.visibleFace == 'front') {
				newVisibleFace = (direction == 'rightToLeft') ? 'right'
						: 'left';
			} else if (this.visibleFace == 'right') {
				newVisibleFace = (direction == 'rightToLeft') ? 'back'
						: 'front';
			} else if (this.visibleFace == 'left') {
				newVisibleFace = (direction == 'rightToLeft') ? 'front'
						: 'back';
			} else {
				newVisibleFace = (direction == 'rightToLeft') ? 'left'
						: 'right';
			}

			if (direction == 'rightToLeft') {
				rotationY = this.rotationValue - 90;
			} else {
				rotationY = this.rotationValue + 90;
			}

			return [ newVisibleFace, rotationY ];
		};

		Portfolio3D.prototype.setTransform = function(rotationValue,
				translateValue) {
			var self = this;
			this.rows
					.each(function(index) {
						$(this).css(
								{
									'-moz-transform' : 'translateZ(-'
											+ translateValue + 'px) rotateY('
											+ rotationValue + 'deg)',
									'-webkit-transform' : 'translateZ(-'
											+ translateValue + 'px) rotateY('
											+ rotationValue + 'deg)',
									'-ms-transform' : 'translateZ('
											- +translateValue + 'px) rotateY('
											+ rotationValue + 'deg)',
									'-o-transform' : 'translateZ(-'
											+ translateValue + 'px) rotateY('
											+ rotationValue + 'deg)',
									'transform' : 'translateZ(-'
											+ translateValue + 'px) rotateY('
											+ rotationValue + 'deg)'
								});

						if (index == 2)
							$(this)
									.one(
											'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
											function() {
												$(this)
														.off(
																'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
												self.animating = false;
											});
					});
		};

		Portfolio3D.prototype.scrollProjectTop = function() {
			this.rows.children('li.selected.open').find('.project-wrapper')
					.animate({
						scrollTop : 0
					}, 300);
		}

		if ($('.cd-3d-portfolio').length > 0) {
			var portfolios3D = [];
			$('.cd-3d-portfolio').each(function() {
				// create a Portfolio3D object for each .cd-3d-portfolio
				portfolios3D.push(new Portfolio3D($(this)));
			});
		}

		var windowResize = false;
		// detect window resize - reset .cd-products-comparison-table properties
		$(window).on(
				'resize',
				function() {
					if (!windowResize) {
						windowResize = true;
						(!window.requestAnimationFrame) ? setTimeout(
								checkResize, 250) : window
								.requestAnimationFrame(checkResize);
					}
				});

		function checkResize() {
			portfolios3D.forEach(function(element) {
				// update transform values on resize
				element.setTransform(element.rotationValue,
						$(window).width() / 2);
			});

			windowResize = false;
		}

		backToTopBtn.on('click', function(event) {
			// scroll to the top of a project when clicking the backToTop button
			event.preventDefault();
			portfolios3D.forEach(function(element) {
				element.scrollProjectTop();
			});
		});
	}
//////////////////////////////////////////////////////////////////////////

// 아이디 가져오는 애
function getUserId(){
	$.ajax({
		url : "/api/login/data",
		method : "POST"
	}).done(function(result){
		CrntuserId = result.userId;
		$("#userId").val(result.name);
	});
}


//////// 컨펌 바꾸자
function confirmClick(thisConfirm){
		console.log("confirmclick");
		$.ajax({
			url : "/api/data/confirm",
			method : "POST",
			data : {
				IdxNum : IdxNum
			}
		}).done(function(result){
			console.log("컨펌 됨");
			thisConfirm.fadeOut();
//			refresh();
		})
	}
////////////////////////////////////////////

// WRITE 버튼잼
	$(".insertBtn").on("click", function(){
		$(".insertPanel").css("display","inherit");
		event.preventDefault();
		transitionLayer.addClass('visible opening');
		var delay = ( $('.no-cssanimations').length > 0 ) ? 0 : 600;
		setTimeout(function(){
			modalWindow.addClass('visible');
		}, delay);

		modalWindow.on('click', '.modal-close', function(event){
			event.preventDefault();
			transitionLayer.addClass('closing');
			modalWindow.removeClass('visible');
			transitionBackground.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
				transitionLayer.removeClass('closing opening visible');
				transitionBackground.off('webkitAnimationEnd oanimationend msAnimationEnd animationend');
			});
		});


	})

	//////////////////////////////////////////////
	//인서트 버튼

	$(".IdeaInsertBtn").on("click", function(){

		var userId = $("#userId").val();
		var title = $("#title").val();
		var contents = $("#contents").val();
		var fileId = $("#fileId").get(0);

		var data = new FormData();

		console.log("과연 코알라? "+fileName);

		data.append("userId",userId)
		data.append("title",title)
		data.append("contents",contents)

		for (var i=0;i<fileId.files.length;i++) {
			var fileName= fileId.files[0].name;
			var file = fileId.files[i];
			data.append(fileName, file);

		}
		console.log("뇨내 :");
		$.ajax({
			url : "/api/IdeaBoard/insert2",
			method : "POST",
			data : data,
			contentType : false,
			processData : false
		}).done(function(result){
			if(result > 0){
				alert("success");
				refresh();
				$(".modal-close").click();
			}else{
				alert("fail");
			}
		})
	})

	///////////////////////////////////////

	$(".IdeaCancelBtn").on("click", function(){
		$(".modal-close").click();
	})

	// 파일업로드
	///////////////////////////////////////////////////

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
    $("#dropbox").text("Uploading " + imgfile[0].name);
    console.log("img file name "+imgfile[0].name);

}
/////////////////////////////////////////////////////

$(".moveBtn").on("click", function(){
	location.href="/";
})

//////////////////////////////
function hitCount(){
	$.ajax({
		url : "/api/data/hitcnt",
		method : "POST",
		data : {
			IdxNum : IdxNum
		}
	}).done(function(result){
		if(result>0){
			console.log("들갔나바");
		}else{
			console.log("실패했나바");
		}
	})
	}


////////////////////////////////

function refresh(){
	$(".cd-3d-portfolio").html("");
	makeBtn(CrntPageNum);
	makeView(CrntPageNum);
}

	getUserId();
	getTotalCnt();
	makeBtn(CrntPageNum);
	makeView(CrntPageNum);
});