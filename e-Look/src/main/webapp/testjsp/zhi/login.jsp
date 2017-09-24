<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="div1">
		<fieldset>
			<legend>login</legend>
			<form action="" method="get">
			<span>帳號</span><input type="text" name="username"><br>
			<span>密碼</span><input type="password" name="userpwd"><br>
			<input type="submit"><br>
			</form>
		</fieldset>
	</div>
	<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
	<script>
	$("#div1").click(function() {
		alert("test");
	})
	</script>
</body>
</html>