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
<!-- 載入課程模板css -->
<!-- <link href="css/twmplate.css" rel="stylesheet"> -->
<script src="HeaderCssJs/jquery.js"></script>
<script src="HeaderCssJs/bootstrap.min.js"></script>

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
    width: 310px;
    height:200px;
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
    color:gray;
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
font-size:30px;
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
	//window.onload = showAdPic;
	
	$(function(){
		showAdPic();
		init();
	})
	
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
<body>
<jsp:include page="${contextPath}/header.jsp"/>
<%-- <jsp:include page="/header.jsp"/> --%>
	  <div class="container">
			<div style="text-align:center">
			<a href=""><span id="ads"></span></a>
			</div>
		<!-- 1-4 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="img/001.jpg" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題1</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:31分鐘</small>
                        <br>
                        <small>觀看人數:113人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="img/002.jpg" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題2</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:42分鐘</small>
                        <br>
                        <small>觀看人數:94人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="img/003.jpg" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題3</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:28分鐘</small>
                        <br>
                        <small>觀看人數:225人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="img/004.jpg" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題4</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:37分鐘</small>
                        <br>
                        <small>觀看人數:172人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 1-4 Template -->
		<br>
		<!-- 5-8 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/005.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題5</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:43分鐘</small>
                        <br>
                        <small>觀看人數:24人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/006.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題6</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:36分鐘</small>
                        <br>
                        <small>觀看人數:260人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/007.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題7</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:48分鐘</small>
                        <br>
                        <small>觀看人數:145人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/008.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題8</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:38分鐘</small>
                        <br>
                        <small>觀看人數:312人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 5-8 Template -->
		<br>
		<!-- 9-12 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/009.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題9</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:33分鐘</small>
                        <br>
                        <small>觀看人數:423人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/010.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題10</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:40分鐘</small>
                        <br>
                        <small>觀看人數:166人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/011.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題11</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:32分鐘</small>
                        <br>
                        <small>觀看人數:151人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/012.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題12</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:31分鐘</small>
                        <br>
                        <small>觀看人數:67人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 9-12 Template -->
		<br>
		<!-- 13-16 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/001.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題13</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:34分鐘</small>
                        <br>
                        <small>觀看人數:153人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/002.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題14</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:147分鐘</small>
                        <br>
                        <small>觀看人數:124人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/003.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題15</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:38分鐘</small>
                        <br>
                        <small>觀看人數:121人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/004.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題16</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:32分鐘</small>
                        <br>
                        <small>觀看人數:148人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 13-16 Template -->
		<br>
		<!-- 17-20 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/005.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題17</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:25分鐘</small>
                        <br>
                        <small>觀看人數:454人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/006.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題18</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:30分鐘</small>
                        <br>
                        <small>觀看人數:140人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/007.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題19</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:27分鐘</small>
                        <br>
                        <small>觀看人數:273人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/008.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題20</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:42分鐘</small>
                        <br>
                        <small>觀看人數:302人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 17-20 Template -->
		<br>
		<!-- 21-24 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/009.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題21</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:28分鐘</small>
                        <br>
                        <small>觀看人數:333人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/010.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題22</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:47分鐘</small>
                        <br>
                        <small>觀看人數:126人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/011.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題23</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:39分鐘</small>
                        <br>
                        <small>觀看人數:167人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/012.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題24</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:34分鐘</small>
                        <br>
                        <small>觀看人數:289人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 21-24 Template -->
		<br>
		<!-- 25-28 Template row -->
		<div class="row">
			<div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/001.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題25</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:34分鐘</small>
                        <br>
                        <small>觀看人數:110人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/002.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題26</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:34分鐘</small>
                        <br>
                        <small>觀看人數:216人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/003.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題27</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:30分鐘</small>
                        <br>
                        <small>觀看人數:246人</small>   
                    </div>
                </div>
            </div>
            <div class="item col-md-3 img-portfolio" style="width: 341px">
                <div class="card card-inverse">
                    <img class="img-responsive img-hover card-img-top" src="" lazy_src="img/004.jpg" 
                    alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="" lazy_src="../Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis">測試課程標題28</p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：免費</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:37分鐘</small>
                        <br>
                        <small>觀看人數:161人</small>   
                    </div>
                </div>
            </div>
        </div>
		<!-- end 25-28 Template -->

	<!-- end of class="container" -->
	</div>

</body>
</html>