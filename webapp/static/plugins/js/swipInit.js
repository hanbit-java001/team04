var myElement = document.getElementById('photos');
		var hammer = new Hammer.Manager(myElement);
		var swipe = new Hammer.Swipe();
		hammer.add(swipe);
		var st = $(myElement).scrollTop();
		hammer.on('swipeleft', function() {
			if ($(".current").index() < $(".cover").last().index()) {
				$('.photos').coverflow('index', $(".current").index() + 1);
			} else {
				$('.photos').coverflow('index', $(".cover").last().index());
			}
		});

		hammer.on('swiperight', function() {
			if ($(".current").index() != 0) {
				$('.photos').coverflow('index', $(".current").index() - 1);
			}else{
				$('.photos').coverflow('index', 0);
			}
			console.log($(this).coverflow('index'));
		});