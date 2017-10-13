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

#liststyle {
	margin: 50px 0;
}

#liststyle>div {
	text-align: center;
}

#liststyle>div>a {
	font-size: 30px;
}

/* .demo { */
/* 	background: #efd391; */
/* } */
a:hover, a:focus {
	outline: none;
	text-decoration: none;
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
</style>
</head>
<body oncontextmenu="window.event.returnValue=false">

	<div class="container-fluid" style="background-color: #CCFF99">
		<div class="container">
			<div class="row">

				<div class="col-md-12  col-xs-12">
					<h1 align="center" style="color: white">videoname</h1>
					<div class="col-md-8">
						<video controls poster="poster.png">
							<source src="tri.mp4" type="video/mp4">
						</video>
					</div>

					<!--縮視窗後改變 已下-->

					<button type="button" class="navbar-toggle btn btn-danger"
						style="width: 600px" data-toggle="collapse"
						data-target="#myNavbar1">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<div class="col-md-4 col-xs-12">
						<div class="collapse navbar-collapse " id="myNavbar1">

							<ul style="color: red">
								<li>募資</li>
								<li>線上課程</li>
								<li>免費課程</li>
								<li>我要開課</li>
							</ul>
						</div>
					</div>
					<!--縮視窗後改變已上 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 人數、時間 等等-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-2 col-xs-3">
					<img src="004-people.png" style="width: 40%">
					<h5>課程人數</h5>
				</div>
				<div class="col-md-2 col-xs-3">
					<img src="clock.png" style="width: 40%">
					<h5>課程時間</h5>
				</div>
				<div class="col-md-2 col-xs-3">
					<img src="share.png" style="width: 40%">
					<h5>
						<a href="#">分享連結</a>
					</h5>
				</div>
				<div class="col-md-2 col-xs-3">
					<img src="001-download.png" style="width: 40%">
					<h5>
						<a href="#">講義下載</a>
					</h5>
				</div>
				<div class="col-md-2 col-xs-12">
					<small>課程售價</small>
					<h3>NT1230</h3>
				</div>
				<div class="col-md-2 col-xs-12">
					<h6 align="center">星星數量位置</h6>
					<button type="button" class="btn btn-success" style="width: 160px">加入購物車</button>
				</div>
			</div>
		</div>
	</div>
	<!--內容 -->

	<div class="demo">
		<div class="container" style="background: #efd391">
			<div class="row">
				<div class="col-md-8">
					<div class="tab" role="tabpanel">

						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#Section1"
								aria-controls="home" role="tab" data-toggle="tab">Section 1</a></li>
							<li role="presentation"><a href="#Section2"
								aria-controls="profile" role="tab" data-toggle="tab">Section
									2</a></li>
							<li role="presentation"><a href="#Section3"
								aria-controls="messages" role="tab" data-toggle="tab">Section
									3</a></li>
						</ul>

						<div class="tab-content tabs">
							<div role="tabpanel" class="tab-pane fade in active"
								id="Section1">
								<h3>課程簡介</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Cras nec urna aliquam, ornare eros vel, malesuada lorem. Nullam
									faucibus lorem at eros consectetur lobortis. Maecenas nec nibh
									congue, placerat sem id, rutrum velit. Phasellus porta enim at
									facilisis condimentum. Maecenas pharetra dolor vel elit tempor
									pellentesque sed sed eros. Aenean vitae mauris tincidunt,
									imperdiet orci semper, rhoncus ligula. Vivamus scelerisque.</p>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="Section2">
								<h3>課程討論</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Cras nec urna aliquam, ornare eros vel, malesuada lorem. Nullam
									faucibus lorem at eros consectetur lobortis. Maecenas nec nibh
									congue, placerat sem id, rutrum velit. Phasellus porta enim at
									facilisis condimentum. Maecenas pharetra dolor vel elit tempor
									pellentesque sed sed eros. Aenean vitae mauris tincidunt,
									imperdiet orci semper, rhoncus ligula. Vivamus scelerisque.</p>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="Section3">
								<h3></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Cras nec urna aliquam, ornare eros vel, malesuada lorem. Nullam
									faucibus lorem at eros consectetur lobortis. Maecenas nec nibh
									congue, placerat sem id, rutrum velit. Phasellus porta enim at
									facilisis condimentum. Maecenas pharetra dolor vel elit tempor
									pellentesque sed sed eros. Aenean vitae mauris tincidunt,
									imperdiet orci semper, rhoncus ligula. Vivamus scelerisque.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>