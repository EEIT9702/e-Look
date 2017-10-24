<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.e_Look.eLookEvent.*"%>
<%
	eLookEventService eLookEventSvc = new eLookEventService();
	List<eLookEventVO> list = eLookEventSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/stickysort.css" media="all"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- 	<link rel="stylesheet" type="text/css" href="css/default.css"> -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.stickysort.min.js"></script>
<style>
/* Component styles */
@font-face {
	font-family: 'Blokk';
	src: url('../fonts/BLOKKRegular.eot');
	src: url('../fonts/BLOKKRegular.eot?#iefix') format('embedded-opentype'),
		url('../fonts/BLOKKRegular.woff') format('woff'),
		url('../fonts/BLOKKRegular.svg#BLOKKRegular') format('svg');
	font-weight: normal;
	font-style: normal;
}

html {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 16px;
}

body {
	color: #333;
	height: 100%;
	line-height: 1.5em;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Montserrat', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	text-transform: uppercase;
}

h3 {
	margin: 3rem 0 0 0;
}

h3:first-of-type {
	margin-top: 0;
}

hr {
	border: none;
	border-top: .125rem solid #ddd;
	margin-bottom: 1.375rem;
}

ul {
	margin-top: -.75rem;
}

pre {
	display: block;
	width: 100%;
}

code {
	background-color: rgba(0, 0, 0, .125);
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: 4px;
	display: inline-block;
	margin: 0 .125rem;
	padding: 0 .25rem;
}

pre code {
	display: block;
	padding: .5rem 1rem;
}

p {
	margin-bottom: 1.5rem;
}

p:last-child {
	margin: 0;
}

.filler {
	color: #999;
	font-family: "Blokk", Arial, sans-serif;
}

.message {
	background-color: #eee;
	border: none;
	border-radius: .5rem;
	color: #333;
	display: block;
	padding: 1.5rem;
	text-align: center;
}

.message:hover {
	background-color: #F7941D;
	color: #eee;
}

.message svg {
	background-color: #666;
	border-radius: 50%;
	margin-bottom: 1rem;
	width: 5rem;
	height: 5rem;
	transition: all .125s ease-in-out;
}

.message:hover svg {
	background-color: #eee;
}

.message svg path {
	fill: #eee;
	transition: fill .125s ease-in-out;
}

.message:hover svg path {
	fill: #F7941D;
}

/* Main */
main {
	margin: 0 16.66667%;
}

main section {border-bottom 1px solid #ccc;
	margin-bottom: 3rem;
}

/* Tables */
table {
	border-collapse: collapse;
	margin-bottom: 3rem;
	width: 100%;
	background: #fff;
}

td, th {
	padding: 0.75rem 1.5rem;
	text-align: center;
}

th {
	background-color: #777;
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, .25) 100%);
	font-family: "Montserrat", Arial, sans-serif;
	font-weight: bold;
	color: #fff;
	text-align: center;
	white-space: nowrap;
}

thead a {
	border: none;
}

tbody th {
	background-color: #777;
	background-image: none;
}

tbody tr:nth-child(2n-1) {
	background-color: #eee;
	transition: all .125s ease-in-out;
}

tbody tr:nth-child(2n-1) th {
	background-image: linear-gradient(to left, rgba(0, 0, 0, .125) 0%,
		rgba(0, 0, 0, .25) 100%);
}

tbody tr:hover {
	background-color: #ccc;
}

tbody img {
	border-radius: 50%;
	display: block;
	width: 4rem;
	height: 4rem;
}

.user-name, .user-firstName, .user-lastName, .user-location {
	text-transform: capitalize;
}

/* Section toggle */
.toggle {
	background-color: #666;
	border: none;
	color: #ddd;
	font-size: 1rem;
	font-weight: normal;
	margin-left: 1rem;
	padding: .25rem .5rem;
	text-transform: none;
}

.toggle:hover {
	color: #fff;
}

/* Basic table */
#basic .toggle, #basic th {
	background-color: #9E0039;
}

#basic tbody tr:hover {
	background-color: rgba(245, 152, 157, .25);
}

tfoot tr:hover {
	background-color: #ccc;
}

/* Basic sort table */
#basic-sort .toggle, #basic-sort th {
	background-color: #A36209;
}

#basic-sort tbody tr:hover {
	background-color: rgba(253, 198, 137, .25);
}

/* Biaxial table */
#biaxial .toggle, #biaxial .bx1 th {
	background-color: #1A7B30;
}

#biaxial .bx1 tbody tr:hover {
	background-color: rgba(163, 211, 156, .5);
}

#biaxial .bx2 thead th, #biaxial .bx2 tbody th {
	background-color: #ccc;
	background-image: none;
	color: #333;
}

#biaxial .bx2 tbody tr:nth-child(2n-1) th {
	background-color: #b9b9b9;
}

#biaxial .bx2 img {
	margin: 0 auto .5rem;
}

#biaxial .user-location {
	white-space: nowrap;
}

/* Final */
#final .sticky-wrap {
	overflow-x: auto;
	overflow-y: auto;
	max-height: 75vh;
}

#final .toggle {
	background-color: #004B80;
}

/* Media queries, unrelated to functionality of StickySort */
@media only screen and (max-width: 768px) {
	html {
		font-size: 14px;
	}
	header, #final .sticky-wrap {
		max-height: 25rem;
	}
}

#div1 {
	width: 90%;
	margin: auto auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="bheader.jsp"></jsp:include>
	<div id="div1">
		<table>
			<thead>
				<tr>
					<th>活動名稱</th>
					<th>開始日期</th>
					<th>結束日期</th>
					<th>折扣優惠</th>
					<th>優惠類別</th>
					<th>編輯</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a class="btn btn-danger" href="#"><i
							class="fa fa-plus">新增</i></a></td>
				</tr>
			</tfoot>
			<tbody>
			<c:forEach var="eLookEventVO" items="${list}">
				<tr>
					<td >${eLookEventVO.eventName}</td>
					<td >${eLookEventVO.eStartDate}</td>
					<td>${eLookEventVO.eEndDate}</td>
					<td>${eLookEventVO.discount}</td>
					<td>${eLookEventVO.courseClass1}&ensp;${eLookEventVO.courseClass2}&ensp;${eLookEventVO.courseClass3}</td>
					<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert" >
			     <input type="submit" value="修改">
			     <input type="hidden" name="empno" value="${eLookEventVO.eventID}">
			     <input type="hidden" name="action"	value="update"></FORM>
			&ensp;
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backstage/elookeventinsert">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="empno" value="${eLookEventVO.eventID}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
			</tr>
					</c:forEach>
			</tbody>
			</div>
		</table>
</body>
</html>