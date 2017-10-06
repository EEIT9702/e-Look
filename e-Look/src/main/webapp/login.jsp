<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application" />
<link rel="Shortcut Icon" type="image/x-icon" href="${SYSTEM.iconUri}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="login/viewport"
	content="width=device-width, initial-scale=1">
<link href="login/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="login/css/login.css" rel="stylesheet" type="text/css">
<script src="login/js/facebook_login.js" type="text/javascript"></script>
<script src="https://apis.google.com/js/platform.js?onload=appStart"
	async defer>
	{
		lang: 'zh-TW'
	}
</script>
<script src="login/js/google_login.js" type="text/javascript"></script>
<script src="login/js/jquery-3.2.1.js" type="text/javascript"></script>


</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- 以下是login畫面 -->
	<div style="margin-top: 100px "class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="col-md-4 col-md-offset-4">
			<div class="container modal-dialog">
				<div class="row ">
					<form class="form-signin mg-btm modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h3 class="heading-desc">
								<img style="margin: auto;" src="login/image/eLook_LOGO.png"
									width="100" class="img-rounded">
							</h3>
						</div>
						<div class="social-box">
							<div class="row mg-btm">
								<div class="col-md-12">
									<button type="button" class="btn btn-primary btn-block"
										onclick="myFacebookLogin()">
										<img src="login/image/fbicon.png" class="img-rounded"><span>
											Facebook 登入</span>
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button id="google" type="button"
										class="btn btn-danger btn-block">
										<img src="login/image/sgicon.png" class="img-rounded"><span>
											GOOGLE 登入</span> 
									</button>
								</div>
							</div>
						</div>
						<div class="main">
							<input type="text" class="form-control" placeholder="Email"
								autofocus> <input type="password" class="form-control"
								placeholder="Password">
							<!-- 預留顯示登入錯誤訊息	<p>    </p> -->
						</div>
						<div class="login-footer">
							<div class="row">
								<div class="col-xs-6 col-md-6">
									<div class="left-section">
										<a id="forget" data-toggle="modal" data-target="#forgetpwd"
											href="">忘記密碼?</a> <a href="#">快速註冊</a>
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
	</div>
	<!-- 以上是login畫面 -->


	<!-- 以下是忘記密碼畫面 -->
	<div style="margin-top: 300px " class="modal fade" id="forgetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="container">
	<div class="row ">
		<div class="col-md-4 col-md-offset-4 modal-content">
			<form id="register-form" role="form" autocomplete="off" class="form "
				method="post">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2>忘記密碼?</h2>
					<p>系統會重新寄發密碼</p>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope color-blue"></i></span> <input
							id="email" name="email" placeholder="email address"
							class="form-control" type="email">
					</div>
				</div>
				<div class="form-group">
					<input name="recover-submit"
						class="btn btn-lg btn-primary btn-block" value="重設密碼"
						type="submit">
				</div>
				<input type="hidden" class="hide" name="token" id="token" value="">
			</form>
		</div>
	</div>
	</div>
	</div>
	<!-- 以上是忘記密碼畫面  -->
<!-- 以上是註冊畫面  -->
<!-- <div class="container "> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="panel panel-primary" > -->
<!-- 				<div class="panel-body"> -->
<!-- 					<form method="POST" action="#" class="" role="form"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<h2>快速註冊</h2> -->
<!-- 						</div> -->
<!-- 						<div class="form-group" > -->
<!-- 							<label class="control-label" for="signupName">Your name</label> -->
<!-- 							<input id="signupName" type="text" maxlength="50" class="form-control" > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label class="control-label" for="signupEmail">Email</label> -->
<!-- 							<input id="signupEmail" type="email" maxlength="50" class="form-control"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label class="control-label" for="signupPassword">Password</label> -->
<!-- 							<input id="signupPassword" type="password" maxlength="8" class="form-control" placeholder="至少輸入8位" > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label class="control-label" for="signupPasswordagain">Password again</label> -->
<!-- 							<input id="signupPasswordagain" type="password" maxlength="25" class="form-control"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<button id="signupSubmit" type="submit" class="btn btn-info btn-block">Create your account</button> -->
<!-- 						</div> -->
<!-- 						<hr> -->
<!-- 						<p>已經有帳號了? <a href="#">登入</a></p> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 以上是註冊畫面  -->

</body>
<script>
	$('#forget').click(function() {
		$('#myModal').modal('hide')

	})
</script>
</html>