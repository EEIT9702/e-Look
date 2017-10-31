<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>TinyMCE - Setup5</title>
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
// 		tinymce.init({ selector:'#texteditor',
<%-- 			language_url:'<%=request.getContextPath()%>/_PJC/tinymce/js/tinymce/langs/zh_TW.js', --%>
// 			plugins: [
// 			  		"advlist autolink link image lists charmap print preview hr anchor pagebreak",
// 			  		"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
// 			  		"save table contextmenu directionality emoticons template paste textcolor image"
// 			  	],
// 			  	file_picker_callback: function(callback, value, meta) {
// 			  	    // Provide file and text for the link dialog
// 			  	    if (meta.filetype == 'file') {
// 			  	      callback('mypage.html', {text: 'My text'});
// 			  	    }

// 			  	    // Provide image and alt text for the image dialog
// 			  	    if (meta.filetype == 'image') {
// 			  	      callback('myimage.jpg', {alt: 'My alt text'});
// 			  	    }

// 			  	    // Provide alternative source and posted for the media dialog
// 			  	    if (meta.filetype == 'media') {
// 			  	      callback('movie.mp4', {source2: 'alt.ogg', poster: 'image.jpg'});
// 			  	    }
// 			  	  },
// 			  	/* toolbar */
// 			  	toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons | image",			
// 			  	menubar: "insert",
// 			  	image_caption: true,
// 			  	image_list: [
// 			  	    {title: 'My image 1', value: 'https://www.tinymce.com/my1.gif'},
// 			  	    {title: 'My image 2', value: 'http://www.moxiecode.com/my2.gif'}
// 			  	  ],
			  	
// 			  	setup: function(ed) {
// 			    ed.on('keyup', function(e) {
// 			        console.log(ed.getContent());
// 			        $("#courseContent").val(ed.getContent());
// 			    });
// 			}
// 			  	  });

		
				
		$(document).ready(function() {
			  tinymce.init({
			    selector: "#texteditor",
			    language_url:'<%=request.getContextPath()%>/_PJC/tinymce/js/tinymce/langs/zh_TW.js',
			    theme: "modern",
			    paste_data_images: true,
			    plugins: [
			      "advlist autolink lists link image charmap print preview hr anchor pagebreak",
			      "searchreplace wordcount visualblocks visualchars code fullscreen",
			      "insertdatetime media nonbreaking save table contextmenu directionality",
			      "emoticons template paste textcolor colorpicker textpattern"
			    ],
			    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
			    toolbar2: "print preview media | forecolor backcolor emoticons",
			    image_advtab: true,
			    file_picker_callback: function(callback, value, meta) {
			      if (meta.filetype == 'image') {
			        $('#upload').trigger('click');
			        $('#upload').on('change', function() {
			          var file = this.files[0];
			          var reader = new FileReader();
			          reader.onload = function(e) {
			            callback(e.target.result, {
			              alt: ''
			            });
			          };
			          reader.readAsDataURL(file);
			        });
			      }
			    },
			    templates: [{
			      title: 'Test template 1',
			      content: 'Test 1'
			    }, {
			      title: 'Test template 2',
			      content: 'Test 2'
			    }],
			  setup: function(ed) {
				    ed.on('keyup', function(e) {
				        console.log(ed.getContent());
				        $("#courseContent").val(ed.getContent());
				    });
				}
			  });
		
		
		});
		</script>
		
	</body>
</html>