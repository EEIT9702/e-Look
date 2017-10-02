<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>開課流程●步驟一</title>
<link href="HeaderCssJs/bootstrap.css" rel="stylesheet">
<link href="HeaderCssJs/bootstrap.min.css" rel="stylesheet">
<script src="HeaderCssJs/jquery.js"></script>
<script src="HeaderCssJs/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
#course:hover{-webkit-transform: scale(1.05);}
#courseimg {
	height: 200px;
	width: 300px;
}

#course {
	height: 400px;
	width: 300px;
	border: 1px #DEDEDE solid;
	background-color: #FFF2FF;
}

#icon {
	height: 50px;
	width: 50px;
	border-radius: 50px;
	border: 1px solid;
	z-index: 1;
	position: absolute;
}




.wizard {
    margin: 20px auto;
    background: #fff;
}

    .wizard .nav-tabs {
        position: relative;
        margin: 40px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

.connecting-line {
    height: 2px;
    background: #e0e0e0;
    position: absolute;
    width: 80%;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 50%;
    z-index: 1;
}

.wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    border: 0;
    border-bottom-color: transparent;
}

span.round-tab {
    width: 70px;
    height: 70px;
    line-height: 70px;
    display: inline-block;
    border-radius: 100px;
    background: #fff;
    border: 2px solid #e0e0e0;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 25px;
}
span.round-tab i{
    color:#555555;
}
.wizard li.active span.round-tab {
    background: #fff;
    border: 2px solid #5bc0de;
    
}
.wizard li.active span.round-tab i{
    color: #5bc0de;
}

span.round-tab:hover {
    color: #333;
    border: 2px solid #333;
}

.wizard .nav-tabs > li {
    width: 25%;
}

.wizard li:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: #5bc0de;
    transition: 0.1s ease-in-out;
}

.wizard li.active:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #5bc0de;
}

.wizard .nav-tabs > li a {
    width: 70px;
    height: 70px;
    margin: 20px auto;
    border-radius: 100%;
    padding: 0;
}

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

.wizard .tab-pane {
    position: relative;
    padding-top: 50px;
}

.wizard h3 {
    margin-top: 0;
}
.step1 .row {
    margin-bottom:10px;
}
.step_21 {
    border :1px solid #eee;
    border-radius:5px;
    padding:10px;
}
.step33 {
    border:1px solid #ccc;
    border-radius:5px;
    padding-left:10px;
    margin-bottom:10px;
}
.dropselectsec {
    width: 68%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.dropselectsec1 {
    width: 74%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.mar_ned {
    margin-bottom:10px;
}
.wdth {
    width:25%;
}
.birthdrop {
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    width: 16%;
    outline: 0;
    font-weight: normal;
}


/* according menu */
#accordion-container {
    font-size:13px
}
.accordion-header {
    font-size:13px;
	background:#ebebeb;
	margin:5px 0 0;
	padding:7px 20px;
	cursor:pointer;
	color:#fff;
	font-weight:400;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px
}
.unselect_img{
	width:18px;
	-webkit-user-select: none;  
	-moz-user-select: none;     
	-ms-user-select: none;      
	user-select: none; 
}
.active-header {
	-moz-border-radius:5px 5px 0 0;
	-webkit-border-radius:5px 5px 0 0;
	border-radius:5px 5px 0 0;
	background:#F53B27;
}
.active-header:after {
	content:"\f068";
	font-family:'FontAwesome';
	float:right;
	margin:5px;
	font-weight:400
}
.inactive-header {
	background:#333;
}
.inactive-header:after {
	content:"\f067";
	font-family:'FontAwesome';
	float:right;
	margin:4px 5px;
	font-weight:400
}
.accordion-content {
	display:none;
	padding:20px;
	background:#fff;
	border:1px solid #ccc;
	border-top:0;
	-moz-border-radius:0 0 5px 5px;
	-webkit-border-radius:0 0 5px 5px;
	border-radius:0 0 5px 5px
}
.accordion-content a{
	text-decoration:none;
	color:#333;
}
.accordion-content td{
	border-bottom:1px solid #dcdcdc;
}



@media( max-width : 585px ) {

    .wizard {
        width: 90%;
        height: auto !important;
    }

    span.round-tab {
        font-size: 16px;
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard .nav-tabs > li a {
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 35%;
    }
}



h5 {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
    margin: 0;
}

.card {
    font-size: 1em;
    overflow: hidden;
    padding: 0;
    border: none;
    border-radius: .28571429rem;
    box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}

.card-block {
    font-size: 1em;
    position: relative;
    margin: 0;
    padding: 1em;
    border: none;
    border-top: 1px solid rgba(34, 36, 38, .1);
    box-shadow: none;
}

.card-img-top {
    display: block;
    width: 310px;
    height:200px;
    margin-top: 4px;
    margin-bottom: 4px;
}

.card-title {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
}

.card-text {
    clear: both;
    margin-top: .5em;
    height: 70px;
}

.card-footer {
    font-size: 15px;
    position: static;
    top: 0;
    left: 0;
    max-width: 100%;
    padding: .75em 1em;
    color:gray;
    border-top: 1px solid rgba(0, 0, 0, .05) !important;
    background: #fff;
}

.card-inverse .btn {
    border: 1px solid rgba(0, 0, 0, .05);
}

.profile {
    position: absolute;
    top: -30px;
    display: inline-block;
    overflow: hidden;
    box-sizing: border-box;
    width: 50px;
    height: 50px;
    margin: 0;
    border: 1px solid #fff;
    border-radius: 50%;
}

.profile-avatar {
    display: block;
    width: 100%;
    height: auto;
    border-radius: 50%;
}

.profile-inline {
    position: relative;
    top: 0;
    display: inline-block;
}

.profile-inline ~ .card-title {
    display: inline-block;
    margin-left: 4px;
    vertical-align: top;
}

.text-bold {
    font-weight: 700;
}

.meta {
    font-size: 2em;
    
}

.meta a {
    text-decoration: none;
    color: rgba(0, 0, 0, .4);
}

.meta a:hover {
    color: rgba(0, 0, 0, .87);
}

</style>

</head>

<body>
<jsp:include page="header.jsp" />
<div class="container" style="margin-top: 50px">
    <div class="row">
    	<section>
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-folder-open"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-picture"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <form role="form">
                <div class="tab-content">
<!-- 整個step1頁面 --><div class="tab-pane active" role="tabpanel" id="step1">                                                         
<!-- 包住step1填寫資料 --><div class="step1">                       
							
							
							



<!-- 預覽課程頁面圖 -->
<div class="col-lg-3 pull-right" style="margin-right:150px;width: 341px">
                <div class="card card-inverse">
                    <img class="card-img-top" src="Class Steps/imgs/請上傳課程封面.png" alt="course" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3" style="font-size: 40px;overflow:hidden;white-space:nowrap"></p>                        	
                        </div>
                        <div>
                            	<p style="margin-top:40px;font-size: 18px">課程售價：xxx元</p>
                        </div>
                    </div>
                    <div class="card-footer">
                    <button class="btn-info btn-sm pull-right" style="margin-bottom: 5px;margin-top: 10px">加入書籤</button>
                        <small>課程時間:yyy分鐘</small>
                        <br>
                        <small>購買人數:zzz人</small>
                        
                    </div>
                </div>
            </div>
					
							<div class="list-inline pull-right">
                            <img alt="" src="Class Steps/imgs/預覽課程展示畫面.png" style="width:150px;height:250px;margin-right: 50px;margin-top: 50px">
                            </div>
                            
                            	
                            <div class="row" style="height:500px">
                            <div class="col-md-6" style="margin-bottom: 25px">
                                <label for="exampleInputEmail1" style="font-size: 20pt">課程標題</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" value="輸入課程標題">
                                
                            </div>

                            <div class="col-md-6" style="margin-bottom: 40px">
                                <label for="exampleInputEmail1" style="font-size: 20pt">上傳課程封面</label>
                                <input type="file" id="wizard-picture">
                            </div>

                            <div class="col-md-6" style="margin-bottom: 25px">
                                <label for="exampleInputEmail1" style="font-size: 20pt">選擇課程類別(最多三項)</label>
                                <div >                               
                                <div style="font-size: 15pt">
                                	<FORM method="post" action="">
									    <INPUT TYPE="checkbox"  NAME="checkbox1" onClick="choose()">烹飪 
									    <INPUT TYPE="checkbox"  NAME="checkbox2" onClick="choose()">商業
									    <INPUT TYPE="checkbox"  NAME="checkbox3" onClick="choose()">程式
									    <INPUT TYPE="checkbox"  NAME="checkbox4" onClick="choose()">音樂<br>
									    <INPUT TYPE="checkbox"  NAME="checkbox5" onClick="choose()">手作
									    <INPUT TYPE="checkbox"  NAME="checkbox6" onClick="choose()">設計
									    <INPUT TYPE="checkbox"  NAME="checkbox7" onClick="choose()">語言
									    <INPUT TYPE="checkbox"  NAME="checkbox8" onClick="choose()">運動<br>
									    <INPUT TYPE="checkbox"  NAME="checkbox9" onClick="choose()">生活
									    <INPUT TYPE="checkbox"  NAME="checkbox10" onClick="choose()">影音
									    <INPUT TYPE="checkbox"  NAME="checkbox11" onClick="choose()">科技
									    <INPUT TYPE="checkbox"  NAME="checkbox12" onClick="choose()">其他
									 </FORM>   
                                </div>
                            </div>
                            </div>
							</div>
                            
<!-- 包住step1填寫資料 --></div>                         
<!-- step1最終確認按鈕 -->
						
						<ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-primary next-step">儲存並前往下一步</button></li>
                        </ul>
                                                                       						
<!-- 整個step1頁面 --></div>
                    
                    
                    
                    
                    <div class="tab-pane" role="tabpanel" id="step2">
                        <div class="step2">
                            <div class="step_21">
                                <div class="row">
                                   
                                </div>
                            </div>
                            <div class="step-22">
                            
                            </div>
                        </div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step3">
                        <div class="step33">
                        <h5><strong>Basic Details</strong></h5>
                        <hr>
                            <div class="row mar_ned">
                                
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Date of birth</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <div class="row">
                                        <div class="col-md-4 col-xs-4 wdth">
                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
                                                <option value="">Date</option>
                                                <option value="2">1</option>
                                                <option value="1">2</option>
                                                <option value="4">3</option>
                                                <option value="5">4</option>
                                                <option value="6">5</option>
                                                <option value="3">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-xs-4 wdth">
                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
                                                <option value="">Month</option>
                                                <option value="2">Jan</option>
                                                <option value="1">Feb</option>
                                                <option value="4">Mar</option>
                                                <option value="5">Apr</option>
                                                <option value="6">May</option>
                                                <option value="3">June</option>
                                                <option value="7">July</option>
                                                <option value="8">Aug</option>
                                                <option value="9">Sept</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-xs-4 wdth">
                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
                                                <option value="">Year</option>
                                                <option value="2">1990</option>
                                                <option value="1">1991</option>
                                                <option value="4">1992</option>
                                                <option value="5">1993</option>
                                                <option value="6">1994</option>
                                                <option value="3">1995</option>
                                                <option value="7">1996</option>
                                                <option value="8">1997</option>
                                                <option value="9">1998</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Marital Status</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <label class="radio-inline">
                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Single
                                    </label>
                                    <label class="radio-inline">
                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Married
                                    </label>
                                </div>
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Highest Education</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <select name="highest_qualification" id="highest_qualification" class="dropselectsec">
                                        <option value=""> Select Highest Education</option>
                                        <option value="1">Ph.D</option>
                                        <option value="2">Masters Degree</option>
                                        <option value="3">PG Diploma</option>
                                        <option value="4">Bachelors Degree</option>
                                        <option value="5">Diploma</option>
                                        <option value="6">Intermediate / (10+2)</option>
                                        <option value="7">Secondary</option>
                                        <option value="8">Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Specialization</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <input type="text" name="specialization" id="specialization" placeholder="Specialization" class="dropselectsec" autocomplete="off">
                                </div>
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Year of Passed Out</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <select name="year_of_passedout" id="year_of_passedout" class="birthdrop">
                                        <option value="">Year</option>
                                        <option value="1980">1980</option>
                                        <option value="1981">1981</option>
                                        <option value="1982">1982</option>
                                        <option value="1983">1983</option>
                                        <option value="1984">1984</option>
                                        <option value="1985">1985</option>
                                        <option value="1986">1986</option>
                                        <option value="1987">1987</option>
                                        <option value="1988">1988</option>
                                        <option value="1989">1989</option>
                                        <option value="1990">1990</option>
                                        <option value="1991">1991</option>
                                        <option value="1992">1992</option>
                                        <option value="1993">1993</option>
                                        <option value="1994">1994</option>
                                        <option value="1995">1995</option>
                                        <option value="1996">1996</option>
                                        <option value="1997">1997</option>
                                        <option value="1998">1998</option>
                                        <option value="1999">1999</option>
                                        <option value="2000">2000</option>
                                        <option value="2001">2001</option>
                                        <option value="2002">2002</option>
                                        <option value="2003">2003</option>
                                        <option value="2004">2004</option>
                                        <option value="2005">2005</option>
                                        <option value="2006">2006</option>
                                        <option value="2007">2007</option>
                                        <option value="2008">2008</option>
                                        <option value="2009">2009</option>
                                        <option value="2010">2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mar_ned">
                                <div class="col-md-4 col-xs-3">
                                    <p align="right"><stong>Total Experience</stong></p>
                                </div>
                                <div class="col-md-8 col-xs-9">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 wdth">
                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
                                                <option value="">Month</option>
                                                <option value="2">Jan</option>
                                                <option value="1">Feb</option>
                                                <option value="4">Mar</option>
                                                <option value="5">Apr</option>
                                                <option value="6">May</option>
                                                <option value="3">June</option>
                                                <option value="7">July</option>
                                                <option value="8">Aug</option>
                                                <option value="9">Sept</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-xs-6 wdth">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mar_ned">
                               
                            </div>
                        </div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="complete">
                        <div class="step44">
                            <h5>Completed</h5>
                            
                          
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </section>
   </div>
</div>


<script type="text/javascript">
$(document).ready(function () {
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

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

$(document).ready(function()
{
    //Add Inactive Class To All Accordion Headers
    $('.accordion-header').toggleClass('inactive-header');
	
	//Set The Accordion Content Width
	var contentwidth = $('.accordion-header').width();
	$('.accordion-content').css({});
	
	//Open The First Accordion Section When Page Loads
	$('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
	$('.accordion-content').first().slideDown().toggleClass('open-content');
	
	// The Accordion Effect
	$('.accordion-header').click(function () {
		if($(this).is('.inactive-header')) {
			$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
		
		else {
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
	});
	
	return false;
});



$("#wizard-picture").change(function(){
    readURL(this);
});


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function choose() { 
	   var n = 12; //checkbox的數量
	   var limit = 3; //限制勾選的數量
	   var j = 0; //已勾選的數量
	   var f = document.forms[0];
	   limit--;
	   for (i=1; i<=n; i++) { 
	      eval("t1 = f.checkbox" + i + ".checked"); 
	      if (t1) j++; 
	   } 
	   if (j>limit) { 
	      for (i=1; i<=n; i++) { 
	         eval("t2 = f.checkbox" + i + ".checked"); 
	         if (!t2) eval("f.checkbox" + i + ".disabled = true"); 
	      } 
	   } 
	   else { 
	      for (i=1; i<=n; i++) 
	         eval("f.checkbox" + i + ".disabled = false"); 
	   } 
	} 
	
	
	
$( "input" )
.keyup(function() {
  var value = $( this ).val();
  $( "#title" ).text( value );
})
.keyup();
</script>
</body>

</html>