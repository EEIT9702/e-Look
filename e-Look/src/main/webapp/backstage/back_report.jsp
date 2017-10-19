<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>檢舉管理畫面</title>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>
<script type="text/javascript" src="css/jquery.mmenu.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
.rtitle{
	width:60%;
	height:100px;
	margin:0 auto;
/* 	border:3px solid red; */
}
.rh1{
	font-size:50px;
	text-align:center;
	font-weight:20px;
}
.bhr{
	width:60%;
	border:1px solid black;
	margin:0 auto;
/* 	margin-top:10px; */
	margin-bottom:35px;
}
.cbox{
	width:60%;
	margin:0 auto;
/* 	border:3px solid gold; */
}
.tstyle{
	background-color:#FAF4FF;
}
.row th, td{
	text-align:center;
}
.row td{
/* 	valign="center; */
/* 	valign="middle; */
}
</style>
</head>
<body>
<jsp:include page="bheader.jsp"></jsp:include>
	<div class="rtitle" style="">
		<h1 class="rh1" style="">檢舉管理</h1>
	</div>
	<div class="bhr" style=""></div>
	<div class="container cbox" style="">
		<div class="row">

		  <table id="reportTable" class="table table-bordered tstyle" style="">
                 <thead>
                    <tr>
                       <th style="width:10%">檢舉編號</th>
                       <th style="width:20%">檢舉內容</th>
                       <th style="width:22%">留言內容</th>
                       <th style="width:20%">檢舉時間</th>
                       <th style="width:10%">檢舉狀態</th>
                       <th style="width:18%">管理</th>
                    </tr>
                 </thead>
                 <tbody>
                 </tbody>
                    <tr><td>1001</td><td>我不爽</td><td>ox@!*/</td><td>2017/10/28</td><td>0</td><td>
	                    <button class="btn btn-primary">確認</button>
	                    <button class="btn btn-warning">不處理</button></td>
                    </tr>
                    <tr><td>1002</td><td>我不喜歡</td><td>x@o!*x/</td><td>2017/10/29</td><td>0</td><td>
	                    <button class="btn btn-primary">確認</button>
	                    <button class="btn btn-warning">不處理</button></td>
                    </tr>
                    <tr><td>1003</td><td>我不喜歡</td><td>~@o!*x/</td><td>2017/10/30</td><td>0</td><td>
	                    <button class="btn btn-primary">確認</button>
	                    <button class="btn btn-warning">不處理</button></td>
                    </tr>
                   	<tr><td>1004</td><td>我討厭</td><td>-^%@!*/</td><td>2017/10/31</td><td>0</td><td>
	                    <button class="btn btn-primary">確認</button>
	                    <button class="btn btn-warning">不處理</button></td>
                    </tr>
<!--                  <tfoot> -->
<!--                  <form name="reportForm"> -->
<!--                  <tr> -->
<!--                   <td><input type="hidden" id="ProductID" name="ProductID"><span></span></td> -->
<!--                   <td><input type="text" class="form-control" id="ProductName" name="ProductName" placeholder="檢舉內容"></td> -->
<!--                   <td><input type="text" style="width:100px" class="form-control" id="UnitPrice" name="UnitPrice" placeholder="檢舉時間"></td> -->
<!--                   <td><input type="text" style="width:100px" class="form-control" id="UnitsInStock" name="UnitsInStock" placeholder="狀態"></td> -->
<!--                   <td><button id="buttonAdd" type="button" class="btn btn-primary">確認</button> -->
<!--                       <button id="buttonUpdate" type="button" class="btn btn-success">不處理</button></td> -->
<!--                  </tr> -->
<!--                  </form> -->
<!--                  </tfoot> -->
            </table>
		</div>

	</div>
</body>
</html>