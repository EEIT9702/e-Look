<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<button  type="button" id="bnt"></button>
</body>
<script type="text/javascript">
$("#bnt").click(function(){
	$.getJSON( "json/AllData.json", function(data) {
		 console.log(data);
		 $.each( data, function( key, val ) {
			 console.log(val.CityName);
			 $.each( val.AreaList, function( key, val ) {
				 console.log(val.AreaName);
				
				 
			 })
		 })
		 
	})
	
})


</script>

</html>