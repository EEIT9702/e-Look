<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>TinyMCE - Setup</title>
	</head>
	<body>
		<form id="get-data-form" method="post">

			<textarea class="tinymce" id="texteditor"></textarea>
			<input type="submit" value="Get Data">
			<input type="hidden" value="" id="courseContent">
		</form>

<!-- 		<div id="data-container"> -->
<!-- 		</div> -->

		<!-- javascript -->
		<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/_PJC/tinymce/tinymce.min.js"></script>
		<script src="<%=request.getContextPath()%>/_PJC/tinymce/init-tinymce.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){

			$("#get-data-form").submit(function(e){

				var content = tinymce.get("texteditor").getContent();
				alert(content);
				$("#data-container").html(content);
				console.log(content);
				$("#courseContent").val(content);
				
				return false;

			});

		});
		</script>
	</body>
</html>