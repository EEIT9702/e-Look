<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>凸顯導覽列</title>
<style type="text/css">
.menu{
	list-style:none;
	width:400px;
	margin:10px auto;
}
.menu li{
	float:left;
	width:98px;
	border:1px solid black;
}
.menu a{
	color:black;
	width:100%;
}
/* .menu a:hover{ */
/* 	background-color:pink; */
/* }  */
.curr{
	background-color:pink;
}
</style>
<script type="text/javascript">
	var currentIndex = 1;
	function init() {
		//獲得選單DOM
		var menu = document.getElementById("menu");
		//檢查所有選單項
		var items = menu.children;
		for(var i = 0; i < items.length; i++) {
			//獲得目前的選單項
			var item = items[i];
			//如果檢查到正在瀏覽的選單項,就增加樣式
			if(i == currentIndex) {
				item.className = "curr";
			}
		}
	}
</script>
</head>
<body>
	<div style="text-align:center" onload="init();">
		<ul class="menu" id="menu">
			<li><a href="#">選單1</a></li>
			<li><a href="#">選單2</a></li>
			<li><a href="#">選單3</a></li>
			<li><a href="#">選單4</a></li>
		</ul>
	</div>

</body>
</html>