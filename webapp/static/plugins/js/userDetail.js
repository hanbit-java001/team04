$(document).ready(function(){

var name ="";
var userId="";
var age;
var confirmCount;
var writeCount;
var boardNum;
var modalTrigger = $('.cd-modal-trigger'),
transitionLayer = $('.cd-transition-layer'),
transitionBackground = transitionLayer.children(),
modalWindow = $('.cd-modal');
var dbfileId = [];
var list = [];
var size = ["small", "medium", "large"];
		
//	    function rndSize(){
//	    	return size[Math.floor(Math.random()*3)];
//	    }
//	    function start(){
//			var $sidescroll	= (function() {
//					
//					// the row elements
//				var $rows			= $('#ss-container > div.ss-row'),
//					// we will cache the inviewport rows and the outside viewport rows
//					$rowsViewport, $rowsOutViewport,
//					// navigation menu links
//					$links			= $('#ss-links > a'),
//					// the window element
//					$win			= $(window),
//					// we will store the window sizes here
//					winSize			= {},
//					// used in the scroll setTimeout function
//					anim			= false,
//					// page scroll speed
//					scollPageSpeed	= 2000 ,
//					// page scroll easing
//					scollPageEasing = 'easeInOutExpo',
//					// perspective?
//					hasPerspective	= true,
//					
//					perspective		= hasPerspective && Modernizr.csstransforms3d,
//					// initialize function
//					init			= function() {
//						
//						// get window sizes
//						getWinSize();
//						// initialize events
//						initEvents();
//						// define the inviewport selector
//						defineViewport();
//						// gets the elements that match the previous selector
//						setViewportRows();
//						// if perspective add css
//						if( perspective ) {
//							$rows.css({
//								'-webkit-perspective'			: 600,
//								'-webkit-perspective-origin'	: '50% 0%'
//							});
//						}
//						// show the pointers for the inviewport rows
//						$rowsViewport.find('a.ss-circle').addClass('ss-circle-deco');
//						// set positions for each row
//						placeRows();
//						
//					},
//					// defines a selector that gathers the row elems that are initially visible.
//					// the element is visible if its top is less than the window's height.
//					// these elements will not be affected when scrolling the page.
//					defineViewport	= function() {
//					
//						$.extend( $.expr[':'], {
//						
//							inviewport	: function ( el ) {
//								if ( $(el).offset().top < winSize.height ) {
//									return true;
//								}
//								return false;
//							}
//						
//						});
//					
//					},
//					// checks which rows are initially visible 
//					setViewportRows	= function() {
//						
//						$rowsViewport 		= $rows.filter(':inviewport');
//						$rowsOutViewport	= $rows.not( $rowsViewport )
//						
//					},
//					// get window sizes
//					getWinSize		= function() {
//					
//						winSize.width	= $win.width();
//						winSize.height	= $win.height();
//					
//					},
//					// initialize some events
//					initEvents		= function() {
//						
//						// navigation menu links.
//						// scroll to the respective section.
//						$links.on( 'click.Scrolling', function( event ) {
//							
//							// scroll to the element that has id = menu's href
//							$('html, body').stop().animate({
//								scrollTop: $( $(this).attr('href') ).offset().top
//							}, scollPageSpeed, scollPageEasing );
//							
//							return false;
//						
//						});
//						
//						$(window).on({
//							// on window resize we need to redefine which rows are initially visible (this ones we will not animate).
//							'resize.Scrolling' : function( event ) {
//								
//								// get the window sizes again
//								getWinSize();
//								// redefine which rows are initially visible (:inviewport)
//								setViewportRows();
//								// remove pointers for every row
//								$rows.find('a.ss-circle').removeClass('ss-circle-deco');
//								// show inviewport rows and respective pointers
//								$rowsViewport.each( function() {
//								
//									$(this).find('div.ss-left')
//										   .css({ left   : '0%' })
//										   .end()
//										   .find('div.ss-right')
//										   .css({ right  : '0%' })
//										   .end()
//										   .find('a.ss-circle')
//										   .addClass('ss-circle-deco');
//								
//								});
//							
//							},
//							// when scrolling the page change the position of each row	
//							'scroll.Scrolling' : function( event ) {
//								
//								// set a timeout to avoid that the 
//								// placeRows function gets called on every scroll trigger
//								if( anim ) return false;
//								anim = true;
//								setTimeout( function() {
//									
//									placeRows();
//									anim = false;
//									
//								}, 10 );
//							
//							}
//						});
//					
//					},
//					// sets the position of the rows (left and right row elements).
//					// Both of these elements will start with -50% for the left/right (not visible)
//					// and this value should be 0% (final position) when the element is on the
//					// center of the window.
//					placeRows		= function() {
//						
//							// how much we scrolled so far
//						var winscroll	= $win.scrollTop(),
//							// the y value for the center of the screen
//							winCenter	= winSize.height / 2 + winscroll;
//						
//						// for every row that is not inviewport
//						$rowsOutViewport.each( function(i) {
//							
//							var $row	= $(this),
//								// the left side element
//								$rowL	= $row.find('div.ss-left'),
//								// the right side element
//								$rowR	= $row.find('div.ss-right'),
//								// top value
//								rowT	= $row.offset().top;
//							
//							// hide the row if it is under the viewport
//							if( rowT > winSize.height + winscroll ) {
//								
//								if( perspective ) {
//								
//									$rowL.css({
//										'-webkit-transform'	: 'translate3d(-75%, 0, 0) rotateY(-90deg) translate3d(-75%, 0, 0)',
//										'opacity'			: 0
//									});
//									$rowR.css({
//										'-webkit-transform'	: 'translate3d(75%, 0, 0) rotateY(90deg) translate3d(75%, 0, 0)',
//										'opacity'			: 0
//									});
//								
//								}
//								else {
//								
//									$rowL.css({ left 		: '-50%' });
//									$rowR.css({ right 		: '-50%' });
//								
//								}
//								
//							}
//							// if not, the row should become visible (0% of left/right) as it gets closer to the center of the screen.
//							else {
//									
//									// row's height
//								var rowH	= $row.height(),
//									// the value on each scrolling step will be proporcional to the distance from the center of the screen to its height
//									factor 	= ( ( ( rowT + rowH / 2 ) - winCenter ) / ( winSize.height / 2 + rowH / 2 ) ),
//									// value for the left / right of each side of the row.
//									// 0% is the limit
//									val		= Math.max( factor * 50, 0 );
//									
//								if( val <= 0 ) {
//								
//									// when 0% is reached show the pointer for that row
//									if( !$row.data('pointer') ) {
//									
//										$row.data( 'pointer', true );
//										$row.find('.ss-circle').addClass('ss-circle-deco');
//									
//									}
//								
//								}
//								else {
//									
//									// the pointer should not be shown
//									if( $row.data('pointer') ) {
//										
//										$row.data( 'pointer', false );
//										$row.find('.ss-circle').removeClass('ss-circle-deco');
//									
//									}
//									
//								}
//								
//								// set calculated values
//								if( perspective ) {
//									
//									var	t		= Math.max( factor * 75, 0 ),
//										r		= Math.max( factor * 90, 0 ),
//										o		= Math.min( Math.abs( factor - 1 ), 1 );
//									
//									$rowL.css({
//										'-webkit-transform'	: 'translate3d(-' + t + '%, 0, 0) rotateY(-' + r + 'deg) translate3d(-' + t + '%, 0, 0)',
//										'opacity'			: o
//									});
//									$rowR.css({
//										'-webkit-transform'	: 'translate3d(' + t + '%, 0, 0) rotateY(' + r + 'deg) translate3d(' + t + '%, 0, 0)',
//										'opacity'			: o
//									});
//								
//								}
//								else {
//									
//									$rowL.css({ left 	: - val + '%' });
//									$rowR.css({ right 	: - val + '%' });
//									
//								}
//								
//							}	
//						
//						});
//					
//					};
//				
//				return { init : init };
//			
//			})();
//			
//			$sidescroll.init();
//	    }



$(".btn-home").on("click",function(){
	location.href="/Home";
});
firstDetail();

//첫페이지 만드는 메소드
function firstDetail(){

$.ajax({
	url:"/api/board/userDetail",
	method:"POST"
}).done(function(result){
	name =result.name;
	userId=result.userId;
	age = result.age;
	confirmCount = result.confirmCount;
	writeCount = result.writeCount;
	fileId= result.fileId;

	if(fileId.toUpperCase()!='NULL'){
		$(".img-responsive").attr("src","http://localhost:8081/file/"+fileId);
	}

	$(".name-top div:nth-child(2)").text(name).css("font-size", 20);
	var changeAge = Math.floor(age/10);
	$(".user-ages span:nth-child("+changeAge+")").css("opacity" , 1);
	$(".emp2>div").text(confirmCount+"건").css("font-size",45);
	$(".emp1>div").text(writeCount+"건").css("font-size" , 45);

}).fail(function(){
	alert('실패');
});
}


// 작성한 글 메소드
function writeViewMenu(){

	var boardIdx="";
	var boardTitle="";
	var boardContents="";
	var boardRegdate="";


	$.ajax({
		url:"/api/userDetail/writeContents",
		method:"POST",
	}).done(function(result){
		$(".write-container-body").html(result);
		var innerHtml="";

		$(".write-container>h2").text(userId+"님의 작성문서");

		$(".write-container-body td:nth-child(1)").text(boardIdx);
		for(var i = 0 ; i< result.board_idx.length; i++){
			innerHtml+="<tr class='"+i+"'><td data-num='"+result.board_idx[i].boardIdx+"'>"+result.board_idx[i].boardIdx+"</td><td><div class='portal'>"
			+result.board_idx[i].title+"</td></div><td class='hideContents'><input type='text' class='form-control'></td><td class='contents'>"+result.board_idx[i].contents+"</td><td>"
			+result.board_idx[i].regDate+"</td><td><i class='fa fa-file-o fa-2x' aria-hidden='true' data-num='"+i+
					"'></i>  " +
					"<i class='fa fa-trash fa-2x' data-num='"+result.board_idx[i].boardIdx+
					"' aria-hidden='true'></i></td></tr>";
			
		}
//		console.log(result.board_idx.length%10==0);

		$(".write-container-body").html(innerHtml);

		$(".fa-trash").on("click",function(){

			 boardNum = Number($(this).attr("data-num"));
			 console.log(boardNum);
				if(confirm("정말 삭제하시겠습니까?")){
					$.ajax({
						url:"/api/userDetail/deleteIcon",
						data:{
							boardNum:boardNum
						},
						method:"POST"
					}).done(function(result){
						firstDetail();
						writeViewMenu();
					}).fail(function(){
						alert('실패욤');
					});

				}else{
					alert('다시시도하시오');
				}

			});

		$(".fa-file-o").on("click", function(){

			boardNum = Number($(this).attr("data-num"));
			
			console.log(boardNum);

//			console.log($(this).parent().parent("i").html(""));
			var michin = $(this).parent().parent("tr").html();
			console.log(michin);

			$(".write-container-body").html("");
			$(".write-container-body").html(michin);

//			$(".fa-file-o").toggle();

			$(".contents").hide();
			$("i").parent("td").html("");

			$(".hideContents").show();

			var Html ="<button class='btn btn-primary btn-modify'>수정하기</button>     <button class='btn btn-default btn-exit'>나가기</button>"

//				data-num='"+result.board_idx[i].boardIdx+"'	
				
//			input[type:text]

			$(".write-container-body td:nth-child(6)").html(Html);

			$(".form-control").val(result.board_idx[boardNum].contents);
			$(".form-control").focus();
			$(".form-control").select();
			

			//나가기 버튼 누를시 액션
			$(".btn-exit").click(function(){
				$(".write-container-body").html("");
				writeViewMenu();
//				$(".write-container-body").focus();
			})
			
			//수정버튼 누를시액션
			$(".btn-modify").click(function(){
				var modifycontents = $(".form-control").val();
				boardNum =Number($(".write-container-body td:nth-child(1)").text());
//				console.log(boardNum);
				$.ajax({
					url:"/api/userDetail/modify",
					data:{
						contents:modifycontents,
						boardNum:boardNum
					},
					method:"POST"
				}).done(function(result){
					if(result.modify==1){
						alert('수정완료');
						writeViewMenu();
						$(".container").height();
						$(".container").scrollTop();
						
					}
				}).fail(function(){
					alert('망망');
				});
			})


//			$.ajax({
//				url:"api/userDetail/modify",
//
//			})
		})
		
		
		$(".portal").on("click", function(){
	
			$(".modal").show();
			boardText = $(this).text();
			boardNum = $(this).parent().prev().attr("data-num");
//			console.log($(this).parent().find("td").first());
			
//			var boardNum1=$(this).attr("data-num");
//			console.log($("td").attr("data-num"));
//			console.log(boardNum);
			
			
	
//			console.log("check this : "+$(this).parent().html());
//			console.log($(".ss-row:not('.not-index')").index($(this).parent().parent()));
//			var rkidx = $(".ss-row:not('.not-index')").index($(this).parent().parent());
//			console.log(rkidx);
			$(".cd-main-content h1").text(boardNum);
			$(".modal-content h1").text('bb');
			$(".modal-content .pclass").text('cc');
			console.log(dbfileId);
			if(dbfileId[boardNum]==null||dbfileId[boardNum]=="NULL"||dbfileId[boardNum]==undefined){
				$(".contents-image").css({"height":"10%"});
				$(".contents-image").text("등록된 이미지가 없습니다.");
			}else{
				$(".contents-image").css({"background-image": "url(http://203.236.209.187:8180/file/"+dbfileId[(boardNum)]+")", "height": "100%"});
			}
			
			event.preventDefault();
			transitionLayer.addClass('visible opening');
			var delay = ( $('.no-cssanimations').length > 0 ) ? 0 : 600;
			setTimeout(function(){
				modalWindow.addClass('visible');
			}, delay);
			
			modalWindow.on('click', '.modal-close', function(event){
//				$(".ss-links").show();
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
			
			
			
			
			
//	$.ajax({
//		url:"/api/userDetail/detailView",
//		data:{
//			boardNum:boardNum
//		},
//		method:"POST"
//	}).done(function(result){
//			
//	}).fail(function(){
//		alert('망');
//	});
})

	});
}

/////////////////////////////////////////




$(".btn-writeList").on("click", function(){

	$(".write-container").toggle();

	writeViewMenu();

	});
});

