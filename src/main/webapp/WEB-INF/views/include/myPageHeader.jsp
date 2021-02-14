<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="no-js" lang="">
<title>Travel Plan</title>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}

html, body, h1, h2, h3, h4 {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}

.w3-tag, .fa {
	cursor: pointer
}

.w3-tag {
	height: 15px;
	width: 15px;
	padding: 0;
	margin-top: 6px
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ include file="header.jsp" %>
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
    <a href="/login/myPage" onclick="w3_close()" class="w3-bar-item w3-button w3-padding "><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Course</a> 
    <a href="/login/myCart" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Cart</a> 
    <a href="/login/myInfo" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>My Information</a> 
  
  <c:choose>
		<c:when test= "${sessionScope.login.mem_id == 'admin'}">
	    <a href="/admin/locationManagement" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-user fa-fw w3-margin-right"></i>Admin Page</a> 
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

 