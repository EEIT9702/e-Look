<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
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


<link href="<%=request.getContextPath()%>/css/documentation.css" />

<script src="<%=request.getContextPath()%>/js/raphael.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.classyled.min.js"></script>
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />
<!-- Sweet Alert -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/alan/sweet/sweetalert2.min.css">
<script
	src="<%=request.getContextPath()%>/alan/sweet/sweetalert2.min.js"></script>
<!-- video.js -->
<script src="<%=request.getContextPath()%>/js/video.js"></script> 
<link href="<%=request.getContextPath()%>/css/video-js.css"rel="stylesheet">
<style>
/* 影片區塊 */
video {
	width: 100%;
	height: 100%;
}

#videoArea {
	background-size: cover;
	background-position: center;
	height: 520px;
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

#peopleNumber>div>p {
	font-size: 18px;
	color: white
}

#priceGroup>div {
	border-right: 1px solid white;
	border-left: 1px solid white
}

#priceGroup>div>div {
	font-size: 18px;
	color: white;
}
/* 下方功能 (簡介)*/
.tab .nav-tabs {
	position: relative;
	border-bottom: none;
}

.tab .nav-tabs li {
	text-align: center;
/* 	margin-right: 10px; */
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
	border-radius: 15px;
	font-size: 18px;
}

#messageHeader>img {
	width: 50px;
}

#videoTitle {
	background-color: rgba(0%, 10%, 20%, 0.6);
	color: white;
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
				<div class="col-md-12 " id="videoArea"
					style="background-image: url('<%=request.getContextPath() %>/CourseImage?CourseID=${courseVO.courseID}')">
					<div class="col-md-12">
						<div class="col-md-8 col-xs-12" style="margin-right:-1px">
							<video id="my-video" class="video-js" data-setup="{}"  controls width="924%">
							    <c:if test="${!empty courseVO.courseVideopathway}">
								    <source src="<%=request.getContextPath()%>/${courseVO.courseVideopathway}" type='video/mp4'>
								</c:if>
							</video>
						</div>
						<div class="col-md-4 col-xs-12" id="videoDivListStyle">
							<div>
								<h2 style="color: white; text-align: center">募資進行中</h2>
								<div style="margin: 15px 0" id="peopleNumber">
									<div class="pull-left">
										<p style="font-size: 22px">目標人數${courseVO.targetStudentNumber}人</p>
									</div>
									<div class="pull-right">
										<p style="font-size: 22px" id="targetPersent"></p>
									</div>
									<div class="clearfix"></div>
									<div class="progress ">
										<div class="progress-bar progress-bar-striped active"
											role="progressbar" aria-valuemin="0" aria-valuemax="100"
											id="targetBar"></div>
									</div>
								</div>
								<div style="margin: 15px 0">
									<div style="text-align: center; color: white">
										<p style="font-size: 22px; color: white">剩餘時間 ( 天:時:分:秒 )
										</p>
									</div>
									<div class="led3  text-center "></div>
								</div>

								<div style="margin: 15px 0" id="priceGroup">
									<div class="col-md-6 ">
										<div class="text-left" style="font-size: 22px">原始價格</div>
										<div class="text-right"
											style="font-size: 22px">NT<span style="text-decoration: line-through;font-size: 22px">${courseVO.soldPrice}</span></div>
									</div>
									<div class="col-md-6">
										<div class="text-left" style="font-size: 22px">募資價格</div>
										<div class="text-right" style="font-size: 22px"id="price"></div>
									</div>
								</div>
								<c:if test="${empty LoginOK}">
									<c:choose>
										<c:when test="${!empty loginerr}">
											<button type="button" class="btn-warning btn-lg"
												data-toggle="modal" data-target="#myModal" id="intoShoppingCart"
												style="width: 100%; font-size: 22px; margin: 20px 0">我要加入募資</button>
										</c:when>
										<c:when test="${empty err}">
											<button type="button" class="btn-warning btn-lg"
												data-toggle="modal" data-target="#myModal" id="intoShoppingCart"
												style="width: 100%; font-size: 22px; margin: 20px 0">我要加入募資</button>


										</c:when>
										<c:otherwise>
											<button type="button" class="btn-warning btn-lg"
												data-toggle="modal" data-target="#myModal" id="intoShoppingCart"
												style="width: 100%; font-size: 22px; margin: 20px 0">我要加入募資</button>
										</c:otherwise>
									</c:choose>
								</c:if>
							<c:if test="${!empty LoginOK}">
									<c:choose>
										<c:when test="${LoginOK.memberID==courseVO.memberID}">
											<button type="button" class="btn-warning btn-lg"
												style="width: 100%; font-size: 22px; margin: 20px 0"
												disabled="disabled">已募資</button>
										</c:when>
										<c:when test="${!empty LoginOK && !empty list2}">
											<c:forEach var="buycourse" items='${list2}'
												varStatus="varStatus">
												<c:choose>
													<c:when test="${courseVO.courseID==buycourse.courseID}">
														<button type="button" class="btn-warning btn-lg"
															style="width: 100%; font-size: 22px; margin: 20px 0"
															disabled="disabled">已募資</button>

														<c:set var="boo" value="true" />
													</c:when>
													<c:when test="${!empty boo}"></c:when>
													<c:when test="${varStatus.last && empty boo}">
														<button type="button" class="btn-warning btn-lg" id="intoShoppingCart"
															style="width: 100%; font-size: 22px; margin: 20px 0">我要加入募資</button>
													</c:when>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-warning btn-lg" id="intoShoppingCart"
												style="width: 100%; font-size: 22px; margin: 20px 0">我要加入募資</button>
										</c:otherwise>
									</c:choose>
								</c:if>
								<div style="color:white;font-size:20px;text-align:center">預計課程上架時間${courseVO.courseStartDate}</div> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--內容 -->

	<div class="demo" style="margin-top: 80px">
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
									<div class="col-md-2 col-xs-3">
										<figure>
											<img
												src="<%=request.getContextPath() %>/Image?MemberID=${memberVo.memberID}"
												class="img-thumbnail center-block img-circle"  />
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
													<c:forEach items="${memberSubscription}" var="memberSubscription">
														<c:choose>
															<c:when	test="${memberSubscription.memberTrackID==courseVO.memberID}">
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
												<button type="button" class="btn btn-info" ${disabled} style="width: 100%" id="subAction">${subName}</button>
												<input type="hidden" id="coursevoMemeberID" value="${courseVO.memberID}">
											</c:if>
										
										</div>
									</div>
								</c:if>
								<div class="col-md-10 col-xs-9">
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
								<!-- 留言板內容 -->
				<div class="col-md-12" id="messageHeader">
				<c:if test="${empty messageVOList}">					
						<c:if test="${empty LoginOK}">
							<div style="text-align:center"><h4>尚未有留言</h4></div>
							<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
							<div style="text-align:center"><img src="<%=request.getContextPath() %>/_Lyy/chat.png"></div>
							<div style="text-align:center"><h4>(請先登入)</h4></div>
						</c:if>
						<c:if test="${!empty LoginOK}">
								<div class="col-md-12" id="inputMessage">
										<div style="text-align:center"><h4>尚未有留言</h4></div>
										<div style="text-align:center"><h4>成為第一個發文的人吧！</h4></div>
										<img  class="col-md-1 img-thumbnail"src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}"/>
										<div class="col-md-11"><textarea class="form-control inputMessage" rows="7" style="margin-left:30px"></textarea></div>
										<div class="text-right"><button class="text-right" style="margin:15px">送出</button></div>					
								</div>							
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
											<a data-toggle="collapse" href="#${messageVO.messageID+messageVO.messageID}" >回應<span class="glyphicon glyphicon-share-alt" style="margin-left:5px"></span></a>		
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
											<div class="col-md-12" id="inputMessage">
												<img class="col-md-1 img-thumbnail" style="margin-top: 20px"
													src="<%=request.getContextPath() %>/Image?MemberID=${LoginOK.memberID}" />
												<div class="col-md-11">
													<h4 style="margin-left: 30px">留言內容</h4>
													<textarea class="form-control inputMessage" rows="7"
														style="margin-left: 30px"></textarea>
												</div>
												<div class="text-right" style="margin-bottom: 10px">
													<button class="text-right" style="margin: 15px">送出</button>
												</div>
											</div>
										</c:if>
										<c:if test="${empty LoginOK}">
											<div class="col-md-12">
												<img class="col-md-1 img-thumbnail" style="margin-top: 20px"
													src="<%=request.getContextPath()%>/img/imember_image.png" />
												<div class="col-md-11" style="margin-bottom: 10px">
													<h4 style="margin-left: 30px">留言內容</h4>
													<textarea class="form-control" rows="7"
														style="margin-left: 30px" readOnly>(您尚未登入)</textarea>
												</div>
											</div>
										</c:if>
									</c:if>
								</div>
							</div>
			<!-- 留言板結束-->
									
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<input type="hidden" id="reportMemberID"value="${LoginOK.memberID}" />
	<input type="hidden"id="reportCourseID" value="${courseVO.courseID}" />						
	<input type="hidden" value="${courseVO.courseID}" id="mbcourseID">
	<input type="hidden" value="${courseVO.fundEndDate}" id="fundEndDate">
	<input type="hidden" value="${LoginOK.memberID}" id="mbmemberID">
	<input type="hidden" value="${courseVO.targetStudentNumber}"id="targetStudentNumber">
	<input type="hidden" value="${LoginOK.status}"id="statusMemberVO">
	<c:remove var="err" scope="session" />
	<c:remove var="loginerr" scope="session" />
	<jsp:include page="/footer.jsp" />
</body>
<script>
		$(function() {
			//點擊檢舉留言
			$('.reportMe').on('click', function() {
				if($('#statusMemberVO').val()==2){
					alert("此帳號已被凍結該功能");
				}else{
				var mess2=$(this).parents('.dropdown').parent('div').nextAll('input').val()
				warning(mess2);
				}
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
								console.log($('#testMessage1').attr('value'));
								console.log($('#reportMemberID').val());
								console.log(result);
								$.post('InsertReportMessageController', {
									'reportContent' : result,
									'reportMemberID' : $('#reportMemberID')
											.val(),
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
$(function(){
		$.getJSON("/e-Look/BuyCourseNumber", {
			'courseID' : $('#mbcourseID').val()
		}, function(data) {
			var buyStudentNumber = parseInt(data);
			var targetStudentNumber = parseInt($('#targetStudentNumber').val())
			var targetBar = buyStudentNumber / targetStudentNumber * 100;
			targetBarEx = parseInt(targetBar);
			$('#targetPersent').text("已達成" + targetBarEx + "%");
			$('#targetBar').attr('style', 'width:' + targetBarEx + '%');

		})

	})
</script>
<script>
	var fundEndDate = $('#fundEndDate').val().replace("-", ":");
	var fundEndDate1 = fundEndDate.replace("-", ":");
	$('.led3').ClassyLED({
		type : 'countdown',
		format : 'ddd:hh:mm:ss',
		countTo : fundEndDate1,
		color : '#af0',
		backgroundColor : '#272727',
		size : 4,
		fontType : 2,
	});
</script>
<script>
	$(document).ready(function() {
		$(".col-md-4 a").click(function() {
			$(this).tab('show');
		});
	});
</script>
<script>
$(function(){
	$.getJSON('/e-Look/GetBuyingPrice',{'courseID':$('#mbcourseID').val()},function(price){
		$('#price').text("NT "+price)
	})
})
</script>
	<script>
		var count = 0;
		$('#subAction').click(function() {
			if (count == 0) {
				$.post("MemberSubcriptionInsert_DeleteController", {
					'memberID' : $('#mbmemberID').val(),
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
// 	留言版專區
		$(function(){
			message();	
					$('.panel-collapse>div').on('click','.text-right>.btn-default',function(){
// 	 				alert($(this).html());
					var $this=$(this)
// 	 				alert($this.parents('div').children('input').val())
// 	 				alert($this.parents('.panel-collapse').find('textarea').val())
					if($('#statusMemberVO').val()==2){
						alert("此帳號已被凍結該功能");
					}else{
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
					}
					
					
					})
					$('#Section3').on('click','.reportM',function() {
						if($('#statusMemberVO').val()==2){
							alert("此帳號已被凍結該功能");
						}else{
						
						var mess=$(this).parents('ul').attr('id')
// 							alert(mess);
							warning(mess);
							//選取檢舉留言功能
						}	
							
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
							
					if(response.status==1){
						var p =$('<p></p>').text('(注意:此留言違反社群規範，已屏蔽)').attr('style','font-style:oblique')
					}else{
						var p =$('<p></p>').text(response.mContent)
					}
					
							li1.append(a1)
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
			var valueText=$(this).parents('#inputMessage').find('.inputMessage').val()
			if($('#statusMemberVO').val()==2){
				alert("此帳號已被凍結該功能");
			}else{
			if(valueText==null||valueText==""){	
				alert("請輸入留言");
			}else{
				$.post('/e-Look/MessageController_v2',{'mContent':valueText,'memberID':$('#mbmemberID').val(),'courseID':$('#mbcourseID').val()},function(){
					$(this).parents('#inputMessage').find('.inputMessage').val("");
					window.location.replace(window.location.href);  
			})
			}
			}
		})
		</script>
</html>