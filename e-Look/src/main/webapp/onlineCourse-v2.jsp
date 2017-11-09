<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.*,com.e_Look.Course.*,com.e_Look.member.model.*,com.e_Look.buyCourse.model.*,javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>${courseVO.courseName}</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/_PJC/css/step1.css"
	rel="stylesheet">

<!-- Sweet Alert -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/alan/sweet/sweetalert2.min.css">
<script
	src="<%=request.getContextPath()%>/alan/sweet/sweetalert2.min.js"></script>
<!-- 星星 -->
<script type="text/javascript"src="<%=request.getContextPath()%>/_Lyy/jquery.raty.min.js"></script>
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />
<!-- video.js -->
<script src="<%=request.getContextPath()%>/js/video.js"></script> 
<link href="<%=request.getContextPath()%>/css/video-js.css"rel="stylesheet">
<style>
/*  影片區塊  */
 video {
	width: 100%;
 	height: 100%; 
} 

#videoArea {
	background-size: cover;
	background-position: center;
	height: 519px;
	padding-left: 0;
}

#videoliststyle>li {
	height: 50px;
	font-size: 20px;
	list-style-type: none;
	border-bottom: 1px solid #8E8E8E;
	line-height: 50px;
}

#videoArea>div>div>ul {
	width: 100%;
	color: white;
	height: 85.2%;
	overflow-y: scroll;
	margin: 0;
	padding: 0;
}

video::-internal-media-controls-download-button {
	display: none;
}

video::-webkit-media-controls-enclosure {
	overflow: hidden;
}

video::-webkit-media-controls-panel {
	width: calc(100% + 30px); /* Adjust as needed */
}

#videoTitle {
	background-color: rgba(0%, 10%, 20%, 0.6);
	color: white;
}

#videoDivListStyle {
	border: 1px solid gray;
	height: 100%;
	background-color: rgba(0%, 10%, 20%, 0.3);;
}

#videoDivListStyle>div>h3 {
	color: white;
	text-align: center;
	font-weight: bold;
}
/* 下方功能 (簡介)*/
.tab .nav-tabs {
	position: relative;
	border-bottom: none;
}

.tab .nav-tabs li a {
	display: block;
	font-size: 18px;
	font-weight: 600;
	color: #444;
	padding: 10px 15px;
	background: transparent;
	margin-right: 0;
	border: none;
	border-radius: 0;
	overflow: hidden;
	position: relative;
	z-index: 1;
	transition: all 0.5s ease 0s;
}

.tab .nav-tabs li a:before {
	content: "";
	width: 100%;
	height: 3px;
	background: #de7921;
	position: absolute;
	top: 92%;
	left: 0;
	transition: all 0.3s ease 0s;
}

.tab .nav-tabs li a:hover:before, .tab .nav-tabs li.active a:before,
	.tab .nav-tabs li.active a:hover:before {
	top: 0;
}

.tab .nav-tabs li a:after {
	content: "";
	width: 100%;
	height: 100%;
	background: #fff;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: -1;
	transition: all 0.3s ease 0s;
}

.tab .nav-tabs li a:hover:after, .tab .nav-tabs li.active a:after, .tab .nav-tabs li.active a:hover:after
	{
	top: 0;
}

.nav-tabs li.active a, .nav-tabs li.active a:focus, .nav-tabs li.active a:hover,
	.nav-tabs li a:hover {
	border: none;
}

.tab .tab-content {
	padding: 30px 15px 20px;
	background: #fff;
	font-size: 14px;
	color: #555;
	line-height: 26px;
}

.tab .tab-content h3 {
	font-size: 24px;
	margin-top: 0;
}

/* 留言板 */
#messageHeader {
	border: 1px solid black;
	font-size: 18px;
}

#messageHeader>img {
	width: 50px;
}

/* 檢舉留言 */
#radioReporter {
	padding-left: 50px;
}

#radioReporter>span {
	font-size: 20px;
	padding-left: 5px;
}
/* <!--課程售價 --> */
#soldPrice {
	border-right: 1px solid #ADADAD;
	border-left: 1px solid #ADADAD;
}

a {
	text-decoration: none;
}

#videoArea::after {
	display: block;
	position: absolute;
	content: '';
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .5);
	padding: 0;
	margin: 0;
}
</style>
</head>
<!-- 影片區 -->
<body >
	<jsp:include page="/login.jsp" flush="true" />
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<h1 align="center" style="font-size:50px" id="videoTitle">${courseVO.courseName}</h1>
				<div class="col-md-12 " id="videoArea"style="background-image: url('<%=request.getContextPath() %>/CourseImage?CourseID=${courseVO.courseID}')">

					<input type="hidden" value="${courseVO.courseID}">
					<div class="col-md-12" style="z-index: 10">
						<div class="col-md-8 col-xs-12" style="margin-right: -15px; z-index: 10">
								<c:if test="${!empty LoginOK && !empty list2}">
									<c:if test="${LoginOK.memberID==courseVO.memberID}">
										<c:set var="bo" value="true"/>
									</c:if>
									<c:forEach var="buycourse"  items='${list2}' varStatus="varStatus">
										<c:choose>
											<c:when test="${!empty boo}"></c:when>
											<c:when test="${courseVO.courseID==buycourse.courseID || !empty bo}">
													<video id="my-video" class="video-js" data-setup="{}"  controls width="922%">
													<c:if test="${!empty courseVO.courseVideopathway}">
													    <source src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}" type='video/mp4'>
													</c:if>
													</video>
													<c:set var="boo" value="true" />
											</c:when>
										
											<c:when test="${empty boo && varStatus.last}">
												<video poster="<%=request.getContextPath()%>/_Lyy/poster.png"> 
				 									    <source src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}" type='video/mp4'> 
				 								</video>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${empty LoginOK}">
									<video poster="<%=request.getContextPath()%>/_Lyy/poster.png"> 
	 									    <source src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}" type='video/mp4'> 
	 								</video>
								</c:if>
						</div>
						<div class="col-md-4 col-xs-12" id="videoDivListStyle">
							<div>
								<h3>推薦課程</h3>
							</div>
							<ul id="videoliststyle">
								<c:forEach var="course" items='${list}'>
									<c:if test="${course.soldPrice>0}">
										<li><a style="color: white; text-decoration: none;"
											href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${course.courseID}">${course.courseName}</a></li>
									</c:if>
									<c:if test="${course.soldPrice==0}">
										<li><a style="color: white; text-decoration: none;"
											href="<%=request.getContextPath() %>/freeCourse-v1.jsp?CourseID=${course.courseID}">${course.courseName}</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 人數、時間 等等-->
	<div class="container" style="font-size: 18px">
		<div class="row">
			<div class="col-md-12" style="margin-top: 20px">
				<!--空-->
				<div class="col-md-1 "></div>
				<!--課程人數 -->
				<div class="col-md-1 col-xs-4">
					<img src="<%=request.getContextPath()%>/_Lyy/004-people.png"
						class="img-responsive center-block img-circle">
					<h5 class="text-center" style="font-size: 18px"id="buyStudentNumber"></h5>
				</div>
				<!--課程時間 -->
				<div class="col-md-1 col-xs-4">
					<img src="<%=request.getContextPath()%>/_Lyy/clock.png"
						class="img-responsive center-block img-circle ">
					<h5 class="text-center" style="font-size: 18px">${courseVO.courseLength}分鐘</h5>
				</div>
				<!--加到最愛 -->
				<c:if test="${!empty mBookmarkList}">
					<c:forEach items="${mBookmarkList}" var="memberBookmsrks">
						<c:choose>
							<c:when test="${courseVO.courseID==memberBookmsrks.courseID}">
								<c:set var="favor" value="favoriteclick1" />
								<c:set var="favor1" value="ture" />
							</c:when>
							<c:when test="${!empty favor1}">
							</c:when>
							<c:otherwise>
								<c:set var="favor" value="favoriteclick2" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
				<c:if test="${empty mBookmarkList}">
					<c:set var="favor" value="favoriteclick2" />
				</c:if>
				<c:if test="${empty LoginOK}">
					<c:choose>
						<c:when test="${!empty loginerr}">
							<div class="col-md-1 col-xs-4">
								<a href="#" data-toggle="modal" data-target="#myModal2"> <img
									src="<%=request.getContextPath()%>/img/favorite.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">加到最愛</h5>
								</a>
							</div>
						</c:when>
						<c:when test="${empty err}">
							<div class="col-md-1 col-xs-4">
								<a href="#" data-toggle="modal" data-target="#myModal"> <img
									src="<%=request.getContextPath()%>/img/favorite.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">加到最愛</h5>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-1 col-xs-4">
								<a href="#" data-toggle="modal" data-target="#myModal2"> <img
									src="<%=request.getContextPath()%>/img/favorite.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">加到最愛</h5>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${!empty LoginOK}">
					<div class="col-md-1 col-xs-4">
						<a href="#" id="${favor}"> <img
							src="<%=request.getContextPath()%>/img/favorite.png"
							class="img-responsive center-block img-circle">
							<h5 class="text-center" style="font-size: 18px">加到最愛</h5>
						</a>
					</div>
				</c:if>
				<input type="hidden" value="${courseVO.courseID}" id="mbcourseID">
				<input type="hidden" value="${LoginOK.memberID}" id="mbmemberID">
				<!--分享連結 -->
				<div class="col-md-1 col-xs-4 ">
					<div class="dropdown text-center">
						<a data-toggle="dropdown"><img
							src="<%=request.getContextPath()%>/_Lyy/share.png"
							class="img-responsive center-block img-circle"
							style="margin-bottom: 6px; text-decoration: none"> 分享連結 </a>
						<ul class="dropdown-menu">
							<li><a href="#">FaceBook</a></li>
							<li><a href="#">Google</a></li>
							<li><a href="#">Line</a></li>
						</ul>
					</div>
				</div>
				<!--講義下載 -->
				<div class="col-md-1 col-xs-4 ">
					<c:if test="${!empty courseVO.paper}">
						<a
							href="<%=request.getContextPath()%>/Paper?CourseID=${courseVO.courseID}">
							<img src="<%=request.getContextPath()%>/_Lyy/001-download.png"
							class="img-responsive center-block img-circle">
							<h5 class="text-center" style="font-size: 18px">講義下載</h5>
						</a>
					</c:if>
					<c:if test="${empty courseVO.paper}">
						<img src="<%=request.getContextPath()%>/_Lyy/001-download.png"
							class="img-responsive center-block img-circle">
						<h5 class="text-center" style="font-size: 18px">講義下載</h5>
					</c:if>
				</div>
				<!--影片檢舉 -->
				<c:if test="${empty LoginOK}">
					<c:choose>
						<c:when test="${!empty loginerr}">
							<div class="col-md-1 col-xs-4">
								<a href="#" href="#" data-toggle="modal" data-target="#myModal2">
									<img src="<%=request.getContextPath()%>/img/warning.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">影片檢舉</h5>
								</a>
							</div>
						</c:when>
						<c:when test="${empty err}">
							<div class="col-md-1 col-xs-4">
								<a href="#" href="#" data-toggle="modal" data-target="#myModal">
									<img src="<%=request.getContextPath()%>/img/warning.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">影片檢舉</h5>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-1 col-xs-4">
								<a href="#" href="#" data-toggle="modal" data-target="#myModal2">
									<img src="<%=request.getContextPath()%>/img/warning.png"
									class="img-responsive center-block img-circle">
									<h5 class="text-center" style="font-size: 18px">影片檢舉</h5>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${!empty LoginOK}">
					<div class="col-md-1 col-xs-4">
						<a class="reportAction" href="#" data-toggle="modal" data-target="#myModalReportVideo">
							<img src="<%=request.getContextPath()%>/img/warning.png"
							class="img-responsive center-block img-circle">
							<h5 class="text-center" style="font-size: 18px">影片檢舉</h5>
						</a>
						<input type="hidden" id="reportMemberID"
									value="${LoginOK.memberID}" /> <input type="hidden"
									id="reportCourseID" value="${courseVO.courseID}" />
					</div>
				</c:if>
				<!--課程售價 -->
				<div class="col-md-2 col-xs-6 " id="soldPrice">
					<h4>課程售價</h4>
					<h2 style="text-align: center; font-weight: bold;">NT${courseVO.soldPrice}</h2>
				</div>
				<!--星星 -->
				<div class="col-md-2 col-xs-6"
					style="height: 89px; border-right: 1px solid #ADADAD">

					<div id="starTatol" style="margin: 0 auto; padding-top: 10px">
						<span id="starText" class="pull-right"></span>
					</div>
					<!-- 		加入購物車 -->
					<c:if test="${empty LoginOK}">
						<c:choose>
							<c:when test="${!empty loginerr}">

								<button id="intoShoppingCart" type="button" data-toggle="modal"
									data-target="#myModal2" class="btn btn-success center-block"
									style="width: 160px">加入購物車</button>

							</c:when>
							<c:when test="${empty err}">


								<button id="intoShoppingCart" type="button" data-toggle="modal"
									data-target="#myModal" class="btn btn-success center-block"
									style="width: 160px">加入購物車</button>


							</c:when>
							<c:otherwise>

								<button id="intoShoppingCart" type="button" data-toggle="modal"
									data-target="#myModal" class="btn btn-success center-block"
									style="width: 160px">加入購物車</button>

							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<c:choose>
							<c:when test="${LoginOK.memberID==courseVO.memberID}">
								<button type="button" class="btn btn-success center-block "
									style="width: 160px" disabled="disabled">已擁有</button>
							</c:when>
							<c:when test="${!empty LoginOK && !empty list2}">
								<c:forEach var="buycourse" items='${list2}'
									varStatus="varStatus">
									<c:choose>
										<c:when test="${courseVO.courseID==buycourse.courseID}">
											<button type="button" class="btn btn-success center-block "
												style="width: 160px" disabled="disabled">已擁有</button>
											<c:set var="boo" value="true" />
										</c:when>
										<c:when test="${!empty boo}"></c:when>
										<c:when test="${varStatus.last && empty boo}">
											<button id="intoShoppingCart" type="button"
												class="btn btn-success center-block " style="width: 160px">加入購物車</button>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<button id="intoShoppingCart" type="button"
									class="btn btn-success center-block " style="width: 160px">加入購物車</button>
							</c:otherwise>
						</c:choose>

					</c:if>
					<!-- 加入購物車結束 -->

				</div>

			</div>
		</div>
	</div>
	<!--內容 -->

	<div class="demo">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="tab" role="tabpanel">

						<ul class="nav nav-tabs" role="tablist"
							style="background-color: #efd391">
							<li role="presentation" class="active"><a href="#Section1"
								aria-controls="home" role="tab" data-toggle="tab">課程簡介</a></li>
							<li role="presentation"><a href="#Section2"
								aria-controls="home" role="tab" data-toggle="tab">講師簡介</a></li>
							<li role="presentation"><a href="#Section3"
								aria-controls="profile" role="tab" data-toggle="tab">課程討論</a></li>
							<li role="presentation"><a href="#Section4"
								aria-controls="messages" role="tab" data-toggle="tab">點評收藏</a></li>
						</ul>
						<!-- 課程簡介 -->
						<div class="tab-content tabs">
							<div role="tabpanel" class="tab-pane fade in active"
								id="Section1" style="font-size: 20px">
								<c:if test="${!empty courseVO.preTool}">
									<strong>需要用到的工具（含種類、版本細節）</strong>
									<p>${courseVO.preTool}</p>
									<hr style="border:0.5px solid black">   
								</c:if>
								<c:if test="${!empty courseVO.background}">
									<strong>需要具有哪些背景知識？</strong>
									<p>${courseVO.background}</p>
									<hr style="border:0.5px solid black">  
								</c:if>
								<c:if test="${!empty courseVO.ability}">
									<strong>上完課後，學生可以學到並做出的東西</strong>
									<p>${courseVO.ability}</p>
									<hr style="border:0.5px solid black">  
								</c:if>
								<c:if test="${!empty courseVO.targetgroup}">
									<strong>哪些人適合這堂課？</strong>
									<p>${courseVO.targetgroup}</p>
									<hr style="border:0.5px solid black">  
								</c:if>
								<c:if test="${!empty courseVO.courseContent}">
									<strong>課程簡介</strong>
									<p>${courseVO.courseContent}</p>
									 
								</c:if>
							</div>
							<!-- 講師簡介 -->
							<div role="tabpanel" class="tab-pane fade" id="Section2"
								style="font-size: 20px">
								<c:if test="${!empty memberVo.memberID}">
									<div class="col-md-2 col-xs-3">
										<figure>
											<img
												src="<%=request.getContextPath() %>/Image?MemberID=${memberVo.memberID}"
												class="img-thumbnail center-block img-circle" />
											<div style="text-align: center">${memberVo.mName}</div>
										</figure>
										<div>

											<c:if test="${empty LoginOK}">
												<c:choose>
													<c:when test="${!empty loginerr}">
														<a href="#" data-toggle="modal" data-target="#myModal">
															<button type="button" class="btn btn-info"
																style="width: 100%">追蹤講師</button>
														</a>
													</c:when>
													<c:when test="${empty err}">
														<a href="#" data-toggle="modal" data-target="#myModal">
															<button type="button" class="btn btn-info"
																style="width: 100%">追蹤講師</button>
														</a>
													</c:when>
													<c:otherwise>
														<a href="#" data-toggle="modal" data-target="#myModal">
															<button type="button" class="btn btn-info"
																style="width: 100%">追蹤講師</button>
														</a>
													</c:otherwise>
												</c:choose>
											</c:if>

											<c:if test="${!empty LoginOK}">
												<c:if test="${!empty memberSubscription}">
													<c:forEach items="${memberSubscription}"
														var="memberSubscription">
														<c:choose>
															<c:when
																test="${memberSubscription.memberTrackID==courseVO.memberID}">
																<c:set var="disabled" value="disabled" />
																<c:set var="subName" value="已追蹤講師" />
																<c:set var="sub1" value="ture" />
															</c:when>
															<c:when test="${!empty sub1}">
															</c:when>
															<c:otherwise>
																<c:set var="disabled" value="" />
																<c:set var="subName" value="追蹤講師" />
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:if>
												<c:if test="${empty memberSubscription}">
													<c:set var="disabled" value="" />
													<c:set var="subName" value="追蹤講師" />
												</c:if>
												<c:if test="${courseVO.memberID==LoginOK.memberID}">
													<c:set var="disabled" value="disabled" />
													<c:set var="subName" value="本人" />
												</c:if>
												<button type="button" class="btn btn-info" ${disabled}
													style="width: 100%" id="subAction">${subName}</button>
												<input type="hidden" id="coursevoMemeberID"
													value="${courseVO.memberID}">
											</c:if>


										</div>
									</div>
								</c:if>
								<div class="col-md-10 col-xs-9">
									<c:if test="${!empty memberVo.aboutme}">
										<strong>關於我</strong>
										<p>${memberVo.aboutme}</p>
										<hr style="border:0.5px solid black"> 
									</c:if>
									<c:if test="${!empty memberVo.skill}">
										<strong>專長</strong>
										<p>${memberVo.skill}</p>
										<hr style="border:0.5px solid black"> 
									</c:if>
									<c:if test="${!empty memberVo.hobby}">
										<strong>興趣</strong>
										<p>${memberVo.hobby}</p>
									</c:if>
								</div>
							</div>
		<!-- 留言板 -->
							
							
			<div role="tabpanel" class="tab-pane fade" id="Section3">
					
	<!-- 留言板內容 -->
				<div class="col-md-12" id="messageHeader">
				<c:if test="${empty messageVOList}">					
						<c:if test="${empty LoginOK}">
							<div style="text-align:center"><h4>尚未有留言</h4></div>
							<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
							<div style="text-align:center"><img src="<%=request.getContextPath() %>/_Lyy/chat.png"></div>
							<div style="text-align:center"><h4>(需登入且有購買該課程者)</h4></div>
						</c:if>
						<c:if test="${!empty LoginOK}">
							<c:if test="${LoginOK.memberID==courseVO.memberID}">
								<c:set var="bo" value="true"/>
							</c:if>
							<c:forEach items="${list2}" var="buycourse" varStatus="varStatus">
								<c:choose>
								<c:when test="${!empty flag}"></c:when>
								<c:when test="${buycourse.courseID==courseVO.courseID||!empty bo}">
									<div class="col-md-12" id="inputMessage">
										<div style="text-align:center"><h4>尚未有留言</h4></div>
										<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
										<img  class="col-md-1 img-thumbnail"src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}"/>
										<div class="col-md-11"><textarea class="form-control inputMessage" rows="7" style="margin-left:30px"></textarea></div>
										<div class="text-right"><button class="text-right" style="margin:15px">送出</button></div>					
									</div>		
									<c:set var="flag" value="true"></c:set>
								</c:when>
								<c:when test="${varStatus.last && empty flag}">  
									<div style="text-align:center"><h4>尚未有留言</h4></div>
									<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
									<div style="text-align:center"><img src="<%=request.getContextPath() %>/_Lyy/chat.png"></div>
									<div style="text-align:center"><h4>(你還沒有購買該課程唷)</h4></div>
								</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${empty list2}">
									<div style="text-align:center"><h4>尚未有留言</h4></div>
									<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
									<div style="text-align:center"><img src="<%=request.getContextPath() %>/_Lyy/chat.png"></div>
									<div style="text-align:center"><h4>(你還沒有購買該課程唷)</h4></div>
							</c:if>
							
						</c:if>				
				</c:if>
				
				
				<c:if test="${!empty messageVOList}">		
				<c:forEach items="${messageVOList}" var="messageVO">
		<!--留言重複的地方開始 -->
					<c:if test="${messageVO.messageID_response==0}">
					
					<div class="col-md-1 col-xs-2">
						<img src="<%=request.getContextPath() %>/Image?MemberID=${messageVO.memberVO.memberID}"
							class="img-thumbnail pull-left">
					</div>
					<div class="col-md-11 col-xs-10">
						<div>
							<span id="testMessage1"  class="text-left" style="font-weight:900">${messageVO.memberVO.mName}</span>
							<fmt:parseDate value="${messageVO.mTime}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
							<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" var="messageDate"/>
							<span style="margin-left:20px">${messageDate}</span>
							<div class="dropdown pull-right">
								<button class="btn dropdown-toggle btn-default "
									type="button" data-toggle="dropdown" style="height: 30px">
									<span class="glyphicon glyphicon-option-horizontal"></span>
								</button>
								<ul class="dropdown-menu">
									<c:if test="${empty LoginOK}">
										<c:choose>
											<c:when test="${!empty loginerr}">
												<li><a href="#" data-toggle="modal"
													data-target="#myModal2">檢舉</a></li>
											</c:when>
											<c:when test="${empty err}">
												<li><a href="#"  data-toggle="modal"
													data-target="#myModal">檢舉</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="reportM" href="#" 
													data-toggle="modal" data-target="#myModal2">檢舉</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${!empty LoginOK}">
										<li><a class="reportMe" href="#">檢舉</a></li>
									</c:if>
									
								</ul>
							</div>
						</div>
						<div style="border-bottom: 1px solid black;padding-top:17px">	 
							<c:if test="${messageVO.status==1}">
							<p style="font-style:oblique">(注意:此留言違反社群規範，已屏蔽)</p>
							</c:if>
							<c:if test="${messageVO.status==0}">
							<p>${messageVO.mContent}</p>
							</c:if>
						</div>
						<input type="hidden"  value="${messageVO.messageID}" class="messageID">
						<input type="hidden"  value="${messageVO.status}" class="status">
					<!--抓取messageID -->
						
					<!--第一個回應 開始-->
						<div class="col-md-12">
							<div class="panel-group">
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title ">
											<a data-toggle="collapse" href="#${messageVO.messageID}">回應記錄</a>
										</h4>
									</div>
									<div id="${messageVO.messageID}" class="panel-collapse collapse mess">
									<!--第一個回應 內容-->
<!-- 										<div> -->
<!-- 											<div class="col-md-1"> -->
<%-- 												<img src="<%=request.getContextPath()%>/img/imember_image.png"class="img-thumbnail pull-left"> --%>
<!-- 											</div> -->
<!-- 											<div class="col-md-11"style="border-bottom: 1px solid black"> -->
<!-- 												<span>吳永志</span> -->
<!-- 												<span>時間</span> -->
<!-- 												<div class="dropdown pull-right"> -->
<!-- 												<button class="btn dropdown-toggle btn-default"type="button" data-toggle="dropdown" style="height: 30px"> -->
<!-- 												<span class="glyphicon glyphicon-option-horizontal"></span> -->
<!-- 												</button> -->
<!-- 												<ul class="dropdown-menu"> -->
<!-- 													<li><a class="reportM" href="#" data-toggle="modal" data-target="#myModal2">檢舉</a></li>								 -->
<!-- 													<li><a href="#">修改</a></li> -->
<!-- 												</ul> -->
<!-- 												</div> -->
<!-- 												<p><textarea>With Bootstrap 2, we added optional mobile</p> -->
<!-- 											</div> -->
<!-- 										</div> -->
										<!--第一個回應 內容結束-->					
									</div>
								</div>
							</div>
						</div>
						<!--第一個回應結束-->
						<!--回應輸入表格-->
						<c:if test="${!empty LoginOK}">
						<div class="col-md-12">  
							<div class="panel-group">
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title ">
									
											<c:forEach items="${list2}" var="buycourse1" varStatus="varStatus1">
												<c:choose>
<%-- 												<c:when test="${!empty msage1}"></c:when> --%>
												<c:when test="${buycourse1.courseID==courseVO.courseID}">
													<a data-toggle="collapse" href="#${messageVO.messageID+messageVO.messageID}" >回應<span class="glyphicon glyphicon-share-alt" style="margin-left:5px"></span></a>		
<%-- 													<c:set var="msage1" value="true"/> --%>
												</c:when>
												<c:when test="${varStatus1.last && empty msage1}">
											
												</c:when>
												</c:choose>
											</c:forEach>
<!-- 											<a data-toggle="collapse" href="#${messageVO.messageID+messageVO.messageID}">我要回應</a>	 -->
										</h4>
									</div>
									<div id="${messageVO.messageID+messageVO.messageID}" class="panel-collapse collapse">
										<div>
											<p>內容:</p>
											<div class="form-group">
												<textarea class="form-control" rows="5" id="comment"></textarea>
											</div>
											<div class="text-right">
												<button class="btn-default " id="inpContent" name="${messageVO.messageID}">送出</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					</div>
					
						<!-- 回應輸入表格結束-->
						</c:if>
					
					</c:forEach>
					<!-- 重複結束 -->
					<c:if test="${!empty LoginOK}">
<!-- 					判斷登入時有無購買課程 -->
							<c:forEach items="${list2}" var="buycourse" varStatus="varStatus">
								<c:choose>
								<c:when test="${!empty msage}"></c:when>
								<c:when test="${buycourse.courseID==courseVO.courseID}">
									<div class="col-md-12" id="inputMessage">
										<img class="col-md-1 img-thumbnail" style="margin-top:20px"src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}"/>
										<div class="col-md-11"><h4 style="margin-left:30px">留言內容</h4><textarea class="form-control inputMessage" rows="7" style="margin-left:30px"></textarea></div>
										<div class="text-right" style="margin-bottom:10px"><button  class="text-right" style="margin:15px" >送出</button></div>					
									</div>		
									<c:set var="msage" value="true"></c:set>
								</c:when>
								<c:when test="${varStatus.last && empty msage}">
									<div class="col-md-12">
										<img class="col-md-1 img-thumbnail" style="margin-top:20px"src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}"/>
										<div class="col-md-11" style="margin-bottom:10px"><h4 style="margin-left:30px">留言內容</h4><textarea class="form-control" rows="7" style="margin-left:30px" readOnly>(尚未購買)</textarea></div>
									</div>	
								</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${empty list2}">  
									<div class="col-md-12">
										<img  class="col-md-1 img-thumbnail" style="margin-top:20px"src="<%=request.getContextPath() %>/img/imember_image.png"/>
										<div class="col-md-11" style="margin-bottom:10px"><h4 style="margin-left:30px">留言內容</h4><textarea class="form-control" rows="7" style="margin-left:30px" readOnly>(您尚未登入或購買)</textarea></div>
									</div>
							</c:if>
						</c:if>
						<c:if test="${empty LoginOK}">
							<div class="col-md-12">
								<img  class="col-md-1 img-thumbnail" style="margin-top:20px"src="<%=request.getContextPath() %>/img/imember_image.png"/>
								<div class="col-md-11" style="margin-bottom:10px"><h4 style="margin-left:30px">留言內容</h4><textarea class="form-control" rows="7" style="margin-left:30px" readOnly>(您尚未登入或購買)</textarea></div>
							</div>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 留言板結束-->
							<!-- 點評收藏 -->
							<div role="tabpanel" class="tab-pane fade" id="Section4"
								style="font-size: 20px">
								<p>喜歡的話記得幫我們評分還有收藏唷</p>
								<span id="noLogin"></span>
								<div id="star"></div>
								<input type="hidden" value="${courseVO.memberID}"
									id="starMemberID">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="star"></div>
	<c:remove var="err" scope="session" />
	<c:remove var="loginerr" scope="session" />
	<jsp:include page="/footer.jsp" />
	<script>
		$(document).ready(function() {
			$(".col-md-4 a").click(function() {
				$(this).tab('show');
			});
		});
	</script>
	<script>
		$(function() {
			//點擊檢舉留言
			$('.reportMe').on('click', function() {
// 				alert($(this).parents('.dropdown').parent('div').nextAll('input').val())
				var mess2=$(this).parents('.dropdown').parent('div').nextAll('input').val()
				warning(mess2);
			})
			//選取檢舉留言功能
			function warning(mess2) {
				swal({
					title : '檢舉留言',
					input : 'select',
					inputOptions : {
						'含有仇恨言論' : '含有仇恨言論',
						'不雅內容' : '不雅內容',
						'垃圾訊息' : '垃圾訊息'
					},
					inputPlaceholder : '請選擇檢舉事項',
					confirmButtonText : '確認',
					cancelButtonText : '取消',
					showCancelButton : true,
					inputValidator : function(value) {
						return new Promise(function(resolve) {
							resolve();
						});
					}
				}).then(
						function(result) {
							if (result) {
								console.log( mess2);
								console.log($('#reportMemberID').val());
								console.log(result);
								$.post('InsertReportMessageController', {
									'reportContent' : result,
									'reportMemberID' : $('#reportMemberID').val(),
									'reportMessageID' : mess2
								})
								swal({
									confirmButtonText : '確認',
									type : 'success',
									html : '檢舉 ' + result + ' 成功，管理員會盡快審核 '
							});
						}
				});
			}
		})
	</script>
	<script>
//判斷是否加入過最愛		
		var count1 = 0;
		$('#favoriteclick1').click(function() {
			alert('已經加入過囉');
		})
		$("#favoriteclick2").click(function() {
// 			console.log($("#mbcourseID").val())
// 			console.log($("#mbmemberID").val())
			if (count1 == 0) {
				$('#favoriteclick2').attr("id", "favoriteclick1")
				$.post('MemberBookmarksInsertController', {
					'courseID' : $("#mbcourseID").val(),
					'memberID' : $("#mbmemberID").val()
				}, function() {
					alert('已經加到你的最愛囉');
					count1++;
				})
			} else {
				alert('已經加入過囉');
			}
		})
	</script>
	<script>
	$(function() {
		$('.reportAction').click(function() {
				warningV();
			})
			function warningV() {
				swal({
					title : '檢舉影片',
					input : 'select',
					inputOptions : {
						'該影片侵犯著作權' : '該影片侵犯著作權',
						'該影片含有不雅內容' : '該影片含有不雅內容',
						'該影片無法播放' : '該影片無法播放'
					},
					inputPlaceholder : '請選擇檢舉事項',
					confirmButtonText : '確認',
					cancelButtonText : '取消',
					showCancelButton : true,
					inputValidator : function(value) {
						return new Promise(function(resolve) {
							resolve();
						});
					}
				}).then(function(result) {
						if (result) {
			 				$.post("ReportCourseInsertController", {
		 					'reportMemberID' : $('#reportMemberID').val(),
		 					'reportCourseID' : $('#reportCourseID').val(),
		 					'radioReporterCon' : result
							})
							swal({
								confirmButtonText : '確認',
								type : 'success',
								html : '檢舉 ' + result + ' 成功，管理員會盡快審核 '
						});
					}
				});
			}	
		});
	</script>
	<script>
// 	追蹤講師
		var count = 0;
		$('#subAction').click(function() {
			if (count == 0) {
				$.post("MemberSubcriptionInsert_DeleteController", {
					'memberID' : $('#reportMemberID').val(),
					'memberTrackID' : $('#coursevoMemeberID').val()
				}, function() {
					alert('已加到您的追蹤講師囉');
					count++;
				});
				$('#subAction').attr('disabled', 'false')
				$('#subAction').text('已追蹤講師')
			} else {
				alert('已經追蹤過囉');
				$('#subAction').attr('disabled', 'false')
			}
		})
	</script>
	<script>
// 	星星點評
		$(function(){
			$('#star').raty(
				{
					path : 'img',
					width : 150,
					starOff : 'star-off-big.png',
					starOn : 'star-on-big.png',
					readOnly :function() {
						if ($('#reportMemberID').val() == ""|| $('#reportMemberID').val() == null) {//沒有登入
							$("#noLogin").text("(請先登入)")
							return true;
						}else{
						var memberID=$('#reportMemberID').val();
// 							console.log(getJson(memberID));
							return getJson(memberID);
					}
				},
					click : function(score, evt) {
						$.post('updateScoreController', {
							'score' : score,
							'memberID' : $('#reportMemberID').val(),
							'courseID' : $('#reportCourseID').val()
						})
						alert("感謝你的評分!");
					}
				});
		});
		function getJson(memberID) {
			var bool;
			$.ajax({'url':'/e-Look/countScoreController',
						'async' : false,
						'method' : "GET",
						'data' : {'memberID' : memberID
						},
						'success' : function(datas) {
							var datasJson = JSON.parse(datas);
// 							console.log(datasJson.length)
// 							console.log(datas);
// 							console.log($('#reportMemberID').val());
// 							console.log($('#starMemberID').val());
							if ($('#starMemberID').val() == $('#reportMemberID')
									.val()) {
								$("#noLogin").text("")
								bool = false
								return bool;
							} else if ($('#starMemberID').val() != $(
									'#reportMemberID').val()) {
								for (var i = 0; i <= (datasJson.length - 1); i++) {
									if (datasJson[i].courseID == $(
											'#reportCourseID').val()) {
										$("#noLogin").text("")
										bool = false
										return bool;
									}
								}
								$("#noLogin").text("(請先購買該課程)")
								bool = true;
								return bool;
							}
						}
					});//$.ajax end
			return bool;
		}
	</script>
	<script>
// 	顯示星星分數
		var scoreJSON;
		var value;
		$(function() {
			$.post('countScoreController', {
				'courseID' : $("#mbcourseID").val()
			}, function(data) {
				scoreJSON = JSON.parse(data);
				value = Math.ceil(parseFloat(scoreJSON));
				$('#starText').css({
					'font-size' : '12px',
					'padding-top' : '5px'
				}).text("(" + value + ")")
				$('#starTatol').raty({
					path : 'img',
					width : 160,
					starOff : 'star-off-big.png',
					starOn : 'star-on-big.png',
					readOnly : true,
					score : value,
				});
			});
		});
	</script>
	<script>
// 	購買課程人數
	$(function(){
		$.getJSON("/e-Look/BuyCourseNumber",{'courseID':$("#mbcourseID").val()},
				function(data){
					var buyStudentNumber=parseInt(data);
					$("#buyStudentNumber").text(buyStudentNumber+"人")
			})
	})
	</script>

		<script>
// 	留言版專區
		$(function(){
			message();	
					$('.panel-collapse>div').on('click','.text-right>.btn-default',function(){
// 	 				alert($(this).html());
					var $this=$(this)
// 	 				alert($this.parents('div').children('input').val())
// 	 				alert($this.parents('.panel-collapse').find('textarea').val())
					if($this.parents('.panel-collapse').find('textarea').val()==''){
						alert('請輸入留言')
					}else{
						$.post('/e-Look/InputMessageController',
								{'mContent':$this.parents('.panel-collapse').find('textarea').val(),
								 'courseID':$('#mbcourseID').val(),
								 'messageID_response':$this.parents('div').children('input').val(),
								 'memberID':$('#mbmemberID').val()},function(){				
								 message();	
								 $this.parents('.panel-collapse').find('textarea').val("")
								 var name=$this.attr('name');
								 $('#'+name).addClass("in");
						})
					}
					})
					$('#Section3').on('click','.reportM',function() {
							var mess=$(this).parents('ul').attr('id')
// 							alert(mess);
							warning(mess);
							//選取檢舉留言功能
							function warning(mess) {
								swal({
									title : '檢舉留言',
									input : 'select',
									inputOptions : {
										'含有仇恨言論' : '含有仇恨言論',
										'不雅內容' : '不雅內容',
										'垃圾訊息' : '垃圾訊息'
									},
									inputPlaceholder : '請選擇檢舉事項',
									confirmButtonText : '確認',
									cancelButtonText : '取消',
									showCancelButton : true,
									inputValidator : function(value) {
										return new Promise(function(resolve) {
											resolve();
										});
									}
								}).then(
										function(result) {
											if (result) {
												
												console.log(mess);
												console.log($('#reportMemberID').val());
												console.log(result);
												$.post('InsertReportMessageController', {
													'reportContent' : result,
													'reportMemberID' : $('#reportMemberID').val(),
													'reportMessageID' : mess
												})
												swal({
													confirmButtonText : '確認',
													type : 'success',
													html : '檢舉 ' + result + ' 成功，管理員會盡快審核 '
												});
										}
								});
							}
						})
			function message(){
			$('.mess').empty()
			$(".messageID").each(function(){
			
				$.getJSON('/e-Look/MessageController_v2',{'messageID':$(this).val()},function(responses){
					var fg = $(document.createDocumentFragment());
					
					$.each(responses,function(index,response){
// 					console.log(response);
					var div1=$('<div></div>').addClass('response')
					var div2=$('<div></div>').addClass('col-md-1 col-xs-2');
					var img1=$('<img></img').addClass('img-thumbnail pull-left').attr({'src':'<%=request.getContextPath()%>/Image?MemberID='+response.memberID,'style':'padding-top:10px'});
						div2.append(img1);
					var div3=$('<div></div>').addClass('col-md-11 col-xs-10').attr('style','border-bottom: 1px solid black;padding-top:10px;margin-bottom:20px')
					var span1=$('<span></span>').attr('style','font-weight:900').text(response.name)
					var span2=$('<span></span>').attr('style','margin-left:20px').text(response.mTime)
					
					var div4=$('<div></div>').addClass('dropdown pull-right').attr('style','margin-right:-30px')
							var button=$('<button></button>').addClass('btn dropdown-toggle btn-default').attr({'data-toggle':'dropdown','style':'height:30px'})
							var	span3=$('<span></span>').addClass('glyphicon glyphicon-option-horizontal')
					var ul=$('<ul></ul>').addClass("dropdown-menu").attr('id',response.messageID)
					var li1=$('<li></li>')
						
						if($('#mbmemberID').val()===''){
							var a1=$('<a></a>').attr('href','#').text('檢舉').attr({'data-toggle':'modal','data-target':'#myModal'})
						}else{
							var a1=$('<a></a>').attr('href','#').text('檢舉').addClass('reportM')
						}
							
// 					var li2=$('<li></li>')
// 					var a2=$('<a></a>').attr('href','#').text('修改')
					if(response.status==1){
						var p =$('<p></p>').text('(注意:此留言違反社群規範，已屏蔽)').attr('style','font-style:oblique')
					}else{
						var p =$('<p></p>').text(response.mContent)
					}
					
								li1.append(a1)
// 		 						li2.append(a2)
		 					ul.append(li1)
		 					button.append(span3)
 					div4.append([ul,button,p])
 					div3.append([div4,span1,span2,p])
 					div1.append([div2,div3])
					fg.append(div1)
					$('#'+response.messageID_response).append(fg);
						})
					})
				})	
			}	
		});

		//輸入留言
		$("#inputMessage>div>button").on('click',function(){
// 			alert($(this).parents('#inputMessage').find('.inputMessage').val());
			var valueText=$(this).parents('#inputMessage').find('.inputMessage').val()
			if(valueText==null||valueText==""){	
				alert("請輸入留言");
			}else{
				$.post('/e-Look/MessageController_v2',{'mContent':valueText,'memberID':$('#mbmemberID').val(),'courseID':$('#mbcourseID').val()},function(){
					$(this).parents('#inputMessage').find('.inputMessage').val("");
					window.location.replace(window.location.href);  
			})
			}
		})
		</script>
		<script>
		$(function(){
			$("button").on("click","td>button:nth-child(2)",function(){
				   var tds = $(this).parents('tr').find("td");
					  $('#ProductID').val(tds.eq(0).text())
					  $('#ProductID+span').text(tds.eq(0).text())
					  $('#ProductName').val(tds.eq(1).text())
					  $('#UnitPrice').val(tds.eq(2).text())
					  $('#UnitsInStock').val(tds.eq(3).text())
			   });
		})
		</script>
	</body>
</html>