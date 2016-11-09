$(function() {
	var modalTrigger = $('.cd-modal-trigger'),
	transitionLayer = $('.cd-transition-layer'),
	transitionBackground = transitionLayer.children(),
	modalWindow = $('.cd-modal');
	var dbfileId = [];
	var list = [];
	var size = ["small", "medium", "large"];

		    function rndSize(){
		    	return size[Math.floor(Math.random()*3)];
		    }
		    function start(){
				var $sidescroll	= (function() {

						// the row elements
					var $rows			= $('#ss-container > div.ss-row'),
						// we will cache the inviewport rows and the outside viewport rows
						$rowsViewport, $rowsOutViewport,
						// navigation menu links
						$links			= $('#ss-links > a'),
						// the window element
						$win			= $(window),
						// we will store the window sizes here
						winSize			= {},
						// used in the scroll setTimeout function
						anim			= false,
						// page scroll speed
						scollPageSpeed	= 2000 ,
						// page scroll easing
						scollPageEasing = 'easeInOutExpo',
						// perspective?
						hasPerspective	= true,

						perspective		= hasPerspective && Modernizr.csstransforms3d,
						// initialize function
						init			= function() {

							// get window sizes
							getWinSize();
							// initialize events
							initEvents();
							// define the inviewport selector
							defineViewport();
							// gets the elements that match the previous selector
							setViewportRows();
							// if perspective add css
							if( perspective ) {
								$rows.css({
									'-webkit-perspective'			: 600,
									'-webkit-perspective-origin'	: '50% 0%'
								});
							}
							// show the pointers for the inviewport rows
							$rowsViewport.find('a.ss-circle').addClass('ss-circle-deco');
							// set positions for each row
							placeRows();

						},
						// defines a selector that gathers the row elems that are initially visible.
						// the element is visible if its top is less than the window's height.
						// these elements will not be affected when scrolling the page.
						defineViewport	= function() {

							$.extend( $.expr[':'], {

								inviewport	: function ( el ) {
									if ( $(el).offset().top < winSize.height ) {
										return true;
									}
									return false;
								}

							});

						},
						// checks which rows are initially visible
						setViewportRows	= function() {

							$rowsViewport 		= $rows.filter(':inviewport');
							$rowsOutViewport	= $rows.not( $rowsViewport )

						},
						// get window sizes
						getWinSize		= function() {

							winSize.width	= $win.width();
							winSize.height	= $win.height();

						},
						// initialize some events
						initEvents		= function() {

							// navigation menu links.
							// scroll to the respective section.
							$links.on( 'click.Scrolling', function( event ) {

								// scroll to the element that has id = menu's href
								$('html, body').stop().animate({
									scrollTop: $( $(this).attr('href') ).offset().top
								}, scollPageSpeed, scollPageEasing );

								return false;

							});

							$(window).on({
								// on window resize we need to redefine which rows are initially visible (this ones we will not animate).
								'resize.Scrolling' : function( event ) {

									// get the window sizes again
									getWinSize();
									// redefine which rows are initially visible (:inviewport)
									setViewportRows();
									// remove pointers for every row
									$rows.find('a.ss-circle').removeClass('ss-circle-deco');
									// show inviewport rows and respective pointers
									$rowsViewport.each( function() {

										$(this).find('div.ss-left')
											   .css({ left   : '0%' })
											   .end()
											   .find('div.ss-right')
											   .css({ right  : '0%' })
											   .end()
											   .find('a.ss-circle')
											   .addClass('ss-circle-deco');

									});

								},
								// when scrolling the page change the position of each row
								'scroll.Scrolling' : function( event ) {

									// set a timeout to avoid that the
									// placeRows function gets called on every scroll trigger
									if( anim ) return false;
									anim = true;
									setTimeout( function() {

										placeRows();
										anim = false;

									}, 10 );

								}
							});

						},
						// sets the position of the rows (left and right row elements).
						// Both of these elements will start with -50% for the left/right (not visible)
						// and this value should be 0% (final position) when the element is on the
						// center of the window.
						placeRows		= function() {

								// how much we scrolled so far
							var winscroll	= $win.scrollTop(),
								// the y value for the center of the screen
								winCenter	= winSize.height / 2 + winscroll;

							// for every row that is not inviewport
							$rowsOutViewport.each( function(i) {

								var $row	= $(this),
									// the left side element
									$rowL	= $row.find('div.ss-left'),
									// the right side element
									$rowR	= $row.find('div.ss-right'),
									// top value
									rowT	= $row.offset().top;

								// hide the row if it is under the viewport
								if( rowT > winSize.height + winscroll ) {

									if( perspective ) {

										$rowL.css({
											'-webkit-transform'	: 'translate3d(-75%, 0, 0) rotateY(-90deg) translate3d(-75%, 0, 0)',
											'opacity'			: 0
										});
										$rowR.css({
											'-webkit-transform'	: 'translate3d(75%, 0, 0) rotateY(90deg) translate3d(75%, 0, 0)',
											'opacity'			: 0
										});

									}
									else {

										$rowL.css({ left 		: '-50%' });
										$rowR.css({ right 		: '-50%' });

									}

								}
								// if not, the row should become visible (0% of left/right) as it gets closer to the center of the screen.
								else {

										// row's height
									var rowH	= $row.height(),
										// the value on each scrolling step will be proporcional to the distance from the center of the screen to its height
										factor 	= ( ( ( rowT + rowH / 2 ) - winCenter ) / ( winSize.height / 2 + rowH / 2 ) ),
										// value for the left / right of each side of the row.
										// 0% is the limit
										val		= Math.max( factor * 50, 0 );

									if( val <= 0 ) {

										// when 0% is reached show the pointer for that row
										if( !$row.data('pointer') ) {

											$row.data( 'pointer', true );
											$row.find('.ss-circle').addClass('ss-circle-deco');

										}

									}
									else {

										// the pointer should not be shown
										if( $row.data('pointer') ) {

											$row.data( 'pointer', false );
											$row.find('.ss-circle').removeClass('ss-circle-deco');

										}

									}

									// set calculated values
									if( perspective ) {

										var	t		= Math.max( factor * 75, 0 ),
											r		= Math.max( factor * 90, 0 ),
											o		= Math.min( Math.abs( factor - 1 ), 1 );

										$rowL.css({
											'-webkit-transform'	: 'translate3d(-' + t + '%, 0, 0) rotateY(-' + r + 'deg) translate3d(-' + t + '%, 0, 0)',
											'opacity'			: o
										});
										$rowR.css({
											'-webkit-transform'	: 'translate3d(' + t + '%, 0, 0) rotateY(' + r + 'deg) translate3d(' + t + '%, 0, 0)',
											'opacity'			: o
										});

									}
									else {

										$rowL.css({ left 	: - val + '%' });
										$rowR.css({ right 	: - val + '%' });

									}

								}

							});

						};

					return { init : init };

				})();

				$sidescroll.init();
		    }

			// //////////////////////////////////////////////////////////////////////////////////////////

          $.ajax({
        	  url : "/api/rankBoard",
        	  method : "POST"
          }).done(function(rankBoardList){
        	  list=rankBoardList;
        	  console.log(list.length);

    			for(var i = 0; i<=(list.length)-1; i++) {
    				var lrIdx = Math.floor(Math.random()*2);
    				var lrIdxrev = (Math.abs(lrIdx))-1;
    				//rankBoardList[i].fileId;

    				dbfileId.push(rankBoardList[i].fileId);
    				console.log(dbfileId);

    				if(lrIdxrev<0){
    					lrIdxrev=1;
    				}
    				var lrHTML = ["<a href='#' class='ss-circle ss-circle-"+i+" imgbtn-"+i+"'>"+i+"번그림잼</a>",
    				          "<h3><span>"+rankBoardList[i].regDate+"</span><a href='#' class='txtbtn-"+i+"'>"+rankBoardList[i].title+"</a></h3>"];
    				if(i==0||(i%5==0)){
    					var rankBoardHTMLbar = "";
    	    			rankBoardHTMLbar +=			"<div class='ss-row not-index'>"
    	    			rankBoardHTMLbar +=            "<div class='ss-left'>"
    	    			rankBoardHTMLbar +=                "<h2 id='btns"+(i+1)+"'>"+(i+1)+"위부터 "+(i+5)+"위까지</h2>"
    	    			rankBoardHTMLbar +=            "</div>"
    	    			rankBoardHTMLbar +=            "<div class='ss-right'>"
    	    			rankBoardHTMLbar +=                "<h2>축하합니다!!</h2>"
    	    			rankBoardHTMLbar +=            "</div>"
    	    			rankBoardHTMLbar +=        "</div>"
    	    			$(".ss-container").append(rankBoardHTMLbar);
    				}

    				var rankBoardHTML = "";
    			    rankBoardHTML +=        "<div class='ss-row ss-"+rndSize()+"'>"
    				rankBoardHTML +=            "<div class='ss-left'>"
    				rankBoardHTML +=                lrHTML[lrIdx];
    				rankBoardHTML +=            "</div>"
    				rankBoardHTML +=            "<div class='ss-right'>"
    				rankBoardHTML +=               lrHTML[lrIdxrev];
    				rankBoardHTML +=           "</div>"
    				rankBoardHTML +=        "</div>"
    				$(".ss-container").append(rankBoardHTML);

    			}
    			for(var i =0; i<30; i++){
    				if(dbfileId[i]==null||dbfileId[i]==undefined||dbfileId[i]=="NULL"){

    				}else{
    					$(".ss-circle-"+i).css("background-image","url(http://203.236.209.179:8180/file/"+dbfileId[i]+")")
    				}
    			}
    			afterClickEvent();
    			start();
          }).fail(function(){
        	  alert("1818");
          });


			function afterClickEvent(){
			$(".ss-row div> a, .ss-row div >h3").on("click",
			function(){

				console.log("아아아"+dbfileId);
				$(".ss-links").hide();
				console.log("check this : "+$(this).parent().html());
//				console.log($(".ss-row:not('.not-index')").index($(this).parent().parent()));
				var rkidx = $(".ss-row:not('.not-index')").index($(this).parent().parent());
				console.log("rkidx : "+rkidx);
				$(".cd-main-content h1").text(list[rkidx].title);
				$(".modal-content h1").text(list[rkidx].userId);
				$(".modal-content .pclass").text(list[rkidx].contents);
				console.log(dbfileId);
				if(dbfileId[rkidx]==null||dbfileId[rkidx]=="NULL"||dbfileId[rkidx]==undefined){
					$(".contents-image").css({"height":"10%"});
					$(".contents-image").text("등록된 이미지가 없습니다.");
				}else{
					$(".contents-image").css({"background-image": "url(http://203.236.209.179:8180/file/"+dbfileId[rkidx]+")", "height": "100%"});
				}


				event.preventDefault();
				transitionLayer.addClass('visible opening');
				var delay = ( $('.no-cssanimations').length > 0 ) ? 0 : 600;
				setTimeout(function(){
					modalWindow.addClass('visible');
				}, delay);

				modalWindow.on('click', '.modal-close', function(event){
					$(".ss-links").show();
					$(".contents-image").text("");
					$(".contents-image").css({"background-image": "none"})
					event.preventDefault();
					transitionLayer.addClass('closing');
					modalWindow.removeClass('visible');
					transitionBackground.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
						transitionLayer.removeClass('closing opening visible');
						transitionBackground.off('webkitAnimationEnd oanimationend msAnimationEnd animationend');
					});
				});





					}
				);
			}



		});