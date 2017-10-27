<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.e_Look.eLookEvent.*"%>
<%
	eLookEventService eLookEventSvc = new eLookEventService();
	List<eLookEventVO> list = eLookEventSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<%@ page import="java.util.*"%>

<!DOCTYPE html >
<html>
<head>
		<title>Generic - Solid State by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<link type="text/css" href="css/stickysort.css" media="all"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/MODALit.min.css">
<link href="<%=request.getContextPath()%>/backstage/css/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/backEvent.css">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.stickysort.min.js"></script>
<script type="text/javascript" src="js/MODALit.min.js" ></script>

	</head>
	<body>
<!-- Header -->
					<header id="header">
						<h1><a href="index.html">Solid State</a></h1>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>
						<!-- Menu -->
					<nav id="menu">
						<div class="inner">
							<h2>Menu</h2>
							<ul class="links">
								<li><a href="index.html">Home</a></li>
								<li><a href="generic.html">Generic</a></li>
								<li><a href="elements.html">Elements</a></li>
								<li><a href="#">Log In</a></li>
								<li><a href="#">Sign Up</a></li>
							</ul>
							<a href="#" class="close">Close</a>
						</div>
					</nav>
					
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Wrapper -->
					<section id="wrapper">
						<header>
							<div class="inner">
								<h2>Generic</h2>
								<p>Phasellus non pulvinar erat. Fusce tincidunt nisl eget ipsum.</p>
							</div>
						</header>

						<!-- Content -->
	<div id="div1">
		<table>
			<thead>
				<tr id="tr1">
					<th>活動編號</th>
					<th>活動名稱</th>
					<th>開始日期</th>
					<th>結束日期</th>
					<th>折扣優惠</th>
					<th>優惠類別</th>
					<th>編輯</th>
				</tr>
			</thead>
			

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
			
						
			
				<form METHOD="post"	ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert"   >
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

			
			</table>     
			</div>
				
					</section>


			</div>

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
            <input type="button" data-modal-btn="dismiss" class="btn primary" value="取消"></input>
        </footer>
    </div>
</div>  




		<!-- Scripts -->
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
			<script src="assets/js/skel.min.js"></script>
<!-- 			<script src="assets/js/jquery.min.js"></script> -->
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>