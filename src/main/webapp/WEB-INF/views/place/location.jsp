<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>
.single-portfolio {
	background: no-repeat;
}

.imgText {
	position: absolute;
	top: 0px;
	left: 1px;
	background: #000000;
	opacity: 0.7;
	text-align: center;
	color: #ffffff;
	width: 270px;
	height: 270px;
}

.imgText h1,small{
	padding-top: 35%;
	color: white;
}

.single-portfolio:hover .imgText {
	opacity: 0;
	text-align: center;

}

/*CSS:지역사진/이름/정보*/
.slidesImage {
	background: no-repeat;
}

.slidesImagetext {
	position: absolute;
	background: #000000;
	text-align: center;
	color: #ffffff;
	padding: 30px;
	border-top: 1px solid #000000;
    border-bottom: 1px solid #000000;
    display: inline;
    opacity: 0.8;
	top: 190px;
	left: 155px;
}

.slidesImagetext h1{
	text-align: center;
	padding-top: 10%;
	font-size: 70px;
	color: white;
}

.slidesImagetext h6{
	text-align: left;
	padding-top: 18%;
	padding-left: 5%;
	font-size: 15px;
	color: #EAEAEA;
	line-height:150%;
	
}
/*CSS:지역사진/이름/정보*/

.sngl_team {
	background: no-repeat;
}

.sngl_index {
	position: absolute;
	text-align: center;
	color: #ffffff;
    opacity: 1;
	top: 0px;
	left: 0px;
}


.sngl_index span {
	text-align: left;
	font-size: 13px;
	color: #EAEAEA;
	line-height:150%;
	margin-left: 0px;
} 

/* 랜덤테마 정보 스타일 */
.random_theme {
	background: no-repeat;
}

.random_text {
	position: absolute;
	top: 100px;
	left: 15px;
	background: #000000;
	opacity: 0.7;
	text-align: center;
	width: 1140px;
	height: 300px;
}
/* 여기어때?*/
.random_theme h4 { 
 	position: absolute; 
 	top: 60px; 
 	text-align: center; 
	font-weight: bolder;
 	width: 1140px; 
 	color: #f98d8d;

 } 

 .random_theme h3 { 
 	position: absolute; 
 	top: 100px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 .random_theme h5 { 
 	position: absolute; 
 	top: 140px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 .random_theme h6 { 
 	position: absolute; 
 	top: 170px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 /* 랜덤테마 정보 스타일 끝 */

</style>

<!-- 슬라이드 부분 start slider Section -->
<section id="slider_sec"  style="background-color: #353638; background-image: url('../resources/img/mainImg.jpg');'">
	<div class="container">
		<div class="row">
			<div class="slider">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->


				
		<!-- 지역사진/이름/정보 -->
			<!-- Wrapper for slides -->
				  <div style="margin-top: -40px" class="carousel-inner" role="listbox">

					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel slidesImage" style="">
							 <!-- <a href="/resources/img/blg.jpg" class="portfolio-popup" title="Project Title"> -->
                                <img src="/displayFile?fileName=${locationInfo.loc_img}" style="width: 860px; height: 460px;"  alt="">
                                <div class="slidesImagetext" style="width: 300px; height: 460px;">
                                	<h1>${locationInfo.loc_name}</h1>
                                	<h6>${locationInfo.loc_info}</h6>
                                </div>
                            </a>
						  </div>						
						</div>
					</div>
				  
				  </div>
<!-- 지역사진/이름/정보 -->				
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 슬라이드 부분  End slider Section -->


<!-- 지역 상세 부분 start portfolio Section -->

<section id="protfolio_sec">
	<div class="container">
		<div class="row">


			<!-- 베스트 카테고리 start our team Section -->
			<section id="tm_sec">
				<div class="container">
					<div class="row">
						<!-- 데이터 값이 있을때 보여주기 -->
						<c:if test="${!bestStay.isEmpty()}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
								<div class="title_sec">
									<h1>BEST 숙박</h1>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12">
								<div class="all_team">
									<c:forEach items="${bestStay}" var="PlaceVO" varStatus="status">
										<div class="sngl_team">
											<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no }&loc_no=${PlaceVO.loc_no}">
											
											<img style="width:277px; height:200px;" src="/displayFile?fileName=${PlaceVO.plc_img}" alt="" />
											<div class="sngl_index">
											<span class="label label-primary">숙박 ${status.count}위</span>
											</div>
											<h3>
												${PlaceVO.plc_name } 
											</h3>
											<p>${PlaceVO.plc_hashtag}</p>
											<h3>
											<c:choose>
													<c:when test="${PlaceVO.plc_totalscore == 0}">
														<span class="label label-default" style="color:white;"> 
 														평점없음
														</span>
													</c:when>
														<c:otherwise>
														<span class="label label-default" style="color:white;"> 평점 | 
															<c:forEach begin="1" end="${PlaceVO.plc_totalscore}" var="score">
															★
															</c:forEach>
														</span>
													</c:otherwise>
												</c:choose>
											</h3>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>

						<c:if test="${!bestAttraction.isEmpty()}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
								<div class="title_sec">
									<h1>BEST 명소</h1>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12">
								<div class="all_team">
									<c:forEach items="${bestAttraction}" var="PlaceVO" varStatus="status">
										<div class="sngl_team">
											<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no }&loc_no=${PlaceVO.loc_no}">
											<img style="width:277px; height:200px;" src="/displayFile?fileName=${PlaceVO.plc_img }" alt="" />
											<div class="sngl_index">
											<span class="label label-success">명소 ${status.count}위</span>
											</div>
											<h3>
												${PlaceVO.plc_name } 
											</h3>
											<p>${PlaceVO.plc_hashtag}</p>
											<h3>
											<c:choose>
													<c:when test="${PlaceVO.plc_totalscore == 0}">
														<span class="label label-default" style="color:white;">
 														평점없음
														</span>
													</c:when>
														<c:otherwise>
														<span class="label label-default" style="color:white;"> 평점 | 
															<c:forEach begin="1" end="${PlaceVO.plc_totalscore}" var="score">
															★
															</c:forEach>
														</span>
													</c:otherwise>
												</c:choose>
											</h3>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>

						<c:if test="${!bestRestaurant.isEmpty()}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
								<div class="title_sec">
									<h1>BEST 맛집</h1>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs12">
								<div class="all_team">
									<c:forEach items="${bestRestaurant }" var="PlaceVO" varStatus="status">
										<div class="sngl_team">
											<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no }&loc_no=${PlaceVO.loc_no}">
											<img style="width:277px; height:200px;" src="/displayFile?fileName=${PlaceVO.plc_img }" alt="" />
											<div class="sngl_index">
											<span class="label label-danger">맛집 ${status.count}위</span>
											</div>
											<h3>
												${PlaceVO.plc_name }
											</h3>
											<p>${PlaceVO.plc_hashtag}</p>
											<h3>
												<c:choose>
													<c:when test="${PlaceVO.plc_totalscore == 0}">
														<span class="label label-default" style="color:white;">
 														평점없음
														</span>
													</c:when>
														<c:otherwise>
														<span class="label label-default" style="color:white;"> 평점 | 
															<c:forEach begin="1" end="${PlaceVO.plc_totalscore}" var="score">
															★
															</c:forEach>
														</span>
													</c:otherwise>
												</c:choose>
											</h3>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</section>
			<!-- 베스트 카테고리 End our team Section -->


			<div class="col-lg-12">
				<div class="portfolio-filter text-uppercase text-center">
					<!-- <ul class="filter">
						<li class="active" data-filter="*">All</li>
						<li data-filter=".숙박">숙박</li>
						<li data-filter=".명소">명소</li>
						<li data-filter=".맛집">맛집</li>
					</ul> -->
					<ul class="filter">
						<li >
						<input type="hidden" name="loc_no_v" value="${locationInfo.loc_no}">
						<a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=&page=1">All</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${locationInfo.loc_no}">
						<a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=숙박&page=1">숙박</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${locationInfo.loc_no}">
						<a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=명소&page=1">명소</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${locationInfo.loc_no}">
						<a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=맛집&page=1">맛집</a></li>
					</ul>
				</div>

				<div class="all-portfolios">
					<c:forEach items="${placeList}" var="PlaceVO" >
						<div class="col-sm-12  col-lg-12 col-md-12 col-xs-12 ">

							<div class="single-portfolio ${PlaceVO.plc_category }" >
								<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no }&loc_no=${PlaceVO.loc_no}"> 
									<img style="width:270px; height:270px;" class="img-responsive"
									src="/displayFile?fileName=${PlaceVO.plc_img }"
									alt="">
									<div class="imgText">
										<h1>${PlaceVO.plc_name }</h1>
										<small>${PlaceVO.plc_hashtag}</small>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 페이징 -->													
			<div class="row">										
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">	
					<ul class="pagination">								
						<c:if test="${pageMaker.prev}">
						<li><a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=${plc_category}&page=${pageMaker.cri.page-1 }">Prev</a></li>							
						</c:if>			
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li><a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=${plc_category}&page=${idx }">${idx}</a></li>
							</c:forEach>				
												
						<c:if test="${pageMaker.next}">						
						<li><a href="/place/location?loc_no=${locationInfo.loc_no}&plc_category=${plc_category}&page=${pageMaker.cri.page+1 }">Next</a></li>
						</c:if>							
				</ul>								
				</div>									
			</div>										
			<!-- 페이징 -->										
		</div>
	</div>
</section>
<!-- 지역 상세 부분 끝 End Portfolio Section -->

<!-- 랜덤 테마 Section -->
<section style="background-color: #353638; height: 400px; ">
	<div class="container">
		<div class="row">
			<div class="slider">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
<!-- 				  Indicators -->
<!-- 				  <ol class="carousel-indicators"> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 				  </ol> -->





	 			   <!-- Wrapper for slides -->
	 <div style="margin-top: -45px" class="carousel-inner" role="listbox">
		 <c:forEach items="${locationList}" var="LocationVO" varStatus="status">
		      	 <c:choose>
	      			<c:when test="${status.count == 1}">
					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel random_theme" style="">
							 <a href="/place/location??loc_no=${LocationVO.loc_no}&page=1&plc_category=" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${LocationVO.loc_img}" style="width:1140px; height:300px; margin-top: -90px;"  alt="">
                                <div class="random_text" style="width:1140px;height:300px;">
                                	<h4>여기어때?</h4>
                                	<h3>${LocationVO.loc_name}</h3>
                                </div>
                            </a>
						  </div>						
						</div>
					</div>
					</c:when>
			 
				   <c:otherwise>
				     <div class="item">
				       <div class="wrap_caption">
						  <div class="caption_carousel random_theme" style="">
							 <a href="/place/location??loc_no=${LocationVO.loc_no}&page=1&plc_category=" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${LocationVO.loc_img}" style="width:1140px;height:300px; margin-top: -90px;"  alt="">
                                <div class="random_text" style="width:1140px;height:300px;">
                                	<h4>여기어때?</h4>
                                	<h3>${LocationVO.loc_name}</h3>
                                </div>
                            </a>
						  </div>						
						</div>
				      </div> 
				      </c:otherwise>
				      </c:choose>
				</c:forEach>
								
				  </div> 
			
				</div>
			</div>	
		</div>			
	</div>	
</section>
<!-- 랜덤 테마 Section 끝 -->




<%@ include file="../include/footer.jsp"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
<!-- Google Map js -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script>
	function initialize() {
		var mapOptions = {
			zoom : 14,
			scrollwheel : false,
			center : new google.maps.LatLng(41.092586000000000000,
					-75.592688599999970000)
		};
		var map = new google.maps.Map(document.getElementById('googleMap'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : map.getCenter(),
			animation : google.maps.Animation.BOUNCE,
			icon : '/resources/img/map-marker.png',
			map : map
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script src="/resources/js/main.js"></script>

<script src="/resources/js/showHide.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('.show_hide').showHide({
			speed : 1000, // speed you want the toggle to happen	
			easing : '', // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
			changeText : 1, // if you dont want the button text to change, set this to 0
			showText : 'View',// the button text to show when a div is closed
			hideText : 'Close' // the button text to show when a div is open

		});

	});
</script>
<script>
	jQuery(document).ready(function($) {
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
	});
</script>

<script>
	//Hide Overflow of Body on DOM Ready //
	$(document).ready(function() {
		$("body").css("overflow", "hidden");
		
		// --------------------------------------------
		
		
		$('.all-portfolios:nth-child(4n)').css('top', '3px');
	});

	// Show Overflow of Body when Everything has Loaded 
	$(window).load(function() {
		$("body").css("overflow", "visible");
		var nice = $('html').niceScroll({
			cursorborder : "5",
			cursorcolor : "#00AFF0",
			cursorwidth : "3px",
			boxzoom : true,
			autohidemode : true
		});

	});
</script>



</body>
</html>
