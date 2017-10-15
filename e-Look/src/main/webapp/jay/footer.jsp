<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<script src="<%=request.getContextPath()%>/HeaderCssJs/jquery.js"></script>  
<script
	src="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">  
</head>
<style>
body{
  font-family: 'Raleway', sans-serif;
}

footer{
	background-color:#222222;
    padding: 60px 0px;
    margin-top: 60px;
}

footer ul{
    list-style:none;
    margin:0 auto;
    display:inline-block;
    padding-top:50px;
}

footer ul li{
    float:left;
}

footer ul li a{
	color:#b1aca1;
    padding:20px;
}

footer ul li a:hover{
	color:#7dabdb;
	text-decoration:none;
}

.footer-top2 a{
    display: block;
    color: #FFF;
    background: #333333;
     border-radius: 72px;
    height: 100px;
    width: 100px;
    padding: 43px 0px;
}


.footer-top2{
	padding-bottom:50px;
}

.footer-top2 .fa{
    font-size:18px;
    color: #FFF;
    padding-right:10px;
}

.footer-top a{
    color:#FFF;
    background:#333333; 
    padding: 10px;
}

.footer-top2 .col-lg-2:hover a{
    color:#FFF;
	text-decoration:none;
	background:#7dabdb;
    transition: all 1s ease-in-out;
}

/*  Footer 2 End */

</style>
<body>
<footer style="margin-top:300px;">
        
        <div class="search-text"> 
            <div class="container">
                <div class="row text-center">               
                </div>         
            </div>     
        </div>
        
        <div class="footer-top2"> 
           <div class="container">
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                   <a href="#"><i class="fa fa-facebook fa-2x"></i>Facebook</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                   <a href="#"><i class="fa fa-twitter fa-2x"></i>Twitter</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                   <a href="#"><i class="fa fa-flickr fa-2x"></i>Flickr</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                    <a href="#"><i class="fa fa-tumblr fa-2x"></i>Tumblr</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                    <a href="#"><i class="fa fa-github fa-2x"></i>Github</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
                    <a href="#"><i class="fa fa-google-plus fa-2x"></i>Google</a>
                </div>
           </div> 
        </div>  
        
        <div class="container" style="border-top:1px solid grey;">
            <div class="row text-center">   
                <div class="col-lg-6 col-lg-offset-3">
                      <ul class="menu">
                                 
                             <li>
                                <a href="#">Home</a>
                              </li>
                                   
                              <li>
                                 <a href="#">About</a>
                              </li>
                                   
                              <li>
                                <a href="#">Blog</a>
                              </li>
                                   
                              <li>
                                 <a href="#">Gallery</a>
                              </li>
                                   
                              <li>
                                <a href="#">Contact</a>
                             </li>
                   
                        </ul>
                </div>
            </div>
        </div>
        
    </footer>
    
    
    <div class="copyright">
     <div class="container">
       
         <div class="row text-center">
         	<p>Copyright © 2017 All rights reserved</p>
         </div>
         
 	   </div>
    </div>
    <!-- Footer 2 End -->
    
    
    
</body>
</html>