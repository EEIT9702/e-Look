<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.http.HttpServletRequest,java.util.*,java.text.*,com.e_Look.message.model.*,com.e_Look.Course.*,com.e_Look.member.model.*,com.e_Look.buyCourse.model.*,javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- <0
 cript -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<style>
#messageHeader{
border:1px solid black;border-radius:15px
}
#messageHeader>img{
width:50px;
}
</style>
</head>
<body>
   
  <!--  <div class=messageContent1 style="border-bottom: 1px solid black">

						<p class=messageContent>
							into the core. In fact, Bootstrap is mobile first. Mobile first
							styles can be found throughout the entire library instead of in
							separate files. To ensure proper rendering and touch zooming, add
							the viewport meta tag to you
							r</p>
	</div> -->
 <table id="productTable" class="table table-bordered">
                       <thead>
                          <tr>
                             <th>留言編號</th>
                             <th>留言</th>
                             <th>留言時間</th>
                             <th>會員編號</th>
                             <th>回應編號</th>
                             <th>課程編號</th>
                             <th>管理</th>
                          </tr>
                       </thead>
                       <tbody>
                      

                     
                       </tbody>
                       <tfoot>
                       
                       <form name="myForm">
                       <tr>
                        <td><input type="hidden" id="ProductID" name="ProductID"><span></span></td>
                        <td><input type="text" class="form-control" id="mContent" name="mContent" placeholder="留言內容"></td>
                        <td><input type="text" style="width:100px" class="form-control" id="UnitPrice" name="memberID" value=${LoginOK.memberID} placeholder=${LoginOK.memberID}></td>
                        <td><input type="text" style="width:100px" class="form-control" id="UnitsInStock" name="courseID" value=200001 placeholder="courseID"></td>
                        <td><button id="buttonAdd" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span></button>
                          <button id="buttonUpdate" type="button" class="btn btn-success"><span class="glyphicon glyphicon-edit"></span></button></td>
                       </tr>
                       </form>
                       </tfoot>
                   </table>	
	
  <script src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script> 
 	<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script> 
 	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
   <script>
   
  /*  courseID=$('#pp').attr('alt'); */
  
    
   
   	$(function(){
   		loadMessage(200001);
   	
   	//新增產品
		$('#buttonAdd').click(function() {

			var frm = $('form[name="myForm"]');
				console.log(frm.serialize());

			//	console.log(frm.serializeArray());
			$.post('/e-Look/_Ccc/MessageController', frm.serialize(), function(data) {
				alert(data);
				loadMessage(200001);
				$('#productTable>tfoot input').val("");
			})

			// 		    	var datas = $('form[name="myForm"]').serialize();
			// 		    	$.post('ProductsInsert',datas,function(data){
			// 		    		alert(data);
			// 		    		loadProduct(1);
			// 		    		 $('#ProductID').val('');
			// 					   $('#ProductName').val('');
			// 					   $('#UnitPrice').val('');
			// 					   $('#UnitsInStock').val('');
			// 		    	});
		})
	
	 		
		  //讀取
	//	   courseID=$('input[name="courseID"]').value();
		   
		   function loadMessage(courseID){
			   $.getJSON('/e-Look/_Ccc/MessageController',{'action':'getOne_For_Display','courseID':courseID},function(datas){
			    	  console.log("111")
			    	  console.log(datas)
			    	  var fragment = $(document.createDocumentFragment());
			    	  $.each(datas,function(idx,messageVO1){
			    		  //product = {}
			    		  var cell1 = $('<td></td>').text(messageVO1.messageID)
			    		  var cell2 = $('<td></td>').text(messageVO1.mContent)
			    		  var cell3 = $('<td></td>').text(messageVO1.mTime)
			    		  var cell4 = $('<td></td>').text(messageVO1.memberID)
			    		  var cell5 = $('<td></td>').text(messageVO1.messageID_response)
			    		  var cell6 = $('<td></td>').text(messageVO1.courseID)
			    		  var cell7 = $('<td></td>').html('<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button> <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>');
			    		  //<tr><td>
			    		  var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
			    		  fragment.append(row);
			    	  });
			    	  
			    	  $('#productTable>tbody').html(fragment);  
		      	}) 
		   }
		   
		 })
   </script>
</body>
</html>