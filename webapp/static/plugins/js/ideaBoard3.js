$(function() {

	var totCnt;
	var CrntPageNum = 1;
	
	var EndBtnNum = ((((CrntPageNum-1)/3)+1)*3)+1;
	//////////////////////////////////
	
	//
	//
//	 $('.cd-3d-portfolio').click(function(){
//	        $('.cd-3d-portfolio')[0].reset();
//	  });
	

		// / 총 숫자 가져오는 애
	function getTotalCnt() {
		$.ajax({
			url : "/api/totCnt",
			method : "POST",
		}).done(function(totCnt) {
			totCnt = totCnt;

		})
	}
	
	
	var totPageNum = totCnt / 9;
	////////////////////////////////////
	// 버튼 그려주는 애
	function makeBtn(CrntPageNum){
		var PgOne = (CrntPageNum-1)*3+1;
		var PgTwo = PgOne+1;
		var PgThree = PgTwo+1;
		$(".PgOne").text("PAGE"+PgOne);
		$(".PgTwo").text("PAGE"+PgTwo);
		$(".PgThree").text("PAGE"+PgThree);
//		Btns(CrntPageNum);
	}
	
	function Btns(CrntPageNum){
		
	}
	////////////////////////////////
	$(".prevBtn").on("click", function(){
		CrntPageNum--;
		console.log("prevBtn :"+CrntPageNum);
		makeBtn(CrntPageNum);
		makeView(CrntPageNum);
		$(".ex li a").removeClass("selected");
		$(".ex li a").first().addClass("selected");
	});
	
	$(".aftBtn").on("click", function(){
		CrntPageNum++;
		console.log("aftBtn :"+CrntPageNum);
		$(".front-face").addClass("selected");
		makeBtn(CrntPageNum);
		makeView(CrntPageNum);
		$(".ex li a").removeClass("selected");
//		$(".cd-wrapper .ex li a").first().addClass("selected");
		$(".ex li a").first().click();
	});
	
	
		/////////////////////////////////////////////////////////
	// left - front - right
	
	// vo 9개 가져와서 그려주는 애
	function makeView(CrntPageNum){
	$.ajax({
				url : "/api/datas",
				method : "POST",
				data : {
					pageNum : CrntPageNum
				}
			}).done(function(result) {
				
				var loop = [1,4,7,2,5,8,3,6,9];
				
				var PgOne = (CrntPageNum-1)*3+1;
				var PgTwo = PgOne+1;
				var PgThree = PgTwo+1;
				
				for(var i = 0; i<=8; i++){
//					console.log("length : "+result.list.length+","+i);
//					console.log("loop : "+loop+","+i);
					if((result.list.length-1)<i){
						$(".project-"+loop[i]+" .project-image .project-title h2").text("default");
						$(".project-"+loop[i]+" .project-image .project-title").attr("disabled",true);
						$(".project-"+loop[i]+" .project-content div p").text("default");
					}else{
						$(".project-"+loop[i]+" .project-image .project-title h2").text(result.list[i].title);
						$(".project-"+loop[i]+" .project-image .project-title").attr("disabled",false);
						$(".project-"+loop[i]+" .project-content div p").text(result.list[i].contents);
					}
					$(".PgOne").text("PAGE"+PgOne);
					$(".PgTwo").text("PAGE"+PgTwo);
					$(".PgThree").text("PAGE"+PgThree);
					
				}
//				$(".row .selected").removeClass("selected");
//				$(".front-face").addClass("selected");
//						
//						$("li .selected").parent().click();
//						console.log($("li .selected").parent().html());
				mainjs();
				$(".row .selected").removeClass("right-face").addClass("front-face");
					})
//					Btns(CrntPageNum);
	}
	
	////////////////////////////////////////
	// 버튼 이벤트

	
//	pointer-events: none;
	function removeClick(){
//		$( "[disabled='disabled']" ).css({"opacity":"0.3"}).parent().css({"pointer-events":"none"}).parent().parent().attr("disabled",true).off("click");
		$( "[disabled='disabled']" ).parent().css({"pointer-events":"none"}).parent().parent().attr("disabled",true).off("click");
//		console.log($( "[disabled='disabled']" ).css({"opacity":"0.3"}).parent().parent().parent().parent().html());
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
	
	
	getTotalCnt();
	makeView(CrntPageNum);
//	Btns(CrntPageNum);
});