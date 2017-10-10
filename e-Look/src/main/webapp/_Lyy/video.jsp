<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.css"
	rel="stylesheet">
<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<style>

video {
	margin-top:-37px;
	float: left;
	width: 660px;
	height: 450px;
	margin-left:95px;
}
.listsize>li {
	
	background-color:#888888;
	color:white;
	height:60px;
}

.listsize {
	width:36%;
	float: left;
	border-top-right-radius:2em;
	font-size:20px;
}

#videoplay {
	background: #e3e3e3;
	width:100%;
}
.container>.nav>li{
text-align:center;
width:33.2%;
}
.container>.nav>li>a:hover{
border-bottom:2px solid orange;
background-color:#FFFFBB;
}
video::-internal-media-controls-download-button {
    display:none;
}
video::-webkit-media-controls-enclosure {
    overflow:hidden;
}
video::-webkit-media-controls-panel {
    width: calc(100% + 30px); /* Adjust as needed */
}
.col-sm-8{
border-bottom:1px solid #DDDDDD;
}
</style>
</head>
<body  oncontextmenu="window.event.returnValue=false">
	<div class="container" id="videoplay">
				<h2 align="center" >videoname</h2>
				
					<video controls loop poster="poster.png">
						<source src="tri.mp4" type="video/mp4">
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
			<div class="row" >
				<div class="col-md-12" style="height:80px" >
					<div class="col-md-2">
					<img src="004-people.png" >	
					<span>課程人數</span>
							
					</div>
					<div class="col-md-2">
					<img src="clock.png" height="64px">	
					<span>課程時間</span>			
					</div>
					<div class="col-md-2">
					<img src="002-question.png" height="64px">
					<span>問題討論</span>					
					</div>
					<div class="col-md-2">
					<img src="001-download.png" height="64px">	
					<span>講義下載</span>				
					</div>
					<div class="col-md-2" style="height:64px">
						 <small>課程售價</small>
						 <h3 align="center">NT12312</h3>					 
					</div>	
					<div class="col-md-2" style="height:80px">
						<h4>星星數量位置</h4>
						<button type="button" class="btn btn-success" style="width:170px">購買課程</button> 
					</div>	
				</div>	
			</div>
					
		 	<ul class="nav nav-tabs" role="tablist" style="margin-top:30px">
			    <li ><a href="#"><b>課程簡介</b></a></li>
			    <li ><a href="#"><b>課程評價</b></a></li>
			    <li ><a href="#"><b>問題討論</b></a></li>
		 	</ul>
		 	
		 	<div class="col-md-12">
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	<p>自我介紹</p>	
		 	</div>
	</div>

</body>
</html>