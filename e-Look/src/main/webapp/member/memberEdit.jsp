<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta name="login/viewport"
	content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/autosize.js"></script>
<title>${SYSTEM.systemName}</title>
<style type="text/css">
.panel-heading {
	padding: 10px 15px;
	background-color: #353535;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	top: 0%;
	opacity: 0.8;
	color: white;
	border: none;
}

.panel-body {
	padding: 60px 4% 5% 7%;
}

.box {
	padding: 2%;
	border: 1px #ddd solid;
	cursor: pointer;
}

.remove-decoration {
	text-decoration: none !important;
	color: #333;
	font-size: 12px;
}

.clickable {
	cursor: pointer;
}

.clickable .glyphicon {
	background: rgba(0, 0, 0, 0.15);
	display: inline-block;
	padding: 6px 12px;
	border-radius: 4px
}

.panel-heading span {
	margin-top: -23px;
	font-size: 15px;
	margin-right: -9px;
}

a.clickable {
	color: inherit;
}

a.clickable:hover {
	text-decoration: none;
}

<!--
-->
.profile-header-container {
	margin: 0 auto;
	text-align: center;
}

.profile-header-img {
	padding: 30px 0;
}

.profile-header-img>img.img-circle {
	width: 120px;
	height: 120px;
	border: 2px solid #51D2B7;
}

.profile-header {
	margin-top: 43px;
}

/**
 * Ranking component
 */
.rank-label-container {
	margin-top: -19px;
	/* z-index: 1000; */
	text-align: center;
}

.label.label-default.rank-label {
	background-color: rgb(81, 210, 183);
	padding: 5px 10px 5px 10px;
	border-radius: 27px;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>
</head>

<body>
	<jsp:include page="/login.jsp" />
	<div style="margin-top: 10px" class="container">
		<form action="" method="POST" name="formData" target="upload_iframe" enctype="multipart/form-data">
			<input type="hidden" name="memberID" value="${LoginOK.memberID}">
			<div class="row">
				<div class="col-md-4 "
					style="padding-top: 20px; background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);">
					<h4 class="text-center">預覽樣式</h4>
					<div class=" panel-body"
						style="padding: 20px; background-image: linear-gradient(-225deg, #77FFD2 0%, #6297DB 48%, #1EECFF 100%);">

						<div class="col-md-6 no-pad ">
							<div class="profile-header-container">
								<div class="profile-header-img">
									<img class="img-circle" id="wizardPicturePreview"
										src="<%=request.getContextPath()%>/Image?MemberID=${LoginOK.memberID}" />
									<!-- badge -->
									<div class="btn btn-success btn-xl image-preview-input">
										<span class="glyphicon glyphicon-folder-open"></span> <span
											class="image-preview-input-title">編輯圖片</span> <input
											type="file" accept="image/png, image/jpeg, image/gif"
											id="wizard-picture" name="input-file-preview">
										<!-- rename it -->
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 no-pad text-center">
							<div class="user-pad" style="padding: 60px 0;">
								<h2 style="color: white;">${LoginOK.mName}</h2>
							</div>
						</div>
					</div>
					<div class="row overview panel-body">
						<div class="col-md-6 user-pad text-center">
							<div class="hero-widget well  well-lg">
								<h3>已參加</h3>
								<h4>堂課</h4>
							</div>
						</div>
						<div class="col-md-6 user-pad text-center">
							<div class="hero-widget well  well-lg">
								<h3>已開設</h3>
								<h4>堂課</h4>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h4 class="text-center">關於我</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p id="keyupaboutme"
									style="word-break: break-all; word-wrap: break-word">${LoginOK.aboutme}
								<p></p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="text-center">專長</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p style="word-break: break-all; word-wrap: break-word">${LoginOK.skill}</p>
								<p></p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="panel panel-warning">
							<div class="panel-heading">
								<h4 class="text-center">興趣</h4>
							</div>
							<div class="panel-body text-center">
								<p class="lead">
								<p style="word-break: break-all; word-wrap: break-word">${LoginOK.hobby}
								<p></p>
							</div>
						</div>
					</div>
				</div>
				<!-- 會員左半邊-->
				<div class="col-md-8 ">
					<h3 class="text-center" style="font-weight: 800;">
						<span class="glyphicon glyphicon glyphicon-cog" aria-hidden="true"></span>帳號設定
					</h3>
					<div class="row" style="margin-top: 50px">
						<div class=" col-md-12 ">
							<div class=" col-md-4 " style="margin: 10px 0;">
								<div class="form-group">
									<label >名字</label> <input type="text"
										class="form-control" id="" value="${LoginOK.mName}">
								</div>
							</div>
							<div class="col-md-8"></div>
						</div>
						<div class=" col-md-12 ">
							<div class=" col-md-8 " style="margin: 10px 0;">
								<div class="form-group">
									<label >帳號(信箱)</label> <input
										type="text" class="form-control" id=""
										value="${LoginOK.email}">
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class=" col-md-12 ">
							<div class=" col-md-5 " style="margin: 10px 0;">
								<div class="form-group">
									<label >密碼</label> <input type="text"
										class="form-control" id="" >
								</div>
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class=" col-md-12 ">
							<div class=" col-md-2" >
								<div class="form-group ">
									<label >地址</label> <select  class="form-control" style="text-align: center;" ><option></option></select>
								</div>
							</div>
							<div class="col-md-7"></div>
						</div>
					</div>

					<div class=" col-ms-12 " style="margin: 100px 0 25px 0;">
						<div class="panel panel-success">
							<div class="panel-heading">關於我</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle" name="targetgroup"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.aboutme}</textarea>
							</div>
						</div>
					</div>
					<div class=" col-ms-12 " style="margin: 45px 0;">
						<div class="panel panel-info">
							<div class="panel-heading">專長</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle" name="targetgroup"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.skill}</textarea>
							</div>
						</div>
					</div>

					<div class=" col-ms-12 " style="margin: 45px 0;">
						<div class="panel panel-warning">
							<div class="panel-heading">興趣</div>
							<div class=" form-group  form-group-textarea ">
								<textarea id="customStyle" name="targetgroup"
									class="form-control" data-toggle="floatLabel"
									data-value="no-js" style="font-size: 18px">${LoginOK.hobby}</textarea>
							</div>
						</div>
					</div>


				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
<script type="text/javascript">
	$('textarea').each(function() {
		autosize(this);
	}).on('autosize:resized');

	$('#customStyle').keyup(function() {
		var value = $('#customStyle').val();
		$("#keyupaboutme").text(value);
	});

	$("#wizard-picture").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#wizardPicturePreview').attr('src', e.target.result).fadeIn(
						'slow');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</html>