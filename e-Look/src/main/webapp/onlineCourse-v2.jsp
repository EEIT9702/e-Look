<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.*,com.e_Look.Course.*,com.e_Look.member.model.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
		String courseID=request.getParameter("CourseID");
	if(courseID!=null){
		CourseDAO dao= new CourseDAO();
		CourseVO courseVO= dao.findByPrimaryKey(Integer.valueOf(courseID));
		MemberService service=new MemberService();
		MemberVO memberVo=service.getMember(courseVO.getMemberID());
		List<CourseVO> list =dao.findBymemberID(courseVO.getMemberID(),2);
		pageContext.setAttribute("list",list);
		pageContext.setAttribute("courseVO",courseVO);
		pageContext.setAttribute("memberVo",memberVo);
		
	}
	%>
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
<style>
/* 影片區塊 */
video {
	width: 100%;
	height: 80%;
	padding-left: -15px;
	padding-right: -15px;
}

#videoArea {
	background-size: cover;
	background-position: center;
	height: 75%;
}

/* #videoArea>.col-md-12 { */
/* height: 100%; */
/* } */
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
	height: 80%;
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

#videoDivListStyle {
	border: 1px solid gray;
	height: 80%;
	padding-left: -15px;
	padding-right: -15px;
	background-color: rgba(0%, 10%, 20%, 0.3);;
}

#videoDivListStyle>div>h3 {
	color: white;
	text-align: center;
	font-weight: bold;
}
/* a:hover, a:focus { */
/* 	outline: none; */
/* 	text-decoration: none; */
/* } */
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
	color:white;
}
</style>
<script>
	function setControl() {
		var video = document.getElementById("vidoeControl");

		if (true) {
			video.controls = true;
		} else {
			video.controls = none;
		}
	}
</script>
</head>
<!-- 影片區 -->
<body oncontextmenu="window.event.returnValue=false">

	<jsp:include page="/login.jsp" flush="true" />
	<div class="container-fluid">
		<div class="container" style="background-color: gray;">
			<div class="row">

				<div class="col-md-12 " id="videoArea"
					style="background-image: url('<%=request.getContextPath() %>/CourseImage?CourseID=${courseVO.courseID}')">
					<h1 align="center" style="color: white">${courseVO.courseName}</h1>
					<div class="col-md-12">
						<div class="col-md-8 col-xs-12">
							<video poster="<%=request.getContextPath()%>/_Lyy/poster.png"
								id="vidoeControl">
								<source src="<%=request.getContextPath()%>/_Lyy/tri.mp4"
									type="video/mp4">
							</video>
						</div>
						<div class="col-md-4 col-xs-12" id="videoDivListStyle">
							<div>
								<h3>推薦課程</h3>
							</div>
							<ul id="videoliststyle">
							<c:forEach var="course"  items='${list}'>
								<c:if test="${course.soldPrice>0}">
								<li><a style="color: white;text-decoration: none;" href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${course.courseID}">${course.courseName}</a></li>
								</c:if>
								<c:if test="${course.soldPrice==0}">
								<li><a style="color: white;text-decoration: none;" href="<%=request.getContextPath() %>/freeCourse-v1.jsp?CourseID=${course.courseID}">course.courseName</a></li>
								</c:if>
								</c:forEach>
<!-- 								<li>線上課程</li> -->
<!-- 								<li>免費課程</li> -->
<!-- 								<li>我要開課</li> -->
<!-- 								<li>免費課程</li> -->
<!-- 								<li>我要開課</li> -->
<!-- 								<li>免費課程</li> -->
<!-- 								<li>我要開課</li> -->
<!-- 								<li>免費課程</li> -->
<!-- 								<li>我要開課</li> -->
<!-- 								<li>免費課程</li> -->
<!-- 								<li>我要開課</li> -->
<!-- 								<li>免費課程</li> -->
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
				<div class="col-md-1 col-xs-4" style="padding-top:15px">
					<img src="<%=request.getContextPath()%>/_Lyy/004-people.png"
						class="img-responsive center-block ">
					<h5 class="text-center">課程人數</h5>
				</div>
				<div class="col-md-1 col-xs-4" style="padding-top:15px">
					<img src="<%=request.getContextPath()%>/_Lyy/clock.png"
						class="img-responsive center-block">
					<h5 class="text-center">課程時間為</h5>
				</div>
				<form method="post" action="">
					<div class="col-md-1 col-xs-4" style="padding-top:15px">
						<a href=”#”> <img
							src="<%=request.getContextPath()%>/img/favorite.png"
							class="img-responsive center-block">
							<h5 class="text-center">加到最愛</h5>
					<input type="hidden" value="${courseVO.courseID}" name="courseID_favorite">
					</div>
					</a>
				</form>
				<div class="col-md-1 col-xs-4 ">
					<img src="<%=request.getContextPath()%>/_Lyy/share.png"
						class="img-responsive center-block">
					<div class="dropdown text-center" style="margin: 6px">
						<a data-toggle="dropdown">分享連結 <span class="caret"></a></span>
						<ul class="dropdown-menu">
							<li><a href="#">FaceBook</a></li>
							<li><a href="#">Google</a></li>
							<li><a href=”#”>Line</a></li>
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
									
<!-- 								<p>黑松企業是1925年由張氏家族所創立，創辦人張文杞先生受家庭環境影響，自小即有做生意的願望。 -->
<!-- 									1924年末於台北後火車站，鄭州路附近一家生產彈珠汽水的「尼可尼可」（ニコニコラムネ）商會有意出 -->
<!-- 									讓，文杞先生遂興起作汽水的念頭。於是文杞先生籌措大部分資金，買下「尼可尼可」商會設備，七位堂兄 -->
<!-- 									弟合股於1925年組成「進馨商會」，首創以「山型」為商標的「富士牌」汽水、及以三兄弟聯手創業圖案 -->
<!-- 									為商標的「三手牌」彈珠汽水，種下黑松企業的幼苗，當時由張文杞先生從事開發生產，其弟張有盛先生負 -->
<!-- 									責推銷業務，兄弟分工為汽水事業打拼，奠定黑松企業發展的基石。時序至今，黑松公司屹立台灣飲料市場 -->
<!-- 									近百年，始終秉持著創業第一代的經營理念，即為「誠實服務」，以核心的研發生產能力及良好的企業文化 -->
<!-- 									，在飲料的專業領域不斷創新及提升品質，並致力於經銷通路的經營，同時長期投入環保綠色行動，成為善 -->
<!-- 									盡社會責任、對環境友善的績優企業。</p> -->
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
								<div class="dropdown pull-right">
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
							
<!-- 								<div>本校為研究型大學，向以理工著稱，尤在電子、資通訊及光電等領域已佔世界頂尖領導之地位，另於優勢基礎 -->
<!-- 									之上，發展管理與科技領域之結合、開拓人文社會新興領域及開展國際客家文化。近年更結合既有優勢領域進入新 -->
<!-- 									興生醫電子領域並發展問題解決為取向之科技應用工程領域。.</div> -->
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
	<jsp:include page="/footer.jsp" />
</body>
</html>