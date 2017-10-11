<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>

</head>
<style>
.container {
	background: #e3e3e3;
	margin-bottom: 20px;
	padding-bottom: 50px;
}

h1, h4 {
	text-align: center;
	margin-bottom: 50px;
}

h1 i {
	color: pink;
}
video {

width: 500px;
height: 300px;

	}
</style>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">

				<h2>videoname</h2>
				<div class="embed-responsive embed-responsive-16by9">
<!-- 					<iframe class="embed-responsive-item"> -->

						<video controls loop poster="poster.png">
							<source src="rockman.mp4" type="video/mp4">
						</video>

<!-- 					</iframe> -->
				</div>
			</div>

		</div>
	</div>
</body>

</html>