<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#messageHeader{
border:1px solid black;border-radius:15px
}
#messageHeader>img{
width:50px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="messageHeader">
				<div class="col-md-1">
					<img src="imember_image.png" class="img-thumbnail pull-left">
				</div>
				<div class="col-md-11">

					<div>
						<span class="text-left">吳永志</span>

						<%
							Date dNow = new Date();
							SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
						%>
						<span class="pull-right"><a>檢舉</a></span>

					</div>

					<div style="border-bottom: 1px solid black">

						<p>With Bootstrap 2, we added optional mobile friendly styles
							for key aspects of the framework. With Bootstrap 3, we've
							rewritten the project to be mobile friendly from the start.
							Instead of adding on optional mobile styles, they're baked right
							into the core. In fact, Bootstrap is mobile first. Mobile first
							styles can be found throughout the entire library instead of in
							separate files. To ensure proper rendering and touch zooming, add
							the viewport meta tag to your</p>
					</div>


					<div class="col-md-12">

						<div class="panel-group">
							<div class="panel">
								<div class="panel-heading">
									<h4 class="panel-title " style="padding-bottom: 10px">
										<a data-toggle="collapse" href="#collapse1">回應記錄</a>
									</h4>
								</div>
								<div id="collapse1" class="panel-collapse collapse ">
					<!--第一個回應 -->
									<div>
										<div class="col-md-1">
											<img src="imember_image.png" class="img-thumbnail pull-left"
												>

										</div>
										<div class="col-md-11 " style="border-bottom: 1px solid black">
											<span>吳永志</span>
											<%
												out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
											%>
											<span class="pull-right"><a>檢舉</a></span>
											<p>With Bootstrap 2, we added optional mobile friendly
												styles for key aspects of the framework. With Bootstrap 3,
												we've rewritten the project to be mobile friendly from the
												start. Instead of adding on optional mobile styles, they're
												baked right into the core. In fact, Bootstrap is mobile
												first. Mobile first styles can be found throughout the
												entire library instead of in separate files. To ensure
												proper rendering and touch zooming, add the viewport meta
												tag to your</p>
										</div>
									</div>
					<!--第二個回應 -->
									<div>
										<div class="col-md-1">
											<img src="imember_image.png" class="img-thumbnail pull-left"
												>
										</div>
										<div class="col-md-11 " style="border-bottom: 1px solid black">
											<span>吳永志</span>
											<%
												out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
											%>
											<span class="pull-right"><a>檢舉</a></span>
											<p>With Bootstrap 2, we added optional mobile friendly
												styles for key aspects of the framework. With Bootstrap 3,
												we've rewritten the project to be mobile friendly from the
												start. Instead of adding on optional mobile styles, they're
												baked right into the core. In fact, Bootstrap is mobile
												first. Mobile first styles can be found throughout the
												entire library instead of in separate files. To ensure
												proper rendering and touch zooming, add the viewport meta
												tag to your</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 			<!--回應輸入表格-->
					<div class="col-md-12">
						<div class="panel-group">
							<div class="panel">
								<div class="panel-heading">
									<h4 class="panel-title ">
										<a data-toggle="collapse" href="#collapse2">我要回應</a>
									</h4>
								</div>
								<div id="collapse2" class="panel-collapse collapse ">
									<div>
										<p>內容:</p>
										<form action="" method="post">
											<div class="form-group">
												<textarea class="form-control" rows="5" id="comment"></textarea>
											</div>
											<div class="text-right">
												<input type="submit">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>