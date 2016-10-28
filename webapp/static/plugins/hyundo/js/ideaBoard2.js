$(function() {

	var totCnt=0;
	var CrntPageNum = 1;
	var totPageNum;
	//////////////////////////////////
	var dbtitle;
	var dbcontents;
	///////////////////////////
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
	// 버튼 그려주는 애
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
							
						for (var i = 1; i < 4; i++) {
							console.log((result.list.length));
							
							rowHTML += "<ul class='row'>"
							for (var j = 1; j < 4; j++) {
								var trnsNum = ((j - 1) * 3 + i) - 1;

								if(result.list.length > trnsNum){
									dbtitle = result.list[trnsNum].title;
									dbcontents = result.list[trnsNum].contents;
								}else{
									dbtitle = "default";
									dbcontents = "default";
								}
								
								rowHTML += cls[k];
								rowHTML += "<div class='project-wrapper'>";
								rowHTML += "<div class='project-image'>";
								rowHTML += "<div class='project-title'>";
								rowHTML += "<h2>title :  "
										+ dbtitle + "</h2>";
								rowHTML += "</div>";
								rowHTML += "</div>";
								rowHTML += "<div class='project-content'>";
								rowHTML += "<div>";
								rowHTML += "<p> contents : "
										+ dbcontents + "</p>";
								rowHTML += "</div>";
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
						Btnmovement();
						mainjs();
						$("body").fadeIn("slow");
					})
	}
	
	// 버튼이벤트
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
							function() {
								// open a new project
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
	
	
	// 글쓰기 부분
//	alert("1919");
	
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
	
	
	
	
	getTotalCnt();
	makeBtn(CrntPageNum);
	makeView(CrntPageNum);
});