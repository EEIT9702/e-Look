<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/backstage/css/jquery-ui.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/backstage/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/backstage/js/jquery-ui.min.js"></script>

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


</script>  

</head>
<style>
.event{
padding-left:60px;
font-size:30px;
 
}
#inputevent{
width:1000px;
font-size: 30px;

}
.file1{
font-size:30px;
autofocus;
background-color: white;
border:1px black solid;
width:1000px;       

}
.file2{font-size:30px;}

#thedate{font-size:30px;
width:947px;
margin-right: 150px;
}
#thedate2{font-size:30px;
width:947px;
}
#discount{width:1000px;
font-size: 30px;
}
.select1{
font-size: 30px;
}
.font{font-size: 30px;}
.courseclass{
margin-right: 100px;
}
#submit{

}
.errormessage{
font-size: 30px;
color: red;
padding-top: 35px;
padding-bottom: 35px;
padding-left:60px;

}
#body{
margin:auto auto;
background:#FFF0F5;

padding-top: 30px;
width: 1370px;
border:solid black 1px;
border-radius: 30px;
}

.hr1{margin: 50px;}
</style>


<body><div id="all">
<jsp:include page="bheader.jsp"></jsp:include></div>
<div id="body">
<form action="<%=request.getContextPath()%>/backstage/elookeventinsert" method="post" enctype="multipart/form-date">
<div class="event">
活動名稱：<input type="text" id="inputevent" name="eventName">
</div>
<p class="errormessage">
              ${ErrMsg.errName}
           </p>
 <div class="event">
選擇起始日期 : <input id="thedate" type="text" name="eStartDate" readonly="readonly"/>
 </div>
   <p class="errormessage">
              ${ErrMsg.errStartDate}</p>
 <div class="event">
 選擇結束日期 : <input id="thedate2" type="text" name="eEndDate" readonly="readonly"/>
 </div>
  <p class="errormessage">
               ${ErrMsg.errEndDate}
           </p>
 <div class="event">
 折扣優惠：<input type="text" id="discount" name="discount">
 </div>
<p class="errormessage">
              ${ErrMsg.errCount}
           </p>
<div class="event">
選擇優惠類別1：<select class="font courseclass" name="courseClass1">
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

選擇優惠類別2：<select class="font courseclass" name="courseClass2">
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
選擇優惠類別3：<select class="font courseclass" name="courseClass3">
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

<hr size="3px" class="hr1">
 <div class="event" id="submit" align="center">
<input type="hidden" name="action" value="insert">
<input type="submit" class="file2" value="儲存" >
<input type="button" class="file2" value="取消">
</div>
</form>
</div>
</body>
</html>