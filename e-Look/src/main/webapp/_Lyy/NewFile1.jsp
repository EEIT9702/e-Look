<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"rel="stylesheet">

<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<style>
.container {
	background: #e3e3e3;
	margin-bottom: 20px;
	padding-bottom: 50px;
}
video {
	float: left;
	width: 500px;
	height: 300px;
	padding: 5px;
}
.listsize>li{
width:400px;
vertical-align: middle;
}
ul {
	padding-top: 10px;
	float: right;
}
</style>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">

				<h2>videoname</h2>

				<div class="embed-responsive embed-responsive-16by9">

					<video controls loop poster="poster.png">
					 <source src="rockman.mp4" type="video/mp4">
					 </video>
				</div>
				
				<ul class="list-group listsize ">
					<li class="list-group-item">first</li>
					<li class="list-group-item">Window</li>
					<li class="list-group-item">图像的数量</li>
					<li class="list-group-item">24*7 支持</li>
					<li class="list-group-item">每年更新成本</li>

				</ul>
			
			</div>

		</div>
	</div>
</body>
</html>