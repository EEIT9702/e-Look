<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>


<link href="<%=request.getContextPath()%>/css/documentation.css" />

<script src="<%=request.getContextPath()%>/js/raphael.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.classyled.min.js"></script>
<script>
	$(document).ready(function() {
		$(".col-md-4 a").click(function() {
			$(this).tab('show');
		});
	});
</script>

<style>
/* 影片區塊 */
video {
	width: 100%;
	height: 100%;

}

#videoArea {
	background-size: cover;
	background-position: center;
	height: 62%;
	
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

#videoDivListStyle {
	border: 1px solid gray;
	height: 100%;
	background-color: rgba(0%, 10%, 20%, 0.9);
	overflow-y: auto;
}

#videoDivListStyle>div>h4 {
	color: white;
	text-align: center;
	font-weight: bold;
}
#peopleNumber>div>p{
font-size: 18px;
 color: white
}
#priceGroup>div{
border-right: 1px solid white; 
border-left: 1px solid white
}
#priceGroup>div>div{
font-size: 18px; color: white;
}
.tab .nav-tabs {
	position: relative;
	border-bottom: none;
}

.tab .nav-tabs li {
	text-align: center;
	margin-right: 10px;
}

.tab .nav-tabs li a {
	display: block;
	font-size: 16px;
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

.star {
	-webkit-filter: grayscale(1);
}

.nstar {
	-webkit-filter: grayscale(0);
}
#messageHeader {
	border: 1px solid black;
	border-radius: 15px;
	font-size: 18px;
}

#messageHeader>img {
	width: 50px;
}
</style>
</head>
<!-- 影片區 -->
<body oncontextmenu="window.event.returnValue=false">
	<jsp:include page="/login.jsp" flush="true" />
	<div class="container-fluid">
		<div class="container">
			<div class="row">

			<h1 align="center" id="videoTitle">${courseVO.courseName}</h1>
				<div class="col-md-12 " id="videoArea"style="background-color:gray">

					<div class="col-md-12">
						<div class="col-md-8 col-xs-12" style="margin-right: -15px">
							
							<video controls="controls" id="vidoeControl" poster="<%=request.getContextPath()%>/_Lyy/videobackground.jpg">
								<source
									src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}"
									type="video/mp4">
							</video>
						</div>
						<div class="col-md-4 col-xs-12" id="videoDivListStyle">
							<div>
								<h4>募資進行中</h4>
								<div style="margin: 15px 0" id="peopleNumber">
									<div class="pull-left">
										<p >目標人數100人</p>
									</div>
									<div class="pull-right">
										<p >達成30%</p>
									</div>
									<div class="clearfix"></div>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 30%;"></div>
									</div>
								</div>
								<div style="margin: 15px 0">
									<div style="text-align: center; color: white">
										<p style="font-size: 18px; color: white">剩餘時間 ( 天:時:分:秒 ) </p>
									</div>
									<div class="led3  text-center "></div>
								</div>

								<div style="margin: 15px 0" id="priceGroup">
									<div class="col-md-6 ">
										<div class="text-left">原始價格</div>
										<div class="text-right"><s>NT1234</s></div>
									</div>
									<div class="col-md-6">
										<div class="text-left">募資價格</div>
										<div class="text-right">NT1000</div>
									</div>
								</div>
								<button type="button" class="btn-warning btn-lg"
									style="width: 100%; margin: 20px 0">我要加入募資</button>
								<div >
									<div class=" text-center"style="font-size: 18px; color: white">
										有興趣可以
										<div class="btn-group" >
											<button type="button" class="btn btn-default btn-sm dropdown-toggle"data-toggle="dropdown">分享連結 <span class="caret"></span></button>
											<ul class="dropdown-menu" style="position:absoulte;z-index:5555">
												<li><a href="#">FaceBook</a></li>
												<li><a href="#">Google</a></li>
											</ul>
											來加快募資速度唷
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--內容 -->

		<div class="demo" style="padding-top:50px">
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
								</c:if>
								<c:if test="${!empty courseVO.background}">
									<strong>需要具有哪些背景知識？</strong>
									<p>${courseVO.background}</p>
								</c:if>
								<c:if test="${!empty courseVO.ability}">
									<strong>上完課後，學生可以學到並做出的東西</strong>
									<p>${courseVO.ability}</p>
								</c:if>
								<c:if test="${!empty courseVO.targetgroup}">
									<strong>哪些人適合這堂課？</strong>
									<p>${courseVO.targetgroup}</p>
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
									<div class="col-md-1">
										<figure>
											<img
												src="<%=request.getContextPath() %>/Image?MemberID=${memberVo.memberID}"
												class="img-thumbnail pull-left">
											<div style="text-align: center;">${memberVo.mName}</div>
										</figure>
									</div>
								</c:if>
								<div class="pull-right">
									<c:if test="${!empty memberVo.aboutme}">
										<strong>關於我</strong>
										<p>${memberVo.aboutme}</p>
										<hr>
									</c:if>
									<c:if test="${!empty memberVo.skill}">
										<strong>專長</strong>
										<p>${memberVo.skill}</p>
										<hr>
									</c:if>
									<c:if test="${!empty memberVo.hobby}">
										<strong>興趣</strong>
										<p>${memberVo.hobby}</p>
									</c:if>
								</div>
							</div>
							<!-- 留言板 -->
							<!-- 留言板 -->
							<div role="tabpanel" class="tab-pane fade" id="Section3">
								<div class="col-md-12" id="messageHeader">
									<div class="col-md-1">
										<img src="<%=request.getContextPath()%>/img/imember_image.png"
											class="img-thumbnail pull-left">
									</div>
									<div class="col-md-11">

										<div>
											<span class="text-left">吳永志</span>

											<%
												Date dNow = new Date();
												SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
												out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
											%>
											<div class="dropdown pull-right">
												<button class="btn dropdown-toggle btn-default "
													type="button" data-toggle="dropdown" style="height: 30px">
													<span class="glyphicon glyphicon-option-horizontal"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a href="#">檢舉</a></li>
													<li><a href="#">修改</a></li>
													<li><a href="#">刪除</a></li>
												</ul>
											</div>

										</div>

										<div style="border-bottom: 1px solid black">

											<p>With Bootstrap 2, we added optional mobile friendly
												styles for key aspects of the framework. With Bootstrap 3,
												we've rewritten the project to be mobile friendly from the
												start. Instead of adding on optional mobile styles, they're
												baked right into the core. In fact, Bootstrap is mobile
												first. Mobile first styles can be found throughout the
												entire library instead of in separate files. To ensure
												proper rendering and touch zooming, add the viewport meta
												tag to your</p>
										</div>


										<div class="col-md-12">

											<div class="panel-group">
												<div class="panel">
													<div class="panel-heading">
														<h4 class="panel-title " style="padding-bottom: 10px">
															<a data-toggle="collapse" href="#collapse1">回應記錄</a>
														</h4>
													</div>
													<div id="collapse1" class="panel-collapse collapse ">
														<!--第一個回應 -->
														<div>
															<div class="col-md-1">
																<img
																	src="<%=request.getContextPath()%>/img/imember_image.png"
																	class="img-thumbnail pull-left">
															</div>
															<div class="col-md-11 "
																style="border-bottom: 1px solid black">
																<span>吳永志</span>
																<%
																	out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
																%>
																<div class="dropdown pull-right">
																	<button class="btn dropdown-toggle btn-default "
																		type="button" data-toggle="dropdown"
																		style="height: 30px">
																		<span class="glyphicon glyphicon-option-horizontal"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<li><a href="#">檢舉</a></li>
																		<li><a href="#">修改</a></li>
																		<li><a href="#">刪除</a></li>
																	</ul>
																</div>
																<p>With Bootstrap 2, we added optional mobile
																	friendly styles for key aspects of the framework. With
																	Bootstrap 3, we've rewritten the project to be mobile
																	friendly from the start. Instead of adding on optional
																	mobile styles, they're baked right into the core. In
																	fact, Bootstrap is mobile first. Mobile first styles
																	can be found throughout the entire library instead of
																	in separate files. To ensure proper rendering and touch
																	zooming, add the viewport meta tag to your</p>
															</div>
														</div>
														<!--第二個回應 -->
														<div>
															<div class="col-md-1">
																<img
																	src="<%=request.getContextPath()%>/img/imember_image.png"
																	class="img-thumbnail pull-left">
															</div>
															<div class="col-md-11 "
																style="border-bottom: 1px solid black">
																<span>吳永志</span>
																<%
																	out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
																%>
																<div class="dropdown pull-right">
																	<button class="btn dropdown-toggle btn-default "
																		type="button" data-toggle="dropdown"
																		style="height: 30px">
																		<span class="glyphicon glyphicon-option-horizontal"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<li><a href="#">檢舉</a></li>
																		<li><a href="#">修改</a></li>
																		<li><a href="#">刪除</a></li>
																	</ul>
																</div>
																<p>With Bootstrap 2, we added optional mobile
																	friendly styles for key aspects of the framework. With
																	Bootstrap 3, we've rewritten the project to be mobile
																	friendly from the start. Instead of adding on optional
																	mobile styles, they're baked right into the core. In
																	fact, Bootstrap is mobile first. Mobile first styles
																	can be found throughout the entire library instead of
																	in separate files. To ensure proper rendering and touch
																	zooming, add the viewport meta tag to your</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 			<!--回應輸入表格-->
										<div class="col-md-12">
											<div class="panel-group">
												<div class="panel">
													<div class="panel-heading">
														<h4 class="panel-title ">
															<a data-toggle="collapse" href="#collapse2">我要回應</a>
														</h4>
													</div>
													<div id="collapse2" class="panel-collapse collapse ">
														<div>
															<p>內容:</p>
															<form action="" method="post">
																<div class="form-group">
																	<textarea class="form-control" rows="5" id="comment"></textarea>
																</div>
																<div class="text-right">
																	<input type="submit">
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 點評收藏 -->
							</div>
							<div role="tabpanel" class="tab-pane fade" id="Section4"
								style="font-size: 20px">

								<p>喜歡的話記得幫我們評分還有收藏唷</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
<script>
	$('.led3').ClassyLED({
		type : 'countdown',
		format : 'ddd:hh:mm:ss',
		countTo : '2017:11:17',
		color : '#af0',
		backgroundColor : '	#272727',
		size : 4,
		fontType : 2,
	});
</script>
</html>