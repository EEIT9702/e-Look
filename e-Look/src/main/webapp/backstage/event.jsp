<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/backstage/css/bootstrap-theme.min.css"></script>
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<style>
#event{
padding-left:60px;
font-size:30px;

}
#inputevent{
width:1500px;
font-size: 30px;
margin-bottom: 30px;
}
.file1{
font-size:30px;
autofocus;
background-color: white;
border:1px black solid;
width:750px;
margin-bottom: 30px;
}
.file2{font-size:30px;}
</style>

<body><div>
<jsp:include page="backstage.jsp"></jsp:include></div>
<form action="<%=request.getContextPath()%>/Upload1" method="post" enctype="multipart/form-date">
<div id="event">
活動名稱：<input id="inputevent">
</div>
<div>
上傳圖檔：<input type="file" name="myfile" class="file1">
 </div>
 <div class="input-group date">
  <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div>
 <div>
<input type="submit" class="file2">

</form>

</body>
</html>