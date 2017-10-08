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
	margin-top:-40px;
	float: left;
	width: 50%;
	height: 450px;
	margin-left:95px;
}
.listsize>li {
	
	background-color:#888888;
	color:white;
	
}

.listsize {
width:35%;
	float: left;
		border-top-right-radius:2em;
	border-bottom-right-radius:2em;
}

#videoplay {
	background: #e3e3e3;
	width:100%;
}
.container>.nav>li{
text-align:center;
width:33%;
}
.container>.nav>li>a:hover{
border-bottom:2px solid orange;
background-color:#FFFFBB;
}
/* .container>.nav>li>a:visit{ */
/* border-top:1px solid #AAAAAA; */
/* border-left:1px solid #AAAAAA; */
/* border-right:1px solid #AAAAAA; */
/* } */
</style>
</head>
<body>
	<div class="container" id="videoplay">
				<h2 align="center" >videoname</h2>
				
					<video controls loop poster="poster.png">
						<source src="rockman.mp4" type="video/mp4">
					</video>
					<ul class="list-group listsize ">
						<li class="list-group-item">first</li>
						<li class="list-group-item">second</li>
						<li class="list-group-item">third</li>
						<li class="list-group-item">forth</li>
						<li class="list-group-item">fifth</li>
						<li class="list-group-item">sixth</li>
						<li class="list-group-item">seventh</li>
				</ul>			
	</div>



	<div class="container" >
 	<ul class="nav nav-tabs" role="tablist">
	    <li ><a href="#">課程簡介</a></li>
	    <li ><a href="#">課程評價</a></li>
	    <li ><a href="#">問題討論</a></li>
    
 	</ul>
	</div>



</body>
</html>