<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="login/viewport"
	content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/autosize.js"></script>
<title>${SYSTEM.systemName}</title>
<style type="text/css">
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
	width: 225px;
	height: 150px;
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

.panel-heading {
	padding: 10px 15px;
	background-color: #353535;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	top: 0%;
	opacity: 0.8;
	color: white;
	border: none;
}

.panel-body {
	padding: 60px 4% 5% 7%;
}

.box {
	padding: 2%;
	border: 1px #ddd solid;
	cursor: pointer;
}

.remove-decoration {
	text-decoration: none !important;
	color: #333;
	font-size: 12px;
}

.clickable {
	cursor: pointer;
}

.clickable .glyphicon {
	background: rgba(0, 0, 0, 0.15);
	display: inline-block;
	padding: 6px 12px;
	border-radius: 4px
}

.panel-heading span {
	margin-top: -23px;
	font-size: 15px;
	margin-right: -9px;
}

a.clickable {
	color: inherit;
}

a.clickable:hover {
	text-decoration: none;
}

<!--
-->
.profile-header-container {
	margin: 0 auto;
	text-align: center;
}

.profile-header-img {
	padding: 30px 0;
	
	
}

.profile-header-img>img.img-circle {
	width: 120px;
	height: 120px;
	border: 2px solid #51D2B7;
}

.profile-header {
	margin-top: 43px;
}

/**
 * Ranking component
 */
.rank-label-container {
	margin-top: -19px;
	/* z-index: 1000; */
	text-align: center;
}

.label.label-default.rank-label {
	background-color: rgb(81, 210, 183);
	padding: 5px 10px 5px 10px;
	border-radius: 27px;
}
a:HOVER {
	color:black;
}
/**/
.card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 130px;
}
.card-background img {
    -webkit-filter: blur(25px);
    -moz-filter: blur(25px);
    -o-filter: blur(25px);
    -ms-filter: blur(25px);
    filter: blur(25px);
    margin-left: -100px;
    margin-top: -200px;
    min-width: 130%;
}
.card.hovercard .useravatar {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
}
.card.hovercard .useravatar img {
    width: 115px;
    height: 115px;
    max-width: 115px;
    max-height: 115px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    border: 5px solid rgba(144, 97, 97, 0.69);
}
.card.hovercard .card-info {
    position: absolute;
    bottom: 5px;
    left: 0;
    right: 0;
}
.card.hovercard .card-info .card-title {
    padding:0 5px;
    font-size: 25px;
    line-height: 1;
    color: #262626;
    background-color: rgba(174, 162, 232, 0.54);
/*     background-color: rgba(255, 255, 255, 0.1); */
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
    color: #737373;
    text-overflow: ellipsis;
}
.card.hovercard .bottom {
    padding: 0 20px;
    margin-bottom: 17px;
}
.btn-pref .btn {
    -webkit-border-radius:0 !important;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>
</head>
<body>
<jsp:include page="/login.jsp" />
<div  class="alert alert-success" role="alert" id="updatainfo" style="display: none ;position:fixed;z-index: 20;width: 100%; text-align: center;opacity: 0.8;font-size: 32px">
	更新成功
</div>
<div style="margin-top: 10px" class="container">
		<div class="row">
		
			
<div class="col-lg-12 col-sm-12">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="image/images.jpg">
        </div>
        <div class="useravatar">
        	<c:if test="${empty Submembervo}">
            <img alt="" id="wizardPicturePreview" src="<%=request.getContextPath()%>/Image?MemberID=${LoginOK.memberID}" />
            <div class="rank-label-container">
			</div>
			<form  method="POST" enctype="multipart/form-data">
			<input type="hidden" name="memberID" id="mem" value="${LoginOK.memberID}">
			<div class="btn btn-info   btn-xs image-preview-input">	<span class="glyphicon glyphicon-edit"></span> 
			<span class="image-preview-input-title">編輯</span> 
			<input type="file" accept="image/png, image/jpeg, image/gif" id="wizard-picture" name="memberphoto">
										<!-- rename it -->
			</div>
			</form>
			</c:if>
			<c:if test="${!empty Submembervo}">
			 <img alt="" src="<%=request.getContextPath()%>/Image?MemberID=${Submembervo.memberID}" />
            <div class="rank-label-container">
			</div>
			</c:if>
        </div>
        <c:if test="${empty Submembervo}">
        <div class="card-info"> <span class="card-title" id="readname">${LoginOK.mName}</span>
        </div>
        </c:if>
        <c:if test="${!empty Submembervo}">
        <div class="card-info"> <span class="card-title">${Submembervo.mName}</span>
        </div>
        </c:if>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button style="font-size: 20px" type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <div class="hidden-xs">主頁</div>
            </button>
        </div>
        <c:if test="${empty Submembervo}"> 
        <div class="btn-group" role="group">
            <button type="button" style="font-size: 20px" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                <div class="hidden-xs">編輯</div>
            </button>
            
        </div>
        </c:if>
        <div class="btn-group" role="group">
            <button type="button" style="font-size: 20px" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                <div class="hidden-xs">課程</div>
            </button>
        </div>
        
    </div>

        <div class="well">
        
      <div class="tab-content">
     
        <div class="tab-pane fade in active" id="tab1">
                   <c:if test="${empty Submembervo}"> 
            <div class="row overview panel-body" >
                <div class="col-md-6 user-pad text-center">
                <div class="hero-widget well  well-lg">
                    <h3>已參加</h3>
                    <h4>${buycourseCount}堂課</h4>
                </div>
                </div>
                <div class="col-md-6 user-pad text-center">
                <div class="hero-widget well  well-lg">
                    <h3>已開設</h3>
                    <h4>${mycourseCount}堂課</h4>
                    </div>
                </div>
            </div>
            </c:if>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h4 class="text-center">關於我</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p id="keyupaboutme"
									style="word-break: break-all; word-wrap: break-word;font-size: 22px">${empty Submembervo?LoginOK.aboutme:Submembervo.aboutme}
								<p></p>
							</div>
						</div>
			
					
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="text-center">專長</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p style="word-break: break-all; word-wrap: break-word;font-size: 22px;" id="keyupskill">${empty Submembervo?LoginOK.skill:Submembervo.skill}</p>
								<p></p>
							</div>
						</div>
				
						<div class="panel panel-warning">
							<div class="panel-heading">
								<h4 class="text-center">興趣</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p style="word-break: break-all; word-wrap: break-word;font-size: 22px;" id="keyuphobby">${empty Submembervo?LoginOK.hobby:Submembervo.hobby}
								<p></p>
							</div>
						</div>
					</div>
        <div class="tab-pane fade in" id="tab2">
        <form  method="POST" name="formData" id="formData"
			enctype="multipart/form-data">
			<input type="hidden" name="memberID" value="${LoginOK.memberID}">
					<div class="row" style="margin-top: 50px">
						<div class=" col-md-12 ">
						
							<div class=" col-md-4 " style="margin: 10px 0;">
								<div class="form-group">
									<label style="font-size: 18px">名字</label> <input type="text" class="form-control" 
										id="keyupname" name="mName" value="${LoginOK.mName}">
								</div>
							</div>
							<div class="col-md-8"></div>
						</div>
						<div class=" col-md-12 ">
							<div class=" col-md-8 " style="margin: 10px 0;">
								<div class="form-group">
									<label style="font-size: 18px">帳號(信箱)</label> <input type="text" class="form-control"
										id="" name="email" value="${LoginOK.email}"<c:if test="${LoginOK.mPassword==''}">readonly</c:if>  >
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class=" col-md-12 ">
							<div class=" col-md-4 " style="margin: 10px 0;">
								<div class="form-group input-group">
									<label style="font-size: 18px">密碼</label> <input type="password" class="form-control"
										id="mPassword" name="mPassword" readonly value="${LoginOK.mPassword}">
										<span  class="input-group-btn" style="padding-top: 27px">
            <button data-toggle="modal" data-target="#ChangePassword" class="btn  btn-info reveal" type="button"  disabled="disabled"><i class="glyphicon glyphicon-pencil"></i></button>
        			 </span>      
								</div>
							</div>
							<div class="col-md-8"></div>
						</div>
						<div class=" col-md-12 " style="display: none;">
							<div class="col-md-8">
							<div class="form-group ">
								 <label>地址</label><label style="margin:10px "></label><input type="text" name="address" class="form-control"	id="" value="${LoginOK.address}">
							</div>
							</div>
						</div>
					</div>

					<div class=" col-ms-12 " style="margin: 30px 0 10px 0;">
						<div class="panel panel-success">
							<div class="panel-heading" style="font-size: 18px">關於我</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle" name="aboutme" form="formData"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.aboutme}</textarea>
							</div>
						</div>
					</div>
					<div class=" col-ms-12 " style="margin: 20px 0;">
						<div class="panel panel-info">
							<div class="panel-heading" style="font-size: 18px">專長</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle1" name="skill" form="formData"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.skill}</textarea>
							</div>
						</div>
					</div>

					<div class=" col-ms-12 " style="margin: 20px 0;">
						<div class="panel panel-warning">
							<div class="panel-heading" style="font-size: 18px">興趣</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle2" name="hobby" form="formData"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.hobby}</textarea>
							</div>
						</div>
					</div>
					  </form>
				</div>

        <div class="tab-pane fade in" id="tab3">
          
			<c:if test="${empty Submembervo}">
				
					<div class="panel panel-info">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">我開的課</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">
							<!-- 1 -->
							<c:forEach var="mycouser" items="${list}">
							<c:if test="${mycouser.soldPrice>0}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
							 <a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${mycouser.courseID}">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${mycouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${LoginOK.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${mycouser.courseName}</p>
										</div>
									</div>
									</a>
									<div class="card-footer">
									<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/CreateCourse.jsp?CourseID=${mycouser.courseID}">
										<button class="btn-info btn-sm center-block"
											style="margin-bottom: 5px; margin-top: 10px">編輯</button></a>
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${mycouser.soldPrice==0}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
							<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/freeCourse-v1.jsp?CourseID=${mycouser.courseID}">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${mycouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${LoginOK.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${mycouser.courseName}</p>
										</div>
									</div>
									</a>
									<div class="card-footer">
									<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/CreateCourse.jsp?CourseID=${mycouser.courseID}">
										 <button class="btn-info btn-sm center-block"
											style="margin-bottom: 5px; margin-top: 10px">編輯</button></a>
									</div>
								</div>
							</div>
							</c:if>
							</c:forEach>
							<!-- 1 -->
							
						</div>
					</div>
				
				
					<div class="panel panel-primary">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">我修的課</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">

							<c:forEach var="buycouser" items="${list2}">
							<c:if test="${buycouser.soldPrice>0&&buycouser.targetStudentNumber==0}">
							<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${buycouser.courseID}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${buycouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${buycouser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${buycouser.courseName}</p>
										</div>
									</div>
								</div>
							</div>
							</a>
							</c:if>
							<c:if test="${buycouser.targetStudentNumber>0}">
							<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/proposalCourse-v1.jsp?CourseID=${buycouser.courseID}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${buycouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${buycouser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${buycouser.courseName}</p>
										</div>
									</div>
								</div>
							</div>
							</a>
							</c:if>
							</c:forEach>
					
						</div>
					</div>
				
				
			
					<div class="panel panel-info">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">審核中的課程</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">

							<c:forEach var="couser" items="${list6}">
							
							<div class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${couser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${couser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${couser.courseName}</p>
										</div>
									</div>
								</div>
							</div>
						
							</c:forEach>
					
						</div>
					</div>
				
				
					<div class="panel panel-primary">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">我的收藏課程</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						 </div>
						<div class="panel-body" style="display: none;">
						<c:forEach var="mBookmark" items="${list3}">
						<c:if test="${mBookmark.soldPrice>0}">
						 <div id="click" class=" col-md-4  col-sm-4" style="width: 318px">
						  <a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${mBookmark.courseID}">
                    <div class="card card-inverse">
                    <img class="card-img-top" src="<%=request.getContextPath()%>/CourseImage?CourseID=${mBookmark.courseID}" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="<%=request.getContextPath()%>/Image?MemberID=${mBookmark.memberID}" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">${mBookmark.courseName}</p>                        	
                        </div>
                       </div>
                       </a>
                    <div class="card-footer">
                    <button class="btn-danger btn-sm center-block" style="margin-bottom: 5px;margin-top: 10px">取消訂閱</button>   
                     <input type="hidden" value="${mBookmark.courseID}">
                   <input type="hidden" value="${LoginOK.memberID}">
                    </div>
                    
                </div>
                </div>
                </c:if>
                <c:if test="${mBookmark.soldPrice==0}">
                 <div id="click" class=" col-md-4  col-sm-4" style="width: 318px">
                 <a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/freeCourse-v1.jsp?CourseID=${mBookmark.courseID}">
                    <div class="card card-inverse">
                    <img class="card-img-top" src="<%=request.getContextPath()%>/CourseImage?CourseID=${mBookmark.courseID}" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="<%=request.getContextPath()%>/Image?MemberID=${mBookmark.memberID}" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">${mBookmark.courseName}</p>                        	
                        </div>
                       </div>
                       </a>
                    <div class="card-footer">
                    <button class="btn-danger btn-sm center-block" style="margin-bottom: 5px;margin-top: 10px">取消訂閱</button>   
                     <input type="hidden" value="${mBookmark.courseID}">
                     <input type="hidden" value="${LoginOK.memberID}">
                    </div>
                    
                </div>
                </div>
                </c:if>
                </c:forEach>
						</div>
					</div>
				
				
				
					<div class="panel panel-info">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">我的草稿</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">
						<c:forEach var="mydraftcouser" items="${list4}">
						<div  id="click2" class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${mydraftcouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${mydraftcouser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${mydraftcouser.courseName}</p>
										</div>
									</div>
									
									<div class="card-footer">
									
										<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/CreateCourse.jsp?CourseID=${mydraftcouser.courseID}"><button class="btn-info btn-sm "
											style="margin-bottom: 5px; margin-top: 10px">編輯</button></a>
											<button class="btn-danger btn-sm pull-right"
											style="margin-bottom: 5px; margin-top: 10px">刪除</button>
												<input type="hidden" value="${mydraftcouser.courseID}">
                     							
									</div>
								</div>						
						</div>
						</c:forEach>
					</div>
				</div>
				
				
					<div class="panel panel-primary">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">募資中的課程</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">

							<c:forEach var="fundcouser" items="${list7}">
							<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/proposalCourse-v1.jsp?CourseID=${fundcouser.courseID}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${fundcouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${fundcouser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${fundcouser.courseName}</p>
										</div>
									</div>
								</div>
							</div>
						
							</c:forEach>
					</a>
						</div>
					</div>
				
				
				
			
					<div class="panel panel-info">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">備課中的課程</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">
						<c:forEach var="readycouser" items="${list8}">
						<div   class=" col-md-4  col-sm-4" style="width: 318px">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${readycouser.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${readycouser.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${readycouser.courseName}</p>
										</div>
									</div>
									
									<div class="card-footer">
									
										<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/CreateCourse.jsp?CourseID=${readycouser.courseID}">
										<button class="btn-info btn-sm center-block"
											style="margin-bottom: 5px; margin-top: 10px">編輯</button></a>
									</div>
								</div>						
						</div>
						</c:forEach>
					
				</div>
				</div>
				
				
				
				
				
				
				
				
					<div class="panel panel-primary">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">我的追蹤講師</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">
						<c:forEach var="mySubscription" items="${list5}">						 
						 <div  id="click3" class=" col-md-3  col-sm-3" style="border: 1px solid #d4d4d5;width: 222px;height: 255px; margin:0 10px ">
						 <a style="text-decoration: none; color:black;" href="<%=request.getContextPath() %>/member/member.jsp?memberID=${mySubscription.memberID}" target="_blank">
								<div class="cprofile-header-img" style="width:120px;margin: auto; padding: 30px 0;">
									<img class="img-circle" style="width: 120px; height: 120px; border: 2px solid #51D2B7;" src="<%=request.getContextPath()%>/Image?MemberID=${mySubscription.memberID}" >
									
									<div class="card-block">
										<div class="card-text"  style="height: 5px;">
											<h5 style="text-align: center;">${mySubscription.mName}</h5>
										</div>
									</div>
									 </a>
									<div class="card-footer">
									
										<button  class="btn-danger btn-sm center-block">取消訂閱</button>
                       			 <input type="hidden" value="${mySubscription.memberID}">
                    			 <input type="hidden" value="${LoginOK.memberID}">
                     							
									</div>
								</div>						
							</div>
						</c:forEach>
						</div>
					
				</div>
				</c:if>
<!-- 講師資訊 -->
<c:if test="${!empty Submembervo}">
						
					<div class="panel panel-info">
						<div class="panel-heading clickable panel-collapsed">
							<h3 class="panel-title">講師的課</h3>
							<span class="pull-right "><i
								class="glyphicon glyphicon-plus"></i></span>
						</div>
						<div class="panel-body" style="display: none;">
							<!-- 1 -->
							<c:forEach var="TeacherCourse" items="${TeacherCourselist}">
							<c:if test="${TeacherCourse.soldPrice>0}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
							 <a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${TeacherCourse.courseID}">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${TeacherCourse.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${TeacherCourse.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${TeacherCourse.courseName}</p>
										</div>
									</div>
									</a>
									<div class="card-footer">
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${TeacherCourse.soldPrice==0}">
							<div class=" col-md-4  col-sm-4" style="width: 318px">
							<a style="text-decoration: none; color:black"; href="<%=request.getContextPath() %>/freeCourse-v1.jsp?CourseID=${TeacherCourse.courseID}">
								<div class="card card-inverse">
									<img class="card-img-top"
										src="<%=request.getContextPath()%>/CourseImage?CourseID=${TeacherCourse.courseID}"
										alt="course" id="wizardPicturePreview" title="">
									<div class="card-block">
										<figure class="profile">
											<img
												src="<%=request.getContextPath()%>/Image?MemberID=${TeacherCourse.memberID}"
												class="profile-avatar" alt="">
										</figure>
										<div class="card-text">
											<p id="title" class="card-title mt-3 multi_ellipsis">${TeacherCourse.courseName}</p>
										</div>
									</div>
									</a>
									<div class="card-footer">
									</div>
								</div>
							</div>
							</c:if>
							</c:forEach>
							<!-- 1 -->
							
						</div>
					</div>
				
				</c:if>			
<!-- 講師資訊 -->
				
			</div>
		</div>


        </div>
        
      </div>
    </div>
    
    </div>
    
      </div>
  
    </div>
			<div class="modal fade" id="ChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:100px ">
	<div class="modal-dialog" style="width: 318px;">
		<div class="modal-content" style="font-size: 18px">

			<div class="modal-header">
				<button type="button" class="close pull-right" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="">修改密碼</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				
					<div class="form-group " >
					 <label id="oldpwd">舊密碼</label>
						<div class="input-group">
							<input type="password" maxlength="10" class="form-control" id="oldpwd1" >
							<label style=""  class="input-group-addon glyphicon glyphicon-question-sign"></label>
						</div>
					</div>
					<div class="form-group " >
					 <label id="newpwd">新密碼</label>
						<div class="input-group">
							<input type="password" maxlength="10" class="form-control" id="newpwd1" >
							<label style=""  class="input-group-addon glyphicon  glyphicon-question-sign"></label>
						</div>
					</div>
					<div class="form-group " >
					 <label id="angpwd">密碼確認</label>
						<div class="input-group">
							<input type="password"  maxlength="10"class="form-control" id="angpwd1" >
							<label style=""  class="input-group-addon glyphicon  glyphicon-question-sign"></label>
						</div>
					</div>
			<button  class=" btn btn-primary  btn-lg btn-block" disabled="disabled" id="ok">確認</button>

			</div> <!-- /.modal-body -->


		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	
</div>

<jsp:include page="/footer.jsp" />


<script type="text/javascript">
//切換頁面功能
$(document).ready(function() {
	$(".btn-pref .btn").click(function () {
	    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	    // $(".tab").addClass("active"); // instead of this do the below 
	    $(this).removeClass("btn-default").addClass("btn-primary");   
	});
	});
//會員編輯
	$('textarea').each(function() {
		autosize(this);
	}).on('autosize:resized');

	$('#customStyle').keyup(function() {
		var value = $(this).val();
		$("#keyupaboutme").text(value);
	});
	$('#customStyle1').keyup(function() {
		var value = $(this).val();
		$("#keyupskill").text(value);
	});
	$('#customStyle2').keyup(function() {
		var value = $(this).val();
		$("#keyuphobby").text(value);
	});
	
	$('#keyupname').keyup(function() {
		var value = $(this).val();
		$("#readname").text(value);
	});

	$("#wizard-picture").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#wizardPicturePreview').attr('src', e.target.result).fadeIn(
						'slow');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("form input[type!='file'],textarea").keyup(function(){
		var formData = new FormData($('form')[4]);
		//console.log(formData);
		$.ajax({
			type : 'POST',
			url : 'MemberDataContrlloer',
			data :formData,
			processData : false,
			contentType : false,
			success: function(){
				delay_till_last('id', function() {
					$('#updatainfo').text("更新成功")
				$("#updatainfo").fadeIn(1200);
				$("#updatainfo").fadeOut(3500);
// 				$('#sendOK').modal()
// 				$('#sendOK h3').text("更新成功")
// 				setTimeout(function(){
// 			        $("#sendOK").modal('hide');
// 			        }, 1000);
				}, 500);
            }
		})
	})
	$("form input[type='file']").change(function(){
		var formData = new FormData($('form')[3]);
		$.ajax({
			type : 'POST',
			url : 'MemberDataContrlloer',
			data :formData,
			processData : false,
			contentType : false,
			success: function(){
				delay_till_last('id', function() {
					$('#updatainfo').text("更新成功")
				$("#updatainfo").fadeIn(1000);	
				$("#updatainfo").fadeOut(3500);
				$("#changeimage").attr("src","/e-Look/Image?MemberID="+$("#mem").val())
// 				$('#sendOK').modal()
// 				$('#sendOK h3').text("更新成功")
// 				setTimeout(function(){
// 			        $("#sendOK").modal('hide');
// 			        }, 1000);
				}, 500);
            }
		})
		
	})
	
	var chkoldpwd;
	var chknewpwd;
	var chkangpwd;
	$("input[type=password]").keyup(function(){
		
		
		
	})
	$("#oldpwd1").keyup(function(){
		var mPassword=$("#mPassword").val();
		var oldpwd=$("#oldpwd1").val();
		if(mPassword===oldpwd){
			chkoldpwd=true;
			$("#oldpwd1+label").removeClass().addClass("input-group-addon glyphicon glyphicon-ok").css("color","green");
				
		}else{
			chkoldpwd=false;
			$("#oldpwd1+label").removeClass().addClass(" input-group-addon glyphicon glyphicon-remove").css("color","red");
			$("#ok").prop("disabled",true)
		}
		if(chkoldpwd&&chknewpwd&&chkangpwd){
			$("#ok").prop("disabled",false)
		}else{
			$("#ok").prop("disabled",true)
		}
		
	})
	
	$("#newpwd1").keyup(function(){
		var angpwd=$("#angpwd1").val();
		
		var newpwd=$("#newpwd1").val();
		if(angpwd===newpwd){
			chkangpwd=true;	
			$("#angpwd1+label").removeClass().addClass("input-group-addon glyphicon glyphicon-ok").css("color","green");
		}else{
			chkangpwd=false;
			$("#angpwd1+label").removeClass().addClass(" input-group-addon glyphicon glyphicon-remove").css("color","red");
			
		}
		
		if(chkoldpwd&&chknewpwd&&chkangpwd){
			$("#ok").prop("disabled",false)
		}else{
			$("#ok").prop("disabled",true)
		}
		var re = new RegExp("^.*(?=.{8,10})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).*$");

		var newpwd=$("#newpwd1").val();
		
		if(re.test(newpwd)){
			chknewpwd=true;	
			$("#newpwd1+label").removeClass().addClass("input-group-addon glyphicon glyphicon-ok").css("color","green");
			
		}else{
			chknewpwd=false;
			$("#newpwd1+label").removeClass().addClass(" input-group-addon glyphicon glyphicon-remove").css("color","red");
			
		}
		
		if(chkoldpwd&&chknewpwd&&chkangpwd){
			$("#ok").prop("disabled",false)
		}else{
			$("#ok").prop("disabled",true)
		}
		
	})
	
	$("#angpwd1").keyup(function(){
		var angpwd=$("#angpwd1").val();
		
		var newpwd=$("#newpwd1").val();
		if(angpwd===newpwd){
			chkangpwd=true;	
			$("#angpwd1+label").removeClass().addClass("input-group-addon glyphicon glyphicon-ok").css("color","green");
		}else{
			chkangpwd=false;
			$("#angpwd1+label").removeClass().addClass(" input-group-addon glyphicon glyphicon-remove").css("color","red");
			
		}
		if(chkoldpwd&&chknewpwd&&chkangpwd){
			$("#ok").prop("disabled",false)
		}else{
			$("#ok").prop("disabled",true)
		}
	})
	$("#ok").click(function(){
		var newpwd=$("#newpwd1").val();
		$("#mPassword").val(newpwd);
		 $("#ChangePassword").modal('hide');
		 $.post('MemberDataContrlloer',	{'change':'pwd','mPassword':newpwd},function(){
			 
			 delay_till_last('id', function() {
				 $('#updatainfo').text("密碼更新成功")
					$("#updatainfo").fadeIn(1000);	
					$("#updatainfo").fadeOut(3500);
			 }, 500);
// 					$('#sendOK').modal()
// 					$('#sendOK h3').text("密碼更新成功")
// 					setTimeout(function(){
// 				        $("#sendOK").modal('hide');
// 				        }, 1000);
	            }
			)
		
		$('#ChangePassword').on('hidden.bs.modal', function(){
			$("#oldpwd1+label").removeClass().addClass("input-group-addon glyphicon  glyphicon-question-sign").css("color","black");
			$("#newpwd1+label").removeClass().addClass("input-group-addon glyphicon  glyphicon-question-sign").css("color","black");
			$("#angpwd1+label").removeClass().addClass("input-group-addon glyphicon  glyphicon-question-sign").css("color","black");
			$("#oldpwd1").val("")
			$("#newpwd1").val("")
			$("#angpwd1").val("")
			})
	})
// 設定keyup事件在特定秒數內只會觸發1次
		var _timer = {};
		function delay_till_last(id, fn, wait) {
			if (_timer[id]) {
				window.clearTimeout(_timer[id]);
				delete _timer[id];
			}

			return _timer[id] = window.setTimeout(function() {
				fn();
				delete _timer[id];
			}, wait);
		}
		// =====================================
//課程資訊
$(document).on('click','.panel-heading span.clickable',
			function(e) {
				var $this = $(this);
				if (!$this.hasClass('panel-collapsed')) {
					$this.parents('.panel').find('.panel-body').slideUp();
					$this.addClass('panel-collapsed');
					$this.find('i').removeClass('glyphicon-minus').addClass(
							'glyphicon-plus');
				} else {
					$this.parents('.panel').find('.panel-body').slideDown();
					$this.removeClass('panel-collapsed');
					$this.find('i').removeClass('glyphicon-plus').addClass(
							'glyphicon-minus');
				}
			});
	$(document).on('click','.panel div.clickable',
			function(e) {
				var $this = $(this);
				if (!$this.hasClass('panel-collapsed')) {
					$this.parents('.panel').find('.panel-body').slideUp();
					$this.addClass('panel-collapsed');
					$this.find('i').removeClass('glyphicon-minus').addClass(
							'glyphicon-plus');
				} else {
					$this.parents('.panel').find('.panel-body').slideDown();
					$this.removeClass('panel-collapsed');
					$this.find('i').removeClass('glyphicon-plus').addClass(
							'glyphicon-minus');
				}
			});
	$(document).ready(function() {
		$('.panel-heading span.clickable').click();

	});
	 $('#click2>div').on('click','.card-footer>button:nth-child(2)',function(){
		   if( confirm("確定刪除草稿嗎?")){
			   $(this).parents('#click2').css("display","none")
			    $.get('/e-Look/com.e_Look.Course.control/CourseEditControlloer', {
				'courseID' : $(this).parents('#click2').find("input").val(),'member':"member"
				//'memberID' : $(this).parents('#click2').find("input+input").val()
			}, function() {
			})
		   }else{
			   
		   }
	 });
		   $('#click>div').on('click','.card-footer>button:nth-child(1)',function(){
			   if( confirm("確定取消訂閱嗎?")){
				   $(this).parents('#click').css("display","none")
				    $.get('/e-Look/MemberBookmarksInsertController', {
					'courseID' : $(this).parents('#click').find("input").val(),
					'memberID' : $(this).parents('#click').find("input+input").val()
				}, function() {
				})
			   }else{
				   
			   }
			   

// 			$.get('ProductsDelete',{'ProductID':id},function(data){
// 				alert(data);
// 				 loadProduct(1);
// 			})
});
		   $('#click3 button:nth-child(1)').on('click',function(){
			   //console.log("123")
			   if( confirm("確定取消訂閱嗎?")){
				   $(this).parents('#click3').css("display","none")
				    $.get('/e-Look/MemberSubcriptionInsert_DeleteController', {
					'memberTrackID' : $(this).parents('#click3').find("input").val(),
					'memberID' : $(this).parents('#click3').find("input+input").val()
				}, function() {
				})
			   }else{
				   
			   }	
		   });

</script>
</body>
</html>