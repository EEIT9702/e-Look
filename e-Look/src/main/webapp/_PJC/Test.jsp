<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>jQuery UI Checkboxradio - Default functionality</title>
<%--   <link href="<%=request.getContextPath()%>/css/bootstrap.css" --%>
<!-- 	rel="stylesheet"> -->
<link href="<%=request.getContextPath()%>/_PJC/css/step1.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step2.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/autosize.js"></script>
<script>
	$(function() {
		$("#CourseCheckbox input").checkboxradio();
	});
</script>
<style>


</style>

</head>
<body>
<div>

 
  <h2>Radio Group</h2>
  <fieldset id="CourseCheckbox">
    <legend>Select a Location: </legend>
    <label for="radio-1">New York</label>
    <input type="radio" name="radio-1" id="radio-1">
    <label for="radio-2">Paris</label>
    <input type="radio" name="radio-1" id="radio-2">
    <label for="radio-3">London</label>
    <input type="radio" name="radio-1" id="radio-3">
  </fieldset>
 
  
</div>
 
 
</body>
</html>