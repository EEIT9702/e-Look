<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/jquery.fancybox.min.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/fullscreen.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/core.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/slideshow.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/thumbs.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prelogin</title>
</head>
<body>
<ul class="list">
	<li>
		<a class="various fancybox.ajax" href="http://fancyapps.com/demo/ajax.txt">Ajax</a>
	</li>
	<li>
		<a class="various" data-fancybox-type="iframe" href="/demo/iframe.html">Iframe</a>
	</li>
	<li>
		<a class="various" href="#inline">Inline</a>
	</li>
	<li>
		<a class="various" href="http://www.adobe.com/jp/events/cs3_web_edition_tour/swfs/perform.swf">SWF</a>
	</li>
</ul>

<ul class="list">
	<li>
		<a class="various fancybox.iframe" href="http://www.youtube.com/embed/L9szn1QQfas?autoplay=1">Youtube (iframe)</a>
	</li>
	<li>
		<a class="various fancybox.iframe" href="http://maps.google.com/?output=embed&f=q&source=s_q&hl=en&geocode=&q=London+Eye,+County+Hall,+Westminster+Bridge+Road,+London,+United+Kingdom&hl=lv&ll=51.504155,-0.117749&spn=0.00571,0.016512&sll=56.879635,24.603189&sspn=10.280244,33.815918&vpsrc=6&hq=London+Eye&radius=15000&t=h&z=17">Google maps (iframe)</a>
	</li>
	<li>
		<a class="various" href="/data/non_existing_image.jpg">Non-existing url</a>
	</li>
</ul>


	<a id="login" class="various fancybox.iframe" href="login.txt"> 登入 </a>
	<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/core.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.min.js"></script>
	<script type="text/javascript" src="js/fullscreen.js"></script>
	<script type="text/javascript" src="js/guestures.js"></script>
	<script type="text/javascript" src="js/hash.js"></script>
	<script type="text/javascript" src="js/media.js"></script>
	<script type="text/javascript" src="js/slideshow.js"></script>
	<script type="text/javascript" src="js/thumbs.js"></script>
<!-- 	<script type="text/javascript" src="js/gulpfile.js"></script> -->
	<script>
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
		$(".various").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});

	
	
	</script>
</body>
</html>