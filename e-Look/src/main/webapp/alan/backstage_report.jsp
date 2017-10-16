<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/css/jquery.mmenu.js"></script>
		<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu();
			});
		</script>
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application" />
<link rel="Short Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/demo.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mmenu.css" />
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
</style>
<body>
		<div id="page">
			<div class="header">
				<a href="#menu"><span></span></a>
				管理者介面
			</div>
			<div class="content">
				<p><strong style="font-size: 50px">檢舉管理</strong></p><br/>
				<br>
				<br>
				<br>
					<p style="font-size:40px;line-height: 40px; font-weight: bolder;">管理人員須知：<br>
					確認網站的重要資訊。再次確認一下網站標題和網站描述是否<br>
					正確，不枉費你辛辛苦苦建立一個網站。網站描述不需要風花<br>
					雪月假文青去寫網站創立目標之類的文字，只需要簡單說明貴<br>
					公司所提供的產品或服務是哪些，通常這些文字也是主要的關<br>
					關鍵字，認真寫好這些關鍵字有很大的幫助。<br>
					</p>
			</div>
			<nav id="menu" style="font-size: 18px">
				<ul >
					<li><a href="backstage.jsp" style="background-color:#FFCCCC">管理員</a></li>
					<li><a href="#" style="background-color:#FFDDAA">活動管理</a></li>
					<li><a href="#"style="background-color: #FFFFBB">輪播管理</a></li>
			        <li><a href="#"style="background-color: #CCFF99">課程審查</a></li>
					<li><a href="#"style="background-color: #BBFFEE	">收益報表</a></li>
					<li><a href="backstage_report.jsp"style="background-color: #CCBBFF">檢舉管理</a></li>
					
				</ul>
			</nav>
		</div>
</body>
</html>