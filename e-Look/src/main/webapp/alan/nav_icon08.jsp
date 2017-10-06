<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

/* #categoryBar li>a:active {  */
/* 	-webkit-filter: grayscale(1);  */
/* }  */
a{
	text-decoration:none;
}
/* 	.grey{ */
/* 		-webkit-filter: grayscale(1);  /*沒有任何色彩的黑白影像*/ */
/* 	} */
/* 	.original{ */
/* 		 -webkit-filter: grayscale(0);  /*顏色不變*/ */
/* 	} */

</style>
<script type="text/javascript">
	var greyArray = new Array([10]);
	greyArray[0] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/life.svg'><br>生活"];
	greyArray[1] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/arts.svg'><br>藝術"];
	greyArray[2] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/athletics.svg'><br>運動"];
	greyArray[3] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/hand-made.svg'><br>手作"];
	greyArray[4] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/other.svg'><br>其他"];
	greyArray[5] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/design.svg'><br>設計"];
	greyArray[6] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/science.svg'><br>科技"];
	greyArray[7] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/business.svg'><br>商業"];
	greyArray[8] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/language.svg'><br>語言"];
	greyArray[9] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/cooking.svg'><br>烹飪"];
	greyArray[10] = ["<img style='-webkit-filter:grayscale(1)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/program.svg'><br>程式"];

	var originalArray = new Array([10]);
	originalArray[0] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/life.svg'><br>生活"];
	originalArray[1] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/arts.svg'><br>藝術"];
	originalArray[2] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/athletics.svg'><br>運動"];
	originalArray[3] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/hand-made.svg'><br>手作"];
	originalArray[4] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/other.svg'><br>其他"];
	originalArray[5] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/design.svg'><br>設計"];
	originalArray[6] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/science.svg'><br>科技"];
	originalArray[7] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/business.svg'><br>商業"];
	originalArray[8] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/language.svg'><br>語言"];
	originalArray[9] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/cooking.svg'><br>烹飪"];
	originalArray[10] = ["<img style='-webkit-filter:grayscale(0)' class='svgIcon' src='<%=request.getContextPath() %>/alan/img/program.svg'><br>程式"];

	document.addEventListener("DOMContentLoaded", function () {
// 	    iconNum = document.querySelectorAll(".ndiv span");
// 	    iconLen = iconNum.length;
// 	    console.log("iconNum = " + iconNum);
// 	    console.log("iconLen = " + iconLen);

// 	     for (var i = 0; i < iconLen; i++) {
// 	    	 console.log("1 - onclick");
// 	    	 iconNum[i].onclick = Click;
// 	    	 //iconNum[i].innerHTML = originalArray[i];
// 	     }
	 });
	
//   	 function Click() {
//           for (i = 0; i < iconLen; i++) {
//         	  console.log("2 - Click()");
//         	  iconNum[i].innerHTML = greyArray[i];
//         	  this.innerHTML = originalArray[i];
//           }
//       }

// function chg1() {
// 	var iconNum = document.querySelectorAll("img.svgIcon");
// 	for(var i = 0; i < iconNum.length; i++) {
// 		iconNum[i].getAttribute("lazy_style");
// 	}
// 	iconNum[0].getAttribute("style");
// }

</script>
</head>
<body>

<div class="ndiv" id="categoryBar">
	<ul>
		<li><a href="?courseClassID=1"><img style='<c:choose><c:when test="${param.courseClassID == 1 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/life.svg" ><br>生活</a></li>
		<li><a href="?courseClassID=2"><img style='<c:choose><c:when test="${param.courseClassID == 2 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/arts.svg"><br>藝術</a></li>
		<li><a href="?courseClassID=3"><img style='<c:choose><c:when test="${param.courseClassID == 3 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/athletics.svg"><br>運動</a></li>
		<li><a href="?courseClassID=4"><img style='<c:choose><c:when test="${param.courseClassID == 4 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/hand-made.svg"><br>手作</a></li>
		<li><a href="?courseClassID=5"><img style='<c:choose><c:when test="${param.courseClassID == 5 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/other.svg"><br>其他</a></li>
		<li><a href="?courseClassID=6"><img style='<c:choose><c:when test="${param.courseClassID == 6 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/design.svg"><br>設計</a></li>
		<li><a href="?courseClassID=7"><img style='<c:choose><c:when test="${param.courseClassID == 7 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/science.svg"><br>科技</a></li>
		<li><a href="?courseClassID=8"><img style='<c:choose><c:when test="${param.courseClassID == 8 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/business.svg"><br>商業</a></li>
		<li><a href="?courseClassID=9"><img style='<c:choose><c:when test="${param.courseClassID == 9 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/language.svg"><br>語言</a></li>
		<li><a href="?courseClassID=10"><img style='<c:choose><c:when test="${param.courseClassID == 10 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/cooking.svg"><br>烹飪</a></li>
		<li><a href="?courseClassID=11"><img style='<c:choose><c:when test="${param.courseClassID == 11 || empty param.courseClassID}">-webkit-filter:grayscale(0)</c:when><c:otherwise>-webkit-filter:grayscale(1)</c:otherwise></c:choose>' class="svgIcon" src="<%=request.getContextPath() %>/alan/img/program.svg"><br>程式</a></li>
	</ul>
</div>${param.courseClassID}


<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/life.svg"><a href="#category1">生活</div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/arts.svg"><a href="#category2">藝術</div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/athletics.svg"><a href="#category3">運動</div> --%>
<%-- 		<div><img class="svgIcon" src="<%=request.getContextPath() %>/alan/img/video.svg"><a href="#category4">影音</div> --%>
		
<!-- 		<ul class="menu" id="menu"> -->
<!-- 			<li><a href="#">選單1</li> -->
<!-- 			<li><a href="#">選單2</li> -->
<!-- 			<li><a href="#">選單3</li> -->
<!-- 			<li><a href="#">選單4</li> -->
<!-- 		</ul> -->
</alan>
</html>