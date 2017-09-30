<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="HeaderCssJs/bootstrap.css" rel="stylesheet">
<!-- <link href="HeaderCssJs/bootstrap.min.css" rel="stylesheet"> -->
<script src="HeaderCssJs/jquery.js"></script>
<script src="HeaderCssJs/bootstrap.min.js"></script>
</head>
<style>
/*根據bootstrap.css內容加以覆寫的方式*/
.navbar-default .navbar-nav li a:hover {
	color: #fc3a63;
	position: relative; /* 當滑鼠經過超連結時，超連結往右下位移2像素 */
	top: 2px;
	left: 2px;
}

.navbar-default .navbar-nav li {
	padding-top:5px;
	
}

.navbar-default .navbar-nav>li>a:active {
	color: #000000;
}


nav {
	font-size: 18px;
	font-family: Microsoft JhengHei;
	font-weight: bold;
	
}

.navbar-default {
border:1px solid black;
	border-radius: 20px;
}

#padding img {
	margin-bottom: 5px; 
	padding-right: 10px;
}
#nopadding img {
	margin-bottom: 5px;
	
	 
}


</style>

<nav class="nav navbar-default navbar-fixed-top" >

	<div class="container" >
		<div class="navbar-header " >
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a href="#"><img src="HeaderCssJs/eLook_LOGO.png" height="75"
				 alt="e-Look"></a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar" >
			<!--底下放要縮放的內容-->
			<ul class="nav navbar-nav " id="padding" >
				<li><a href="#menu1"><img src="HeaderCssJs/003-coins.png"height="30">募資</a></li>
				<li><a href="#menu2"><img src="HeaderCssJs/002-team.png" height="30">線上課程</a></li>
				<li><a href="#menu2"><img src="HeaderCssJs/004-gift.png"height="30">免費課程</a></li>
				<li><a href="#menu2"><img src="HeaderCssJs/001-book.png" height="30">我要開課</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right" id="nopadding">
				<li><a href="#"><img src="HeaderCssJs/002-shopping-cart.png"height="30" /></a></li>
				<li><a href="#"data-toggle="modal" data-toggle="modal" data-target="#myModal"data-target="#myModal"><img src="HeaderCssJs/001-login.png"height="30" />登入</a></li>
			</ul>
		</div>
	</div>

</nav>