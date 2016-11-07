$(function() {
	$(window).resize(function() {
		init();
	});
	function init() {
		if ($(window).width() <= 500) {

//			$("body").css("background-color", "red");
			$(".photos").css({
				"width" : "130%",
				"top" : "20%",
				"height" : "50%",
				"left" : "53%",
				"transform" : "translateX(-50%)"
			});
			$(".reflected").css({
				"width" : "140%"
			});
			$(".current").css({
				"width" : "50%",
			});
			$(".dream").css({
				"font-size" : "137%",
				"width" : "75%",
				"left":"41%",
				"text-align" : "center",
				"bottom" : "30%"
			})
			$("#photos-info").css({
				"display" : "inherit",
				"bottom" : "34%"
			})
			$("#photos-name").css({
				"font-size":"300%"
			})
			initCoverFlow(160, 120);
		} else {
			$("body").css("background-color", "#FFFFFF");
			initCoverFlow(320, 240);
		}
	}
	init();
	$("img").reflect();
	function initCoverFlow(screen_width, screen_height) {
		$('.photos').coverflow(
				{
					easing : 'easeOutElastic',
					duration : 'slow',
					index : 3, // 시작 이미지 넘버 0번 부터시작
					width : screen_width,
					height : screen_height,
					visible : 'density',
					selectedCss : {
						opacity : 1
					},
					outerCss : {
						opacity : .1
					},

					confirm : function() {
						console.log('Confirm');
					},

					change : function(event, cover, index) {
						$('#photos-name').text(
								$(cover).children().children('img')
										.data('name')
										|| 'unknown');
						if($('#photos-name').text().length>10){
							$('#photos-name').css("font-size","200%");
						}
						else{
							$('#photos-name').css("font-size","300%");
						}
						console.log("check length"+$('#photos-name').text()+" , "+$('#photos-name').text().length);

					},
					select : function(event, cover, index) {
						$(cover).click(
								function() {
									location.href = $(cover).children()
											.children('img').data('url');
								})
					},


				});
	}

	$(".photos").hover(function() {
		$("body").animate({
			'background-color' : 'rgba(0,0,0,0.9)',
			'outline-color' : 'black'
		}, 'slow');
		$("#photos-info").fadeIn();
		$(".dream").css("color", "#ffffff");
	}, function() {
		$("body").animate({
			'background-color' : 'rgba(255,255,255,1)',
			'outline-color' : 'white'
		}, 'slow');
		$(".dream").css("color", "#000000");
		$("#photos-info").fadeOut();
	});

	function csshover() {
		$("body").animate({
			'background-color' : 'rgba(0, 0, 0, 0.5)'
		}, 'slow');
	}

})
