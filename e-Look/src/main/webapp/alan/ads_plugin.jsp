<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application" />
<link rel="Short Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%= request.getContextPath() %>/body/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-309104">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-309104">
					</li>
<!-- 					<li data-slide-to="1" data-target="#carousel-309104"> -->
					<li data-slide-to="1" data-target="<%= request.getContextPath() %>/body/img/001.jpg">
					</li>
					<li data-slide-to="2" data-target="<%= request.getContextPath() %>/body/img/002.jpg">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="img/1.jpg" />
						<div class="carousel-caption">
							<h4>
								棒球
							</h4>
							<p>
								棒球運動是一種以棒打球為主要特點，集體性、對抗性很強的球類運動項目，在美國、日本尤為盛行。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/2.jpg" />
						<div class="carousel-caption">
							<h4>
								衝浪
							</h4>
							<p>
								衝浪是以海浪為動力，利用自身的高超技巧和平衡能力，搏擊海浪的一項運動。運動員站立在衝浪板上，或利用腹板、跪板、充氣的橡皮墊、划艇、皮艇等駕馭海浪的一項水上運動。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/3.jpg" />
						<div class="carousel-caption">
							<h4>
								自行車
							</h4>
							<p>
								以自行車為工具比賽騎行速度的體育運動。1896年第一屆奧林匹克運動會上被列為正式比賽項目。環法賽為最著名的世界自行車錦標賽。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="<%= request.getContextPath() %>/body/img/003.jpg" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-309104" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>