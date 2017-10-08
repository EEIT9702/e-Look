<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">

<!-- <!-- Custom CSS -->
<%-- <link href="<%=request.getContextPath()%>/HeaderCssJs/landing-page.css" --%>
<!-- 	rel="stylesheet"> -->
<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>



<style>
video {
	margin-top:-50px;
	float: left;
	width: 700px;
	height: 500px;

}
.listsize>li {
	width: 400px;	
}

ul {

	float: left;
}

.container {
	background: #e3e3e3;

}
</style>
</head>
<body>
	<div class="container">
				<h2 align="center" >videoname</h2>
				
					<video controls loop poster="poster.png">
						<source src="rockman.mp4" type="video/mp4">
					</video>
					<ul class="list-group listsize ">
						<li class="list-group-item">免费域名注册</li>
						<li class="list-group-item">免费 Window 空间托管</li>
						<li class="list-group-item">图像的数量</li>
						<li class="list-group-item">24*7 支持</li>
						<li class="list-group-item">每年更新成本</li>
				</ul>
				
	</div>



</body>
</html>