<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<link href="<%=request.getContextPath() %>/backstage/css/jquery-ui.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/backstage/css/jquery.js"></script>
<script src="<%=request.getContextPath()%>/backstage/css/jquery-ui.min.js"></script>

<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){

	  var today = new Date();
	  var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);

	  $('#thedate2').datepicker();
	  $('#thedate').datepicker({
	    //minDate: 0, //從今天後日期才可選
	    minDate: tomorrow, //從明天日期才可選
	    onSelect: function (dat, inst) {
	      $('#thedate2').datepicker('option', 'minDate', dat);
	    }
	  });
	});


	$.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' }); //全局設置日期格式

// $(function(){

//     $('#thedate').datepicker({
//    	 		dateFormat: 'yy-mm-dd',
//         minDate: 0  , //限制最小日期，從今天開始。過去不可選。
//     });

// });

// $(function(){

//     $('#thedate2').datepicker({
//    	 		dateFormat: 'yy-mm-dd',
//         minDate: 0  , //限制最小日期，從今天開始。過去不可選。
//     });

// });
</script>  

</head>
<style>
.event{
padding-left:60px;
font-size:50px;
margin-bottom: 100px;
}
#inputevent{
width:1500px;
font-size: 50px;

}
.file1{
font-size:50px;
autofocus;
background-color: white;
border:1px black solid;
width:1500px;       

}
.file2{font-size:40px;}

#thedate{font-size:50px;
width:450px;
margin-right: 150px;
}
#thedate2{font-size:50px;
width:450px;
}
#discount{width:1500px;
font-size: 50px;
}
.select1{
font-size: 50px;
}
.font{font-size: 40px;}
.courseclass{
margin-right: 100px;
}
#submit{

}
</style>


<body><div>
<jsp:include page="bheader.jsp"></jsp:include></div>
<form action="<%=request.getContextPath()%>/backstage/elookeventinsert" method="post" enctype="multipart/form-date">
<div class="event">
活動名稱：<input id="inputevent" name="eventName">
</div>

 <div class="event">
選擇起始日期 : <input id="thedate" type="text" name="eStartDate"/>
選擇結束日期 : <input id="thedate2" type="text" name="eEndDate"/>
 </div>
 <div class="event">
 折扣優惠：<input id="discount" name="discount">
 </div>

<div class="event">
選擇優惠類別1：<select class="font courseclass" name="courseclass1">
<option value="null">無</option>
<option value="all">全部</option>
<option value="life">生活</option>
<option value="athletics">運動</option>
<option value="video">影音</option>
<option value="hand-made">手作</option>
<option value="other">其他</option>
<option value="design">設計</option>
<option value="science">科技</option>
<option value="business">商業</option>
<option value="language">語言</option>
<option value="cooking">烹飪</option>
<option value="program">程式</option>
</select>

選擇優惠類別2：<select class="font courseclass" name="courseclass2">
<option value="null">無</option>
<option value="all">全部</option>
<option value="life">生活</option>
<option value="athletics">運動</option>
<option value="video">影音</option>
<option value="hand-made">手作</option>
<option value="other">其他</option>
<option value="design">設計</option>
<option value="science">科技</option>
<option value="business">商業</option>
<option value="language">語言</option>
<option value="cooking">烹飪</option>
<option value="program">程式</option>
</select>
選擇優惠類別3：<select class="font courseclass" name="courseclass3">
<option value="null">無</option>
<option value="all">全部</option>
<option value="life">生活</option>
<option value="athletics">運動</option>
<option value="video">影音</option>
<option value="hand-made">手作</option>
<option value="other">其他</option>
<option value="design">設計</option>
<option value="science">科技</option>
<option value="business">商業</option>
<option value="language">語言</option>
<option value="cooking">烹飪</option>
<option value="program">程式</option>
</select>
</div>

<hr size="3px">
 <div class="event" id="submit" align="center">
<input type="hidden" name="action" value="insert">
<input type="submit" class="file2" value="儲存" >
<input type="button" class="file2" value="取消">
</div>
</form>
</body>
</html>