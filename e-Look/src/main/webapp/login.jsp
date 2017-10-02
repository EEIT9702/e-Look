<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html ">
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application"/>
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="login/viewport" content="width=device-width, initial-scale=1">
<link href="login/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="login/css/login.css" rel="stylesheet" type="text/css">
<script  src="login/js/facebook_login.js" type="text/javascript"></script>
<script src="https://apis.google.com/js/platform.js?onload=appStart" async defer>
{lang: 'zh-TW'}
</script>
<script  src="login/js/google_login.js" type="text/javascript"></script>
<script  src="login/js/jquery-3.2.1 .js" type="text/javascript"></script>


</head>
<body>
<jsp:include page="header.jsp" />
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div style="margin-top:150px; " class="container modal-dialog" >
		<div class="row ">
			<form class="form-signin mg-btm modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
			</button>
				<h3 class="heading-desc">
					<img style="margin: auto;" src="login/image/eLook_LOGO.png" width="100"
						class="img-rounded">
				</h3>
			</div>
				<div class="social-box">
					<div class="row mg-btm">
						<div class="col-md-12">
							<button type="button" class="btn btn-primary btn-block"
								onclick="myFacebookLogin()">
								<img src="login/image/fbicon.png" class="img-rounded"><span>    Facebook 登入</span>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<button id="google" type="button"
								class="btn btn-danger btn-block">
								<img src="login/image/sgicon.png" class="img-rounded"><span>     GOOGLE 登入</span> 
							</button>
						</div>
					</div>
				</div>
				<div class="main">
					<input type="text" class="form-control" placeholder="Email" autofocus>	
						<input type="password" class="form-control"placeholder="Password"> 
				<!-- 預留顯示登入錯誤訊息	<p>    </p> -->
				</div>
				<div class="login-footer">
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="left-section">
								<a href="">忘記密碼?</a> <a id="quickRegisterbtn" href="#"data-toggle="modal" data-target="#quickRegister">快速註冊</a>
							</div>
						</div>
						<div class="col-xs-6 col-md-6 pull-right">
							<button type="submit" class="btn btn-large btn-info pull-right">登入</button>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="quickRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div style="margin-top:150px; " class="container modal-dialog" >
		<div class="row ">
			<form class="form-signin mg-btm modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
			</button>
				<h3 class="heading-desc">
					<img style="margin: auto;" src="login/image/eLook_LOGO.png" width="100"
						class="img-rounded">
				</h3>
			</div>
	
				<div class="main">
					<input type="text" class="form-control" placeholder="Email" autofocus>	
						<input type="password" class="form-control"placeholder="Password"> 
				<!-- 預留顯示登入錯誤訊息	<p>    </p> -->
				</div>
				<div class="login-footer">
					<div class="row">
						
						<div class="col-xs-6 col-md-6 pull-right">
							<button type="submit" class="btn btn-large btn-info pull-right">登入</button>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</div>
<script>
$('#quickRegisterbtn').click(function(){
	$('#myModal').modal('hide')		
})
</script>

</body>
</html>