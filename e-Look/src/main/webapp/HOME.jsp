<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<html>
<style>
#title1 {
	border-bottom: solid 1px #FF8800;
}
</style>
<style type="text/css">
#title1{
padding-top:30px;
}
h5 {
	font-size: 1.28571429em;
	font-weight: 700;
	line-height: 1.2857em;
	margin: 0;
}

.card {
	font-size: 1em;
	overflow: hidden;
	padding: 0;
	border: none;
	border-radius: .28571429rem;
	box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}

.card-block {
	font-size: 1em;
	position: relative;
	margin: 0;
	padding: 1em;
	border: none;
	border-top: 1px solid rgba(34, 36, 38, .1);
	box-shadow: none;
}

.card-img-top {
	display: block;
	width: 310px;
	height: 200px;
	margin-top: 4px;
	margin-bottom: 4px;
}

.card-title {
	font-size: 1.28571429em;
	font-weight: 700;
	line-height: 1.2857em;
}

.card-text {
	clear: both;
	margin-top: .5em;
	height: 70px;
}

.card-footer {
	font-size: 15px;
	position: static;
	top: 0;
	left: 0;
	max-width: 100%;
	padding: .75em 1em;
	color: gray;
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	background: #fff;
}

.card-inverse .btn {
	border: 1px solid rgba(0, 0, 0, .05);
}

.profile {
	position: absolute;
	top: -30px;
	display: inline-block;
	overflow: hidden;
	box-sizing: border-box;
	width: 50px;
	height: 50px;
	margin: 0;
	border: 1px solid #fff;
	border-radius: 50%;
}

.profile-avatar {
	display: block;
	width: 100%;
	height: auto;
	border-radius: 50%;
}

.profile-inline {
	position: relative;
	top: 0;
	display: inline-block;
}

.profile-inline ~ .card-title {
	display: inline-block;
	margin-left: 4px;
	vertical-align: top;
}

.text-bold {
	font-weight: 700;
}

.meta {
	font-size: 2em;
}

.meta a {
	text-decoration: none;
	color: rgba(0, 0, 0, .4);
}

.meta a:hover {
	color: rgba(0, 0, 0, .87);
}

.multi_ellipsis {
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	line-height: 30px;
	height: 60px;
	font-size: 30px;
}
#course{
margin-top:20px
}
a:HOVER {
	color:black;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body id="body" style="margin-top:50px">
	<jsp:include page="/login.jsp" />
	<jsp:useBean id="course" scope="page" class="com.e_Look.Course.CourseDAO"/>
	
	<div class="container-fluid" style="background-color: black; margin:-50px">
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="/jay/advertising.jsp" />
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 id="title1">熱門課程</h2>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="padding-left:40px">
		<!--for each  -->
		 <c:forEach var='listcourse' items='${course.allonlineCourse}'>
		
		<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width: 341px">
		 <a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${listcourse.courseID}">
				<div class="card card-inverse" style="background-color: white;">
					<img class="card-img-top" src="<%=request.getContextPath() %>/CourseImage?CourseID=${listcourse.courseID}" alt="course"
						id="wizardPicturePreview" title="">
					<div class="card-block">
						<figure class="profile">
							<img src="<%=request.getContextPath() %>/Image?MemberID=${listcourse.memberID}" class="profile-avatar" alt="">
						</figure>
						<div class="card-text">
							<p id="title" class="card-title mt-3 multi_ellipsis">${listcourse.courseName}</p>
						</div>
			</a>
						<div>
							<p style="margin-top: 40px; font-size: 18px">課程售價：${listcourse.soldPrice}</p>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn-info btn-sm pull-right"
							style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
						<small>課程時間:${listcourse.courseLength}分鐘</small> <br> <small>購買人數:zzz人</small>
					</div>
				</div>
				
			</div>
			
			</c:forEach>
		<!--for each  -->

			</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 id="title1">募資課程</h2>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="row"style="padding-left:40px">
					<!-- 	1 -->
					<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width: 341px">
						<div class="card card-inverse" style="background-color: white;">
							<img class="card-img-top" src="<%=request.getContextPath()%>/img/請上傳課程封面.png" alt="course"
								id="wizardPicturePreview" title="">
							<div class="card-block">
								<figure class="profile">
									<img src="<%=request.getContextPath()%>/img/eLook_LOGO1.png" class="profile-avatar" alt="">
								</figure>
								<div class="card-text">
									<p id="title" class="card-title mt-3 multi_ellipsis">這裡請輸入課程標題</p>
								</div>
								<div>
									<p style="margin-top: 40px; font-size: 18px">課程售價：xxx元</p>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn-info btn-sm pull-right"
									style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
								<small>課程時間:yyy分鐘</small> <br> <small>購買人數:zzz人</small>
							</div>
						</div>
					</div>
					<!-- 2 -->
					<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width: 341px">
						<div class="card card-inverse" style="background-color: white;">
							<img class="card-img-top" src="<%=request.getContextPath()%>/img/請上傳課程封面.png" alt="course"
								id="wizardPicturePreview" title="">
							<div class="card-block">
								<figure class="profile">
									<img src="<%=request.getContextPath()%>/img/eLook_LOGO1.png" class="profile-avatar" alt="">
								</figure>
								<div class="card-text">
									<p id="title" class="card-title mt-3 multi_ellipsis">這裡請輸入課程標題</p>
								</div>
								<div>
									<p style="margin-top: 40px; font-size: 18px">課程售價：xxx元</p>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn-info btn-sm pull-right"
									style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
								<small>課程時間:yyy分鐘</small> <br> <small>購買人數:zzz人</small>
							</div>
						</div>
					</div>
					<!-- 			3 -->
					<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width: 341px">
						<div class="card card-inverse" style="background-color: white;">
							<img class="card-img-top" src="<%=request.getContextPath()%>/img/請上傳課程封面.png" alt="course"
								id="wizardPicturePreview" title="">
							<div class="card-block">
								<figure class="profile">
									<img src="<%=request.getContextPath()%>/img/eLook_LOGO1.png" class="profile-avatar" alt="">
								</figure>
								<div class="card-text">
									<p id="title" class="card-title mt-3 multi_ellipsis">這裡請輸入課程標題</p>
								</div>
								<div>
									<p style="margin-top: 40px; font-size: 18px">課程售價：xxx元</p>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn-info btn-sm pull-right"
									style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
								<small>課程時間:yyy分鐘</small> <br> <small>購買人數:zzz人</small>
							</div>
						</div>
					</div>
					<!-- 4 -->
					<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width: 341px">
						<div class="card card-inverse" style="background-color: white;">
							<img class="card-img-top" src="<%=request.getContextPath()%>/img/請上傳課程封面.png" alt="course"
								id="wizardPicturePreview" title="">
							<div class="card-block">
								<figure class="profile">
									<img src="<%=request.getContextPath()%>/img/eLook_LOGO1.png" class="profile-avatar" alt="">
								</figure>
								<div class="card-text">
									<p id="title" class="card-title mt-3 multi_ellipsis">這裡請輸入課程標題</p>
								</div>
								<div>
									<p style="margin-top: 40px; font-size: 18px">課程售價：xxx元</p>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn-info btn-sm pull-right"
									style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
								<small>課程時間:yyy分鐘</small> <br> <small>購買人數:zzz人</small>
							</div>
						</div>
					</div>
				</div>
			</div>
			
<jsp:include page="/footer.jsp" />
</body>
</html>