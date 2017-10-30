<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>檢舉課程管理畫面</title>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<!-- <script type="text/javascript" src="css/jquery.mmenu.js"></script> -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/table2.css">

<style>
.rtitle{
	width:60%;
	height:100px;
	margin:0 auto;
/* 	border:3px solid red; */
}
.rh1{
	font-size:50px;
	text-align:center;
	font-weight:20px;
}
.bhr{
	width:60%;
	border:1px solid black;
	margin:0 auto;
/* 	margin-top:10px; */
	margin-bottom:35px;
}
.cbox{
	width:60%;
	margin:0 auto;
/* 	border:3px solid gold; */
}
.tstyle{
	background-color:#FAF4FF;
}
.row th, td{
	text-align:center;
}
.row td{
/* 	valign="center; */
/* 	valign="middle; */
}
.histiryBtn a{
	text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="backheader.jsp"></jsp:include>
<section id="wrapper">
<header>
	<div class="inner">
		<h2>檢舉管理</h2>
		
	</div>
</header>
</section> 
<div class="container cbox" style="">
		<div class="row">

		  <table id="reportTable" class="table table-bordered tstyle" style="">
                 <thead>
                    <tr>
                       <th style="width:16%">檢舉課程編號</th>
                       <th style="width:16%">課程編號</th>
                       <th style="width:22%">檢舉內容</th>
                       <th style="width:18%">檢舉時間</th>
                       <th style="width:10%">檢舉狀態</th>
                       <th style="width:18%">管理</th>
                    </tr>
                 </thead>
                 <tbody>
                 </tbody>
                  <tfoot style="border-top:none">
<!-- 	                 <form> -->
	                 <tr>
	                  <td><button type="button" value="hideHistory" onclick="self.location.href='back_report-v2.jsp'" class="btn btn-info">檢舉留言管理</button></td>
	                  <td><input type="hidden" id="" name=""><span></span></td>
	                  <td><input type="hidden" id="" name=""><span></span></td>
	                  <td><input type="hidden" id="" name=""><span></span></td>
	                  <td><input type="hidden" id="" name=""><span></span></td>
	                  <td><button type="button" value="hideHistory" onclick="self.location.href='breport_course_history.jsp'" class="btn btn-success">查詢下架影片記錄</button></td>
	                 </tr>
<!-- 	                 </form> -->
                  </tfoot>
			</table>

		</div>

</div>
<script>
		$(function(){
			
			//帶入0到loadReportCourse方法裡
		    loadReportCourse(0);
		
			//下架影片
			//找td底下按鈕的第二個子元素-下架影片
			$('#reportTable>tbody').on('click','td>button:nth-child(1)',function(){
				var reportIDy = $(this).parents('tr').children('td:first-child').text();
				//Course的status設為6,reportCourse的status設為1
				$.post('ReportCourseControl',{'reportIDx':reportIDy,'status':6},function(){
					loadReportCourse(0);
				})
			});
				
			
			//找td底下按鈕的第一個子元素-不處理鈕
			$('#reportTable>tbody').on('click','td>button:nth-child(2)',function(){
				//alert("edit")
				var reportIDy = $(this).parents('tr').children('td:first-child').text();
				//Course的status設為2,reportCourse的status設為2
				$.post('ReportCourseControl',{'reportIDx':reportIDy,'status':2},function(){
					loadReportCourse(0);
				})
			})
			
		    //讀取檢舉
		    //讀取到剛剛觸發帶入的值,並放入id
		   function loadReportCourse(id){
		    $.getJSON('ReportCourseControl',{"status":id},function(datas){
		    	//console.log(datas)

		    	//datas = [] array
		    	//建一個fragment容器,並加上$()轉成jQuery物件去裝迴圈裡產生的物件
		    	var fragment = $(document.createDocumentFragment());
		    	$.each(datas,function(idx,reportV){
		    		//product = {}
		    		var cell1 = $('<td></td>').text(reportV.reportID);
		    		var cell2 = $('<td></td>').text(reportV.reportCourseID);
		    		var cell3 = $('<td></td>').text(reportV.reportContent);
		    		var cell4 = $('<td></td>').text(reportV.reportTime);
		    		var cell5 = $('<td></td>').text(reportV.status);
		    		var cell6 = $('<td></td>').html('<button class="btn btn-primary">下架影片</button>&nbsp;<button class="btn btn-warning">不處理</button></td>');
		    		//<tr><td>
		    		var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6]);
		    		//放到容器裡
		    		fragment.append(row);
		    	})
		    	$('#reportTable>tbody').html(fragment);
		     })
	    	}

			
		//end of loadReportCoursefunction
		})
		
</script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>