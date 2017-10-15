<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>開課流程</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step1.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step2.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step4.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
	

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/autosize.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/bootstrap-datetimepicker.zh-TW.js"></script>

</head>

<body>
	<input id="datetimepicker1" type="text" />
  <script>
    $(document).ready(function(){ 
      $('#datetimepicker1').datetimepicker();
      });
	</script>
		
	
	
	
		



</body>

</html>