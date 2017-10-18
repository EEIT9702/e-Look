<%@page import="com.e_Look.search.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />
<title>${initParam.systemName}</title>
<link href="HeaderCssJs/bootstrap.css" rel="stylesheet">
<link href="HeaderCssJs/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<!-- 載入課程模板css -->
<!-- <link href="css/twmplate.css" rel="stylesheet"> -->
<script src="HeaderCssJs/jquery.js"></script>
<script src="HeaderCssJs/bootstrap.min.js"></script>

<style type="text/css">
/* 課程模板 */
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
	width: 340px;
/* 	height:200px; */
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
/* 分類icon */
.formDiv{
	/*width:78%;*/
	height:100px;
	margin-bottom:1%;
	margin-left:auto;
	margin-right:auto;
	border-bottom:2px solid black;
}
.iconWidth{
	width:50px;
}
.iconA{
	text-align:center;
	text-decoration: none;
  	color:#9F35FF;
  	visited: none;
  	active: none;
  	font-size: 20px;
  	font-family: 微軟正黑體;
  	cursor: pointer;
}
.formicon{
}
.formicon a:hover{
	text-decoration: none;
	color:#9F35FF;
}
.formicon div:hover{
    top: 2px;
    left: 2px;
}
.formicon div:ACTIVE{
    top: 4px;
    left: 4px;
}
.text-center{
 	width:50px; 
}
/* 熱門關鍵字 */
.outBorder{
	border:3px solid orange;
	border-radius:25px;
}
.middleborder{
	padding-left:6%;
	padding-top:1.5%;
	padding-bottom:1.5%;
}
.inputarea{
	border:none !important;
	width:80% !important;
}
.searchImg{
	float:right;
}
.searchicon{
	width:30px;
}
.searchicon img:HOVER{
}
.hotkeyword{
 	padding-left:10%;
	padding-top:2%;"
}
.keyword{
 	clear:both;
	color:blue;
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

/*展示廣告圖片*/
function showAdPic() {
	//獲得廣告的DOM
	var ads = document.getElementById("ads");
	//直接在DOM中增加HTML原始程式來增加一個圖片的DOM
	ads.innerHTML = "<img src='img/xmas video sale.jpg' width='650' />";
	//設定計時器,3秒以後關閉廣告圖片
	setTimeout(function() {
		var ads = document.getElementById("ads");
		//隱藏圖片
		ads.style.display = "none";
	}, 1500)
}
//window.onload = showAdPic;

	/*瀑布流關鍵*/
var rowValueX = 0;
$(function() {
	//showAdPic();
	//init();
	river();
	//卷軸初載入高度為0
	var	wst = $(window).scrollTop();
	//視窗高度
	var	wh = $(window).height();
	//整份文件
	var	dh =$(document).height();
	console.log(wst+"---"+dh+"---"+wh);
	$(window).scroll(river);
	
	$('.col-md-1 text-center').click(function(){
		$(this).text("123");
		
	})
	
	
	
});
function refreshRiver(){
	$('#river').text("");
	river();
}
function river(){
	console.log("river()");
	//卷軸初再入高度為0
	var	wst = $(window).scrollTop();
	//視窗高度
	var	wh = $(window).height();
	//整份文件
	var	dh =$(document).height();
	//$('a[href="#menu1"]').text(wst+"---"+dh+"---"+wh)
	console.log(wst+"---"+dh+"---"+wh+","+wh+","+(dh-wh));
	//判斷卷軸是否到底部
	//有時候卷軸會多0.5  改>=的寫法可以解決這個問題
	if( wst>=(dh-wh) || rowValueX==0 ){
		rowValueX++;
		$.get("<%= request.getContextPath() %>/body/body_data2.jsp",{"rowValueY":rowValueX},function(data){
			$('#river').append(data);
		});
	}
}

	
	




/*延遲載入圖片*/
//初始化函數
function init() {
	//開始計時器
	//setTimeout("checkHeight()", 1000);
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
			for (var j = 0; j < pics.length; j++) {
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
<body>
<%-- <jsp:include page="${contextPath}/header.jsp" /> --%>
<jsp:include page="${contextPath}/login.jsp" />


<!-- form按鈕圖式star -->
<div class="formDiv container" style="">
	<div class="col-md-10 ">
	<form class="formicon" action="">
	
		<div class="col-md-1 text-center" >
			<input style="display:none;" type="checkbox" checked="checked" id="class1" ><label class="iconA" for="class1"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/life.svg"><br>生活</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked"  id="class2" ><label class="iconA" for="class2"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/arts.svg"><br>藝術</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class3" ><label class="iconA" for="class3"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/athletics.svg"><br>運動</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class4" ><label class="iconA" for="class4"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/video.svg"><br>影音</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class5" ><label class="iconA" for="class5"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/hand-made.svg"><br>手作</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class6" ><label class="iconA" for="class6"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/other.svg"><br>其他</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class7" ><label class="iconA" for="class7"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/design.svg"><br>設計</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class8" ><label class="iconA" for="class8"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/science.svg"><br>科技</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class9" ><label class="iconA" for="class9"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/business.svg"><br>商業</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class10" ><label class="iconA" for="class10"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/language.svg"><br>語言</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class11" ><label class="iconA" for="class11"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/cooking.svg"><br>烹飪</label>
		</div>
		<div class="col-md-1 text-center">
			<input style="display:none;" type="checkbox" checked="checked" id="class12" ><label class="iconA" for="class12"><img class="iconWidth" src="<%=request.getContextPath() %>/alan/img/program.svg"><br>程式</label>
		</div>
	
	</form>
	</div><!-- /col-md-10 -->
	<div class="col-md-2">
	<form class="navbar-form navbar-left" id="searchKey" method="get" action="">
	
		<div class="input-group outBorder" style="">

			<div class="middleborder" style="">
			
				<input name="keyWord" type="text" class="form-control inputarea" placeholder="Search" style="">
				
				<div class="input-group-btn searchImg" style="">
<%-- 				<input id="searchsubmit" class="searchicon" style="" type="image" src="<%=request.getContextPath()%>/alan/img/search.svg" /> --%>
				<img class="searchicon" src="<%=request.getContextPath()%>/alan/img/search.svg" >
				</div>
			</div>
			
		</div>
	</form>
	<p class="hotkeyword text-left">熱門：
		<span class="keyword">
			<c:forEach var="searchVO" items="<%= new SearchDAO().getKeywordRank(4) %>" >
				${searchVO.keyWord}&nbsp;
			</c:forEach>
		</span>
	</p>
	</div><!-- /col-md-2 -->
</div><!-- /width:78% -->

<!-- 3秒消失廣告star -->
<div style="text-align:center">
	<a href=""><span id="ads"></span></a>
</div>
<!-- 3秒消失廣告end -->

<div class="videobox container">
	<div class="row" id="river">
	
	<!-- end of class="container" -->
	</div>
</div>

<jsp:include page="${contextPath}/footer.jsp" />
</body>
</html>