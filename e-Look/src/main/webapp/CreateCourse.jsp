<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="SYSTEM" class="init.GlobalService" scope="application" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${SYSTEM.systemName}</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step1.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step2.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step4.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/_PJC/css/step6.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
	
<!-- 顯示分頁上e-look的小圖示	 -->
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/autosize.js"></script>
<script
	src="<%=request.getContextPath()%>/_PJC/js/bootstrap-datetimepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/_PJC/js/bootstrap-datetimepicker.zh-TW.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/tinymce/tinymce.min.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/tinymce/init-tinymce.js"></script>
<script src="<%=request.getContextPath()%>/_PJC/js/upload1.js"></script>
</head>

<body>
	<jsp:include page="/login.jsp" flush="true" />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<section>
				<div class="wizard">
					<div class="wizard-inner">
						<div class="connecting-line"></div>
						<ul class="nav nav-tabs" role="tablist">

							<li role="presentation" class="active"><a href="#step1"
								data-toggle="tab" aria-controls="step1" role="tab"
								title="Step 1"> <span class="round-tab"> 
								<i class="glyphicon glyphicon-list"></i>
								</span>
							</a></li>

							<li role="presentation" class="disabled"><a href="#step2"
								data-toggle="tab" aria-controls="step2" role="tab"
								title="Step 2"> <span class="round-tab"> <i
										class="glyphicon glyphicon-picture"></i>
								</span>
							</a></li>
							<li role="presentation" class="disabled"><a href="#step3"
								data-toggle="tab" aria-controls="step3" role="tab"
								title="Step 3"> <span class="round-tab"> <i
										class="glyphicon glyphicon-tags"></i>
								</span>
							</a></li>
							<li role="presentation" class="disabled"><a href="#step4"
								data-toggle="tab" aria-controls="step4" role="tab"
								title="Step 4"> <span class="round-tab"> <i
										class="glyphicon glyphicon-usd"></i>
								</span>
							</a></li>
							<li role="presentation" class="disabled"><a href="#step5"
								data-toggle="tab" aria-controls="step5" role="tab"
								title="Step 5"> <span class="round-tab"> <i
										class="glyphicon glyphicon-pencil"></i>
								</span>
							</a></li>
							<li role="presentation" class="disabled"><a href="#step6"
								data-toggle="tab" aria-controls="step6" role="tab"
								title="Step 6"> <span class="round-tab"> <i
										class="glyphicon glyphicon-open"></i>
								</span>
							</a></li>

							<li role="presentation" class="disabled"><a href="#complete"
								data-toggle="tab" aria-controls="complete" role="tab"
								title="Complete"> <span class="round-tab"> <i
										class="glyphicon glyphicon-thumbs-up"></i>
								</span>
							</a></li>
						</ul>
					</div>

					<form
						action=""
						method="POST" name="formData" target="upload_iframe"
						enctype="multipart/form-data" role="form" id="TotalContent"
						onsubmit="showStatus()">
						<iframe name=upload_iframe width=0 height=0></iframe>
						<input type="hidden" value="${CourseID}" name="CourseID">
						<input type="hidden" value="${LoginOK.memberID}" name="memberID">
						<div class="tab-content">
							<!-- 整個step1頁面 -->
							<div class="tab-pane active" role="tabpanel" id="step1">
								<div class="container">
									<div class="row">




										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step1">
													<i class="glyphicon glyphicon-list"></i>
												</div>
												<div class="update-text">																																			
													<strong>步驟一、</strong> 介紹建立課程有哪些流程?<a href="#"></a>
												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step2">
													<i class="glyphicon glyphicon-picture"></i>
												</div>
												<div class="update-text">
													<strong>步驟二、</strong> 輸入課程標題、上傳課程封面、選擇課程種類<a href="#"></a>
												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step3">
													<i class="glyphicon glyphicon-tags"></i>
												</div>
												<div class="update-text">
													<strong>步驟三、</strong> 設定課程學習目標<a href="#"></a>
												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step4">
													<i class="glyphicon glyphicon-usd"></i>
												</div>
												<div class="update-text">
													<strong>步驟四、</strong> 設定課程銷售方式

												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step5">
													<i class="glyphicon glyphicon-pencil"></i>
												</div>
												<div class="update-text">
													<strong>步驟五、</strong> 課程內容主要說明
												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step6">
													<i class="glyphicon glyphicon-open"></i>
												</div>
												<div class="update-text">
													<strong>步驟六、</strong> 上傳影片
												</div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="update-nag">
												<div class="update-split update-step7">
													<i class="glyphicon glyphicon-thumbs-up"></i>
												</div>
												<div class="update-text">
													<strong>步驟七、</strong> 確認課程資料內容、送出審核
												</div>
											</div>
										</div>
									</div>
								</div>


								<!-- step1最終確認按鈕 -->
								<div class="col-md-4 pull-right" style="margin-top: 20px">
									<button type="button"
										class="btn btn-primary pull-right next-step">前往下一步並開始編輯課程</button>
								</div>
								<!-- 整個step1頁面 -->
							</div>
		
							<div class="tab-pane" role="tabpanel" id="step2">
								<!-- step2的填寫資料 -->
								<div>
									<!-- 預覽課程頁面圖 -->
									<div class="col-md-4">
										<div class="row" style="margin-bottom: 25px">
											<label for="exampleInputEmail1" style="font-size: 20pt">課程標題</label>
											<input type="text" onfocus="this.select()"
												class="form-control" id="CourseInput" value="輸入課程標題"
												style="font-size: 18px" name="courseName">
										</div>
										<div class="row" style="margin-bottom: 40px">
											<label for="exampleInputEmail1" style="font-size: 20pt">上傳課程封面</label>
											<input type="file" id="wizard-picture"
												style="font-size: 18px" name="picture">
										</div>
										<div class="row" style="margin-bottom: 25px">
											<label for="exampleInputEmail1" style="font-size: 20pt">選擇課程類別(最多三項)</label>
											<div>
												<div style="font-size: 15pt">

													<INPUT TYPE="checkbox" NAME="checkbox1" onClick="choose()">烹飪
													<INPUT TYPE="checkbox" NAME="checkbox2" onClick="choose()">商業
													<INPUT TYPE="checkbox" NAME="checkbox3" onClick="choose()">程式
													<INPUT TYPE="checkbox" NAME="checkbox4" onClick="choose()">音樂<br>
													<INPUT TYPE="checkbox" NAME="checkbox5" onClick="choose()">手作
													<INPUT TYPE="checkbox" NAME="checkbox6" onClick="choose()">設計
													<INPUT TYPE="checkbox" NAME="checkbox7" onClick="choose()">語言
													<INPUT TYPE="checkbox" NAME="checkbox8" onClick="choose()">運動<br>
													<INPUT TYPE="checkbox" NAME="checkbox9" onClick="choose()">生活
													<INPUT TYPE="checkbox" NAME="checkbox10" onClick="choose()">影音
													<INPUT TYPE="checkbox" NAME="checkbox11" onClick="choose()">科技
													<INPUT TYPE="checkbox" NAME="checkbox12" onClick="choose()">其他

												</div>
											</div>
										</div>
									</div>
									<div class="list-inline col-md-4">
										<img alt=""
											src="<%=request.getContextPath()%>/Class Steps/imgs/預覽課程展示畫面.png"
											style="width: 150px; height: 250px; margin-right: 50px; margin-top: 50px">
									</div>
									<div class="col-md-4">
										<div style="width: 310px">
											<div class="card card-inverse">
												<img class="card-img-top"
													src="<%=request.getContextPath()%>/Class Steps/imgs/請上傳課程封面.png"
													alt="您的圖片連結已失效" id="wizardPicturePreview" title="">
												<div class="card-block">
													<figure class="profile">
														<img
															src="<%=request.getContextPath()%>/Class Steps/imgs/eLook_LOGO1.png"
															class="profile-avatar" alt="">
													</figure>
													<div class="card-text">
														<p id="title" class="card-title multi_ellipsis"></p>
													</div>
													<div>
														<p style="margin-top: 40px; font-size: 18px">課程售價：xxx元</p>
													</div>
												</div>
												<div class="card-footer">
													<button class="btn-info btn-sm pull-right"
														style="margin-bottom: 5px; margin-top: 10px">加入書籤</button>
													<small>課程時間:yyy分鐘</small> <br> <small>購買人數:zzz人</small>

												</div>
											</div>
										</div>
									</div>

									<!-- 包住step2填寫資料 -->
								</div>

								<ul class="list-inline pull-right" style="margin-top: 50px">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-primary next-step">儲存並前往下一步</button></li>
								</ul>

							</div>



							<!-- 包住step3填寫資料 -->
							<div class="tab-pane" role="tabpanel" id="step3">
								<div class="[ container ]">
									<div class="[ row ]">
										<div class="[ col-xs-12 ]">
											<div
												style="font-size: 20px; font-weight: bold; background-color: #BBFFEE">
												學生會需要用到的工具（含種類、版本細節）</div>
											<div class="[ form-group ][ form-group-textarea ]">
												<textarea name="preTool"
													placeholder="請輸入課程中，可能會使用到的工具" class="form-control"
													data-toggle="floatLabel" data-value="no-js"
													style="font-size: 18px" form="TotalContent"></textarea>
												<label for="customStyle" style="">(例：Photoshop CC
													2015)</label>
											</div>
										</div>
									</div>
								</div>

								<div class="[ container ]">
									<div class="[ row ]">
										<div class="[ col-xs-12 ]">
											<div
												style="font-size: 20px; font-weight: bold; background-color: #BBFFEE">
												學這堂課之前，學生需要具有哪些背景知識？</div>
											<div class="[ form-group ][ form-group-textarea ]">
												<textarea name="background"
													placeholder="如果是比較進階的課程，建議先跟學生說明必備的知識，幫助學生了解這堂課"
													class="form-control" data-toggle="floatLabel"
													data-value="no-js" style="font-size: 18px" form="TotalContent"></textarea>
												<label for="customStyle" style="">(例：學過PS遮罩的概念)</label>
											</div>
										</div>
									</div>
								</div>

								<div class="[ container ]">
									<div class="[ row ]">
										<div class="[ col-xs-12 ]">
											<div
												style="font-size: 20px; font-weight: bold; background-color: #BBFFEE">
												學完這堂課後，學生可以做出什麼東西？</div>
											<div class="[ form-group ][ form-group-textarea ]">
												<textarea name="ability"
													placeholder="最好是某種實質的東西：像是完成某種作品、達到哪種目標甚至是得到什麼結果"
													class="form-control" data-toggle="floatLabel"
													data-value="no-js" style="font-size: 18px" form="TotalContent"></textarea>
												<label for="customStyle" style="">(例：可習得合成影像的基本技術)</label>
											</div>
										</div>
									</div>
								</div>

								<div class="[ container ]">
									<div class="[ row ]">
										<div class="[ col-xs-12 ]">
											<div
												style="font-size: 20px; font-weight: bold; background-color: #BBFFEE">
												哪些人適合這堂課？</div>
											<div class="[ form-group ][ form-group-textarea ]">
												<textarea name="targetgroup"
													placeholder="形容這堂課適合的學生族群，可以更讓學生了解課程內容的方向"
													class="form-control" data-toggle="floatLabel"
													data-value="no-js" style="font-size: 18px" form="TotalContent"></textarea>
												<label for="customStyle" style="">(例：雜誌編輯、海報設計的美編人員等...)</label>
											</div>
										</div>
									</div>
								</div>

								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-default next-step">跳過此步驟</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">儲存並前往下一步</button></li>
								</ul>
							</div>

							<div class="tab-pane" role="tabpanel" id="step4">
								<div class="[ container ]">
									<div class="col-md-6">
										<div class="col-md-6">
											<div class="funkyradio" id="CourseList" onchange="select()">
												<div class="radio-free" style="font-size: 20px;">
													<input type="radio" name="radio" id="radio1" value="radio1" />
													<label for="radio1">免費課程</label>
												</div>
												<div class="radio-online" style="font-size: 20px;">
													<input type="radio" name="radio" id="radio3" value="radio3" />
													<label for="radio3">線上課程</label>
												</div>
												<div class="radio-proposal" style="font-size: 20px;">
													<input type="radio" name="radio" id="radio2" value="radio2" />
													<label for="radio2">募資課程</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="container" style="margin-top: 2em;">
									<div class="col-md-6">
										<div class="form-group col-lg-6" style="font-size: 20px;">
											<label>定價(最低售價為$10元)</label> <input type="text" name="soldPrice"
												class="form-control" id="" value="" style="font-size: 18px;">
										</div>

										<div class="form-group col-lg-6" style="font-size: 20px;">
											<label>預計課程長度(以分鐘為單位)</label> <input type="text" name="courseLength"
												class="form-control" id="" value="" style="font-size: 18px;">
										</div>


									</div>
								</div>
								<div class="container" style="margin-top: 2em;"
									id="ProposalCourse">
									<div class="col-md-12">
										<div class="form-group col-lg-4" style="font-size: 20px;">
											<label>開課門檻人數(最低為10人)</label> <input type="text" name="targetStudentNumber"
												class="form-control" id="" value="" style="font-size: 18px;">
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 2em;">
										<div class="form-group col-lg-4" style="font-size: 20px;">
											<label>募資起始日期</label>
											<div class="input-group date" data-date=""
												data-date-format="yyyy-mm-dd" data-link-field="dtp_input1"
												data-link-format="yyyy-mm-dd">
												<input class="form-control" style="font-size: 18px;"
													type="text" value="" readonly size="18" id="starttime" name="fundStartDate"><span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
											<!-- 											<input type="hidden" id="dtp_input1" value="" /><br /> -->
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 2em;">
										<div class="form-group col-lg-4" style="font-size: 20px;">
											<label>募資結束日期(最高天數為30天)</label>
											<div class="input-group date" data-date=""
												data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
												data-link-format="yyyy-mm-dd">
												<input class="form-control" style="font-size: 18px;"
													type="text" value="" readonly size="18" id="endtime" name="fundEndDate"><span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
											<!-- 											<input type="hidden" id="dtp_input2" value="" /><br /> -->
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 2em;">
										<div class="form-group col-lg-6" style="font-size: 20px;">
											<label>募資結束後的備課天數</label> <label>(最高天數為60天)</label> <input
												type="text" name="" class="form-control" id="prepareDate"
												value="" style="font-size: 18px">
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 0.5em;">
										<div class="form-group col-lg-6" style="font-size: 20px;">
											<label>課程預計上線日期：</label><input type="hidden" id="endofproposal" name="courseStartDate" value=""><span></span>
										</div>
									</div>
								</div>


								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">儲存並前往下一步</button></li>
								</ul>

							</div>

							<div class="tab-pane" role="tabpanel" id="step5">
								<div class="[ container ]">
									<div class="[ row ]">
										<div class="[ col-xs-12 ]">
											<div
												style="font-size: 20px; font-weight: bold; background-color: #BBFFEE">
												課程內容說明</div>
											<div>趕緊來為你精心設計的課程做個介紹吧!請務必在文案中加上開課緣由、自我介紹、課程單元說明、教學方式、課程難易度、相關作品圖片、作品集網站…等資料，越詳細的內容將會提升學生對課程的信任感；而善用編輯排版功能，讓提案更加吸引人！
											</div>
											<div class="[ form-group ][ form-group-textarea ]"
												id="get-data-form">
												<textarea class="tinymce" id="texteditor" name="courseContent"  form="TotalContent"></textarea>
											</div>
										</div>
									</div>
								</div>



								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">儲存並前往下一步</button></li>
								</ul>
							</div>

							<div class="tab-pane" role="tabpanel" id="step6">
								<div class="container">
									<br />
									<div class="row">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<strong>影片上傳</strong> <small> </small>
												</div>
												<div class="panel-body">
													<div class="input-group image-preview">
														<!-- don't give a name === doesn't send on POST/GET -->
														<span> <!-- image-preview-clear button --> 
														<input type="hidden"id="filename1" value="">
														<span></span>
															<div class="btn btn-default image-preview-input">
																<span class="glyphicon glyphicon-folder-open"></span> <span
																	class="image-preview-input-title">選擇檔案</span>
																	<input type="file" name="input-file-preview"
																	id="inputfilename1" onclick="fileSelect()"/>
																<!-- rename it -->
															</div>
															<button id="btnSubmit1" type="submit"
																class="btn btn-labeled btn-primary"
																onclick="bottonClick()">
																<span class="btn-label"><i
																	class="glyphicon glyphicon-upload"></i></span>上傳
															</button>
														</span>
													</div>
													<!-- /input-group image-preview [TO HERE]-->
													<br />
													<!-- Drop Zone -->
													<!-- Progress Bar -->
													<div class="progress">
														<div id="progressBar1" class="progress-bar"
															role="progressbar1" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100" style="width: 0%;">
															<!-- 															60% <span class="sr-only">60% Complete</span> -->
														</div>
													</div>
													<br />
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /container -->
								<div class="container">
									<br />
									<div class="row">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<strong>課程講義上傳</strong> <small> </small>
												</div>
												<div class="panel-body">
													<div class="input-group image-preview">
														<!-- don't give a name === doesn't send on POST/GET -->
														<span> <!-- image-preview-clear button --> 
														<input type="hidden"id="filename2" value="">
														<span></span>
															<div class="btn btn-default image-preview-input">
																<span class="glyphicon glyphicon-folder-open"></span> <span
																	class="image-preview-input-title">選擇檔案</span> <input
																	type="file" name="input-file-preview"
																	id="inputfilename2" onclick="fileSelect()" />
																<!-- rename it -->
															</div>
															<button id="btnSubmit2" type="submit"
																class="btn btn-labeled btn-primary"
																onclick="bottonClick()">
																<span class="btn-label"><i
																	class="glyphicon glyphicon-upload"></i></span>上傳
															</button>
														</span>
													</div>
													<!-- /input-group image-preview [TO HERE]-->
													<br />
													<!-- Drop Zone -->
													<!-- Progress Bar -->
													<div class="progress">
														<div id="progressBar2" class="progress-bar"
															role="progressbar2" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100" style="width: 0%;">
															<!-- 															60% <span class="sr-only">60% Complete</span> -->
														</div>
													</div>
													<br />
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /container -->
								
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">儲存並前往下一步</button></li>
								</ul>
							</div>

							<div class="tab-pane" role="tabpanel" id="complete">
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">完成課程編輯並送出審核</button></li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			//Initialize tooltips
			$('.nav-tabs > li a[title]').tooltip();

			//Wizard
			$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {

				var $target = $(e.target);

				if ($target.parent().hasClass('disabled')) {
					return false;
				}
			});

			$(".next-step").click(function(e) {

				var $active = $('.wizard .nav-tabs li.active');
				$active.next().removeClass('disabled');
				nextTab($active);

			});
			$(".prev-step").click(function(e) {

				var $active = $('.wizard .nav-tabs li.active');
				prevTab($active);

			});
		});

		function nextTab(elem) {
			$(elem).next().find('a[data-toggle="tab"]').click();
		}
		function prevTab(elem) {
			$(elem).prev().find('a[data-toggle="tab"]').click();
		}

		//according menu

		$(document).ready(
				function() {
					//Add Inactive Class To All Accordion Headers
					$('.accordion-header').toggleClass('inactive-header');

					//Set The Accordion Content Width
					var contentwidth = $('.accordion-header').width();
					$('.accordion-content').css({});

					//Open The First Accordion Section When Page Loads
					$('.accordion-header').first().toggleClass('active-header')
							.toggleClass('inactive-header');
					$('.accordion-content').first().slideDown().toggleClass(
							'open-content');

					// The Accordion Effect
					$('.accordion-header').click(
							function() {
								if ($(this).is('.inactive-header')) {
									$('.active-header').toggleClass(
											'active-header').toggleClass(
											'inactive-header').next()
											.slideToggle().toggleClass(
													'open-content');
									$(this).toggleClass('active-header')
											.toggleClass('inactive-header');
									$(this).next().slideToggle().toggleClass(
											'open-content');
								}

								else {
									$(this).toggleClass('active-header')
											.toggleClass('inactive-header');
									$(this).next().slideToggle().toggleClass(
											'open-content');
								}
							});

					return false;
				});

		$("#wizard-picture").change(function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#wizardPicturePreview').attr('src', e.target.result)
							.fadeIn('slow');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function choose() {
			var n = 12; //checkbox的數量
			var limit = 3; //限制勾選的數量
			var j = 0; //已勾選的數量
			var f = document.forms[3];
			limit--;
			for (i = 1; i <= n; i++) {
				eval("t1 = f.checkbox" + i + ".checked");
				if (t1)
					j++;
			}
			if (j > limit) {
				for (i = 1; i <= n; i++) {
					eval("t2 = f.checkbox" + i + ".checked");
					if (!t2)
						eval("f.checkbox" + i + ".disabled = true");
				}
			} else {
				for (i = 1; i <= n; i++)
					eval("f.checkbox" + i + ".disabled = false");
			}
		}

		$("#CourseInput").keyup(function() {
			var value = $(this).val();
			$("#title").text(value);
		});

		$(document).ready(
				function() {
					// Floating Labels
					//==============================================================
					$('[data-toggle="floatLabel"]').attr('data-value',
							$(this).val()).on('keyup change', function() {
						$(this).attr('data-value', $(this).val());
					});
				});

		$('textarea').each(function() {
			autosize(this);
		}).on('autosize:resized');

		function checkEndTime(starttime, endtime) {
			var starttime = $("#starttime").val();
			var endtime = $("#endtime").val();
			if (endtime < starttime) {
				return false;
			} else {
				return true;
			}
		};

		$(function() {

			$('#starttime').datetimepicker({
				language : 'zh-TW',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				format : 'yyyy-mm-dd'
			}).on('changeDate', function(ev) {
				var starttime = $('#starttime').val();
				$('#endtime').datetimepicker('setStartDate', starttime);
				$('#starttime').datetimepicker('hide');
			});

			$('#endtime').datetimepicker({
				language : 'zh-TW',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				format : 'yyyy-mm-dd'
			}).on('changeDate', function(ev) {
				var starttime = $('#starttime').val();
				var endtime = $('#endtime').val();

				if (starttime != "" && endtime != "") {
					if (!checkEndTime(starttime, endtime)) {
						$('endtime').val('');
						alert("起始日期不能大於結束日期");
						return;
					}
				}
				$('#starttime').datetimepicker('setEndDate', endtime);
				$('#starttime').datetimepicker('hide');
			});

		});

		$("#prepareDate").keyup(
				function() {
					var endtime = $('#endtime').val();
					var Dates = new Date(endtime);
					var prepareDate = $(this).val();
					Dates = Dates.valueOf();
					Dates = Dates + (prepareDate * 24 * 60 * 60 * 1000); // 一天幾豪秒
					Dates = new Date(Dates);
					$("#endofproposal").val(Dates.getFullYear() + "-" + (Dates.getMonth() + 1)
							+ "-" + Dates.getDate());
					$("#endofproposal+span").text(
							Dates.getFullYear() + "-" + (Dates.getMonth() + 1)
									+ "-" + Dates.getDate());
				});

		function select() {
			var selectr = document.querySelector("#CourseList input:checked").value;
			if (selectr === "radio1" || selectr === "radio3") {
				document.querySelector("#ProposalCourse").style = "opacity: 0.4";
				document.querySelectorAll("#ProposalCourse input").forEach(
						function(el) {
							el.setAttribute("disabled", "disabled");
							el.style = "opacity: 0.4";
						})
			} else if (selectr === "radio2") {
				document.querySelector("#ProposalCourse").style = "opacity: 1";
				document.querySelectorAll("#ProposalCourse input").forEach(
						function(el) {
							el.removeAttribute("disabled");
							el.style = "opacity: 1";
						})
			}
		};

		$('#inputfilename1').change(
				function() {
					$('#filename1').attr("class",
							"btn btn-default image-preview-input");
					var value = $('#inputfilename1').val();
					console.log(value);
					$('#filename1').val(value);
					$('#filename1+span').text(value);
				})
		$('#inputfilename2').change(
				function() {
					$('#filename2').attr("class",
							"btn btn-default image-preview-input");
					var value = $('#inputfilename2').val();
					console.log(value);
					$('#filename2').val(value);
					$('#filename2+span').text(value);
				})

				
		 $('input[type!="file"]').keyup(function(e){
			 
			 var formData = new FormData($('form')[3]);
				console.log("從input欄位送資料到資料庫囉!");
				$.ajax({
					type : 'POST',
					url : '/e-Look/com.e_Look.Course.control/CourseEditControlloer',
					data :formData,
					processData : false,
					contentType : false,
//					success: function(){
//						
//						$('#sendOK').modal()
//						$('#sendOK h3').text("更新成功")
//						setTimeout(function(){
//					        $("#sendOK").modal('hide');
//					        }, 1000);
//			        }
					error:function(){
						alert("請輸入正確的格式!");
					}
				})
			 
			 
		 })
		
	
	
	$('textarea').keyup(function(e){
			 
			 var formData = new FormData($('form')[3]);
				console.log("從textarea欄位送資料到資料庫囉!");
				$.ajax({
					type : 'POST',
					url : '/e-Look/com.e_Look.Course.control/CourseEditControlloer',
					data :formData,
					processData : false,
					contentType : false,
					success: function(){
						
// 						$('#sendOK').modal()
// 						$('#sendOK h3').text("更新成功")
// 						setTimeout(function(){
// 					        $("#sendOK").modal('hide');
// 					        }, 1000);
					
			        }

				})
			 
			 
		 })
		 
		 		 
					

	</script>



</body>

</html>