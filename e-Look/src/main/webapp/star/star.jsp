<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
        .s {
            -webkit-filter: grayscale(1); 
        }

        .n {
            -webkit-filter: grayscale(0); 
        }
    </style>
    <script>
        flag = false;
        document.addEventListener("DOMContentLoaded", function () {
            //document.getElementById("idstar1").onmouseover = mouseOver;  
            //document.getElementById("idstar").onmouseout = mouseOut;
            //document.getElementById("idstar1").onclick = click;
            var imgs = document.getElementsByTagName("img");
            var imglen = imgs.length
            for (i = 0; i < imglen; i++) {
                imgs[i].onmouseover = mouseOver;
                imgs[i].onmouseout = mouseOut;
                imgs[i].onclick = click;
            }

        });
        function click() {
            var s=1 ;
                  s++;
                if (s = 2) {
                    flag = true;}
                s--;
            
            //click1();
            document.getElementById("stsrnum").innerHTML = "*****你給" + this.id.substr(6) + "顆星*****";
        }
        function mouseOver() {
            var movein = this.id.substr(6)
            for (i = 1; i <= movein; i++) {
                document.getElementById("idstar"+i).className = "n";
            }
            //document.getElementById(this.id).className = "n";
            document.getElementById("stsrnum").innerHTML = "-----你給" + this.id.substr(6) + "顆星-----";


        }

        function mouseOut() {
            if (!flag) {
                var out = this.id.substr(6)
                for (u = 1; u <= out; u++) {
                    document.getElementById("idstar" + u).className = "s";
                }
                document.getElementById("stsrnum").innerHTML = "";
            }
        }
        function click1() {
            //document.write("你給" + this.id.substr(6) + "顆星");
            //if (!flag1) { flag1 = true;}
            //document.getElementById("stsrnum").innerHTML = "*****你給" + this.id.substr(6) + "顆星*****";
                     
        }


    </script>
</head>
<body>
  <div>
    <img id="idstar1" class="s" src="star.jpg" />
    <img id="idstar2" class="s" src="star.jpg" />
    <img id="idstar3" class="s" src="star.jpg" />
    <img id="idstar4" class="s" src="star.jpg" />
    <img id="idstar5" class="s" src="star.jpg" />
    </div>
    <hr/>
    <div id="stsrnum" style="font-size:3em;color:red"></div>
</body>
</html>