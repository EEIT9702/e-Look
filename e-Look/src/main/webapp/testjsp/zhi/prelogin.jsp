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
	<a id="single_1"
		href="http://farm9.staticflickr.com/8140/30366640446_eb359921c5_b.jpg"
		title="Morning on Camaret (Tony N.)"> <img
		src="http://farm9.staticflickr.com/8140/30366640446_eb359921c5_m.jpg"
		alt="" />
	</a>
	<a id="single_2"
		href="http://farm1.staticflickr.com/756/22625719192_fdc3369588_b.jpg"
		title="Transparence (delphine.cury)"> <img
		src="http://farm1.staticflickr.com/756/22625719192_fdc3369588_m.jpg"
		alt="" />
	</a>
	<a id="single_3"
		href="http://farm9.staticflickr.com/8542/29466009773_a809b99d19_b.jpg"
		title="aletsch (|| | | gamma | | ||)"> <img
		src="http://farm9.staticflickr.com/8542/29466009773_a809b99d19_m.jpg"
		alt="" />
	</a>
	<a id="single_4"
		href="images/21297023_340207436431101_8092181138325372928_n.jpg"
		title="the forest at dawn (Luca-Anconetani)"> <img
		src="images/21297023_340207436431101_8092181138325372928_n.jpg"
		alt="" />
	</a>
	<a id="login" href="login2.html"> 登入 </a>

	<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/core.js"></script>
	<script type="text/javascript" src="js/fullscreen.js"></script>
	<script type="text/javascript" src="js/guestures.js"></script>
	<script type="text/javascript" src="js/hash.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.min.js"></script>
	<script type="text/javascript" src="js/media.js"></script>
	<script type="text/javascript" src="js/slideshow.js"></script>
	<script type="text/javascript" src="js/thumbs.js"></script>
	<script>
		$("#single_1").fancybox({
			helpers : {
				title : {
					type : 'float'
				}
			}
		});

		$("#single_2").fancybox({
			openEffect : 'elastic',
			closeEffect : 'elastic',

			helpers : {
				title : {
					type : 'inside'
				}
			}
		});

		$("#single_3").fancybox({
			openEffect : 'none',
			closeEffect : 'none',
			helpers : {
				title : {
					type : 'outside'
				}
			}
		});

		$("#single_4").fancybox({
			helpers : {
				title : {
					type : 'over'
				}
			}
		});
		$("#login").fancybox({
			helpers : {
				title : {
					type : 'over'
				}
			}
		});
	</script>
</body>
</html>