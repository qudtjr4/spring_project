<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>

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
	​-webkit-text-stroke-width: 1px;
}
</style>


<!-- 장소 상세페이지 start blog Section -->
<section id="blg_sec">
	<div class="container">
		<div class="row">
			<div class="title_sec">
				<h1>${PlaceVO.plc_name}</h1>
				<h2>${PlaceVO.plc_hashtag}</h2>
			</div>
			

			<div class="col-lg-8 col-md-8 col-sm-8 col-xs8 ">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<!-- Wrapper for slides -->
					<!-- 슬라이드 이미지 -->
					<div class="carousel-inner">
						<c:forEach items="${listImage}" var="ImageVO">
							<div class="item mySlides">
								<img 
									src="/displayFile?fileName=${ImageVO.img_name}"
									alt="Norway" style="width:100%;height:600px">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 정보 게시판 -->
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs4 ">
			
			<c:if test="${sessionScope.login.mem_id == 'admin'}">
			<div>
				<button type="button" class="btn btn-primary" id="btnModify">수정</button>
				<button type="button" class="btn btn-danger" id="btnDelete">삭제 </button>
			</div>
			</c:if>
			
			<div class="post_content"><p>${PlaceVO.plc_info}</p></div>
				<table class="table table-hover">
					<tr>
						<th>별점</th>
						<td>
							<c:choose>
								<c:when test="${PlaceVO.plc_totalscore == 0}">
									평점없음
								</c:when>
									<c:otherwise>
										<c:forEach begin="1" end="${PlaceVO.plc_totalscore}"
										var="score">
										<a href=""><i class="glyphicon glyphicon-star"></i></a>
									</c:forEach>
								</c:otherwise>
							</c:choose>
								
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${PlaceVO.plc_addr}</td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>${PlaceVO.plc_time}</td>
					</tr>
					<tr>
						<th>전화</th>
						<td>${PlaceVO.plc_tel }</td>
					</tr>
				</table>
				<!-- 카트에 담기 버튼 -->
				<button type="button" class="btn btn-warning" id="btnPrev" >목록으로</button>
				<c:if test="${sessionScope.login.mem_id != null}">
					<button type="button" class="btn btn-primary" id="AddCart">Add Cart</button>
				</c:if>
			</div>
			<!-- 정보 게시판 끝-->
			
			
<!-- slide place 시작 -->
<section id="tm_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>Image</h1>
					<h2>클릭시 화면 크게 보임</h2>
				</div>			
			</div>		
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12">
				<div class="all_team col">
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					
					<c:forEach items="${listImage}" var="ImageVO" varStatus="status">
						<div class="sngl_team">	
	    				 	<img src="/displayFile?fileName=${ImageVO.img_name }" alt="" style="width:100%; height:200px; cursor:pointer" class="w3-hover-opacity" onclick="currentDiv(${status.count})" title="지역명 1">
	     				 	<div class="w3-container w3-white">
	    		   		 	<p><b>Lorem Ipsum</b></p>
				   				</div>					
						</div>					
    		   		</c:forEach>	
				</div>			
			</div>
		</div>
	</div>
</section>
<!-- slide place 끝 -->
			
<!-- 지도 start located map Section -->
<section id="ltd_map_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="map">
					<h1>located THE MAP</h1>
					<div id="slidingDiv">
					<div class="map_area text-">
						<div id="map" style="width:98%;height:300px;"></div><br>
					<button class="btn btn-default" onclick="setBounds()">한눈에 보기</button> 
					</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 지도 End located map  Section -->		
			

			<!-- 댓글 -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
			<div class="text-center" style="background-color: #BDBDBD;">
				<hr>
				<h1>REVIEW</h1>
				<br>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
				<br>
				<!-- 댓글추가하기 버튼 -->
				<button type="button" id="btnAddReview" class="btn btn-block"
					style="background-color: #4C4C4C; color: white;"
					onclick="document.getElementById('modalAddReview').style.display='block'">리뷰등록하기</button>
				<hr>

				<!-- 모달창 -->
				<div id="modalAddReview" class="w3-modal">
					<div class="w3-modal-content w3-card-4 w3-animate-zoom"
						style="max-width: 600px">

						<div class="w3-center">
							<br> <span
								onclick="document.getElementById('modalAddReview').style.display='none'"
								class="w3-button w3-xlarge w3-hover-red w3-display-topright"
								title="Close Modal">&times;</span>
						</div>

						<form class="w3-container" role="form"
							action="/place/AddPlaceReview" method="post">
							<div
								class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
								<h4>${sessionScope.login.mem_id}님,반갑습니다.</h4>
								<h5>리뷰를 작성해주세요.</h5>
								<hr>
								<input type="hidden" name="mem_id" name="mem_id" value="${sessionScope.login.mem_id}"> 
								<input type="hidden" name="loc_no" value="${PlaceVO.loc_no}">
								<input type="hidden" name="plc_no" name="plc_no" value="${PlaceVO.plc_no}">
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
									<label for="rev_content">한줄평</label>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
									<input class="w3-input w3-border w3-margin-bottom" type="text"
										placeholder="한줄평" name="rev_content" required>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
									<label for="plc_days">별점</label>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
										<input type="radio" name="rev_score" id="rev_score" value="1"><br>★
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
										<input type="radio" name="rev_score" id="rev_score" value="2">★★
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
										<input type="radio" name="rev_score" id="rev_score" value="3">★★★
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
										<input type="radio" name="rev_score" id="rev_score" value="4">★★★★
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
										<input type="radio" name="rev_score" id="rev_score" value="5"><br>★★★★★
									</div>
								</div>
								<div
									class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
									<hr>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center">
										<button
											class="w3-button w3-block w3-black w3-section w3-padding"
											type="submit">등록하기</button>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center">
										<button
											onclick="document.getElementById('modalAddReview').style.display='none'"
											type="button"
											class="w3-button w3-block w3-black w3-section w3-padding">취소</button>
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>

				<!-- 모달창 -->

			</div>
			
			<div>
				<c:forEach items="${listReview}" var="Plc_ReviewVO">
					<div class="author_info col-lg-12 col-md-12 col-sm-12 col-xs12" style="display:inline-block">
					
						<img src="/displayFile?fileName=${Plc_ReviewVO.mem_img}" style="width:100px;height:100px" class="img-circle" alt="" />
						<div class="author_dec">
							<ul class="social_link">
								<c:forEach begin="1" end="${Plc_ReviewVO.rev_score}"
									var="score">
									<li><a href=""><i class="glyphicon glyphicon-star"></i></a></li>
								</c:forEach>
							</ul>
							<h3>${Plc_ReviewVO.mem_id}
								<small> | ${Plc_ReviewVO.rev_time}</small>
							</h3>
							<p>${Plc_ReviewVO.rev_content}</p>
							<input type="hidden" name="rev_no" id="rev_no" value="${Plc_ReviewVO.rev_no }">
							<input type="hidden" name="rev_score" id="rev_score" value="${Theme_ReviewDTO.rev_score}">
							<input type="hidden" name="mem_id" id="mem_id" value="${Theme_ReviewDTO.mem_id}">
							<c:if test="${Plc_ReviewVO.mem_id == sessionScope.login.mem_id || sessionScope.login.mem_id == 'admin'}">
							<div class="text-right" id="replyModify">
								<Button type="submit" class="btn" onclick="document.getElementById('modalModifyReview').style.display='block'">수정/삭제</Button>
							</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 댓글 -->
		</div>
	</div>
	</div>
</section>
<!-- 장소 상세페이지 끝 end Blog Section -->

<!-- 댓글 수정 모달창 -->
<div id="modalModifyReview" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('modalModifyReview').style.display='none'"
					class="w3-button w3-xlarge w3-hover-red w3-display-topright"
					title="Close Modal">&times;</span>
			</div>
			<form class="w3-container" role="form" action="/place/reviewModify" method="post">
				<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center" >
					<h4><span id="rev_mem_id1"></span> 님, 반갑습니다.</h4><h5> 리뷰를 수정해주세요.</h5><hr>
<%-- 					<input type="hidden" name="page" id="page" value="${pageMaker.cri.page}"> --%>
					<input type="hidden" name="mem_id" id="rev_mem_id" >
					<input type="hidden" name="rev_no" id="rev_rev_no" >
					<input type="hidden" name="plc_no" id="rev_plc_no" >
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
					<label for="rev_content">한줄평</label>
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
					<input
						class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="한줄평" name="rev_content" id="rev_rev_content" required>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
					<label for="cour_days">별점</label>
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
						<input type="radio" name="rev_score" id="rev_score1" value="1"><br>★
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
						<input type="radio" name="rev_score" id="rev_score2" value="2">★★ 
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
						<input type="radio" name="rev_score" id="rev_score3" value="3">★★★
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
						<input type="radio" name="rev_score" id="rev_score4" value="4">★★★★
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
						<input type="radio" name="rev_score" id="rev_score5" value="5"><br>★★★★★
						</div>
					</div>
					<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
					<div class="modal-footer">
						<input type="hidden" name="loc_no" value="${PlaceVO.loc_no}">
						<button type="submit" class="btn btn-info" >Modify</button>
						<button type="button" class="btn btn-danger"  id="modalBtnDelete">Delete</button>
						<button type="button" class="btn btn-default" id="modalBtnClose">Close</button>
					</div>
					</div>
	 
				</div>
			</form>
		</div>
	</div>

<!-- 댓글 수정 모달창 -->



<script>

$(document).ready(function(){
	$('#btnPrev').click(function(){
		location.href="/place/location?loc_no=${PlaceVO.loc_no}&page=${cri.page}&plc_category="
	});
	
	
	//카트에 담기
	$('#AddCart').click(function(){
		location.href = "/place/addCart?plc_no=${PlaceVO.plc_no}&loc_no=${PlaceVO.loc_no}"
	});
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert('카트에 담았습니다.');
	} else if (result == 'FAIL') {
		alert('이미 추가되어있는 장소입니다.')
	}
	
	
	
	
	// place 수정
	$('#btnModify').click(function(){
		location.href = "/place/placeModify?plc_no=${PlaceVO.plc_no}&loc_no=${PlaceVO.loc_no}";
	});
	
	// place 삭제
	$('#btnDelete').click(function(){
		location.href = "/place/remove?plc_no=${PlaceVO.plc_no}&loc_no=${PlaceVO.loc_no}&plc_category=${PlaceVO.plc_category}&page=${cri.page}";
	});

 $('#replyModify .btn').click(function(e) {
	 e.preventDefault();
	// 리뷰 수정하기 모달열기
	
		console.log("클릭됨")
		var rev_no = $(this).parent('div').parent('div').find('#rev_no').val();
		console.log("rev_no : " + rev_no );
		
		$.ajax({
			'type' : 'get',
			'url' : '/place/reviewModify/' + rev_no,
			'headers' : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'get'
			},
			'dataType' : 'json',
			'success' : function(result) {
				
				$('#rev_mem_id1').text(result.mem_id);
				$('#rev_mem_id').val(result.mem_id);

				console.log("rev_no : " + result.rev_no);
				$('#rev_rev_no').val(result.rev_no);
				$('#rev_plc_no').val(result.plc_no);
				console.log("plc_no : " + result.plc_no);
				console.log("rev_content : " + result.rev_content);
				$('#rev_rev_content').val(result.rev_content);
				console.log("rev_score : " + result.rev_score);
				if(result.rev_score == 1){
					$('#rev_score1').attr('checked', '=checked');
				}else if(result.rev_score == 2){
					$('#rev_score2').attr('checked', '=checked');
				}else if(result.rev_score == 3){
					$('#rev_score3').attr('checked', '=checked');
				}else if(result.rev_score == 4){
					$('#rev_score4').attr('checked', '=checked');
				}else if(result.rev_score == 5){
					$('#rev_score5').attr('checked', '=checked');
				}
			}
		});
	 });
//리뷰 삭제하기
	$('#modalBtnDelete').click(function(){
		var plc_no = $(this).parent('div').parent('div').parent('div').find('#rev_plc_no').val();
		var rev_no = $(this).parent('div').parent('div').parent('div').find('#rev_rev_no').val();
//		console.log("plc_no : " + plc_no );
//		console.log("rev_no : " + rev_no );
		var url = '/place/deletePlaceReview/' + rev_no +"/" + plc_no ;
		$.ajax({
			'type' : 'delete',
			'url' : url,
			'headers' : {
				'content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'delete'
			},
			'success' : function(result) {
				if (result == 'SUCCESS') {
					alert('삭제 되었습니다.');
					document.getElementById('modalModifyReview').style.display='none';
					location.href = '/place/placeDetail/?plc_no=' + plc_no + '&loc_no='+ ${PlaceVO.loc_no};
				} else {
					alert('삭제에 실패하였습니다.');
				}
			}
		});
	});
	
	// 리뷰 수정/삭제 취소하기
	$('#modalBtnClose').click(function(){
		document.getElementById('modalModifyReview').style.display='none';
	});

});
</script>

<script>
// Slideshow Place Images
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>
<!-- ===================MAP======================= -->

<script src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990"></script>
<script>
 var plcMap = ${plcMap};
console.log(plcMap);

//==============MAP=============
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(0, 0), // 지도의 중심좌표
        level: 0, // 지도의 확대 레벨
        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
    }; 
// 지도를 생성한다 
var map = new daum.maps.Map(mapContainer, mapOption); 
// 지도에 마커를 생성하고 표시한다

	var map
	var marker = new daum.maps.Marker({
	   	 position: new daum.maps.LatLng( plcMap.plc_map_x , plcMap.plc_map_y), // 마커의 좌표
	   	 map: map // 마커를 표시할 지도 객체
	
    
		});
	var infowindow = new daum.maps.InfoWindow({
 	   content : '<div style="padding:3px;" class="text-center"> 장소 이름 | '+plcMap.plc_name+'</div>' // 인포윈도우에 표시할 내용
	});
infowindow.open(map, marker);






// 지도 중심좌표 / 확대레벨 비율 조절
var point = new daum.maps.LatLng(plcMap.plc_map_x, plcMap.plc_map_y);

console.log("point : " + point);

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds();    

var i;

    bounds.extend(point);


function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
setBounds();
//==============MAP=============

</script> 

<script>
$('#map').on('scroll touchmove mousewheel', function(event) {						
	event.preventDefault();	
	event.stopPropagation();	
				
	return false;	
});	
</script>

<!-- ===================MAP======================= -->


<script>
$('#map').on('scroll touchmove mousewheel', function(event) {						
	event.preventDefault();	
	event.stopPropagation();	
				
	return false;	
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
