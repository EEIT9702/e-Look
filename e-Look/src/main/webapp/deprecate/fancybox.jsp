<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/jquery.fancybox.min.css" />
<script	src="js/jquery.fancybox.min.js" ></script> 

<style>
/*#hidden-content-b {

	max-width: 550px;
	border-radius: 4px;
	transform: translateY(-50px);
	transition: all .33s;
}

.fancybox-slide--current #hidden-content-b {
	transform: translateY(0);
} */
</style>
</head>

<body>


		<p>#4 - Modal window</p>

		<p>
			<a data-fancybox data-options='{"src": "#hidden-content-d", "modal": true}' href="javascript:;" class="btn">登入在這裡</a>
		</p>


		<div style="display: none; max-width: 600px;" id="hidden-content-d">
			<div id="div1" >

				<fieldset>
					<legend>login</legend>
					<form action="" method="get">
						<span>帳號</span><input type="text" name="username"><br>
						<span>密碼</span><input type="password" name="userpwd"><br>
						<input type="submit"><br>
					</form>
				</fieldset>

			</div> 
		</div>


	
</body>
</html>