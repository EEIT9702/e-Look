<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Short Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${SYSTEM.systemName}</title>
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
	
	/*展示廣告圖片*/
	function showAdPic () {
	//獲得廣告的DOM
	var ads = document.getElementById("ads");
	//直接在DOM中增加HTML原始程式來增加一個圖片的DOM
	ads.innerHTML = "<img src='img/xmas video sale.jpg' width='1000' />";
	//設定計時器,3秒以後關閉廣告圖片
	setTimeout (function(){
		var ads = document.getElementById("ads");
		//隱藏圖片
		ads.style.display = "none";
		},3000)
	}
	window.onload = showAdPic;
	
	/*延遲載入圖片*/
	//初始化函數
	function init() {
		//開始計時器
		setTimeout("checkHeight()", 1000);
	}
	//計時器函數
	function checkHeight() {
		//圖片的DOM
		var rows = document.querySelectorAll(".row");
		//console.log(pics)
		//var pic = document.getElementById("pic");
		//取得捲軸的位置
		var sTop = document.documentElement.scrollTop;
		//取得可見區域高度
		var cHeight = document.documentElement.clientHeight;

		for (i = 1; i < rows.length; i++) {
			//圖片距離最左上角的top值
			var top = rows[i].offsetTop;
			//如果捲軸還未來到可見區域
 			if (sTop + cHeight < top) {			
				//計時器繼續工作
				setTimeout("checkHeight()", 1500);
			} else {
				
				var pics = rows[i].querySelectorAll("img");	
				for(var j = 0; j < pics.length; j++){
					pics[j].src = pics[j].getAttribute("lazy_src");
				}
				//把延遲的值指定給src
 				//pics[i].src = pics[i].getAttribute("lazy_src");
				//console.log(top);
			}
 		}

	}
</script>	
</head>
<body onload="init()">
<jsp:include page="${contextPath}/header.jsp"/>
<%-- <jsp:include page="/header.jsp"/> --%>
		<div class="container">
			<div style="text-align:center">
			<a href=""><span id="ads"></span></a>
		</div>
		<!-- 1-3 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/001.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一
				影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/002.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二
				影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" src="img/003.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三
				影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row 1-3 -->

		<!-- 4-6 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/004.jpg" alt="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四
				影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/005.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五
				影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/006.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六
				影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>
		<!-- /.row 4-6 -->

		<!-- 7-9 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/007.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七
				影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/008.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八
				影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/009.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九
				影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row 7-9 -->
		
		<!-- 10-12 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/001.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一
				影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/002.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二
				影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/003.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三
				影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row 10-12 -->

		<!-- 13-15 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/004.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四
				影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/005.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五
				影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/006.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六
				影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>
		<!-- /.row 13-15 -->

		<!-- 16-18 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/007.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七
				影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/008.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八
				影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/009.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九
				影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row 16-18 -->
		
		<!-- 19-21 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/001.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左一</a>
				</h3>
				<p>影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一
				影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一影片一</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/002.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中一</a>
				</h3>
				<p>影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二
				影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二影片二</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/003.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右一</a>
				</h3>
				<p>影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三
				影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三影片三</p>
			</div>
		</div>
		<!-- /.row 19-21 -->

		<!-- 22-24 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/004.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左二</a>
				</h3>
				<p>影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四
				影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四影片四</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/005.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中二</a>
				</h3>
				<p>影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五
				影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五影片五</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/006.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右二</a>
				</h3>
				<p>影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六
				影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六影片六</p>
			</div>
		</div>
		<!-- /.row 22-24 -->

		<!-- 25-27 Projects Row -->
		<div class="row">
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/007.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">左三</a>
				</h3>
				<p>影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七
				影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七影片七</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/008.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">中三</a>
				</h3>
				<p>影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八
				影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八影片八</p>
			</div>
			<div class="item col-md-4 img-portfolio">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-hover" lazy_src="img/009.jpg" alt="" src="">
				</a>
				<h3>
					<a href="portfolio-item.html">右三</a>
				</h3>
				<p>影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九
				影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九影片九</p>
			</div>
		</div>
		<!-- /.row 25-27 -->
	</div>



</body>
</html>