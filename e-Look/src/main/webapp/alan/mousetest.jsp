<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>按鈕滑鼠經過變色</title>
<style type="text/css">
.over {color:yellow; background: navy}
.down {color:yellow; background: navy; font-style: italic}
</style>
</head>
<body>
<!-- onMouseUp="this.className='over';"  -->
<!-- onMouseOut="this.className='';"  -->
<input type="Button"
onMouseOver="this.className='over';" 

onMouseDown="this.className='down';" 

value="按我!!" 
onClick="this.value='被按了！'" name="Button"> 
</body>
</html>