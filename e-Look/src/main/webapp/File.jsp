<%@ page contentType="text/html;charset=Big5" language="java" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<% 
// 宣告將上傳之檔案放置到伺服器的 / .... /upload 目錄中 
String saveDirectory = "c:\\"; 
// 宣告暫存目錄 
String tmpDirectory = "c:\\"; 
// 宣告限制上傳之檔案總大小為, 單位為 byte, -1 表示無限制 
int maxPostSize = 1024 * 1024; 
%> 
<% 
// 宣告儲存敘述上傳檔案內容的變數 
String FileDescription = null; 
// 宣告儲存上傳檔案名稱的變數 
String FileName = null; 
// 宣告儲存上傳檔案大小的變數 
long FileSize = 0; 
// 宣告儲存上傳檔案型態的變數 
String ContentType = null; 
// 計算上傳檔案之個數 
int count = 0 ; 
%> 
<% 
DiskFileUpload upload = new DiskFileUpload(); 
// 設定記憶體存放資料的大小, 超過則寫入檔案, 有設定暫存目錄, 暫存檔置於暫存目錄下 
upload.setSizeThreshold(4096); 
// 設定總上傳大小限制 
upload.setSizeMax(maxPostSize); 
// 設定暫存目錄 
upload.setRepositoryPath(tmpDirectory); 
List /* FileItem */ items = upload.parseRequest(request); 
%> 
<body> 
<% 
Iterator iter = items.iterator(); 
int tmp = 0; 
FileItem tmpItem = null; 
while (iter.hasNext()) { 
tmp++; 
FileItem item = (FileItem) iter.next(); 
if (item.isFormField()) { 
// 如果是一般欄位, 取得檔案敘述 
FileDescription = item.getString(); 
} else { 
// 否則取得檔案資訊 
FileName = item.getName(); 
// 因為不同的瀏覽器會造成傳遞 path + filename, 有些則只有 filename 
try { 
// for wintel platform 
FileName = FileName.substring(FileName.lastIndexOf("\\")+1); 
// for unix-like platform 
FileName = FileName.substring(FileName.lastIndexOf("/")+1); 
} catch ( Exception ex ) { 
out.println(ex); 
} 
ContentType = item.getContentType(); 
FileSize = item.getSize(); 
tmpItem = item; 
} 
// 因為一個檔案都是兩個欄位, 每讀取兩個欄位處理一次 
if (tmp == 2 && FileSize != 0) { 
count ++; 
%> 
<font color="red">你上傳的第<%= count %>個的檔案：</font><br> 
檔案名稱為：<%= FileName %><br> 
檔案大小為：<%= FileSize %> Bytes<br> 
檔案型態為：<%= ContentType %><br> 
檔案的敘述：<%= FileDescription %><br><br> 
<% 
// 將檔案寫入存檔目錄 
try { 
out.println(FileName); 
File uploadedFile = new File(saveDirectory + FileName); 
tmpItem.write(uploadedFile); 
} catch ( Exception ex ) { 
out.println(ex); 
} 
tmp = 0; 
} else if (tmp == 2 && FileSize == 0) { 
tmp = 0; 
} // end if 
} // end while 
%> 
您總共上傳<font color="red"><%= count %></font>個檔案 
</body> 
</html>