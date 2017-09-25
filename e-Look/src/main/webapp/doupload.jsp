<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //把request傳入UploadTool裡
    toolkie.UploadTool upload = new toolkie.UploadTool(request);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
    <table align="center">
<tr><td align="center"><img src="http://localhost:8080/.galleria1.jpg"></td></tr>
<tr><td align="center">測試1</td></tr>
</table>

<%
    //查詢是否錯誤
    String msg = upload.checkUpload();
    if (msg.length() > 0) {
        out.println(msg);
    } else {
        //設定上傳路徑
        upload.setUploadDir(this.getServletContext().getRealPath("."));
        out.println("上傳到此路徑:"
                + this.getServletContext().getRealPath(".") + "<br/>");
        
        //out.println("<img src="+this.getServletContext().getRealPath(".")+">");            
                  
      
       
        //開始上傳
        if (upload.isExtUpload("File1"))
            msg = upload.doUpload(upload.getUploadParameter("File1"));
        
 
        if (msg.length() > 0)
            out.println(msg);
        else
            out.println("上傳成功" + "<br/>");
                
                
                
 
    }
%>
 
</body>
</html>



    upload.setUploadDir(this.getServletContext().getRealPath("/")+"data//");
        out.println("上傳到此路徑:"
                + this.getServletContext().getRealPath("/data") + "<br/>");
