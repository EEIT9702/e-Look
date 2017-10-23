<%@page import="com.e_Look.shoppingCart.model.jdbc.ShoppingCartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.e_Look.member.model.*" %>
    <%	
    
    
    ShoppingCartDAO scdao=new ShoppingCartDAO(); 

	
	
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Insert title here</title> -->
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.css" rel="stylesheet">
<%-- <script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script> --%>
<style>
.navbar {
	background: rgba(255, 255, 255, 0.25);
	border: none;
	background: #8999A8;
}

.nav>li>a {
	border-bottom: 3px solid transparent;
}

.nav>li>a:focus, .nav>li>a:hover, .nav .open>a, .nav .open>a:focus, .nav .open>a:hover
	 {
	border-bottom: 3px solid transparent;
	background: none;
}

.navbar a,  .navbar-toggle {
	color: #fff;
}

.dropdown-menu {
	-webkit-box-shadow: none;
	box-shadow: none;
}

#navbar .nav li:hover:nth-child(4n+1), #navbar .nav li.active:nth-child(4n+1) {
	border-bottom: #C4E17F 3px solid;
}

#navbar .nav li:hover:nth-child(4n+2),#navbar .nav li.active:nth-child(4n+2) {
	border-bottom: #F7FDCA 3px solid;
}

#navbar .nav li:hover:nth-child(4n+3),#navbar .nav li.active:nth-child(4n+3) {
	border-bottom: #FECF71 3px solid;
}

#navbar .nav li:hover:nth-child(4n+4),#navbar .nav li.active:nth-child(4n+4) {
	border-bottom: #F0776C 3px solid;
}

.navbar-toggle .icon-bar {
	color: #fff;
	background: #fff;
}
body{
padding-top:80px;
}
#headerTextStyle{
font-family: Microsoft JhengHei;
font-size: 18px;
}
/*******ShoppingCartStyleStart***********/
.courseTitle {
	font-size: 20px;
	color: #3e3d3e;
	width: 70%;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	float: right;
}

.courseSubtitle {
	font-size: 16px;
	float: left;
}

.courseDelete {
	float: right;
	padding-right: 10px;
}

.cartrows {
	overflow-x: hide;
	overflow: auto;
	max-height: 40vh;
}

.cartrow {
	width: 90%;
	padding: 20px;
	border-bottom: 1px solid #cccccc;
	margin: auto
}

.cartrow img {
	width: 30%;
	height: 70px;
}

.close {
	float: none;
}

.cartcount {
	position: absolute;
	right: 5px;
	border: 1px solid #FFF;
	background: #F68867;
	color: #FFF;
	border-radius: 100px;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	z-index: 15;
	width: 20px;
	height: 20px;
}

/*******ShoppingCartStyleEnd***********/
</style>
</head>

	<div class="navbar-wrapper" id="headerTextStyle">
		<div class="container-fluid">
			<nav class="navbar navbar-fixed-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed black-center"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							
							<span class="sr-only"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a href="<%=request.getContextPath()%>/HOME.jsp"><img
							src="<%=request.getContextPath()%>/HeaderCssJs/eLook_LOGO.png"
							height="77" alt="e-Look"></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse" >
						<ul class="nav navbar-nav">
							<li style="padding-top:12px"><a href="#"><img
									src="<%=request.getContextPath()%>/HeaderCssJs/003-coins.png"
									height="28">募資</a></li>
							<li style="padding-top:12px"><a href="#"><img
									src="<%=request.getContextPath()%>/HeaderCssJs/002-team.png"
									height="28">線上課程</a></li>
							<li style="padding-top:12px"><a href="#"><img
									src="<%=request.getContextPath()%>/HeaderCssJs/004-gift.png"
									height="28">免費課程</a></li>
							<li style="padding-top:12px"><a
								href="<%=request.getContextPath()%>/CreateCourse.jsp"><img
									src="<%=request.getContextPath()%>/HeaderCssJs/001-book.png"
									height="28">我要開課</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<c:choose>
								<c:when test="${!empty LoginOK}">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="false"
										aria-expanded="false"><span class="cartcount">3</span><img style="margin-top:15px"
											src="<%=request.getContextPath()%>/HeaderCssJs/002-shopping-cart.png"
											height="26" /></a> <!-- 				以下為購物車內容 -->
										<ul class="dropdown-menu" style="width: 465px;">
											<li class="dropdown-header"
												style="border-bottom: 1px solid #aaaaaa;"><h3></h3></li>
											<!-- 				課程1 -->
										
											<c:forEach var="courseVO" items="shoppingCartList">
											<div class="cartrows">
												<div class="cartrow">
													<div style="text-align: right;">
														<div style="float: left; width: 80%; text-align: left;"></div>
														<button class="close" type="button" aria-hidden="true">&times;</button>
													</div>
													<img
														src="${courseVO.cPhoto }">
													<span class="courseTitle"><c:out value="${courseVO.cName }"/><br>
														<span class="courseSubtitle">科技,語言,IT</span> <span
														class="courseDelete"></span><br> <span
														class="courseDelete">$800</span>
													</span>
												</div>
												</c:forEach>
												<!-- 				課程2 -->
												<div class="cartrow">
													<div style="text-align: right;">
														<div style="float: left; width: 80%; text-align: left;"></div>
														<button class="close" type="button" aria-hidden="true">&times;</button>
													</div>
													<img
														src="<%=request.getContextPath()%>/Class Steps/imgs/請上傳課程封面.png">
													<span class="courseTitle">Java線上學習2xxxx<br> <span
														class="courseSubtitle">科技,語言</span> <span
														class="courseDelete"></span><br> <span
														class="courseDelete">$70</span>
													</span>
												</div>
												<div class="cartrow">
													<div style="text-align: right;">
														<div style="float: left; width: 80%; text-align: left;"></div>
														<button class="close" type="button" aria-hidden="true">&times;</button>
													</div>
													<img
														src="<%=request.getContextPath()%>/Class Steps/imgs/請上傳課程封面.png">
													<span class="courseTitle">Java線上學習2xxxx<br> <span
														class="courseSubtitle">科技,語言</span> <span
														class="courseDelete"></span><br> <span
														class="courseDelete">$70</span>
													</span>
												</div>
											</div>
											<div class="modal-body text-right">
												<div style="float: left;">共 3 筆課程</div>
												<span>總金額：940元</span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary btn-block">前往結帳</button>
											</div>
										</ul> 
										<!-- 				以上為購物車內容 --></li>
								</c:when>
								<c:otherwise>
									<li style="padding-top:13px"><a href="#"><img
											src="<%=request.getContextPath()%>/HeaderCssJs/002-shopping-cart.png"
											height="24" /></a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${!empty LoginOK}">
									<li class="dropdown "><a href="#" class=" dropdown-toggle"
										id="dropdownMenu1" data-toggle="dropdown"><img
											src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}"
											height="40" /><span class="caret"></span></a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li class="text-center"><a
												href="<%=request.getContextPath()%>/member/member.jsp"><img
													align="left"
													src="<%=request.getContextPath()%>/HeaderCssJs/member.png"
													height="26">會員中心</a></li>
											<li style="padding-top: 0px;" role="presentation"
												class="divider"></li>
											<li class="text-center"><a href="#"><img align="left"
													src="<%=request.getContextPath()%>/HeaderCssJs/wallet.png"
													height="26">我的消費</a></li>
											<li style="padding-top: 0px;" role="presentation"
												class="divider"></li>
											<li class=" text-center"><a onclick="signOut()"
												href="<%=request.getContextPath()%>/logout.do"><img
													align="left"
													src="<%=request.getContextPath()%>/HeaderCssJs/exit.png"
													height="26">登出</a></li>
										</ul></li>
								</c:when>
								<c:when test="${!empty loginerr}">
									<li style="padding-top:12px"><a href="#" data-toggle="modal" data-target="#myModal2"><img
											src="<%=request.getContextPath()%>/HeaderCssJs/001-login.png"
											height="26" />登入</a></li>
								</c:when>
								<c:when test="${empty err}">
									<li style="padding-top:12px"><a href="#" data-toggle="modal" data-target="#myModal"><img
											src="<%=request.getContextPath()%>/HeaderCssJs/001-login.png"
											height="26" />登入</a></li>
								</c:when>
								<c:otherwise>
									<li style="padding-top:12px"><a href="#" data-toggle="modal"	data-target="#myModal2"><img
											src="<%=request.getContextPath()%>/HeaderCssJs/001-login.png"
											height="26" />登入</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
