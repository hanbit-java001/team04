$(document).ready(
		
		function() {
			var countAdd = 0;
			var userName = "";
			$.ajax({
				url : "/api/loginCheck",
				method : "GET"
			}).done(function(result) {
				console.log("check login -bong : " + result.isloggedIn);
				console.log("check name -bong : " + result.userName);
				userName = result.userName;
				console.log("test");
				if (result.isloggedIn) {

				} else {
					$("#btnModify a").text("login");
					$("#btnModify").on("click", function() {
						location.href = "/login";
					});
					// $("#btnAdd a").text("login").attr("href","/login");
				}
			})

			$('#btnModify').click(
					function() {
						if (countAdd % 2 == 0) {
							$.ajax({
								url : "modify/info",
								method : "GET",
								data : "bId=" + $("input[name='bId']").val(),
								success : function(origin) {
									console.log("check result : " + origin);
									console.log("네임이" + userName);
									console.log("check result : "
											+ origin.userName);
									$('#modifyForContent').load(
											'/static/html/modify2.html',
											function() {
												alert(origin.bId);
												$("input[name='bTitle']").val(
														origin.bTitle);
												$("input[name='bContent']")
														.val(origin.bContent);
												$("input[name='fake']").val(
														userName).attr(
																"disabled", true);
												$("input[name='bWriter']").val(
														userName);
												$("#bId").val(origin.bId);
											})
									$(this).html("Close");
								},
								error : function() {
									alert("modify form ajax error")
								}
							})
						} else {
							$('#writeForContent').empty();
							$(this).html("Modify");
						}
						countAdd++;
					});

			// $('#btnModify').on("click",function(){
			// var bId;
			// $.ajax({
			// url : "updateForm.do",
			// method : "GET",
			// data :{
			// bId : "bId="+$("input[name='bId]").val()
			// }
			// }).done(function(origin){
			// alert("1818");
			// console.log(origin);
			// })
			//		
			// })

			$('.info-container .post-time').each(function() {
				// Thu Nov 03 17:01:53 KST 2016
				var t = time_ago($(this).html() * 1);
				$(this).html(t);
			})
		});

function time_ago(time) {

	switch (typeof time) {
	case 'number':
		break;
	case 'string':
		time = +new Date(time);
		break;
	case 'object':
		if (time.constructor === Date)
			time = time.getTime();
		break;
	default:
		time = +new Date();
	}
	var time_formats = [ [ 60, 'seconds', 1 ], // 60
	[ 120, '1 minute ago', '1 minute from now' ], // 60*2
	[ 3600, 'minutes', 60 ], // 60*60, 60
	[ 7200, '1 hour ago', '1 hour from now' ], // 60*60*2
	[ 86400, 'hours', 3600 ], // 60*60*24, 60*60
	[ 172800, 'Yesterday', 'Tomorrow' ], // 60*60*24*2
	[ 604800, 'days', 86400 ], // 60*60*24*7, 60*60*24
	[ 1209600, 'Last week', 'Next week' ], // 60*60*24*7*4*2
	[ 2419200, 'weeks', 604800 ], // 60*60*24*7*4, 60*60*24*7
	[ 4838400, 'Last month', 'Next month' ], // 60*60*24*7*4*2
	[ 29030400, 'months', 2419200 ], // 60*60*24*7*4*12, 60*60*24*7*4
	[ 58060800, 'Last year', 'Next year' ], // 60*60*24*7*4*12*2
	[ 2903040000, 'years', 29030400 ], // 60*60*24*7*4*12*100, 60*60*24*7*4*12
	[ 5806080000, 'Last century', 'Next century' ], // 60*60*24*7*4*12*100*2
	[ 58060800000, 'centuries', 2903040000 ] // 60*60*24*7*4*12*100*20,
	// 60*60*24*7*4*12*100
	];
	var seconds = (+new Date() - time) / 1000, token = 'ago', list_choice = 1;

	if (seconds == 0) {
		return 'Just now'
	}
	if (seconds < 0) {
		seconds = Math.abs(seconds);
		token = 'from now';
		list_choice = 2;
	}
	var i = 0, format;
	while (format = time_formats[i++])
		if (seconds < format[0]) {
			if (typeof format[2] == 'string')
				return format[list_choice];
			else
				return Math.floor(seconds / format[2]) + ' ' + format[1] + ' '
						+ token;
		}
	return time;
}