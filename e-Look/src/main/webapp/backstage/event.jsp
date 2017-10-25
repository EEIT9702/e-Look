<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.e_Look.eLookEvent.*"%>
<%
	eLookEventService eLookEventSvc = new eLookEventService();
	List<eLookEventVO> list = eLookEventSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/stickysort.css" media="all"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/MODALit.min.css">
<link href="<%=request.getContextPath()%>/backstage/css/jquery-ui.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.stickysort.min.js"></script>
<script type="text/javascript" src="js/MODALit.min.js" ></script>
<style>
/* Component styles */
@font-face {
	font-family: 'Blokk';
	src: url('../fonts/BLOKKRegular.eot');
	src: url('../fonts/BLOKKRegular.eot?#iefix') format('embedded-opentype'),
		url('../fonts/BLOKKRegular.woff') format('woff'),
		url('../fonts/BLOKKRegular.svg#BLOKKRegular') format('svg');
	font-weight: normal;
	font-style: normal;
}

html {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 16px;
}

body {
	color: #333;
	height: 100%;
	line-height: 1.5em;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Montserrat', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	text-transform: uppercase;
}

h3 {
	margin: 3rem 0 0 0;
}

h3:first-of-type {
	margin-top: 0;
}

hr {
	border: none;
	border-top: .125rem solid #ddd;
	margin-bottom: 1.375rem;
}

ul {
	margin-top: -.75rem;
}

pre {
	display: block;
	width: 100%;
}

code {
	background-color: rgba(0, 0, 0, .125);
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: 4px;
	display: inline-block;
	margin: 0 .125rem;
	padding: 0 .25rem;
}

pre code {
	display: block;
	padding: .5rem 1rem;
}

p {
	margin-bottom: 1.5rem;
}

p:last-child {
	margin: 0;
}

.filler {
	color: #999;
	font-family: "Blokk", Arial, sans-serif;
}

.message {
	background-color: #eee;
	border: none;
	border-radius: .5rem;
	color: #333;
	display: block;
	padding: 1.5rem;
	text-align: center;
}

.message:hover {
	background-color: #F7941D;
	color: #eee;
}

.message svg {
	background-color: #666;
	border-radius: 50%;
	margin-bottom: 1rem;
	width: 5rem;
	height: 5rem;
	transition: all .125s ease-in-out;
}

.message:hover svg {
	background-color: #eee;
}

.message svg path {
	fill: #eee;
	transition: fill .125s ease-in-out;
}

.message:hover svg path {
	fill: #F7941D;
}

/* Main */
main {
	margin: 0 16.66667%;
}

main section {border-bottom 1px solid #ccc;
	margin-bottom: 3rem;
}

/* Tables */
table {
	border-collapse: collapse;
	margin-bottom: 3rem;
	width: 100%;
	background: #fff;
}

td, th {
	padding: 0.75rem 1.5rem;
	text-align: center;
}

th {
	background-color: #777;
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, .25) 100%);
	font-family: "Montserrat", Arial, sans-serif;
	font-weight: bold;
	color: #fff;
	text-align: center;
	white-space: nowrap;
}

thead a {
	border: none;
}

tbody th {
	background-color: #777;
	background-image: none;
}

tbody tr:nth-child(2n-1) {
	background-color: #eee;
	transition: all .125s ease-in-out;
}

tbody tr:nth-child(2n-1) th {
	background-image: linear-gradient(to left, rgba(0, 0, 0, .125) 0%,
		rgba(0, 0, 0, .25) 100%);
}

tbody tr:hover {
	background-color: #ccc;
}

tbody img {
	border-radius: 50%;
	display: block;
	width: 4rem;
	height: 4rem;
}

.user-name, .user-firstName, .user-lastName, .user-location {
	text-transform: capitalize;
}

/* Section toggle */
.toggle {
	background-color: #666;
	border: none;
	color: #ddd;
	font-size: 1rem;
	font-weight: normal;
	margin-left: 1rem;
	padding: .25rem .5rem;
	text-transform: none;
}

.toggle:hover {
	color: #fff;
}

/* Basic table */
#basic .toggle, #basic th {
	background-color: #9E0039;
}

#basic tbody tr:hover {
	background-color: rgba(245, 152, 157, .25);
}

tfoot tr:hover {
	background-color: #ccc;
}

/* Basic sort table */
#basic-sort .toggle, #basic-sort th {
	background-color: #A36209;
}

#basic-sort tbody tr:hover {
	background-color: rgba(253, 198, 137, .25);
}

/* Biaxial table */
#biaxial .toggle, #biaxial .bx1 th {
	background-color: #1A7B30;
}

#biaxial .bx1 tbody tr:hover {
	background-color: rgba(163, 211, 156, .5);
}

#biaxial .bx2 thead th, #biaxial .bx2 tbody th {
	background-color: #ccc;
	background-image: none;
	color: #333;
}

#biaxial .bx2 tbody tr:nth-child(2n-1) th {
	background-color: #b9b9b9;
}

#biaxial .bx2 img {
	margin: 0 auto .5rem;
}

#biaxial .user-location {
	white-space: nowrap;
}

/* Final */
#final .sticky-wrap {
	overflow-x: auto;
	overflow-y: auto;
	max-height: 75vh;
}

#final .toggle {
	background-color: #004B80;
}

/* Media queries, unrelated to functionality of StickySort */
@media only screen and (max-width: 768px) {
	html {
		font-size: 14px;
	}
	header, #final .sticky-wrap {
		max-height: 25rem;
	}
}

#div1 {
	width: 90%;
	margin: auto auto;
}

.i2Style1 {
	font: bold 13px Tahoma, Geneva, sans-serif;
	font-style: normal;
	color: #ffffff;
	background: #1568db;
	border: 0px solid #ffffff;
	text-shadow: 0px -1px 0px #222222;
	box-shadow: 2px 2px 5px #000000;
	-moz-box-shadow: 2px 2px 5px #000000;
	-webkit-box-shadow: 2px 2px 5px #000000;
	border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	-webkit-border-radius: 10px 10px 10px 10px;
	width: 40px;
	padding: 9px 6px;
	cursor: pointer;
	margin: 0 auto;
}

.i2Style:active {
	cursor: pointer;
	position: relative;
	top: 2px;
}

.i2Style {
	font: bold 13px Tahoma, Geneva, sans-serif;
	font-style: normal;
	color: #ffffff;
	background: #FF3333;
	border: 0px solid #ffffff;
	text-shadow: 0px -1px 0px #222222;
	box-shadow: 2px 2px 5px #000000;
	-moz-box-shadow: 2px 2px 5px #000000;
	-webkit-box-shadow: 2px 2px 5px #000000;
	border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	-webkit-border-radius: 10px 10px 10px 10px;
	width: 40px;
	padding: 9px 6px;
	cursor: pointer;
	margin: 0 auto;
}

.i2Style1:active {
	cursor: pointer;
	position: relative;
	top: 2px;
}
.i2Style3:active {
	cursor: pointer;
	position: relative;
	top: 2px;
}

.i2Style3 {
	font: bold 13px Tahoma, Geneva, sans-serif;
	font-style: normal;
	color: #ffffff;
	background: #00DD77;
	border: 0px solid #ffffff;
	text-shadow: 0px -1px 0px #222222;
	box-shadow: 2px 2px 5px #000000;
	-moz-box-shadow: 2px 2px 5px #000000;
	-webkit-box-shadow: 2px 2px 5px #000000;
	border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	-webkit-border-radius: 10px 10px 10px 10px;
	width: 40px;
	padding: 9px 6px;
	cursor: pointer;
	margin: 0 auto;
}
.dialog{
width:1200px;
}
#i2Style1{background:#00DD77;}
#i2Style2{background:#00DD77;}
.inputtext{text-align:center;}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="bheader.jsp"></jsp:include>
	<div id="div1">
		<table>
			<thead>
				<tr>
					<th>活動編號</th>
					<th>活動名稱</th>
					<th>開始日期</th>
					<th>結束日期</th>
					<th>折扣優惠</th>
					<th>優惠類別</th>
					<th>編輯</th>
				</tr>
			</thead>
			
				<tfoot>
			
				<form METHOD="post"	ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert" id="footer1"  >
				<tr>
					<td></td>
					<td><input type="text" name="eventName" value="${ErrMsg.errName}" class="inputtext"></td>
					<td><input type="text" name="eStartDate" id="thedate" value="${ErrMsg.errStartDate}" class="inputtext thedate" readonly="readonly"></td>
					<td><input type="text" name="eEndDate" id="thedate2" value="${ErrMsg.errEndDate}" class="inputtext thedate2" readonly="readonly"> </td>
					<td><input type="text" name="discount"value="${ErrMsg.errCount}" class="inputtext"></td>
					<td><select class="font courseclass"
						name="courseClass1">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select>&ensp;<select class="font courseclass" name="courseClass2">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select>&ensp;<select class="font courseclass" name="courseClass3">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select></td>
					<td><input type="submit" class="i2Style3" id="i2Style1"  value="新增">
					<input type="hidden" name="action" value="insert">
					</td>	
				</tr>
			</form>

			</tfoot>
			<tbody>
				<c:forEach var="eLookEventVO" items="${list}">
					<tr>
						<td>${eLookEventVO.eventID}</td>
						<td>${eLookEventVO.eventName}</td>
						<td>${eLookEventVO.eStartDate}</td>
						<td>${eLookEventVO.eEndDate}</td>
						<td>${eLookEventVO.discount}</td>
						<td>${eLookEventVO.courseClass1}&ensp;${eLookEventVO.courseClass2}&ensp;${eLookEventVO.courseClass3}</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert"
								style="display: inline;">
								<input type="button" class="i2Style1"  name="update" data-target="#update" value="修改"> 
								<input type="hidden" name="eventID" value="${eLookEventVO.eventID}">
								&ensp;<input type="button" name="delete" class="i2Style" data-target="#modal"  value="刪除">  
							</FORM> 
								</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>     
			</div>
		
                    
<!-- Sets modal target -->
<!-- <button type="button" id="button" data-target="#modal">測試</button> -->
<!-- 刪除訊息視窗 -->
<div id="modal" class="modalit" aria-hidden="true">
    <div class="dialog">
        <header>
            <h3>警告</h3>
        </header>
        <div class="content">
            <p>是否刪除此活動?</p>
        </div>
        <footer>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert" style="display: inline;">
        <input type="submit"  value="刪除"> 
        <input	type="hidden" name="eventID" id="deleteEventID" value="">
		<input type="hidden" name="action" value="delete"></FORM>
            <button type="button" data-modal-btn="dismiss" class="btn primary">取消</button>
        </footer>
    </div>
</div>  

<!-- 修改訊息視窗 -->
<div id="update" class="modalit" aria-hidden="true">
    <div class="dialog">
        <header>
            <h3>修改</h3>
        </header>
        <div class="content" id="updateDiv">
          <table>
          <thead>
				<tr>
			    	<th>活動編號</th>
					<th>活動名稱</th>
					<th>開始日期</th>
					<th>結束日期</th>
					<th>折扣優惠</th>
					<th>優惠類別</th>
				</tr>
			</thead>
          <form METHOD="post"ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert" >
				<tr>
				    <td id="td1"></td>
					<td><input type="text" name="eventName"  class="inputtext"></td>
					<td><input type="text" name="eStartDate"  class="inputtext thedate" readonly="readonly"></td>
					<td><input type="text" name="eEndDate" class="inputtext thedate2" readonly="readonly"> </td>
					<td><input type="text" name="discount" class="inputtext"></td>
					<td><select class="font courseclass"
						name="courseClass1">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select>&ensp;<select class="font courseclass" name="courseClass2">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select>&ensp;<select class="font courseclass" name="courseClass3">
							<option value="null">無</option>
							<option value="全部">全部</option>
							<option value="生活">生活</option>
							<option value="運動">運動</option>
							<option value="影音">影音</option>
							<option value="手作">手作</option>
							<option value="其他">其他</option>
							<option value="設計">設計</option>
							<option value="科技">科技</option>
							<option value="商業">商業</option>
							<option value="語言">語言</option>
							<option value="烹飪">烹飪</option>
							<option value="程式">程式</option>
							<option value="音樂">音樂</option>
					</select></td>
				</tr>
			</table>
        </div>
        <footer>
        <input type="submit"  value="儲存"> 
        <input	type="hidden" name="eventID" id="updateEventID" value="">
		<input type="hidden" name="action" value="update1"></FORM>
            <button type="button" data-modal-btn="dismiss" class="btn primary">取消</button>
        </footer>
    </div>
</div>  

<script>		
			
		//抓取delete該行id	
		$('tbody input[name="delete"]').on('click',function(){
		var event1=$(this).parent().children('input:eq(1)').val();
		$('#deleteEventID').val(event1);
		})			

		$('tbody input[name="update"]').on('click',function(){
			var event2=$(this).parent().children('input:eq(1)').val();
			$('#updateEventID').val(event2);
		$('#td1').text(event2);
		})	
	
		
	  var today = new Date();
	  var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);

	  $('.thedate2').datepicker();
	  $('.thedate').datepicker({
	    //minDate: 0, //從今天後日期才可選
	    minDate: tomorrow, //從明天日期才可選
	    onSelect: function (dat, inst) {
	      $('.thedate2').datepicker('option', 'minDate', dat);
	    }
	  });


	$.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' }); //全局設置日期格式

	//初始彈跳視窗插件

	// Sets modal target
	var modal = new MODALit({
	    el:'.i2Style'
	});   
	
	var modal = new MODALit({
	    el:'.i2Style1'
	});      
</script> 
</body>
</html>