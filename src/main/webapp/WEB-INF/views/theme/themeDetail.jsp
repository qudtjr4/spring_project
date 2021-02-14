<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>
	<section>
		<div>
			<div>
				<div>----------------------------------------------</div>
				<div>----------------------------------------------</div>
				<div>----------------------------------------------</div>
			</div>
		</div>
	</section>

<!-- 테마 추천수 등등 -->
	<!-- start Counting section-->
	<section id="counting_sec">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="counting_sl">
						<i class="fa fa-user"></i>
						<h2 class="counter">${vo.recomand }</h2>
						<h4>추천수</h4>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="counting_sl">
						<i class="fa fa-desktop"></i>
						<h2 class="counter">20</h2>
						<h4>댓글수</h4>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="counting_sl">
						<i class="fa fa-clock-o"></i>
						<h2 class="counter">${vo.viewcount}</h2>
						<h4>조회수</h4>
					</div>

				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="counting_sl">
						<h2 class="">
					
							<c:choose>
								<c:when test="${vo.theme_totalscore < 1}">
											☆☆☆☆☆
										</c:when>
								<c:when
									test="${vo.theme_totalscore < 2 && vo.theme_totalscore >= 1}">
											★☆☆☆☆
										</c:when>
								<c:when
									test="${vo.theme_totalscore < 3 && vo.theme_totalscore >= 2}">
											★★☆☆☆
										</c:when>
								<c:when
									test="${vo.theme_totalscore < 4 && vo.theme_totalscore >= 3}">
											★★★☆☆
										</c:when>
								<c:when
									test="${vo.theme_totalscore < 5 && vo.theme_totalscore >= 4}">
											★★★★☆
										</c:when>
								<c:otherwise>
											★★★★★										
										</c:otherwise>
							</c:choose>
						</h2>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	


	<!-- start Latest post Section -->
	<section id="lts_sec">
		<div class="container">
			<div class="row">

<!-- 테마 정보 -->	
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
					<div class="title_sec">
						<h1>${vo.theme_title}</h1>
						<h2>${vo.theme_content}</h2>
						<h2>${vo.theme_hashtag}</h2>
						<!-- 아이디 세션 값 주기 -->
						<c:if test="${vo.mem_id == sessionScope.login.mem_id || sessionScope.login.mem_id == 'admin'}">
						<div>
							<form role="form" method="post" action="/theme/themeModify">
							<input type="hidden" name="mem_id" value="${vo.mem_id}">
							<input type="hidden" name="theme_no" value="${vo.theme_no}">
							<input type="hidden" name="theme_title" value="${vo.theme_title}">
							<input type="hidden" name="theme_content" value="${vo.theme_content}">
							<input type="hidden" name="theme_hashtag" value="${vo.theme_hashtag}">						
							<input type="hidden" name="theme_img" value="${vo.theme_img}">
<!-- 테마 수정삭제 버튼 -->							
							<button id="themeModify" type="submit" class="btn pricing_btn">수정</button>
							<button id="themeDelete" type="button" class="btn pricing_btn">삭제</button>
							</form>
						</div>
						</c:if>
					</div>
				</div>
<!-- 테마에 등록된 장소들 -->
				<c:forEach items="${plcList}" var="PlaceVO">
					<div class="col-lg-4 col-md-4 col-sm-12">
						<div class="lts_pst">
							
							<img style="width: 380px; height : 300px;"
								src="/displayFile?fileName=${PlaceVO.plc_img}"
								alt="" />
							<h2>${PlaceVO.plc_name}</h2>
							<h2>${PlaceVO.plc_category}</h2>
							<p class="ellipsis-multi">${PlaceVO.plc_info}</p>
							<a href="/place/placeDetail?loc_no=${PlaceVO.loc_no}&plc_no=${PlaceVO.plc_no}">자세히 보기 <i
								class="fa fa-long-arrow-right"></i></a>
						</div>
					</div>
				</c:forEach>
				
<!-- start located map Section -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
				<div class="map col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">						
				<h1 style="color:black">located THE MAP</h1><br>
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

<!-- End located map  Section -->
					
					
					<div class="skills progress-bar1">
						<ul class="col-md-12 col-sm-12 col-xs-12 wow fadeInRight">
						
<!-- 작성자 정보 -->						
						<div class="author_info col-md-4 col-sm-4 col-xs-4">
						<img 
							src=<c:choose>
								<c:when test="${MemberVO.mem_img == null}">
								"/resources/img/admin.jpg"
								</c:when>
								<c:otherwise>
								"/displayFile?fileName=${MemberVO.mem_img}"
								</c:otherwise>
							</c:choose>
							style="width:100px; height:100px" alt="" />
						<div class="author_dec">
							<ul class="social_link">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-instagram"></i></a></li>
								<li><a href=""><i class="fa fa-google"></i></a></li>
							</ul>
							<h3>|작성자|</h3>
							<h3>${vo.mem_id}</h3>
						</div>
					</div>
						
						
<!-- 추천하기 버튼 -->						
							<li class="progress col-md-8 col-sm-8 col-xs-8 w3-margin-top">
								<div class="progress-bar" data-width="${recomand}">${recomand}%
									추천</div>
							</li>
						
						
						<div id="recommandBtn" class="btn pricing_btn">
							<span>추천하기</span></a>
						</div>
						<div class="btn pricing_btn">
							<a
								href="theme?page=${cri.page}&keyword=${cri.keyword}&lineUp=${cri.lineUp}"
								><span>돌아가기</span></a>
						</div>
						</ul>
						
						<input type="hidden" id="page" value="${page}" />
					</div>
				
				
					
					
				</div>


<!-- 댓글 -->

			<div class="text-center" style="background-color: ##fff;">
				<hr>
				<h1>REVIEW</h1>
				<br>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
				<br>
				<!-- 댓글추가하기 버튼 -->
				<button type="button" id="btnAddReview" class="btn btn-block"
					style="background-color: #36BFF3; color: white;">리뷰등록하기</button>
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

						<form class="w3-container" role="form" action="/theme/addTheme_Review"
							method="post">
							<div
								class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
								<h4 id="mem_id">${sessionScope.login.mem_id}님,반갑습니다.</h4>
								<h5>테마리뷰를 작성해주세요.</h5>
								<hr>
								<input type="hidden" name="mem_id"
									value="${sessionScope.login.mem_id}"> <input type="hidden"
								 name="theme_no" value="${vo.theme_no}">
								<input type="hidden" name="page" value="${cri.page}"> <input
									type="hidden" name="keyword" value="${cri.keyword}"> <input
									type="hidden" name="lineUp" value="${cri.lineUp}">
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs2 text-center">
									<label for="rev_content">한줄평</label>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs10 text-center">
									<input class="w3-input w3-border w3-margin-bottom" id="rev_content" type="text"
										placeholder="한줄평" name="rev_content" required>
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
										<input type="radio" name="rev_score" id="rev_score" value="5" ><br>★★★★★
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
				
				
				
<!-- 댓글 수정 모달창 -->
	<div id="modalModifyReview" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('modalModifyReview').style.display='none'"
					class="w3-button w3-xlarge w3-hover-red w3-display-topright"
					title="Close Modal">&times;</span>
			</div>
			<form class="w3-container" role="form" action="/theme/theme_ReviewModify" method="post">
				<div class="w3-section col-lg-12 col-md-12 col-sm-12 col-xs12 text-center" >
					<h4><span id="rev_mem_id"></span>${sessionScope.login.mem_id}님, 반갑습니다.</h4><h5> 테마리뷰를 수정해주세요.</h5><hr>
					<input type="hidden" name="mem_id" id="rev_mem_id" value = "${sessionScope.login.mem_id}" >
					<input type="hidden" name="rev_no" id="rev_rev_no" >
					<input type="hidden" name="theme_no" id="rev_theme_no" >
					<input type="hidden" name="page" value="${cri.page }" >
					<input type="hidden" name="keyword" value="${cri.keyword }" >
					<input type="hidden" name="lineUp" value="${cri.lineUp }" >
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
<!-- 댓글 리스트 -->
			</div>
			<div>

				<c:forEach items="${revList}" var="Theme_ReviewDTO">

					<div class="author_info col-lg-12 col-md-12 col-sm-12 col-xs12" style="display:inline-block">
						
						<img style="width:100px; height:100px"
							src="/displayFile?fileName=${Theme_ReviewDTO.mem_img }"
							class="img-circle" alt="" />
						<div class="author_dec">
							<ul class="social_link">
								<c:forEach begin="1" end="${Theme_ReviewDTO.rev_score}"
									var="score">
									<li><a href=""><i class="glyphicon glyphicon-star"></i></a></li>
								</c:forEach>
							</ul>
							<h3>${Theme_ReviewDTO.mem_id}
								<small> | ${Theme_ReviewDTO.rev_time}</small>
							</h3>
							<p>${Theme_ReviewDTO.rev_content}</p>
							<input type="hidden" id="rev_no" name="rev_no" value="${Theme_ReviewDTO.rev_no}">
							<input type="hidden" name="rev_score" id="rev_score" value="${Theme_ReviewDTO.rev_score}">
							<input type="hidden" name="mem_id" id="mem_id" value="${Theme_ReviewDTO.mem_id}">
							
							<c:if test="${Theme_ReviewDTO.mem_id == sessionScope.login.mem_id || sessionScope.login.mem_id == 'admin'}">
							<div class="text-right" id="revModify">
								<Button type="button" class="btn btn btn-warning" onclick="document.getElementById('modalModifyReview').style.display='block'">수정/삭제</Button>
							</div>	
							</c:if>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<!-- End Latest post Section -->



<%@ include file="../include/footer.jsp" %>


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
	<!-- MAP -->
<script src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990"></script>
<script>

// 지도 스크립트 부분 
 
var plcMapList = ${plcMapList};
console.log(plcMapList);

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
for (var i = 0; i < plcMapList.length; i++){


	var map
	var marker = new daum.maps.Marker({
	   	 position: new daum.maps.LatLng( plcMapList[i].plc_map_x , plcMapList[i].plc_map_y), // 마커의 좌표
	   	 map: map // 마커를 표시할 지도 객체
	
    
		});
	var infowindow = new daum.maps.InfoWindow({
 	   content : '<div style="padding:3px;" class="text-center">'+ (i+1) + ' 번째 장소 |'+plcMapList[i].plc_name+'</div>' // 인포윈도우에 표시할 내용
	});
infowindow.open(map, marker);

}




// 지도 중심좌표 / 확대레벨 비율 조절
var points = [];
for (var i = 0; i < plcMapList.length; i++) {
	points.push(new daum.maps.LatLng(plcMapList[i].plc_map_x, plcMapList[i].plc_map_y) );
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
	<script>
//추천하기 버튼 클릭 후 rttr 
		var result = '${msg}';
		if (result == 'SUCCESS') {
			alert('추천되었습니다.');
		} else if (result == 'FALSE') {
			alert('추천은 한번만 가능합니다.')
		}
	</script>
	
	<script src="/resources/js/main.js"></script>

	<script src="/resources/js/showHide.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
//테마삭제			
			$('#themeDelete').click(function(){
				location.href = "/theme/themeDelete?theme_no=${vo.theme_no}"
				
				
			});
//테마추천하기			
			$('#recommandBtn').click(function(){
				if('${sessionScope.login.mem_id}' != ''){
					location.href = "/theme/themeDetailRecomand?theme_no=${vo.theme_no}&page=${cri.page}&keyword=${cri.keyword}&lineUp=${cri.lineUp}"
							
				}else{
					document.getElementById('id01').style.display='block';
					
				}
				
				
				
			})

// 리뷰 수정하기 모달열기
			$('#revModify .btn').click(function() {
				
				var rev_no = $(this).parent('div').parent('div').find('#rev_no').val();
				console.log("rev_no : " + rev_no );
				
				$.ajax({
					'type' : 'get',
					'url' : '/theme/reviewModify/' + rev_no,
					'headers' : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'get'
					},
					'dataType' : 'json',
					'success' : function(result) {
						//console.log("mem_id : " + result.mem_id);
						$('#rev_mem_id').val(result.mem_id);
						//console.log("rev_no : " + result.rev_no);
						$('#rev_rev_no').val(result.rev_no);
						$('#rev_theme_no').val(result.theme_no);
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
				var theme_no = $(this).parent('div').parent('div').parent('div').find('#rev_theme_no').val();
				var rev_no = $(this).parent('div').parent('div').parent('div').find('#rev_rev_no').val();
				console.log("theme_no : " + theme_no );
				console.log("rev_no : " + rev_no );
				var url = '/theme/deleteTheme_Review/' + rev_no + '/' + theme_no;
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
							location.href = 
								'/theme/themeDetail?page=${cri.page}&keyword=${cri.keyword}&lineUp=${cri.page}&theme_no='+theme_no;
							
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
			
			$('#btnAddReview').click(function(e){
				e.preventDefault();
				if('${sessionScope.login.mem_id}' != ''){
					document.getElementById('modalAddReview').style.display='block';
					}else{
					document.getElementById('id01').style.display='block';
					
					}
			});
			
			
			
			
			
			$('.show_hide').showHide({
				speed : 1000, // speed you want the toggle to happen	
				easing : '', // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
				changeText : 1, // if you dont want the button text to change, set this to 0
				showText : 'View',// the button text to show when a div is closed
				hideText : 'Close' // the button text to show when a div is open

			});
			
			/* $('#reviewModify').click(function(){
				var data = {
						'rev_no' : 1
				}
				
				console.log('data', data);
				
				$.get('/theme_ReviewModify', data, function (result) {
					console.log("result: " + result);
				});
			}); */
			/* 
			$('#reviewModify .btn').click(function(e){
				e.preventDefault();
				
				var rev_no = $(this).parent('div').find('#rev_no').val();
				
				console.log('rev_no' + rev_no);
				$.ajax({
					'type' : 'get',
					'url' : '/reviewModify/' +rev_no,
					'headers' : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'get'
					},
					'success' : function(result) {
						console.log(result);
						$('#mem_id2').text(result.mem_id+'님, 반갑습니다.');
						$('#mem_id3').attr('value', result.mem_id);
						$('#rev_content2').attr('value', result.rev_content);
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
				
			}) */
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
