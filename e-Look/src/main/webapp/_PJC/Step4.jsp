<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<meta charset="utf-8" />
    <script>
        function test() {
            //var v = this.querySelector("input").value;
            var v = document.querySelector("#div1 input:focus").value;
            if (v === "pay" || v === "free") {
                //document.getElementById("div2").style = "background-color:#E0E0E0";
                document.querySelectorAll("#div2 input").forEach(function (el) {
                    el.setAttribute("readonly", "readonly");
                    el.style = "opacity: 0.4";
                })
                    
               // document.querySelector("#div2 input")
            } else if (v === "raise") {
                //document.getElementById("div2").style = "background-color:none";
        
                document.querySelectorAll("#div2 input").forEach(function (el) {
                    el.removeAttribute("readonly");
                    el.style = "opacity: 1";
                })
            }
           
            
            //alert(v);
        }
        document.addEventListener("DOMContentLoaded", function () {
            year();
            month();
            day();
        });
        function year() {
            
          
            var x = new Date().getFullYear();
            console.log(x);
            for (i = x ; i <=x+5; i++) {

                var opt = document.createElement("option");
                opt.setAttribute("value", i);
                var optTxt = document.createTextNode(i);
                opt.appendChild(optTxt);
                document.getElementById("se1").appendChild(opt);
            }
            document.getElementById("se1").addEventListener("change", day);
            document.getElementById("se1").addEventListener("change", month);
            //   document.getElementById("se1").addEventListener("change", print);

        }
        function month() {
        //    if (this.value == new Date().getFullYear()) {
           
        //}else{
        //        var x = 1;
        //    }
            var x = new Date().getMonth() + 1;
            console.log(x);
            document.getElementById("se2").innerHTML = "";
            for (i = 1; i <= 12; i++) {
                var opt = document.createElement("option");
                opt.setAttribute("value", i);
                var optTxt = document.createTextNode(i);
                opt.appendChild(optTxt);
                document.getElementById("se2").appendChild(opt);
            }
            document.getElementById("se2").addEventListener("change", day);
         //   document.getElementById("se2").addEventListener("change", print);
        }
        function day() {
            var y = parseInt(document.getElementById("se1").value);
            var m = parseInt(document.getElementById("se2").value);
            var d = new Date().getDate();
            var d2 = new Date(y, m, 0).getDate();
            document.getElementById("se3").innerHTML = "";
            for (i = 1; i <= d2; i++) {
                var opt = document.createElement("option");
                opt.setAttribute("value", i);
                var optTxt = document.createTextNode(i);
                opt.appendChild(optTxt);
                document.getElementById("se3").appendChild(opt);
            }
         //   document.getElementById("se3").addEventListener("change", print);
        }
    </script>
    <style>
   
    </style>
</head>
<body>
    <form>
        <div id="div1" onchange="test()">
            <input type="radio" name="class" value="pay" /><label>付費課程</label><br>

            <input type="radio" name="class" value="free"/><label>免費課程</label><br>
            
            <input type="radio" name="class" value="raise" /><label>我要先透過募資，看人數再決定是否要開課</label>
        </div>
        <div>
            <label>付費課程</label>
            <input type="text" name="class" value=""  width="20"/><label>元</label>
        </div>
        <div >
            <label>開課門檻人數</label>
            <input type="text" name="class" value="" width="20" /><label>元</label><br>
            <label>募資期間</label><br>
            <label>募資起始日期：</label>
                <select id="se1"></select><label>年</label>
                <select id="se2"></select><label>月</label>
                <select id="se3"></select><label>日</label>
        </div>

        <div id="div2">
            <input type="text" name="class" value="" width="20"  /><label></label><br>
            <input type="text" name="class" value="" width="20" /><label></label><br>
            <input type="text" name="class" value="" width="20" /><label></label><br>
        </div>
    </form>
</body>
</html>