<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${SYSTEM.systemName} </title>
</head>
<body>
<form action="<%=request.getContextPath() %>/Upload1" method="POST" enctype="multipart/form-data" >
<!-- <input type="text" name="testtext" value="fjgifi" > -->
<input type="file" name="myFile">
<input type="submit">
</form>
</body>
</html>