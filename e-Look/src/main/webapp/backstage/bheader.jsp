<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<%-- <script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script> --%>
		<title>eLook後台管理系統</title>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/demo.css" />
<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.css" />
</head>
<style>
nav li{
	font-size: 18px;

}
.mm-navbar{
background-color:	#5599FF;
}
.mm-menu .mm-navbar a{color:
#FFFFFF;
font-weight:bold;
}
.mm-listview>li>a{padding:60px 10px 60px 20px;}
.header{

margin-bottom: 45px;
}
</style>
<body>
		<div id="page">
			<div class="header">
				<a href="#menu"><span></span></a>
				管理者介面
			</div>
		
			<nav id="menu" style="font-size: 18px">
				<ul >
					<li><a href="#" style="background-color:#FFCCCC">會員管理</a></li>	
					<li><a href="event.jsp" style="background-color:#FFDDAA">活動管理</a></li>
					<li><a href="backAd.jsp"style="background-color: #FFFFBB">輪播管理</a></li>
			        <li><a href="#"style="background-color: #CCFF99">課程審查</a></li>
					<li><a href="#"style="background-color: #BBFFEE	">收益報表</a></li>
					<li><a href="back_report.jsp"style="background-color: #CCBBFF">檢舉管理</a></li>
					
				</ul>
			</nav>
		</div>
		<script type="text/javascript" src="js/jquery.mmenu.js"></script>
		<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu();
			});
		</script>
</body>
</html>