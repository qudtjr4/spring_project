<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>
.td_sytle {
	backgroud-color: red;
}

.img-responsive {
	/* 	boarder: 1px solid; */
	/* 	opacity: 0.6 !important; */
	/* 	filter: alpha(opacity = 50); */
	/* 	onmouseover: opacity:1.0; */
	filter: alpha(opacity = 70);
	opacity: 0.7;
	-webkit-opacity: 0.7;
}

.carousel-caption {
	/* 277 × 277 pixels */
	bottom: 85px;
	color: white;
	-webkit-text-fill-color: white;
	-webkit-text-stroke-color: #353638;
	​ -webkit-text-stroke-width: 1px;
}
</style>

<!-- 슬라이드 부분 start slider Section -->
<section id="slider_sec">
	<div class="container">
		<div class="row">
			<div class="slider">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="wrap_caption">
								<div class="caption_carousel">
									<h1>해운대 · 센텀</h1>
									<p>HAEUNDAE · CENTUM</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="wrap_caption">
								<div class="caption_carousel">
									<h1>해운대 · 센텀</h1>
									<p>HAEUNDAE · CENTUM</p>
								</div>
							</div>
						</div>
						<div class="item ">
							<div class="wrap_caption">
								<div class="caption_carousel">
									<h1>해운대 · 센텀</h1>
									<p>HAEUNDAE · CENTUM</p>
								</div>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left left_crousel_btn" href="#carousel-example-generic"
						role="button" data-slide="prev"> <i class="fa fa-angle-left"></i>
						<span class="sr-only">Previous</span>
					</a> <a class="right right_crousel_btn"
						href="#carousel-example-generic" role="button" data-slide="next">
						<i class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 슬라이드 부분  End slider Section -->




<!-- 장소 List All start blog Section -->

<section id="protfolio_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>해운대 · 센텀</h1>
					<h2>HAEUNDAE · CENTUM</h2>
					<hr>
					<h2>국내 최대의 해수욕장과 세계 최대의 백화점이 위치해 관광, 쇼핑을 한 번에 즈길 수 있는 필수 코스
						1번지예요.</h2>
					<hr>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="portfolio-filter text-uppercase text-center">
					<ul class="filter">
						<li id="stay" data-filter=".숙박">숙박</li>
						<li id="attraction" data-filter=".명소">명소</li>
						<li id="restaurant" data-filter=".맛집">맛집</li>
					</ul>
				</div>
			</div>
			
			<c:forEach items="${placeCategory }" var="PlaceVO">
				<div class="col-lg-4 col-md-4 col-sm-12">
					<div class="lts_pst">
						<img src="${PlaceVO.plc_img }" alt="" />
						<h2>${PlaceVO.plc_name }</h2>
						<p>${PlaceVO.plc_info }</p>
						<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no }">Read more <i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</section>




<!-- 장소 List All 끝 end Blog Section -->

<script>
$(document).ready(function(e){
	
	$('#stay').click(function(e){
		location.href = '/place/placeCategoryList?plc_category='+${PlaceVO.plc_category}
	});
	
	$('#attraction').click(function(e){
		location.href = '/'
	});
	
	$('#restaurant').click(function(e){
		location.href = '/'
	});
});

</script>



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
