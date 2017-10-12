<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.css"
	rel="stylesheet">
<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<style>
/* 影片區塊 */
video {
	width: 100%;
}

.listsize>li {
	background-color: #888888;
	color: white;
	height: 60px;
}

.listsize {
	width: 80%;
	MARGIN-left: -30px;
	border-top-right-radius: 2em;
	font-size: 20px;
	border-top-right-radius: 2em;
}

#videoplay {
	background: #e3e3e3;
	height: 500px;
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
/* 簡介區塊 */
#infoIntro>div{
vertical-align:middle;
}
</style>
</head>
<body oncontextmenu="window.event.returnValue=false">
	<div class="container-fluid" id="videoplay">
		<div class="container">
			<h2 align="center">videoname</h2>
			<div class="row">
				<div class="col-md-8">
					<video controls loop poster="poster.png">
						<source src="tri.mp4" type="video/mp4">
					</video>
				</div>

				<!-- 				<div class="navbar-header "> -->
				<!-- 					<button type="button" class="navbar-toggle" data-toggle="collapse" -->
				<!-- 						data-target="#myNavbar"> -->
				<!-- 						<span class="icon-bar"></span> <span class="icon-bar"></span> <span -->
				<!-- 							class="icon-bar"></span> -->
				<!-- 					</button> -->
				<!-- 				</div> -->
				<!-- 				<div class="collapse navbar-collapse" id="myNavbar"> -->
				<!--底下放要縮放的內容-->
				<!-- 				<div class="col-md-4 nav navbar-nav"> -->
				<!-- 						<ul class="list-group listsize "> -->
				<!-- 							<li class="list-group-item">first</li> -->
				<!-- 							<li class="list-group-item">second</li> -->
				<!-- 							<li class="list-group-item">third</li> -->
				<!-- 							<li class="list-group-item">forth</li> -->
				<!-- 							<li class="list-group-item">fifth</li> -->
				<!-- 							<li class="list-group-item">sixth</li> -->
				<!-- 							<li class="list-group-item">seventh</li> -->
				<!-- 						</ul> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="height: 80px" id="infoIntro">
			
				<div class="col-md-1">
					<img src="004-people.png">
				</div>
				<div class="col-md-1">
					<h5>課程人數</h5>
					<h5>534人</h5>
				</div>
				
				<div class="col-md-1">
					<img src="clock.png" height="64px"> 
				</div>
				<div class="col-md-1">
					<h5>課程時間</h5>
					<h5>45min</h5>
				</div>
				
				<div class="col-md-1">
					<img src="002-question.png" height="64px">
				</div>
				<div class="col-md-1">
					<h5>問題討論</h5>
				</div>
				
				<div class="col-md-1">
					<img src="001-download.png" height="64px">
				</div>
				<div class="col-md-1">
					<h5>講義下載</h5>
				</div>
				
				<div class="col-md-1" style="height: 80px">
				<img src="share.png" height="32px">
					<h5>分享連結</h5>			
				</div>
				
				<div class="col-md-1" style="height: 64px">
					<small>課程售價</small>
					<h3>NT1230</h3>
				</div>
				
				<div class="col-md-2" style="height: 80px">
					<h6 align="center">星星數量位置</h6>
					<button type="button" class="btn btn-success" style="width:160px">加入購物車</button>
				</div>
				
<!-- 				課程簡介 -->
				<div class="col-md-12" >
					<div class="col-md-4" align="center"style="padding: 50px">
						<a href="#"><b>課程簡介</b></a>				
					</div>
					<div class="col-md-4" align="center"style="padding: 50px">
						<a href="#"><b>課程簡介</b></a>
					</div>
					<div class="col-md-4" align="center"style="padding: 50px">
						<a href="#"><b>課程簡介</b></a>
					</div>
				</div>
				<div class="col-md-12" >
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				<p>自我介紹</p>
				</div>
			</div>
		</div>
	</div>




			
				
			


</body>
</html>