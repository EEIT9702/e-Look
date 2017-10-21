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

<style>
.nav-tabs > li {
    width: 25%;
}
.wizard .nav-tabs {
	position: relative;
	margin: 40px auto;
	margin-bottom: 0;
	border-bottom-color: #e0e0e0;
}

.wizard>div.wizard-inner {
	position: relative;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="${contextPath}/login.jsp" flush="true"  />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<section>
			<div class="wizard">
				<div class="wizard-inner">
					<div class="connecting-line"></div>
					<ul class="nav nav-tabs" role="tablist">

						<li role="presentation" class="active"><a href="#step1"
							data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-list"></i>
							</span>
						</a></li>

						<li role="presentation" class="disabled"><a href="#step2"
							data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-picture"></i>
							</span>
						</a></li>
						<li role="presentation" class="disabled"><a href="#step3"
							data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-tags"></i>
							</span>
						</a></li>
						<li role="presentation" class="disabled"><a href="#step4"
							data-toggle="tab" aria-controls="step4" role="tab" title="Step 4">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-usd"></i>
							</span>
						</a></li>

					</ul>
				</div>


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
					$("#endofproposal").text(
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
					$('#filename1').text(value);
				})
		$('#inputfilename2').change(
				function() {
					$('#filename2').attr("class",
							"btn btn-default image-preview-input");
					var value = $('#inputfilename2').val();
					console.log(value);
					$('#filename2').text(value);
				})
		$('#inputfilename3').change(
				function() {
					$('#filename3').attr("class",
							"btn btn-default image-preview-input");
					var value = $('#inputfilename3').val();
					console.log(value);
					$('#filename3').text(value);
				})
	</script>

</body>
</html>