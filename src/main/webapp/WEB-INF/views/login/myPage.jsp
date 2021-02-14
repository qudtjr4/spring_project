<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="apple-touch-icon" href="apple-touch-icon.png">
<!--[if lt IE 9]> <script src="js/html5shiv.js"></script> 
	<script src="js/respond.min.js"></script> <![endif]-->
<!-- Place favicon.ico in the root directory -->
<link href='https://fonts.googleapis.com/css?family=Lato:400,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/css/normalize.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.css">
<link rel="stylesheet" href="/resources/css/responsive.css">
<link rel="stylesheet" href="/resources/css/style.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../include/header.jsp" %> 
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}



</style>





<br><br><br>
<body class="w3-light-grey w3-content" style="max-width:1600px">
<dis class= container>

<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <a href=""><img src="/displayFile?fileName=${MemberVO.mem_img}" style="width:45%;"></a><br><br>
    <h4><b>My Page</b></h4>
    <p class="w3-text-grey">${MemberVO.mem_name} 님 반갑습니다.</p>
  </div>
  <div class="w3-bar-block">
    <a href="/login/myPage" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Course</a> 
    <a href="/login/myCart" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Cart</a> 
    <a href="/login/myInfo" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>My Information</a> 
  
  <c:choose>
		<c:when test= "${sessionScope.login.mem_id == 'admin'}">
	    <a href="/admin/locationManagement" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>Admin Page</a> 
					</c:when>
		<c:otherwise>
			<br>
		</c:otherwise>
	</c:choose>
  
  
  </div>
   <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity" onclick="location.href='https://www.facebook.com/'"style="cursor:pointer"></i>
    <i class="fa fa-instagram w3-hover-opacity" onclick="location.href='https://www.instagram.com/'"style="cursor:pointer"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity" onclick="location.href='https://twitter.com/?lang=ko'"style="cursor:pointer"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header id="MyCourse">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1><b>My Course</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      <button class="w3-button w3-white" onclick="location.href='/login/myPage'"><i class="fa fa-diamond w3-margin-right"></i>코스별</button>
      <button class="w3-button  w3-hide-small w3-white" onclick="location.href='/login/myPage2'"><i class="fa fa-photo w3-margin-right"></i>테마별</button>
      <button class="w3-button  w3-hide-small w3-khaki " onclick="location.href='/course/add';" >
      <i class="fa fa-map-pin w3-margin-right"></i>코스등록하기</button>
      <button class="w3-button  w3-hide-small w3-khaki " onclick="location.href='/theme/themeRegist';" >
      <i class="fa fa-map-pin w3-margin-right"></i>테마등록하기</button>
   
   
    </div>
    </div>
    
  </header>
  
  
  
  
	  <!-- start slider Section -->
		<div class="container">
			<div class="row">
				<div class="slider">
					
	
	
					  <a class="left left_crousel_btn" href="#carousel-example-generic" role="button" data-slide="prev">
						<i class="fa fa-angle-left"></i>
						<span class="sr-only">Previous</span>
					  </a>
					  <a class="right right_crousel_btn" href="#carousel-example-generic" role="button" data-slide="next">
						<i class="fa fa-angle-right"></i>
						<span class="sr-only">Next</span>
					  </a>
		
				</div>	
			</div>			
		</div>	
	<!-- End slider Section -->
  
  
  


<!-- start our team Section -->
<section id="tm_sec">
	<div class="container">
		<div class="row">
		
			<c:forEach items="${CourseList}" var="CourseDTO" >
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
				
					<h1><a href="/course/detail?cour_no=${CourseDTO.cour_no}&page=1">${CourseDTO.cour_title}<span style="color:red" >(클릭)</span></a></h1>
				</div>			
			</div>		
			
			
			
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12">
				<div class="all_team">
					<c:forEach items="${CourseDTO.listMap}" var="map" begin="0" varStatus="status" end="${CourseDTO.listMap.size()}">
					
					<div class="sngl_team">			
					<img src="/displayFile?fileName=${map.get("plc_img")}" alt="Norway" style="width:277px; height:250px;cursor:pointer" 
							class="w3-hover-opacity" >			
						<div class="w3-container w3-white">
	    		   		 <p><b>${map.get("plc_name")}</b></p>
 			   			</div>							
					</div>					
				
									
					</c:forEach>
				</div>			
			</div>
			</c:forEach>
			
			
		</div>
	</div>
</section>
<!-- End our team Section -->









<%@ include file="../include/footer.jsp" %>
</div>


<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="/resources/js/vendor/jquery-1.11.3.min.js"></script>

<script src="/resources/js/isotope.pkgd.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/appear.js"></script>
<script src="/resources/js/jquery.counterup.min.js"></script>
<script src="/resources/js/waypoints.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/showHide.js"></script>
<script src="/resources/js/jquery.nicescroll.min.js"></script>
<script src="/resources/js/jquery.easing.min.js"></script>
<script src="/resources/js/scrolling-nav.js"></script>
<script src="/resources/js/plugins.js"></script>
<script src="/resources/js/main.js"></script>

<script src="/resources/js/showHide.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){


   $('.show_hide').showHide({			 
		speed: 1000,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open
					 
	}); 


});

</script>
<script>
    jQuery(document).ready(function( $ ) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    });
</script>

<script>

  //Hide Overflow of Body on DOM Ready //
$(document).ready(function(){
    $("body").css("overflow", "hidden");
});

// Show Overflow of Body when Everything has Loaded 
$(window).load(function(){
    $("body").css("overflow", "visible");        
    var nice=$('html').niceScroll({
	cursorborder:"5",
	cursorcolor:"#00AFF0",
	cursorwidth:"3px",
	boxzoom:true, 
	autohidemode:true
	});

});
</script>




</body>
</html>
