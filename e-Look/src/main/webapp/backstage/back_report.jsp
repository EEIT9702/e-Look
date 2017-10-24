<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.e_Look.reportMessage.model.*"%>
<%@ page import="com.e_Look.message.model.*"%>
<%
	ReportMessageDAO dao = new ReportMessageDAO();

    List<ReportMessageVO> list = dao.getNotHandle();
    pageContext.setAttribute("list",list);
    
// 	MessageDAO dao2 = new MessageDAO();
// 	List<MessageVO> list2 = dao2.getAll();
// 	pageContext.setAttribute("list2",list2);

%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>檢舉管理畫面</title>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script type="text/javascript" src="css/jquery.mmenu.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

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
</style>
</head>
<body>
<jsp:include page="bheader.jsp"></jsp:include>
	<div class="rtitle" style="">
		<h1 class="rh1" style="">檢舉管理</h1>
	</div>
	<div class="bhr" style=""></div>
	<div class="container cbox" style="">
		<div class="row">

		  <table id="reportTable" class="table table-bordered tstyle" style="">
                 <thead>
                    <tr>
                       <th style="width:10%">檢舉編號</th>
                       <th style="width:20%">檢舉內容</th>
                       <th style="width:22%">留言內容</th>
                       <th style="width:20%">檢舉時間</th>
                       <th style="width:10%">檢舉狀態</th>
                       <th style="width:18%">管理</th>
                    </tr>
                 </thead>
                 <tbody>
                <c:forEach var="reportMessageVO" items="${list}">
                    <tr><td>${reportMessageVO.reportId}</td><td>${reportMessageVO.reportContent}</td><td>${reportMessageVO.messageVO.mContent}</td>
                    <td>${reportMessageVO.reportTime}</td><td>${reportMessageVO.status}</td><td>
	                    <button id="" class="btn btn-primary">確認</button>
	                    <button class="btn btn-warning">不處理</button></td>
                    </tr>
<!--                     <tr><td>1002</td><td>我不喜歡</td><td>x@o!*x/</td><td>2017/10/29</td><td>0</td><td> -->
<!-- 	                    <button class="btn btn-primary">確認</button> -->
<!-- 	                    <button class="btn btn-warning">不處理</button></td> -->
<!--                     </tr> -->
<!--                     <tr><td>1003</td><td>我不喜歡</td><td>~@o!*x/</td><td>2017/10/30</td><td>0</td><td> -->
<!-- 	                    <button class="btn btn-primary">確認</button> -->
<!-- 	                    <button class="btn btn-warning">不處理</button></td> -->
<!--                     </tr> -->
<!--                    	<tr><td>1004</td><td>我討厭</td><td>-^%@!*/</td><td>2017/10/31</td><td>0</td><td> -->
<!-- 	                    <button class="btn btn-primary">確認</button> -->
<!-- 	                    <button class="btn btn-warning">不處理</button></td> -->
<!--                     </tr> -->
                </c:forEach>
                  </tbody>
<!--                  <tfoot> -->
<!--                  <form name="reportForm"> -->
<!--                  <tr> -->
<!--                   <td><input type="hidden" id="ProductID" name="ProductID"><span></span></td> -->
<!--                   <td><input type="text" class="form-control" id="ProductName" name="ProductName" placeholder="檢舉內容"></td> -->
<!--                   <td><input type="text" style="width:100px" class="form-control" id="UnitPrice" name="UnitPrice" placeholder="檢舉時間"></td> -->
<!--                   <td><input type="text" style="width:100px" class="form-control" id="UnitsInStock" name="UnitsInStock" placeholder="狀態"></td> -->
<!--                   <td><button id="buttonAdd" type="button" class="btn btn-primary">確認</button> -->
<!--                       <button id="buttonUpdate" type="button" class="btn btn-success">不處理</button></td> -->
<!--                  </tr> -->
<!--                  </form> -->
<!--                  </tfoot> -->
            </table>
		</div>

	</div>
	<script>
		$(function(){
			
			//帶入0到loadReportMessage方法裡
		    loadReportMessage(0);
			
			//找td底下按鈕的第一個子元素-刪除鈕
			//$('#productTable td>button:nth-child(1)').click(function(){
			$('#reportTable>tbody').on('click','td>button:nth-child(1)',function(){
				//用nth-child找父元素,因為往上不只一層,所以要用有s的,往上找到'tr',在往下撈所有的'td'
				var id = $(this).parents('tr').find('td:nth-child(1)').text();
				//alert(id);
				$.get('ReportConfirm',{'reportId':id},function(data){
					//alert(data);
					//檢舉狀態更改完要再重新載入
					loadReportMessage(0);
				})
			})
			
		    //讀取檢舉
		    //讀取到剛剛觸發帶入的值放入id
		   function loadReportMessage(id){
		    $.getJSON('ReportMessages',{"status":id},function(datas){
		    	console.log(datas)

		    	//datas = [] array
		    	//建一個fragment容器,並加上$()轉成jQuery物件去裝迴圈裡產生的物件
		    	var fragment = $(document.createDocumentFragment());
		    	$.each(datas,function(idx,report){
		    		//product = {}
		    		var cell1 = $('<td></td>').text(report.reportID);
		    		var cell2 = $('<td></td>').text(report.reportMessageID);
		    		var cell3 = $('<td></td>').text(report.reportMemberID);
		    		var cell4 = $('<td></td>').text(report.reportContent);
		    		var cell5 = $('<td></td>').text(report.reportTime);
		    		var cell6 = $('<td></td>').text(report.status);
		    		var cell7 = $('<td></td>').html('<button class="btn btn-primary">確認</button><button class="btn btn-warning">不處理</button></td>');
		    		//<tr><td>
		    		var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
		    		//放到容器裡
		    		fragment.append(row);
		    	})
		    	$('#reportTable>tbody').html(fragment);
		     })
	    	}
		
		//end of readyfunction
		})
		
	</script>
</body>
</html>