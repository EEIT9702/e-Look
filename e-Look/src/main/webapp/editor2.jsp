<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="tinymce/tinymce.min.js"></script>

</head>

<body >
<jsp:include page="header.jsp" />

    <form>
      <textarea id="editor1">
      Hello World! 這是 TinyMCE!
      </textarea>
    </form>
    <script>
    tinymce.init({
        selector:'#editor1',
        language:'zh_TW',
        height:300,
        width:800,
        menubar:false,
       
        
        plugins:[
            'advlist autolink lists link image charmap print preview anchor',
            'searchreplace visualblocks code fullscreen textcolor colorpicker',
            'insertdatetime media table contextmenu paste code hr pagebreak nonbreaking',
            'jbimages'
            ],
        toolbar:['newdocument preview fullscreen searchreplace | bold italic underline strikethrough superscript subscript removeformat forecolor backcolor | alignleft aligncenter alignright alignjustify |',
        'undo redo cut copy paste pastetext pasteword | bullist numlist outdent indent | advlist autolink lists link unlink image table media jbimages']
        });
    </script>
</body>
</html>