<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" /> --%>

<title>${SYSTEM.systemName}</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<form action="Upload" method="POST" enctype="multipart/form-data" >
<input type="file" name="input-file-preview">
<input type="submit">
</form>
</body>
</html>
