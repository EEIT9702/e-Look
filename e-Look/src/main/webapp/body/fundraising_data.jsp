<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.card-text a {
	text-decoration: none;
	color: black;
}

.card-text a:hover {
	text-decoration: none;
	color: black;
}

.card-text a:visted {
	text-decoration: none;
	color: black;
}

</style>
<jsp:useBean id="courseClass" scope="page" class="com.e_Look.courseClass.CourseClassDAO"/>
<jsp:useBean id="course" scope="page" class="com.e_Look.Course.CourseDAO"/>


<!--課程類別forEach Star -->
<%-- <c:forEach var='freeCourse' items='${course.allonlineCourse}'> --%>
<%-- <c:if test="${courseClass.byCourseClassID == ${param.courseClass}"> --%>
	
<!--線上課程forEach Star -->
<c:forEach var='onlineCourse' items='${course.allonlineCourse}' begin="${param.rowValueY}" end="${param.rowValueY + 3}">
<c:if test="${onlineCourse.soldPrice >= 0}">
	<div class="col-md-6 col-sm-6 col-lg-4 col-xs-6" id="course" style="width:341px;margin-bottom:20px;">
		<div class="card card-inverse" style="background-color: white;">
			<a style="text-decoration: none; color: black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${onlineCourse.courseID}">
				<img class="card-img-top" src="<%=request.getContextPath() %>/CourseImage?CourseID=${onlineCourse.courseID}" alt="course" id="wizardPicturePreview" title="">
			</a>
			<div class="card-block">
				<figure class="profile">
					<img src="<%=request.getContextPath() %>/Image?MemberID=${onlineCourse.memberID}" class="profile-avatar" alt="">
				</figure>
				<div class="card-text">
					<a style="text-decoration: none; color: black"; href="<%=request.getContextPath() %>/onlineCourse-v2.jsp?CourseID=${onlineCourse.courseID}">
						<p id="title" class="card-title mt-3 multi_ellipsis">${onlineCourse.courseName}</p>
					</a>
				</div>
				<div style="margin-top:40px;">
					<p style="font-size:18px;float:left;">預購價：
						<fmt:setLocale value="zh-TW" />
						<fmt:formatNumber value="${onlineCourse.soldPrice+10}" type="currency"/>
					</p>
					<p style="font-size:18px;float:right;">剩${onlineCourse.courseLength}天</p>
				</div>
				<div class="progress" style="clear:both;">
					<div class="progress-bar progress-bar-warning progress-bar-striped active" 
					role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 
					style="width:100%">
					<p style="display:none"><fmt:formatNumber type="percent" value="${(onlineCourse.soldPrice+1)/onlineCourse.courseLength}" maxFractionDigits="0"/></p>
					
					</div>
				</div>
				<div>
					<p style="font-size:18px;text-align:center;clear:both;padding-top:8px;">已募資${onlineCourse.soldPrice+1}/${onlineCourse.courseLength}人</p>
				</div>
			</div>

		</div>
	</div>
</c:if>
</c:forEach>
<!--線上課程forEach End -->

<%-- </c:if> --%>
<%-- </c:forEach> --%>
<!--課程類別forEach End -->

<script>
	$(function(){
		//console.log($('.progress-bar').text());
		var pbVal = $('.progress-bar').text();
		$('.progress-bar').removeAttr('style');
		$('.progress-bar').each(function(){
			console.log($(this).text());
			$(this).attr('style','width:'+$(this).text());
		})	
		
	})

</script>

			