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
			<input type="hidden" value="" id="courseContent">
		</form>

<!-- 		<div id="data-container">49491916156-->
<!-- 		</div> -->


		<script src="<%=request.getContextPath()%>/_PJC/js/jquery.js"></script>		
		<script src="<%=request.getContextPath()%>/_PJC/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
		<script src="<%=request.getContextPath()%>/_PJC/tinymce/js/tinymce/tinymce.js"></script>		
		<script>
		tinymce.init({ selector:'#texteditor',
			language_url:'<%=request.getContextPath()%>/_PJC/tinymce/js/tinymce/langs/zh_TW.js',
			plugins: [
			  		"advlist autolink link image lists charmap print preview hr anchor pagebreak",
			  		"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			  		"save table contextmenu directionality emoticons template paste textcolor"
			  	],
			  	/* toolbar */
			  	toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",			
			setup: function(ed) {
			    ed.on('keyup', function(e) {
			        console.log(ed.getContent());
			        $("#courseContent").val(ed.getContent());
			    });
			}}); 
		</script>
		
	</body>
</html>