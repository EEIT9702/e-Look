<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application" />
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"
	type="text/javascript"></script>
<title>${SYSTEM.systemName}</title>
<style>
</style>
<script>
	$(function() {

		//$('#ShoppingCar').modal()

	})
</script>
</head>
<body>
	<jsp:include page="${requestScope.contextPath}/header.jsp" />

	<div class="modal fade" id="ShoppingCar" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">我的購物車</h4>
				</div>
				<div class="modal-body">課程1</div>
				<div class="modal-body text-right">
				<div style="float:left;">共 2 筆課程</div><span>總金額：870元</span>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">結帳</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>