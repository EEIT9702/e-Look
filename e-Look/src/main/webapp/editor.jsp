<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="dist/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="dist/jquery-3.2.1.js"></script> -->
<!-- <script	src="dist/bootstrap.js"></script> -->
<!-- <link href="dist/summernote.css" rel="stylesheet"> -->
<!-- <script src="dist/summernote.js"></script> -->
<!-- <script src="dist/summernote.min.js"></script> -->
<!-- <script src="dist/lang/summernote-zh-TW.js"></script> -->

<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css" />
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- include summernote css/js-->
<link href="summernote.css" rel="stylesheet">
<script src="summernote.js"></script>

</head>

<body>
<%-- <jsp:include page="header.jsp" /> --%>
	<div >
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
	</div>
</body>
</html>