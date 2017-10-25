tinymce.init({ selector:'textarea',
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
		