<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>開課流程</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/_PJC/css/step1.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/_PJC/css/step2.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/_PJC/css/step3.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/js/jquery-3.2.1.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
<style>
    
</style>

</head>

<body>
<jsp:include page="/header.jsp" flush="true"/>
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
                                <i class="glyphicon glyphicon-list"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-picture"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-tags"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" title="Step 4">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-usd"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step5" data-toggle="tab" aria-controls="step5" role="tab" title="Step 5">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step6" data-toggle="tab" aria-controls="step6" role="tab" title="Step 6">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-open"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-thumbs-up"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <form role="form">
                <div class="tab-content">
<!-- 整個step1頁面 --><div class="tab-pane active" role="tabpanel" id="step1">                                                         
	<div class="container">
	<div class="row">
    
		<div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step1"><i class="glyphicon glyphicon-list"></i></div>
            <div class="update-text"><strong>步驟一、</strong>    介紹建立課程有哪些流程?<a href="#"></a> </div>
          </div>
        </div>
    
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step2"><i class="glyphicon glyphicon-picture"></i></div>
            <div class="update-text"><strong>步驟二、</strong>    輸入課程標題、上傳課程封面、選擇課程種類<a href="#"></a> </div>
          </div>
        </div>

        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step3"><i class="glyphicon glyphicon-tags"></i></div>
            <div class="update-text"><strong>步驟三、</strong>    設定課程學習目標<a href="#"></a></div>
          </div>
        </div>
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step4"><i class="glyphicon glyphicon-usd"></i></div>
            <div class="update-text"><strong>步驟四、</strong>    設定課程銷售方式</div>
          </div>
        </div>
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step5"><i class="glyphicon glyphicon-pencil"></i></div>
            <div class="update-text"><strong>步驟五、</strong>    課程內容主要說明</div>
          </div>
        </div>
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step6"><i class="glyphicon glyphicon-open"></i></div>
            <div class="update-text"><strong>步驟六、</strong>    上傳影片</div>
          </div>
        </div>
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-step7"><i class="glyphicon glyphicon-thumbs-up"></i></div>
            <div class="update-text"><strong>步驟七、</strong>    確認課程資料內容、送出審核</div>
          </div>
        </div>
	</div>
	</div>

 
 
 
 
 
               
<!-- step1最終確認按鈕 --><div class="col-md-4 pull-right" style="margin-top: 20px">
                        <button type="button" class="btn btn-primary pull-right next-step">前往下一步並開始編輯課程</button>
                      </div>                                                                   						
<!-- 整個step1頁面 --></div>
                    
                    
                    
                    
                    <div class="tab-pane" role="tabpanel" id="step2">
<!-- 包住step2填寫資料 --><div>                       
<!-- 預覽課程頁面圖 -->							                                                       	
                            <div class="col-md-4">
                            <div class="row" style="margin-bottom: 25px">
                                <label for="exampleInputEmail1" style="font-size: 20pt">課程標題</label>
                                <input type="text" onfocus="this.select()" class="form-control" id="exampleInputEmail1" value="輸入課程標題">                                
                            </div>
                            <div class="row" style="margin-bottom: 40px">
                                <label for="exampleInputEmail1" style="font-size: 20pt">上傳課程封面</label>
                                <input type="file" id="wizard-picture">
                            </div>
                            <div class="row" style="margin-bottom: 25px">
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
							<div class="list-inline col-md-4">
                            <img alt="" src="<%= request.getContextPath() %>/Class Steps/imgs/預覽課程展示畫面.png" style="width:150px;height:250px;margin-right: 50px;margin-top: 50px">
                            </div>
<div class="col-md-4">
                <div style="width: 310px">
                <div class="card card-inverse">
                    <img class="card-img-top" src="<%= request.getContextPath() %>/Class Steps/imgs/請上傳課程封面.png" alt="您的圖片連結已失效" id="wizardPicturePreview" title="">
                    <div class="card-block">
                        <figure class="profile">
                            <img src="<%= request.getContextPath() %>/Class Steps/imgs/eLook_LOGO1.png" class="profile-avatar" alt="">
                        </figure>
                        <div class="card-text">
                        <p id="title" class="card-title mt-3 multi_ellipsis"></p>                        	
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
					</div>
                            
<!-- 包住step2填寫資料 --></div>
						
                        <ul class="list-inline pull-right" style="margin-top: 50px">
                            <li><button type="button" class="btn btn-default prev-step">前一步</button></li>
                            <li><button type="button" class="btn btn-primary next-step">儲存並前往下一步</button></li>
                        </ul>
                        
                    </div>
                    
                    
                    
                   <!-- 包住step3填寫資料 --> 
                   <div class="tab-pane" role="tabpanel" id="step3">
                        <div class="[ container ]">

    <div class="[ row ]">
        <div class="[ col-xs-12 ]"> 
        <div style="font-size: 20px;font-weight: bold;background-color:#BBFFEE">
           	學生會需要用到的工具（含種類、版本細節）
		</div>
            <div class="[ form-group ][ form-group-textarea ]">
            	<textarea id="customStyle" name="customStyle" placeholder="Custom Style" class="[ form-control ]" data-toggle="floatLabel" data-value="no-js"></textarea>
				<label for="customStyle" style="">Custom style</label>
			</div>
        </div>
    </div>
</div>
<div class="[ container ]">
    <div class="[ row ]">
        <div class="[ col-xs-12  ]">
            <p>So I wanted to have some floating labels and was looking at all of the plugins that existed out there (more than I thought), but was unhappy with them all. Them seems to rely javascript to do the heavy lifting. This bothered me because I knew there had to be an easier way to handle this.</p>
            <p><strong>PS:</strong> The reason I default the <code>data-value</code> to <code>no-js</code> is because this always the label to show up incase the user has javascript disabled.</p>
            <p><strong>PPS:</strong> I do not know all of the standards when it comes to using jQuery and chaining, so if my code is wrong or shouldn't be written the way it is please let me know.</p>
        </div>
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


<script>
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


$(document).ready(function(){
	// Floating Labels
	//==============================================================
    $('[data-toggle="floatLabel"]').attr('data-value', $(this).val()).on('keyup change', function() {
		$(this).attr('data-value', $(this).val());
	});
});



$('textarea').each(function(){
	  autosize(this);
	}).on('autosize:resized', function(){
	  console.log('textarea height updated');
	});
</script>

</body>

</html>