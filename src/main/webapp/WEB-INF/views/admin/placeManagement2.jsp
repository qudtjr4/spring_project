<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/myPageHeader.jsp"%>

<style>
.td_sytle {
	backgroud-color: red;
}

#fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #eeeeee;
	margin: 0 auto;
}

#fileDrop2 {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #eeeeee;
	margin: 0 auto;
}
#uploadedList > div {
	float : left;
	margin : 10px;
}

</style>

<!-- Header -->
  <header id="MyCourse">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1><b>장소 등록</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      
      <button class="w3-button w3-white" onclick="location.href='/admin/locationManagement'"><i class="fa fa-photo w3-margin-right"></i>지역 관리</button>
      <button class="w3-button w3-white w3-hide-small" onclick="location.href='/admin/placeManagement1'"><i class="fa fa-photo w3-margin-right"></i>상세장소</button>
      <button class="w3-button w3-white" onclick="location.href='/course/add'"><i class="fa fa-diamond w3-margin-right"></i>코스추가</button>
      <button class="w3-button w3-white w3-hide-small" onclick="location.href='/theme/themeRegist'"><i class="fa fa-diamond w3-margin-right"></i>테마추가</button>
      <button class="w3-button w3-white w3-hide-small"  onclick="location.href='/admin/adminUserSearch'"><i class="fa fa-user fa-fw w3-margin-right"></i>유저리스트</button>
    </div>
    </div>
  </header>


<!-- place 관리 페이지 -->
<section id="protfolio_sec">
	<div class="container" >
		<div class="row">
			<div class="title_sec">
				<h1>상세장소 관리 페이지</h1>
			</div>
			<div class="title_sec">
				<h4>${loc_info.loc_name}</h4>
				<small>${loc_info.loc_info}</small>
			</div>

 <!-- 지역 게시판 -->
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
						<input type="hidden" name="loc_no_v" value="${loc_info.loc_no}">
						<a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=&page=1">All</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${loc_info.loc_no}">
						<a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=숙박&page=1">숙박</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${loc_info.loc_no}">
						<a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=명소&page=1">명소</a></li>
						<li >
						<input type="hidden" name="loc_no_v" value="${loc_info.loc_no}">
						<a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=맛집&page=1">맛집</a></li>
					</ul>
				</div>
 
 
 			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>장소 사진</th>
							<th>장소 이름</th>
							<th>장소 카테고리</th>
						</tr>
					<thead>
						<c:forEach items="${plcVO}" var="PlaceVO">
							<tr>
								<td>
									<img style="height:150px; width: 150px;" src="/displayFile?fileName=${PlaceVO.plc_img}">
								</td>
								<td class="td_sytle">
									<a href="/place/placeDetail?plc_no=${PlaceVO.plc_no}&loc_no=${PlaceVO.loc_no}">
										${PlaceVO.plc_name} 
									</a>
								</td>
								<td>
									${PlaceVO.plc_category}
								</td>
							</tr>
						</c:forEach>
				</table>
				<!-- 장소 등록 폼으로 -->
				<button type="button" class="btn btn-primary" id="btnPlcRegist" onclick="location.href='/admin/placeInput'"> 장소 등록 </button>		

				<!-- 페이징 -->													
				<div class="row">										
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">	
						<ul class="pagination">								
							<c:if test="${pageMaker.prev}">
							<li><a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=${plc_category}&page=${pageMaker.cri.page-1 }">Prev</a></li>							
							</c:if>			
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li><a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=${plc_category}&page=${idx }">${idx}</a></li>
								</c:forEach>				
													
							<c:if test="${pageMaker.next}">						
							<li><a href="/admin/placeManagement2?loc_no=${loc_info.loc_no}&plc_category=${plc_category}&page=${pageMaker.cri.page+1 }">Next</a></li>
							</c:if>							
						</ul>								
					</div>									
				</div>										
				<!-- 페이징 -->		
				</div>

<!-- 지역 게시판 끝-->
		</div>
		<%@ include file="../include/myPageFooter.jsp"%>
	</div>
</section>


<script src="/resources/js/upload.js"></script>


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
