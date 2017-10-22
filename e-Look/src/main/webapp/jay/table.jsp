<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>無標題文件</title>
    <script type="text/javascript" src="css/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btn1').click(function () {
                data = [["a", "b", "c"], ["1", "2", "3"], ["4", "5", "6"]]; //將資料以陣列方式保存
                var td = "", tr = "", table = "", span = "";
                for (var i in data) {
                    for (var j in data[i]) {
                        td += '<td>' + data[i][j] + '</td>';
                    }
                    tr += '<tr>' + td + '</tr>';
                    td = "";
                }
                table = '<table>' + tr + '</table>';
                tr = "";
                $('#test').append(table);
            })
            //另一寫法:
            data = [["a","b","c"],["1","2","3"],["4","5","6"]];
var $table = $(document.createElement('table'));
$table.appendTo($("#test"));
for(var i in data){
var $tr = $(document.createElement('tr'));
$tr.appendTo($table);
for(var j in data[i]){
               var $td = $(document.createElement('td'));
               $td.text(data[i][j]);
               $td.appendTo($tr);
}
}
 
           
        })
    </script>
</head>
<body>
    <form name="form1" method="get" action="">
    <div id="test"></div>
    <input type="button" value="mybtn" id="btn1"/>
    </form>
</body>
</html>