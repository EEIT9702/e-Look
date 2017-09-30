<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="HeaderCssJs/bootstrap.css" rel="stylesheet">
<link href="HeaderCssJs/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script src="HeaderCssJs/jquery.js"></script>
<script src="HeaderCssJs/bootstrap.min.js"></script>

<style>
li a:hover {
	color: #fc3a63;
	/* 當滑鼠經過時，超連結文字顏色變成桃紅色     ps.被bootstrap.css4518行複寫，所以顏色沒變更 */
	position: relative; /* 當滑鼠經過超連結時，超連結往右下位移2像素 */
	top: 2px;
	left: 2px;
}

/*根據bootstrap.css內容加以覆寫的方式*/
.navbar-default .navbar-nav li a:hover {
	color: #fc3a63;
}

.navbar-default .navbar-nav>li>a:active {
	color: #000000;
}

.navbar-default .navbar-nav {
	padding-left: 300px;
}

body {
	font-size: 20px;
	font-family: Microsoft JhengHei;
}

body {
	font-size: 20px;
}
.container{
	padding-top:60px;
}
</style>
<script type="text/javascript">
	//為文件的滑鼠按下事件定義回呼
	document.onmousedown = function(event) {
		//滑鼠事件：0 > 沒按鍵, 1 > 按左鍵, 2 > 按右鍵, 3 > 按左鍵&右鍵
		//4 > 按中間鍵, 5 > 按左鍵&中間鍵, 6 > 按右鍵&中間鍵, 7 > 按所有鍵
		if (event.button == 2) {
			//提示使用者禁用滑鼠右鍵
			alert("禁用滑鼠右鍵!");
		}	
	}
</script>	
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container">
		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/001.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/002.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/003.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/004.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/005.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/006.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/007.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/008.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/009.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row -->
				<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/001.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/002.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/003.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/004.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/005.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/006.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/007.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/008.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/009.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row -->
				<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/001.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/002.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/003.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/004.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/005.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/006.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>

		<!-- Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/007.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/008.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/009.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row -->
	</div>



</body>
</html>