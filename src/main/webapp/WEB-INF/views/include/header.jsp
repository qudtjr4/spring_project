<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Travel Plan</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<script src="/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.none{display:none}
#ticker2{float:left;width:40px;}
.navi2{float:right;}
.block2 {border:1px solid #000000; padding:0 px; height:30px; overflow:hidden; background:#fff; width:350px; font-family:Gulim; font-size:16px;float:right;}
.block2 ul,
.block2 li {margin:0; padding:0; list-style:none;}
.block2 li a {display:block; height:30px; line-height:30px; color:#555; text-decoration:none;}
</style>

<style>
.none{display:none}
#ticker1{float:left;width:40px;}
.navi{float:right;}
.block {border:1px solid #000000; padding:0 px; height:30px; overflow:hidden; background:#fff; width:350px; font-family:Gulim; font-size:16px;float:right;}
.block ul,
.block li {margin:0; padding:0; list-style:none;}
.block li a {display:block;  height:30px; line-height:30px; color:#555; text-decoration:none;}
</style>

<style>
.ellipsis-multi {
  width:300px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3; /* 라인수 */
  -webkit-box-orient: vertical;
  word-wrap:break-word; 
  line-height: 1.2em;
  height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
}
.ellipsis-mono {
  width:300px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1; /* 라인수 */
  -webkit-box-orient: vertical;
  word-wrap:break-word; 
  line-height: 1.2em;
  height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
}
</style>

</head>
<body>
	<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}" />
	<!-- start preloader -->
	<div id="loader-wrapper">
		<div class="logo"></div>
		<div id="loader"></div>
	</div>
	<!-- end preloader -->
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->


	<!-- Start Header Section -->
	<header class="main_menu_sec navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12">
					<a href="/"><img src="/resources/img/logo_1.png" style="width:131.25px; height:83.44px;"alt="" /></a>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12">
					<div class="rgt_hd">
						<div class="main_menu">
							<nav id="nav_menu">
								<button aria-controls="navbar" aria-expanded="false"
									data-target="#navbar" data-toggle="collapse"
									class="navbar-toggle collapsed" type="button">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<div id="navbar">
									<ul>
										<li><a class="page-scroll" href="/">Home</a></li>
										<li><a href="#">location <i class="fa fa-angle-down"></i></a>
											<ul>
												<c:forEach items="${locationList}" var="locationVO">
													<li><a class="page-scroll" href="/place/location?loc_no=${locationVO.loc_no}&page=1&plc_category=">${locationVO.loc_name}</a></li>
												</c:forEach>
											</ul>
										<li><a class="page-scroll" href="/course/main?page=1">Course</a></li>
										<li><a class="page-scroll" href="/theme/theme?page=1&lineUp=&keyword=">Thema</a></li>

										<c:choose>
											<c:when test="${sessionScope.login.mem_id != null}">
												<li><a class="page-scroll"
													href="/login/myPage">MyPage</a></li>
												
												<input type="hidden" name="addr" id="addr" value=""/>
												<li id="logoutBtn"><a class="page-scroll" style="cursor:pointer">Logout</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="page-scroll" style="cursor:pointer" id="modalController"
													onclick="document.getElementById('id01').style.display='block'">Login</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
									<div id="id01" class="w3-modal">
										<div class="w3-modal-content w3-card-4 w3-animate-zoom"
											style="max-width: 400px"> 

											<div class="w3-center">
												<br> <span
													onclick="document.getElementById('id01').style.display='none'"
													class="w3-button w3-xlarge w3-hover-red w3-display-topright"
													title="Close Modal">&times;</span> <img
													src="/resources/img/lock_image.png" alt="Avatar"
													style="width: 150px" class="w3-circle w3-margin-top">
											</div>
											
											<form id="loginDialog" class="w3-container" action="/login/loginRun" method="post">
												<input type="hidden" id="addr" name="addr" value=""/>
												<div class="w3-section">
												
													<label><b>아이디</b></label> <input
														class="w3-input w3-border w3-margin-bottom" type="text"
														placeholder="Enter Username" name="mem_id" 
														<c:if test="${cookie.isUseCookie.value == 'true'}">
															value="${cookie.mem_id.value}"
														</c:if>
														required>
													<label><b>비밀번호</b></label> <input
														class="w3-input w3-border" type="password"
														placeholder="Enter Password" name="mem_pw" required>

													<button id="loginBtn"
														class="w3-button w3-block w3-black w3-section w3-padding"
														type="submit">로그인</button>
													
													<button
														onclick="document.getElementById('id01').style.display='none'"
														type="button"
														class="w3-button w3-block w3-black w3-section w3-padding">취소</button>

														<div id="failMessage" style="display:none;">
															<p style="color:red;">아이디/비밀번호가 틀렸습니다.</p>
														</div>
														
													<input class="w3-check" type="checkbox" name="useCookie"
														<c:if test="${cookie.isUseCookie.value == 'true'}">
													
														checked="checked"
														
														</c:if> /> 아이디 저장
														
													<div style="float:right">
														<a href="/login/find">비밀번호 찾기 </a>/
														<a href="/login/joinForm">회원가입</a>  
													</div>
												</div> 
											</form>
												
<!-- 											<div -->
<!-- 												class="w3-container w3-border-top w3-padding-16 w3-light-grey"> -->
<!-- 												<span class="w3-right w3-padding w3-hide-small">  -->
<!-- 												<a href="/login/joinForm">회원가입</a> 	 -->
<!-- 												</span> -->
<!-- 											</div> -->

										</div>
									</div>
								</div>
							</nav>
						</div>
						<form id="logoutForm" method="post" action="/login/logout">
							<input type="hidden" name="addr1" id="addr1" value=""/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- End Header Section -->
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script>
	$(document).ready(function(){
		
			
// 			$('#loginBtn').click(function(e){
// 				e.preventDefault();
// 				alert('블라인드 처리 되었습니다. 문의사항은 travelline606@gmail.com')
// 			})
		
		
			$('#loginDialog').submit(function(e){
				e.preventDefault();
				var that = $(this);
				$('#addr').attr('value', location.href);
				console.log($('#addr').attr('value'));
				
				that.get(0).submit();
			});
		
			$('#logoutBtn').click(function(e){
				e.preventDefault();
				var that = $('#logoutForm');
				console.log(location.href);
				$('#addr1').attr('value', location.href);
				console.log($('#addr1').attr('value'));
				
				that.get(0).submit();
				//
			}); 
			
		});
	</script>
	