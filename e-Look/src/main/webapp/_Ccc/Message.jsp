<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.http.HttpServletRequest,java.util.*,java.text.*,com.e_Look.message.model.*,com.e_Look.Course.*,com.e_Look.member.model.*,com.e_Look.buyCourse.model.*,javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
<c:if test="${empty LoginOK}">
	<c:redirect url="/HOME.jsp"/>
	</c:if>
	<jsp:include page="/login.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="messageHeader">
				<div class="col-md-1">
					<img src="<%=request.getContextPath() %>/Image?MemberID=${MessageVO.memberID}" class="img-thumbnail pull-left">
				</div>
				<div class="col-md-11">

					<div>
						<span class="text-left">${LoginOK.mName}</span>

						<%
							Date dNow = new Date();
							SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
						%>
						<div class="dropdown pull-right">
												<button class="btn dropdown-toggle btn-default "
													type="button" data-toggle="dropdown" style="height: 30px">
													<span class="glyphicon glyphicon-option-horizontal"></span>
												</button>
												
												<ul class="dropdown-menu">
												<form method="post" action="<%=request.getContextPath()%>/MessageController" >
													<li><a href="#">檢舉</a></li>
													<li><input type="hidden" name="action" value="update"> 
 													    <input type="hidden" name="action" value="delete"> 
 												 		<input type="submit" value="修改">
 												 	</li>
 												 		<li><input type="hidden" name="action" value="delete"> 
 													    <input type="submit" value="刪除"></li>
 												</form>
												</ul>
												
											</div>

					</div>

					<div style="border-bottom: 1px solid black">

						<p>${MessageVO.mContent}
						
							into the core. In fact, Bootstrap is mobile first. Mobile first
							styles can be found throughout the entire library instead of in
							separate files. To ensure proper rendering and touch zooming, add
							the viewport meta tag to your</p>
					</div>


					<div class="col-md-12">

						<div class="panel-group">
							<div class="panel">
								<div class="panel-heading">
									<h4 class="panel-title " style="padding-bottom: 10px">
										<a data-toggle="collapse" href="#collapse1">回應記錄</a>
									</h4>
								</div>
								<div id="collapse1" class="panel-collapse collapse ">
					<!--第一個回應 -->
									<div>
										<div class="col-md-1">
											<img src="<%=request.getContextPath() %>/Image?MemberID=${MessageVO.memberID}" class="img-thumbnail pull-left"
												>

										</div>
										<div class="col-md-11 " style="border-bottom: 1px solid black">
											<span>${LoginOK.mName}</span>
											<%
												out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
											%>
											<span class="pull-right"><a>檢舉</a></span>
											<p>${MessageVO.mContent}
											
											With Bootstrap 2, we added optional mobile friendly
												styles for key aspects of the framework. With Bootstrap 3,
												we've rewritten the project to be mobile friendly from the
												start. Instead of adding on optional mobile styles, they're
												baked right into the core. In fact, Bootstrap is mobile
												first. Mobile first styles can be found throughout the
												entire library instead of in separate files. To ensure
												proper rendering and touch zooming, add the viewport meta
												tag to your</p>
										</div>
									</div>
					<!--第二個回應 -->
									<div>
										<div class="col-md-1">
											<img src="<%=request.getContextPath() %>/Image?MemberID=${MessageVO.memberID}" class="img-thumbnail pull-left"
												>
										</div>
										<div class="col-md-11 " style="border-bottom: 1px solid black">
											<span>${LoginOK.mName}</span>
											<%
												out.print("<span align=\"center\">" + ft.format(dNow) + "</span>");
											%>
											<span class="pull-right"><a>檢舉</a></span>
											<p>${MessageVO.mContent}回應
											
											entire library instead of in separate files. To ensure
												proper rendering and touch zooming, add the viewport meta
												tag to your
											
											    </p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 			<!--回應輸入表格-->
					<div class="col-md-12">
						<div class="panel-group">
							<div class="panel">
								<div class="panel-heading">
									<h4 class="panel-title ">
										<a data-toggle="collapse" href="#collapse2">我要回應</a>
									</h4>
								</div>
								<div id="collapse2" class="panel-collapse collapse ">
									<div>
										<p>內容:</p>
										<form action="" method="post">
											<div class="form-group">
												<textarea class="form-control" rows="5" id="comment"></textarea>
											</div>
											<div class="text-right">
												<input type="submit">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
     <div style="width:10px;height:60px "></div>
		<div class="container">
        <div class="row">
			<div class="col-md-12" id="messageHeader">
						<p><form method="post" action="<%=request.getContextPath()%>/MessageController" >
				<div>
					<input type="text" class="col-md-10" name="mContent">
					<font color='red'>${errorMsgs}</font>
                    <font color='red'>${MessageInsertOK}</font>
				</div>
				    <input type="hidden" name="action" value="insert">
					<input type="submit" value="留言"><br>
					<input type="radio" name="update" value="message">修改留言
					<input type="submit" value="修改">
				</form></p>
					</div>  
					</div>
					</div>
<!-- 	<script src="js/jquery-1.12.3.min.js"></script> -->
<!-- 	<script src="js/jquery-ui.min.js"></script> -->
	<script>
		$(function(){
		   loadProduct(1);
		  //刪除
		  $('#productTable>tbody').on('click','td>button:nth-child(1)',function(){
			  
					var id = $(this).parents('tr').find('td:nth-child(1)').text();
					$.get('ProductsDelete',{'ProductID':id},function(data){
						alert(data);
						 loadProduct(1);
					})
		  });
			//修改
		  $('#productTable>tbody').on('click','td>button:nth-child(2)',function(){
				  var tds = $(this).parents('tr').find("td");
				  $('#ProductID').val(tds.eq(0).text())
				  $('#ProductID+span').text(tds.eq(0).text())
				  $('#ProductName').val(tds.eq(1).text())
				  $('#UnitPrice').val(tds.eq(2).text())
				  $('#UnitsInStock').val(tds.eq(3).text())
		  });
		  
		  
			
		   //新增產品
		    $('#buttonAdd').click(function(){
		    	
		    	var frm = $('form[name="myForm"]');
		    //	console.log(frm.serialize());

		    //	console.log(frm.serializeArray());
		    $.post('ProductsInsert',frm.serialize(),function(data){
		    	 alert(data);
		    	 loadProduct(1);
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
		   
		    //讀取產品
		   function loadProduct(id){
		    $.getJSON('Products',{'categoryID':id},function(datas){
		    	  //datas = [] array
		    	  var fragment = $(document.createDocumentFragment());
		    	  $.each(datas,function(idx,product){
		    		  //product = {}
		    		  var cell1 = $('<td></td>').text(product.ProductID)
		    		  var cell2 = $('<td></td>').text(product.ProductName)
		    		  var cell3 = $('<td></td>').text(product.UnitPrice)
		    		  var cell4 = $('<td></td>').text(product.UnitsInStock)
		    		  var cell5 = $('<td></td>').html('<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button> <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>');
		    		  //<tr><td>
		    		  var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5]);
		    		  
		    		  fragment.append(row);
		    	  });
		    	  $('#productTable>tbody').html(fragment);
		    	  
		    })
		    	 //更新產品
		   $('#buttonUpdate').click(function(){
			   
				var frm = $('form[name="myForm"]');
			    //	console.log(frm.serialize());

			    //	console.log(frm.serializeArray());
			    $.post('ProductsUpdate',frm.serialize(),function(data){
			    	 alert(data);
			    	 loadProduct(1);
			    	 $('#productTable>tfoot input').val("");
			    	 $('#productTable>tfoot span').text("");
			    })
			   				
</body>
</html>