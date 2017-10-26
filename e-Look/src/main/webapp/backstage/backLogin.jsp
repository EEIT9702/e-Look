<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>eLook後台管理系統</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<style>
	li{margin-bottom:10px;}
	</style>
	<body>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">

						<nav>
							<a href="#menu">登入</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<div class="inner">
						<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/backstage/adControl"
					enctype="multipart/form-data" style="display: inline;">
							<h2>登入</h2>
							<ul class="links">
								<li>帳號:<input type="text" name="adminID"></li>
								<li>密碼:<input type="text" name="adminPw"></li>
							</ul>
							<input type="submit" value="登入"> <input type="hidden"
						name="adID" id="sent" value=""> <input type="hidden"
						name="action" value="sent">
							<a href="#" class="close">Close</a>
						</FORM></div>
					</nav>

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<div class="logo"><span class="icon fa-diamond"></span></div>
							<h2>E-LOOK後台管理系統</h2>
							<p>請先登入會員<a href="#menu">Login</a></p>
						</div>
					</section>

				
			</div>

		<!-- Scripts -->
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>