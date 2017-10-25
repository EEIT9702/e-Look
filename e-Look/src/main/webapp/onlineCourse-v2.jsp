<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"
	import="java.util.*,java.text.*,com.e_Look.Course.*,com.e_Look.member.model.*,com.e_Look.buyCourse.model.*,javax.servlet.http.HttpSession"%>
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
<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

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
	height: 83.2%;
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
	background-color: rgba(0%, 10%, 20%, 0.3);
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

.tab .nav-tabs {
	position: relative;
	border-bottom: none;
}

/* .tab .nav-tabs li { */
/* 	text-align: center; */
/* 	margin-right: 10px; */
/* } */
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
/* video::-webkit-media-controls { */
/*   display:none; */
/* } */
#messageHeader {
	border: 1px solid black;
	border-radius: 15px;
	font-size: 18px;
}

#messageHeader>img {
	width: 50px;
}

a:HOVER {
	color: white;
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
				<div class="col-md-12 " id="videoArea"
					style="background-image: url('<%=request.getContextPath() %>/CourseImage?CourseID=${courseVO.courseID}')">

					<div class="col-md-12">
						<div class="col-md-8 col-xs-12"  style="margin-right:-15px">

							<c:choose>
								<c:when test="${LoginOK.memberID==courseVO.memberID}">
									<video controls="controls" id="vidoeControl">
										<source
											src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}"
											type="video/mp4">
									</video>

								</c:when>
								<c:when test="${!empty LoginOK && !empty list2}">
									<video
										<c:forEach var="buycourse"  items='${list2}'>
							<c:choose>
								<c:when test="${courseVO.courseID==buycourse.courseID}">
							<c:set var="control" value="controls=controls" />
							<c:set var="boo" value="true" />
							</c:when>
							<c:when test="${!empty boo}">
							</c:when>
							<c:otherwise> 
								<c:set var="poster" value="poster=_Lyy/poster.png" />
								<c:set var="control" value=""/>
							</c:otherwise>
							</c:choose>
							</c:forEach>
										<c:out value="${poster}"/> <c:out value="${control}"/>
										id="vidoeControl">
										<source
											src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}"
											type="video/mp4">
									</video>
								</c:when>
								<c:otherwise>
									<video poster="<%=request.getContextPath()%>/_Lyy/poster.png"
										id="vidoeControl">
										<source
											src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}"
											type="video/mp4">
									</video>
								</c:otherwise>
							</c:choose>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">


				<div class="col-md-1 "></div>
				<div class="col-md-1 col-xs-4">
					<img src="<%=request.getContextPath()%>/_Lyy/004-people.png"
						class="img-responsive center-block ">
					<h5 class="text-center">課程人數</h5>
				</div>
				<div class="col-md-1 col-xs-4">
					<img src="<%=request.getContextPath()%>/_Lyy/clock.png"
						class="img-responsive center-block">
					<h5 class="text-center">課程時間為 ${courseVO.courseLength}min</h5>
				</div>
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
					<c:set var="favor" value="favoriteclick2"/>
				</c:if>
				
					<c:if test="${empty LoginOK}">
						<c:choose>
									<c:when test="${!empty loginerr}">
										<div class="col-md-1 col-xs-4">
										<a href="#" data-toggle="modal" data-target="#myModal2">
										<img src="<%=request.getContextPath()%>/img/favorite.png"class="img-responsive center-block">
										<h5 class="text-center">加到最愛</h5>
										</a>
										</div>
									</c:when>
									<c:when test="${empty err}">
									<div class="col-md-1 col-xs-4">
										<a href="#" data-toggle="modal" data-target="#myModal">
										<img src="<%=request.getContextPath()%>/img/favorite.png"class="img-responsive center-block">
										<h5 class="text-center">加到最愛</h5>
										</a>
										</div>
									</c:when>
									<c:otherwise>
									<div class="col-md-1 col-xs-4">
										<a href="#" data-toggle="modal"	data-target="#myModal2">
										<img src="<%=request.getContextPath()%>/img/favorite.png"class="img-responsive center-block">
										<h5 class="text-center">加到最愛</h5>
										</a>
										</div>
									</c:otherwise>
						</c:choose>
				</c:if>
				
				<c:if test="${!empty LoginOK}">
					<div class="col-md-1 col-xs-4">
						<img src="<%=request.getContextPath()%>/img/favorite.png"
							class="img-responsive center-block"> <a href="#"
							id="${favor}"><h5 class="text-center">加到最愛</h5></a>
					</div>
				</c:if>
				<input type="hidden" value="${courseVO.courseID}" id="mbcourseID" name="courseID">
				<input type="hidden" value="${LoginOK.memberID}" id="mbmemberID" name="memberID">

				<div class="col-md-1 col-xs-4 ">
					<img src="<%=request.getContextPath()%>/_Lyy/share.png"
						class="img-responsive center-block">
					<div class="dropdown text-center" style="margin: 6px">
						<a data-toggle="dropdown">分享連結 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">FaceBook</a></li>
							<li><a href="#">Google</a></li>
							<li><a href="#">Line</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-1 col-xs-4 ">
					<a href="#"> <img
						src="<%=request.getContextPath()%>/_Lyy/001-download.png"
						class="img-responsive center-block">
						<h5 class="text-center">講義下載</h5>
					</a>
				</div>
				<div class="col-md-1 col-xs-4">
					<a href="#"> <img
						src="<%=request.getContextPath()%>/img/warning.png"
						class="img-responsive center-block">
						<h5 class="text-center">影片檢舉</h5>
					</a>
				</div>
				<div class="col-md-2 col-xs-6 ">
					<h5>課程售價</h5>
					<h2 style="text-align: center; font-weight: bold;">NT${courseVO.soldPrice}</h2>
				</div>
				<div class="col-md-2 col-xs-6 center-block">
					<div style="width: 70px; margin: 0 auto">
						<img id="idstar1" class="star"
							src="<%=request.getContextPath()%>/star/ystar.png" /> <img
							id="idstar2" class="star"
							src="<%=request.getContextPath()%>/star/ystar.png" /> <img
							id="idstar3" class="star "
							src="<%=request.getContextPath()%>/star/ystar.png" /> <img
							id="idstar4" class="star "
							src="<%=request.getContextPath()%>/star/ystar.png" /> <img
							id="idstar5" class="star "
							src="<%=request.getContextPath()%>/star/ystar.png" />
					</div>
					<button type="button" class="btn btn-success center-block"
						style="width: 160px">加入購物車</button>
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
								<div class=" pull-right">
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
	<c:remove var="err" scope="session"/>
	<c:remove var="loginerr" scope="session"/>
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
			var flag1 = false;
			$('img').hover(over, out);
			function over() {
				if (!flag1) {
					var movein = this.id.substr(6);
					for (i = 1; i <= movein; i++) {
						document.getElementById("idstar" + i).className = "nstar";
						//	$('img:lt(i)').switchClass('s','n',1000);
					}
				}
			}
			function out() {
				if (!flag1) {
					var out = this.id.substr(6);
					for (u = 1; u <= out; u++) {
						document.getElementById("idstar" + u).className = "star";
						//	$('div img:nth-child(u)').switchClass('n','s',1000);
					}
				}
			}
			$('img').click(function() {
				if (!flag1) {
					flag1 = true
				}
				;
				// 			 document.getElementById("starnum").innerHTML = "你給" + this.id.substr(6) + "顆星";
				//	       $.get("Buycourse",{"name":"score","score":this.id.substr(6)});
			})
		})
	</script>
	<script>
		//判斷是否加入過最愛		
  var count=0;
		 $('#favoriteclick1').click(function() {
			alert('已經加入過囉');
		})
		
		$("#favoriteclick2").click(function() {

			console.log($("#mbcourseID").val())
			console.log($("#mbmemberID").val())
			if(count==0){
			$('#favoriteclick2').attr("id","favoriteclick1")
			 	$.post('MemberBookmarksInsertController', {
				'courseID' : $("#mbcourseID").val(),
				'memberID' : $("#mbmemberID").val()
			}, function() {
				alert('已經加到你的最愛囉');
				count++;
				})
			}else{
				alert('已經加入過囉');
			}

		})
	</script>
</body>
</html>