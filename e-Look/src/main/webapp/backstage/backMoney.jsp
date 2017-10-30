<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <script src="js/jquery.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.min.css">
<!--   <link rel="stylesheet" href="css/table.css"> -->
<script src="code/highcharts.js"></script>
<script src="code/modules/exporting.js"></script>
<script src="code/themes/dark-unica.js"></script>


<title>Insert title here</title>
<style type="text/css">
.container{font-family:inherit;}
</style>

</head>
<body>
	<jsp:include page="backheader.jsp"></jsp:include>
				
<section id="wrapper">
						<header>
							<div class="inner">
								<h2>收益報表</h2>		
							</div>
						</header>
						</section> 
<div id="container" style="width: 80%; height: 700px; margin: 0 auto"></div>
<script>
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'e-LOOK收益報表'
    },
    xAxis: {
        categories: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: ' 千元(k)'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:20px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} k</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: '課程類別',
        data: [40, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    }]
});
	</script>

 
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>