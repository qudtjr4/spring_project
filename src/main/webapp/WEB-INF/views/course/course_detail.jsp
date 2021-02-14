
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>

<!-- 타이틀 -->
<section id="blg_sec">
	<div class="container">
		<div class="row">
			<div class="title_sec" >
			<hr><br>
				<span class="label label-default" style="margin : 3px;">
					<c:choose>
					<c:when test="${(courseVO.cour_days).equals('4')}">
					장기코스
					</c:when>
					<c:otherwise>
					${courseVO.cour_days}일 코스
					</c:otherwise>
					</c:choose>
				</span>
				<c:choose>
					<c:when test="${courseVO.cour_totalscore == 0}">
					<span class="label label-danger" id="cour_totalscore" style="margin : 3px;">평점 없음</span>
					</c:when>
					<c:otherwise>
					<span class="label label-danger" id="cour_totalscore" style="margin : 3px;"> 평점 | 
						<c:forEach begin="1" end="${courseVO.cour_totalscore}">
						★
						</c:forEach>
					</span>
					</c:otherwise>
				</c:choose>
				<h1>${courseVO.cour_title}</h1><small> BY ${courseVO.mem_id}</small>
				<h2>${courseVO.cour_hashtag}</h2>
			</div>
			
			<!-- 코스전체 -->	
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs2">
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs8">
				<hr>
				<div class="all_team">
					<c:forEach items="${listPlace}" var="PlaceVO">
					<div class="sngl_team">						
						<a href="#img1"><img style="width:130px ; height:130px" src="/displayFile?fileName=${PlaceVO.plc_img}"/></a>						
					</div>	
					</c:forEach>								
				</div><hr>	
			</div>
		</div>
		
	<!-- 코스 세부 -->
	<div class="text-center" style="background-color: #333;"><hr><h1 style="color: #ffffff">DETAIL</h1><br></div>
	<div id="protfolio_sec" class="col-lg-12 col-md-12 col-sm-12 col-xs12">
	<div class="container">
		<div class="row">
		<c:forEach items="${listPlace}" var="PlaceVO">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12" style="margin: 30px">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs3 text-center">
					<img style="width:250px ; height:220px" id="img1" class="img-circle col-lg-12 col-md-12 col-sm-12 col-xs12" src="/displayFile?fileName=${PlaceVO.plc_img}" alt=""/>	
				</div>
				<div class="col-lg-9 col-md-9 col-sm-9 col-xs9 text-left">
					<h2>${PlaceVO.plc_name}<small> | ${PlaceVO.plc_category} | ${PlaceVO.plc_addr}</small></h2><br>
					<div style="margin-right: 50px;">${PlaceVO.plc_info}</div>
					<a href="/place/placeDetail?loc_no=${PlaceVO.loc_no}&plc_no=${PlaceVO.plc_no}">Read more <i class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>

<!-- map -->
<section id="ltd_map_sec">
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
			<div class="map col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">						
			<h1>located THE MAP</h1><br>
			<div id="slidingDiv">
				<div class="map_area text-">
					<div id="map" style="width:98%;height:300px;"></div><br>
				<button class="btn btn-default" onclick="setBounds()">전체 코스 한눈에 보기</button> 
				</div>
			</div>	
			</div>
		</div>
	</div>
</div>
</section>
<!-- map -->
<!-- 코스 수정/삭제 버튼 -->
<c:if test="${courseVO.mem_id == sessionScope.login.mem_id || sessionScope.login.mem_id == 'admin'}">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center">
<button type="button" class="btn btn-primary btn-block w3-margin-top" onclick="location.href='/course/modify?cour_no=${courseVO.cour_no}'">코스 수정하기</button>
</div>

<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center ">
<button type="button" class="btn btn-danger btn-block w3-margin-top" onclick="location.href='/course/delete?mem_id=${courseVO.mem_id}&cour_no=${courseVO.cour_no}'">코스 삭제하기</button>
</div>
<br><hr>
</c:if>

<!-- 코스 수정/삭제 버튼 -->
<!-- 댓글 -->
	
	<div class="text-center" style="background-color:#BDBDBD;"><hr><h1>REVIEW</h1><br></div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center"><br>
	<!-- 댓글추가하기 버튼 -->
	<button type="button" id="btnAddReview" class="btn btn-block" style="background-color: #4C4C4C; color: white;">리뷰등록하기</button>
	<hr>
	
<!-- 댓글 추가 모달창 -->
	<div id="modalAddReview" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('modalAddReview').style.display='none'"
					class="w3-button w3-xlarge w3-hover-red w3-display-topright"
					title="Close Modal">&times;</span>
			</div>
			<form class="w3-container" role="form" action="/course/AddCourseReview" method="post">
				<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center" >
					<h4>${sessionScope.login.mem_id}님, 반갑습니다.</h4><h5> 코스리뷰를 작성해주세요.</h5><hr>
					<input type="hidden" name="page" id="page" value="${pageMaker.cri.page}">
					<input type="hidden" name="mem_id" id="mem_id" value="${sessionScope.login.mem_id}">
					<input type="hidden" name="cour_no" id="cour_no" value="${courseVO.cour_no}">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
					<label for="rev_content">한줄평</label>
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
					<input
						class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="한줄평" name="rev_content" id="revcontent" required>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
					<label for="cour_days">별점</label>
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
					<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center"><hr>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center">
						<button class="w3-button w3-block w3-black w3-section w3-padding" type="submit">등록하기</button>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 text-center">
						<button onclick="document.getElementById('modalAddReview').style.display='none'"
						type="button" class="w3-button w3-block w3-black w3-section w3-padding">취소</button>
					</div>
					</div>
	 
				</div>
			</form>
		</div>
	</div>
<!-- 댓글 추가 모달창 -->

<!-- 댓글 수정 모달창 -->
<div id="modalModifyReview" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('modalModifyReview').style.display='none'"
					class="w3-button w3-xlarge w3-hover-red w3-display-topright"
					title="Close Modal">&times;</span>
			</div>
			<form class="w3-container" role="form" action="/course/ModifyCourseReview" method="post">
				<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center" >
					<h4><span id="rev_mem_id_1"></span> 님, 반갑습니다.</h4><h5> 코스리뷰를 수정해주세요.</h5><hr>
					<input type="hidden" name="page" id="page" value="${pageMaker.cri.page}">
					<input type="hidden" name="mem_id" id="rev_mem_id" >
					<input type="hidden" name="rev_no" id="rev_rev_no" >
					<input type="hidden" name="cour_no" id="rev_cour_no" >
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

<div id="#modifyReview"></div>
	
	</div>
	<!-- 댓글 -->
	<div>
<c:forEach items="${listReview}" var="cour_reviewVO">
	<div class="author_info col-lg-12 col-md-12 col-sm-12 col-xs12 " style="display:inline-block">
		<img src="/displayFile?fileName=${cour_reviewVO.mem_img}" style="width:100px; height:100px" class="img-circle" alt=""/>
			<div class="author_dec">
				<ul class="social_link">
					<c:forEach begin="1" end="${cour_reviewVO.rev_score}" var="score">
					<li><a href=""><i class="glyphicon glyphicon-star"></i></a></li>
					</c:forEach>
				</ul>
				<input type="hidden" name="rev_no" id="rev_no" value="${cour_reviewVO.rev_no}">
				<input type="hidden" name="rev_score" id="rev_score" value="${cour_reviewVO.rev_score}">
				<input type="hidden" name="mem_id" id="mem_id" value="${cour_reviewVO.mem_id}">
			<h3>${cour_reviewVO.mem_id} <small> | ${cour_reviewVO.rev_time}</small></h3>
			<p id="rev_content">${cour_reviewVO.rev_content}</p>	
			
			<c:if test="${cour_reviewVO.mem_id == sessionScope.login.mem_id || sessionScope.login.mem_id == 'admin'}">		
			<div class="text-right" id="revModify">
				<Button type="button" class="btn btn btn-warning" onclick="document.getElementById('modalModifyReview').style.display='block'">수정/삭제</Button>
			</div>				
			</c:if>	
		
		</div>
	</div>
</c:forEach>
	</div>
	<!-- 댓글 -->
	<!-- 댓글페이징 -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
					<li>
						<a href="/course/detail?cour_no=${courseVO.cour_no}&page=${pageMaker.cri.page - 1}">Prev</a>
					</li>
					</c:if>
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li>
						<a href="/course/detail?cour_no=${courseVO.cour_no}&page=${idx}">${idx}</a>
					</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
					<li>
						<a href="/course/detail?cour_no=${courseVO.cour_no}&page=${pageMaker.cri.page + 1}">Next</a>
					</li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 페이징 -->
	</div>
</section>





<%@ include file="../include/footer.jsp" %>

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


<!-- MAP -->
<script src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990"></script>
<script>

var listPointX = ${listPointX};
var listPointY = ${listPointY};
var listPlaceSize = ${listPlaceSize};
var listPlcName = ${listPlcName};


console.log("listPointX[0] : " + listPointX[0]);
console.log("listPointY : " + listPointY);
console.log("listPlaceSize : " + listPlaceSize);
console.log("listPlcName : " + listPlcName);

// ==============MAP=============
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(0, 0), // 지도의 중심좌표
	        level: 0, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption); 
	// 지도에 마커를 생성하고 표시한다
for (var i = 0; i < listPlaceSize; i++) {
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(listPointX[i], listPointY[i]), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});
	var infowindow = new daum.maps.InfoWindow({
	    content : '<div style="padding:3px;" class="text-center">'+ (i+1) + ' 번째 장소 | '+ listPlcName[i]+'</div>' // 인포윈도우에 표시할 내용
	});
	infowindow.open(map, marker);
}

 // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
    var colorList = ['#CC3D3D','#CC723D','#CCA63D','#47C83E','#4374D9', '#002a9e','#8041D9'];
	var x = 0;	
			 for (var i = 0; i < listPlaceSize-1; i++) {
 				if(i > 0 && (i%7) == 0){
					var x = 1;
				}else{
					x++;
				};
				console.log(x);
		 	var polyline = new daum.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path:[ // 선을 구성하는 좌표 배열
					new daum.maps.LatLng(listPointX[i], listPointY[i]),
					new daum.maps.LatLng(listPointX[i+1], listPointY[i+1])
				],
				strokeWeight: 2, // 선의 두께
				strokeColor: colorList[x-1], // 선 색
				strokeOpacity: 0.9, // 선 투명도
				strokeStyle: 'solid' // 선 스타일
			});
	}
    // 지도 중심좌표 / 확대레벨 비율 조절
	var points = [];
	for (var i = 0; i < listPlaceSize; i++) {
		points.push(new daum.maps.LatLng(listPointX[i], listPointY[i]));
	}
	console.log("points : " + points);
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new daum.maps.LatLngBounds();    

	var i;
	for (i = 0; i < points.length; i++) {
	    bounds.extend(points[i]);
	}

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
$(document).ready(function() {
	//댓글추가하기 버튼
	$('#btnAddReview').click(function(e){
		e.preventDefault();
		if('${sessionScope.login.mem_id}' != ''){
			document.getElementById('modalAddReview').style.display='block';
		}else{
			document.getElementById('id01').style.display='block';
			
		}
		
	})
	
	
	// 리뷰 수정하기 모달열기
	$('#revModify .btn').click(function() {
		
		var rev_no = $(this).parent('div').parent('div').find('#rev_no').val();
		//console.log("rev_no : " + rev_no );
		
		$.ajax({
			'type' : 'get',
			'url' : '/course/reviewModify/' + rev_no,
			'headers' : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'get'
			},
			'dataType' : 'json',
			'success' : function(result) {
				//console.log("mem_id : " + result.mem_id);
				$('#rev_mem_id_1').text(result.mem_id);
				$('#rev_mem_id').val(result.mem_id);
				//console.log("rev_no : " + result.rev_no);
				$('#rev_rev_no').val(result.rev_no);
				$('#rev_cour_no').val(result.cour_no);
				//console.log("cour_no : " + result.cour_no);
				//console.log("rev_content : " + result.rev_content);
				$('#rev_rev_content').val(result.rev_content);
				//console.log("rev_score : " + result.rev_score);
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
	
	// 리뷰 삭제하기
	$('#modalBtnDelete').click(function(){
		var cour_no = $(this).parent('div').parent('div').parent('div').find('#rev_cour_no').val();
		var rev_no = $(this).parent('div').parent('div').parent('div').find('#rev_rev_no').val();
		//console.log("cour_no : " + cour_no );
		//console.log("rev_no : " + rev_no );
		var url = '/course/deleteCourseReview/' + rev_no + '/' + cour_no;
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
					location.href = '/course/detail/?cour_no=' + cour_no + '&page=1';
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