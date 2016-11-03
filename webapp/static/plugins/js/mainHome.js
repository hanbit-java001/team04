		$(function() {
			$("img").reflect();
			$('.photos').coverflow(
					{
						easing : 'easeOutElastic',
						duration : 'slow',
						index : 2,	//시작 이미지 넘버 0번 부터시작
						width : 320,
						height : 240,
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
									$(cover).children().children('img').data(
											'name')
											|| 'unknown');

						},
						select:function(event, cover, index){
							$(cover).click(function(){
								location.href = $(cover).children().children('img').data('url');
							})
						}

					});

			$(".photos").hover(function() {
				$("body").animate({'background-color' : 'rgba(0,0,0,0.9)','outline-color' : 'black'}, 'slow');
				$("#photos-info").fadeIn();
				$(".dream").css("color","#ffffff");
			}, function() {
				$("body").animate({
					'background-color' : 'rgba(255,255,255,1)',
					'outline-color' : 'white'
				}, 'slow');
				$(".dream").css("color","#000000");
				$("#photos-info").fadeOut();
			});

			function csshover() {
				$("body").animate({
					'background-color' : rgba(0, 0, 0, 0.5)
				}, 'slow');
			}


		})
