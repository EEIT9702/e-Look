<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ndiv{
	width:800px;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
}
.ndiv li{
	list-style-type:none;
	float:left;
	margin:8px;
}
.svgIcon{
	width:48px;
}
.grey{
	-webkit-filter: grayscale(1);  /*沒有任何色彩的黑白影像*/
}
.original{
	 -webkit-filter: grayscale(0);  /*顏色不變*/
}
</style>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
	    iconNum = document.querySelectorAll("img.svgIcon");
	    iconLen = iconNum.length;
	    console.log("iconNum = " + iconNum);
	    console.log("iconLen = " + iconLen);

	     for (var i = 0; i < iconLen; i++) {
	    	 console.log("1 - onclick");
	    	 iconNum[i].onclick = Click;
	     }
	 });
	
  	 function Click() {
          for (i = 0; i < iconLen; i++) {
        	  console.log("2 - Click()");
        	  iconNum.className = "svgIcon grey";
        	  iconNum[i].className = "svgIcon original";
          }
      }



</script>
</head>
<body>
<!-- 	<div style="text-align:center;"> -->
	<div class="ndiv">
		<ul>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/life.svg"><br>生活</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/arts.svg"><br>藝術</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/athletics.svg"><br>運動</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/hand-made.svg"><br>手作</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/other.svg"><br>其他</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/design.svg"><br>設計</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/science.svg"><br>科技</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/business.svg"><br>商業</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/language.svg"><br>語言</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/cooking.svg"><br>烹飪</li>
			<li><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/program.svg"><br>程式</li>
		</ul>
	</div>


<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/life.svg"><a href="#category1">生活</a></div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/arts.svg"><a href="#category2">藝術</a></div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/athletics.svg"><a href="#category3">運動</a></div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/video.svg"><a href="#category4">影音</a></div> --%>
		
<!-- 		<ul class="menu" id="menu"> -->
<!-- 			<li><a href="#">選單1</a></li> -->
<!-- 			<li><a href="#">選單2</a></li> -->
<!-- 			<li><a href="#">選單3</a></li> -->
<!-- 			<li><a href="#">選單4</a></li> -->
<!-- 		</ul> -->
</alan>
</html>