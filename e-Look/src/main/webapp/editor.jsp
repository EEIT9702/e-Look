<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="HeaderCssJs/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="js/jquery-3.2.1.js"></script> -->
<!-- <script src="HeaderCssJs/jquery.js"></script> -->
<!-- <script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
<link href="dist/summernote.css" rel="stylesheet">
<script src="dist/summernote.js"></script>
<script src="dist/lang/summernote-zh-TW.js"></script>

</head>

<body>
<jsp:include page="header.jsp" />
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form>
		<textarea name="summernote" id="summernote">
                This is my textarea to be replaced with CKEditor.
            </textarea>
		<script>
		$(document).ready(function() {
	        $('#summernote').summernote({
	        	 lang: 'zh-TW', // default: 'en-US'
	        	 width: 1000,
	        	 height: 300,                 // set editor height
	        	 minHeight: null,             // set minimum height of editor
	        	 maxHeight: null,             // set maximum height of editor
	        	 focus: true                  // set focus to editable area after initializing summernote
	        });
	    });
		</script>
	</form>
	
</body>
</html>