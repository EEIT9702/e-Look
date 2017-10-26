<%@page import="com.nimbusds.oauth2.sdk.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.e_Look.ad.*"%>
<%
	AdService svc = new AdService();
	List<AdVO> list = svc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/backEvent.css">
<link type="text/css" href="css/stickysort.css" media="all"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/MODALit.min.css">
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script src="js/stickysort.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/MODALit.min.js"></script>
<title>Insert title here</title>
</head>
<style>
#div2 {
	margin: 0px auto;
}
</style>
<body>
	<jsp:include page="bheader.jsp"></jsp:include>
	<div id="div1">

		<table>
			<thead>
				<tr>
					<th>廣告編號</th>
					<th>廣告名稱</th>
					<th>顯示設定</th>
					<th>預覽</th>
					<th>管理</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="AdVO" items="${list}">
					<tr>
						<td align="center">${AdVO.adID}</td>
						<td align="center">${AdVO.fileName}</td>
						<td align="center">${AdVO.status}</td>
						<td align="center"><div id="div2">
								<img
									src="<%=request.getContextPath()%>/adImages?adID=${AdVO.adID}" />
							</div></td>
						<td align="center"><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert"
								style="display: inline;">
								<input type="button" class="i2Style1" name="update"
									data-target="#update" value="修改"> <input type="hidden"
									name="adID" value="${AdVO.adID}"> &ensp;<input
									type="button" name="delete" class="i2Style"
									data-target="#delete" value="刪除">
							</FORM></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="button" class="i2Style3" data-target="#modal"
						value="新增"></td>
				</tr>
			</tfoot>
		</table>
	</div>

	<!-- 	新增彈跳窗 -->
	<div id="modal" class="modalit" aria-hidden="true">
		<div class="dialog">
			<header>
				<h3>新增</h3>
			</header>
			<div class="content">
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/backstage/adControl"
					enctype="multipart/form-data" style="display: inline;">
					<table>
						<thead>
							<tr>
								
								<td>廣告名稱</td>
								<td>檔案上傳</td>
								<td>上架狀態</td>
							</tr>
						</thead>

						<tr>
							
							<td><input type="text" name="fileName"></td>
							<td><input type="file" name="adFile"></td>
							<td><select name="status">
									<option value="0">展示</option>
									<option value="1">隱藏</option>
							</select></td>
						</tr>
						<tfoot>
							<tr>
								
								<th>${errMsg.errName}</th>
								<th>${errMsg.adFile}</th>
								<th></th>
							</tr>
						</tfoot>

					</table>
			</div>
			<footer>

				<input type="submit" value="新增"> <input type="hidden"
					name="action" value="insert">
				</FORM>
				<button type="button" data-modal-btn="dismiss" class="btn primary">取消</button>
			</footer>
		</div>
	</div>
<!-- 修改訊息窗 -->
	<div id="update" class="modalit" aria-hidden="true">
		<div class="dialog">
			<header>
				<h3>修改</h3>
			</header>
			<div class="content">
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/backstage/adControl"
					enctype="multipart/form-data" style="display: inline;">
					<table>
						<thead>
							<tr>
								<td>廣告編號</td>
								<td>廣告名稱</td>
								<td>檔案上傳</td>
								<td>上架狀態</td>

							</tr>
						</thead>

						<tr>
							<td id="td1"></td>
							<td><input type="text" name="fileName"></td>
							<td><input type="file" name="adFile"></td>
							<td><select name="status">
									<option value="0">展示</option>
									<option value="1">隱藏</option>
							</select></td>
						</tr>

						<tfoot>
							<tr>

								<th></th>
								<th>${errMsg.errName}</th>
								<th>${errMsg.adFile}</th>
								<th></th>
							</tr>
						</tfoot>

					</table>
			</div>
			<footer>

				<input type="submit" value="修改"> <input type="hidden"
					name="adID" id="updateAdID" value=""> <input type="hidden"
					name="action" value="update">
				</FORM>
				<button type="button" data-modal-btn="dismiss" class="btn primary">取消</button>
			</footer>
		</div>
	</div>

	<!-- 刪除訊息視窗 -->
	<div id="delete" class="modalit" aria-hidden="true">
		<div class="dialog">
			<header>
				<h3>警告</h3>
			</header>
			<div class="content">
				<p>是否刪除此廣告?</p>
			</div>
			<footer>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/backstage/adControl"
					enctype="multipart/form-data" style="display: inline;">
					<input type="submit" value="刪除"> <input type="hidden"
						name="adID" id="deleteAdID" value=""> <input type="hidden"
						name="action" value="delete">
				</FORM>
				<button type="button" data-modal-btn="dismiss" class="btn primary">取消</button>
			</footer>
		</div>
	</div>

	<script>
		var modal = new MODALit({
			el : '.i2Style3'
		});
		var modal = new MODALit({
			el : '.i2Style1'
		});
		var modal = new MODALit({
			el : '.i2Style'
		});

		$('tbody input[name="update"]').on('click', function() {
			var event1 = $(this).parent().children('input:eq(1)').val();
			$('#updateAdID').val(event1);
			$('#td1').text(event1);
		})
		$('tbody input[name="delete"]').on('click', function() {
			var event2 = $(this).parent().children('input:eq(1)').val();
			$('#deleteAdID').val(event2);
		})
		
	</script>
</body>
</html>