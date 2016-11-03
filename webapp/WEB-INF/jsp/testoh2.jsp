<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Shuffle Text Effect with jQuery | Tutorialzine Demo</title>

        <!-- Our CSS stylesheet file -->
       <style>
.test-right{
float: right;
}
</style>
    </head>

    <body>
    <div class="test-right">
    <time class="timeago" datetime="2008-07-17T09:24:17Z">나 존나 쓸거야</time></div>
<!-- <script src="/static/plugins/startbootstrap/vendor/jquery/jquery.min.js"></script> -->
<script src="/static/plugins/jquery/jquery-3.1.0.min.js"></script>
<script src="/static/plugins/js/timeago.js"></script>
<script>
jQuery(document).ready(function() {
	console.log(new Date());
	$(".timeago").attr("datetime",new Date());
	  jQuery("time.timeago").timeago();
	});
</script>




    </body>
</html>