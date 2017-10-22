<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />
<title>${initParam.systemName}</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/settled.css"
	rel="stylesheet">
<style>
.thumbnails>li {
	float: left;
	margin-bottom: 20px;
	margin-left: 20px;
}

.thumbnail>img {
	display: block;
	max-width: 100%;
	margin-left: auto;
	margin-right: auto;
	max-height: 74px;
	min-height: 74px;
}

.span2 {
	width: 104px;
}

@media ( max-width : 979px) and (min-width: 768px) {
	.span2 {
		width: 104px;
	}
}

@media ( min-width : 1200px) {
	.span5 {
		width: 470px;
	}
}

@media ( min-width : 1200px) {
	[class*="span"] {
		float: left;
		min-height: 1px;
		margin-left: 30px;
	}
}

.span5 {
	min-width: 380px;
}

@media ( max-width : 979px) and (min-width: 768px) {
	.span5 {
		width: 290px;
	}
}

@media ( max-width : 979px) and (min-width: 768px) {
	[class*="span"] {
		float: left;
		min-height: 1px;
		margin-left: 20px;
	}
}

.thumbnail {
	box-shadow: 1px 1px 9px 0px black;
}

ul {
	list-style-type: none;
}

.btn {
	margin-bottom: 20px !important;
}
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;
}
.credit-card-box label {
    display: block;
}
.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 70%;
}
.credit-card-box .panel-heading img {
    min-width: 180px;
}
.panel-body{
padding:30px !important;
}
.input-group input {
	margin: 0px 2px
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="${contextPath}/login.jsp" flush="true" />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<section>
			<div class="wizard">
				<div class="wizard-inner">
					<div class="connecting-line"></div>
					<ul type="" class="nav nav-tabs" role="tablist">

						<li role="presentation" class="active"><a href="#step1"
							data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-list-alt"></i>
							</span>
						</a></li>

						<li role="presentation" class="disabled"><a href="#step2"
							data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-pencil"></i>
							</span>
						</a></li>
						<li role="presentation" class="disabled"><a href="#step3"
							data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-usd"></i>
							</span>
						</a></li>
						<li role="presentation" class="disabled"><a href="#step4"
							data-toggle="tab" aria-controls="step4" role="tab" title="Step 4">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-ok"></i>
							</span>
						</a></li>

					</ul>
				</div>
				<form class="form-horizontal">
					<div class="tab-content">
						<!-- step1start -->
						<div class="tab-pane active" role="tabpanel" id="step1">
							<div class="container">
								<div class="row">

									<div class="span12">
										<ul class="thumbnails">
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="<%=request.getContextPath()%>/img/02.jpg"
														alt="ALT NAME" class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="onlineCourse-v2.jsp?courseID=200001"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="<%=request.getContextPath()%>/img/預覽課程展示畫面.png"
														alt="ALT NAME" class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="onlineCourse-v2.jsp?courseID=200002"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="http://placehold.it/320x200" alt="ALT NAME"
														class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="onlineCourse-v2.jsp?courseID=200003"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="http://placehold.it/320x200" alt="ALT NAME"
														class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="onlineCourse-v2.jsp?courseID=200004"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="http://placehold.it/320x200" alt="ALT NAME"
														class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="onlineCourse-v2.jsp?courseID=200005"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
											<li class="span5 clearfix">
												<div class="thumbnail clearfix">
													<img src="onlineCourse-v2.jsp?courseID=200006"
														alt="ALT NAME" class="pull-left span2 clearfix"
														style='margin-right: 10px'>
													<div class="caption" class="pull-left">
														<a href="http://bootsnipp.com/"
															class="btn btn-danger icon  pull-right">刪除</a>
														<h4>
															<a href="#">Luis Felipe Kaufmann</a>
														</h4>
														<small><b>RG: </b>99384877</small>
													</div>
												</div>
											</li>
										</ul>



									</div>
								</div>
							</div>
							<div class="col-md-4 pull-right" style="margin-top: 20px">
								<button type="button"
									class="btn btn-primary pull-right next-step">前往填寫付款資訊</button>
							</div>
						</div>
						<!-- step1end -->
						<!-- step2start -->
						<div class="tab-pane" role="tabpanel" id="step2">
							<div class="container">
								<div class="row">

									<fieldset>
										<!-- Multiple Radios (inline) -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="reqType">發票類型
											</label>
											<div class="col-md-4">
												<label class="radio-inline" for="reqType-0"> <input
													type="radio" name="reqType" id="reqType-0" value="post"
													checked="checked"> 二聯電子發票
												</label> <label class="radio-inline" for="reqType-1"> <input
													type="radio" name="reqType" id="reqType-1" value="get">
													三聯電子發票
												</label>
											</div>
										</div>
										<!-- Multiple Radios (inline) -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="textinput">統一編號</label>
											<div class="col-md-2">
												<input id="textinput" name="textinput" type="text"
													placeholder="placeholder" class="form-control input-md"
													required="">
											</div>
										</div>
										<!-- Text input-->
										<div class="form-group">
											<label class="col-md-4 control-label" for="color">購買人姓名</label>
											<div class="col-md-2">
												<input id="color" name="color" type="text"
													placeholder="#F0F0F0" class="form-control input-md">
											</div>
										</div>
										<!-- Appended Input-->
										<div class="form-group">
											<label class="col-md-4 control-label" for="account">聯絡電話</label>
											<div class="col-md-3">
												<div class="input-group">
													<input id="account" name="account" class="form-control"
														placeholder="Alan Francis" type="text">
												</div>
											</div>
										</div>
										<!-- Select Basic -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="threshold">地址</label>
											<div class="col-md-2">
												<select id="threshold" name="threshold" class="form-control">
													<option value="台北市">台北市</option>
													<option value="新北市">新北市</option>
													<option value="桃園市">桃園市</option>
													<option value="台中市">台中市</option>
													<option value="台南市">台南市</option>
													<option value="高雄市">高雄市</option>
													<option value="基隆市">基隆市</option>
													<option value="新竹市">新竹市</option>
													<option value="嘉義市">嘉義市</option>
													<option value="新竹縣">新竹縣</option>
													<option value="苗栗縣">苗栗縣</option>
													<option value="彰化縣">彰化縣</option>
													<option value="南投縣">南投縣</option>
													<option value="雲林縣">雲林縣</option>
													<option value="嘉義縣">嘉義縣</option>
													<option value="屏東縣">屏東縣</option>
													<option value="宜蘭縣">宜蘭縣</option>
													<option value="花蓮縣">花蓮縣</option>
													<option value="台東縣">台東縣</option>
													<option value="澎湖縣">澎湖縣</option>
													<option value="金門縣">金門縣</option>
													<option value="連江縣">連江縣</option>
												</select>
											</div>


											<div class="col-md-2">
												<select name="comparison" class="form-control">
													<option value="GT">信義區</option>
													<option value="LT">Less than</option>
												</select>
											</div>
										</div>
										<!-- Text input-->
										<div class="form-group">
											<label class="col-md-4 control-label" for="thresholdvalue"></label>
											<div class="col-md-6">
												<input id="thresholdvalue" name="thresholdvalue" type="text"
													placeholder="threshold value" class="form-control input-md">
											</div>
										</div>
										<!-- Button (Double) -->
										<!-- 
									 	<div class="form-group">
											<label class="col-md-4 control-label" for="submitButton"></label>
											<div class="col-md-8">
												<button id="submitButton" name="submitButton"
													class="btn btn-success">Save</button>
												<button id="cancel" name="cancel" class="btn btn-inverse">Cancel</button>
											</div>
										</div> 
										-->

										<div class="col-md-4 pull-right" style="margin-top: 20px">
											<button type="button"
												class="btn btn-primary pull-right next-step">選擇付款方式</button>
										</div>
									</fieldset>
								</div>
							</div>
						</div>
						<!-- step2end -->
						<!-- step3start -->
						<div class="tab-pane" role="tabpanel" id="step3">
							<div class="container">
								<div class="row">
									<div class="col-md-3"></div>
									<div class="form-group col-md-6">
										<h3>訂單金額： 2300 元</h3>
										<hr>
										<br>
										<h3>付款方式：</h3>
										<hr>
									</div>

									<div class="col-md-3"></div>
									<div class="col-md-12"></div>
									<div class="col-md-3"></div>
									<div class="col-xs-12 col-md-6">


										<!-- CREDIT CARD FORM STARTS HERE -->
										<div class="panel panel-default credit-card-box">
											<div class="panel-heading display-table">
												<div class="row display-tr">
													<h3 class="panel-title display-td">Payment Details</h3>
													<div class="display-td">
														<img class="img-responsive pull-right"
															src="http://i76.imgup.net/accepted_c22e0.png">
													</div>
												</div>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group">
															<label for="cardNumber">CARD NUMBER</label>
															<div class="input-group">
																<input type="tel" class="form-inline col-md-2" name="cardNumber"
																	maxlength="4" required  />
																<input type="tel" class="form-inline col-md-2" name="cardNumber"
																	maxlength="4" required  />
																<input type="tel" class="form-inline col-md-2" name="cardNumber"
																	maxlength="4" required  />
																<input type="tel" class="form-inline col-md-2" name="cardNumber"
																	maxlength="4" required  />
															
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-7 col-md-7">
														<div class="form-group">
															<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span
																class="visible-xs-inline">EXP</span> DATE</label> <input
																type="tel" class="form-control" name="cardExpiry"
																placeholder="MM / YY" autocomplete="cc-exp" required />
														</div>
													</div>
													<div class="col-xs-5 col-md-5 pull-right">
														<div class="form-group">
															<label for="cardCVC">CV CODE</label> <input type="tel"
																class="form-control" name="cardCVC" placeholder="CVC"
																autocomplete="cc-csc" required />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group">
															<label for="couponCode">COUPON CODE</label> <input
																type="text" class="form-control" name="couponCode" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<button class="btn btn-success btn-lg btn-block"
															type="submit">Start Subscription</button>
													</div>
												</div>
												<div class="row" style="display: none;">
													<div class="col-xs-12">
														<p class="payment-errors"></p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</form>


			</div>
			</section>
		</div>
	</div>



</body>
</html>