<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE >
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta charset="UTF-8">
<title>${SYSTEM.systemName} </title>

<link href="<%= request.getContextPath() %>/HeaderCssJs/bootstrap.css" rel="stylesheet">

<!-- <link href="HeaderCssJs/bootstrap.min.css" rel="stylesheet"> -->

<script src="<%= request.getContextPath() %>/HeaderCssJs/jquery.js"></script>
<script src="<%= request.getContextPath() %>/HeaderCssJs/bootstrap.min.js"></script>

<style>
/*根據bootstrap.css內容加以覆寫的方式*/
#myNavbar li a:hover {
	color: #fc3a63;
	position: relative; /* 當滑鼠經過超連結時，超連結往右下位移2像素 */
	top: 2px;
	left: 2px;
}
#myNavbar li {
	padding-top:5px;
	
}
#myNavbar li>a:active { 
	color: #000000;
}
#headerdav {
	font-size: 14px;
	font-family: Microsoft JhengHei;
	font-weight: bold;
}
#padding img {
	margin-bottom: 5px; 
	padding-right: 10px;
}
#nopadding img {
	margin-bottom: 5px;
}
body{
	padding-top:100px;
}
.maincontainer {
             max-width: 500px;
             margin:0 auto;
         }
</style>
</head>
<div class="maincontainer">

<nav class="nav navbar-default navbar-fixed-top " id="headerdav" >

	<div class="container"  >
		<div class="navbar-header " >
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>

			<a href="#"><img src="<%= request.getContextPath() %>/HeaderCssJs/eLook_LOGO.png" height="75"
				 alt="e-Look"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar" >
			<!--底下放要縮放的內容-->

			<ul class="nav navbar-nav " id="padding" >
				<li><a href="#menu1"><img src="<%= request.getContextPath() %>/HeaderCssJs/003-coins.png"height="30">募資</a></li>
				<li><a href="#menu2"><img src="<%= request.getContextPath() %>/HeaderCssJs/002-team.png" height="30">線上課程</a></li>
				<li><a href="#menu2"><img src="<%= request.getContextPath() %>/HeaderCssJs/004-gift.png"height="30">免費課程</a></li>
				<li><a href="#menu2"><img src="<%= request.getContextPath() %>/HeaderCssJs/001-book.png" height="30">我要開課</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right" id="nopadding">

				<li><a href="#"><img src="<%= request.getContextPath() %>/HeaderCssJs/002-shopping-cart.png"height="30" /></a></li>

				

				<li><a href="#"data-toggle="modal" data-target="#myModal"><img src="<%= request.getContextPath() %>/HeaderCssJs/001-login.png"height="30" />登入</a></li>

				
			</ul>
		</div>
	   </div>
	
</nav>
</div>

