<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style>

video::-internal-media-controls-download-button {
	display: none;
}

video::-webkit-media-controls-enclosure {
	overflow: hidden;
}

video::-webkit-media-controls-panel {
	width: calc(100% + 30px); /* Adjust as needed */
}
#abgneBlock {
	width: 1450px;
	height: 450px;
	position: relative;
	overflow: hidden;
	
}

#abgneBlock ul.list {
	padding: 0;
	margin: 0;
	position: absolute;
	width: 9999px;
	height: 100%;
}

#abgneBlock ul.list li {
	float: left;
	width: 1450px;
	height: 100%;
}

#abgneBlock .list img {
	width: 100%;
	height: 100%;
	border: 0;
}
#abgneBlock .list video {
	width: 800px;
	height:435px;
	border:0;
	margin-left:325px ;
}

#abgneBlock ul.playerControl {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	bottom: 5px;
	right: 5px;
	height: 14px;
}

#abgneBlock ul.playerControl li {
	float: left;
	width: 23px;
	height: 14px;
	cursor: pointer;
	margin: 0px 2px;
	background: url(images/rect_ctrl.png) no-repeat 0 0;
}

#abgneBlock ul.playerControl li.current {
	background-position: -23px 0;
}
</style>
<body>

	<script type="text/javascript">
		$(function() {
			// 先取得必要的元素並用 jQuery 包裝
			// 再來取得 $block 的高度及設定動畫時間
			var $block = $('#abgneBlock'), $slides = $('ul.list', $block), _width = $block
					.width(), $li = $('li', $slides), _animateSpeed = 600;
			// 產生 li 選項
			var _str = '';
			for (var i = 0, j = $li.length; i < j; i++) {
				// 每一個 li 都有自己的 className = playerControl_號碼
				_str += '<li class="playerControl_' + (i + 1) + '"></li>';
			}

			// 產生 ul 並把 li 選項加到其中
			// 並幫 li 加上 mouseover 事件
			$('<ul class="playerControl"></ul>').html(_str).appendTo(
					$slides.parent()).css('left', function() {
				// 把 .playerControl 移到置中的位置
				return (_width - $(this).width()) / 2;
			}).find('li').mouseover(
					function() {
						var $this = $(this);
						$this.addClass('current').siblings('.current')
								.removeClass('current');
						// 移動位置到相對應的號碼
						$slides.stop().animate({
							left : _width * $this.index() * -1
						}, _animateSpeed);
						return false;
					}).eq(0).mouseover();
		});
	</script>
	<div class="container">
		<div style="margin: 0px auto" id="abgneBlock">
			<ul class="list">
				<li ><video autoplay="autoplay" controls
							src="images/Yif-Magic.mp4"></video></li>
				<li><a target="_blank" href="#"><img src="images/04.jpg"></a></li>
				<li><a target="_blank" href="#"><img src="images/02.jpg"></a></li>
				<li><a target="_blank" href="#"><img src="images/03.jpg"></a></li>
			</ul>
		</div>
	</div>
</body>
</html>