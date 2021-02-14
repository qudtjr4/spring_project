<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <h1><b>장소 수정</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      
      <button class="w3-button w3-white" onclick="location.href='/admin/adminPage?mem_id=${MemberVO.mem_id}'"><i class="fa fa-photo w3-margin-right"></i>지역 관리</button>
<%--       <button class="w3-button w3-white" onclick="location.href='locationInput?mem_id=${MemberVO.mem_id}'"><i class="fa fa-photo w3-margin-right"></i>지역추가</button> --%>
      <button class="w3-button w3-white w3-hide-small" onclick="location.href='/admin/placeInput?mem_id=${MemberVO.mem_id}'"><i class="fa fa-photo w3-margin-right"></i>상세장소</button>
      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>코스추가</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-diamond w3-margin-right"></i>테마추가</button>
      <button class="w3-button w3-white w3-hide-small"  onclick="location.href='/admin/adminUserSearch?mem_id=${MemberVO.mem_id}'"><i class="fa fa-user fa-fw w3-margin-right"></i>유저리스트</button>
    </div>
    </div>
  </header>


<!-- place 상세페이지 start blog Section -->
<!-- <section id="blg_sec"> -->
	<div class="container">
		<div class="row">

<form id="" method="post" action="/place/placeModify">
<input type="hidden" name="plc_map_x" id="plc_map_x" value="${plcVO.plc_map_x }">
<input type="hidden" name="plc_map_y" id="plc_map_y" value="${plcVO.plc_map_y }">




			<button type="button" class="btn btn-primary" id="btnPrev"
					onclick="history.back()">돌아가기</button>
				<div class="form-group">
					<h1>
						<label for="location">지역</label>
					</h1>
					<select class="form-control" name="loc_no">
						<c:forEach items="${locationList}" var="locVO">
							<option value="${locVO.loc_no}" >${locVO.loc_name}</option>
						</c:forEach>
					</select>
				</div>

			<div class="form-group">
				<h3><label for="category">카테고리</label></h3>
				<select class="form-control" name="plc_category">
						<option>숙박</option>
						<option>맛집</option>
						<option>명소</option>
				</select>
			</div>
			

			<div class="form-group">
				<h3><label for="locationName">장소 이름</label></h3>
				<input type="text" name="plc_name" class="form-control locationName"
					required="required" value="${plcVO.plc_name }">
				
			</div>

			<div class="form-group">
				<h3><label for="address">주소</label></h3>
				<input type="text" name="plc_addr" class="form-control addr"
					required="required" value="${plcVO.plc_addr }">
			</div>

			<div class="form-group">
				<h3><label for="openTime">영업시간</label></h3>
				<input type="text" name="plc_time" class="form-control openTime"
					required="required" value="${plcVO.plc_time }">
			</div>


			<div class="form-group">
				<h3><label for="tel">전화</label></h3>
				<input type="text" name="plc_tel" class="form-control tel"
					required="required" value="${plcVO.plc_tel }">
			</div>
			
			<div class="form-group">
				<h3><label for="info">정보</label></h3>
				<textarea name="plc_info" class="form-control info" id="info" rows="10">${plcVO.plc_info }</textarea>
			</div>
			
			<div class="form-group">
				<h3><label for="hashTag">해시태그</label></h3>
				<input type="text" name="plc_hashtag" class="form-control hashTag"
					required="required" value="${plcVO.plc_hashtag }">
			</div>

			
			<div class="form-group" id="search">
			
				<h3><label for="mapPosition">지도 위치</label></h3>
				
				<input type="text" name="searchMap" class="form-control mapPosition" 
					required="required" id="searchMap" style="width:30%;float:left" value="${plcVO.plc_name }">
					
				<button type="button" class="btn btn-primary" id="btnSearchMap" name="btnSearchMap" style="float:center">검색</button>
				</div>
		

			<div class="form-group">

				<div id="map" style="width: 100%; height: 350px;"></div>
				<p id="infoDiv"></p>
				
				<script type="text/javascript"
					src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990&libraries=services"></script>
				<script>
// 					<script>
					
					
					
					$('#btnSearchMap').on('click', function(e) {
						var searchMap = $('#searchMap').val();
						console.log("searchMap : " + searchMap);
						

						
					// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
					var infowindow = new daum.maps.InfoWindow({
						zIndex : 1
					});
				
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
//```````````````````````````````````````````````````````````````````````````````````````````````````````
						center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 
						level : 3
					// 지도의 확대 레벨
					};
					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption);
					
					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);	

					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();

					// 지도 타입 컨트롤을 지도에 표시합니다
					map.addControl(mapTypeControl,
							daum.maps.ControlPosition.TOPRIGHT);


					daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
					    // 클릭한 위도, 경도 정보를 가져옵니다 
					    var latlng = mouseEvent.latLng; 
					    var x = latlng.getLat();
					    var y = latlng.getLng(); 
					    
					    // 마커 위치를 클릭한 위치로 옮깁니다
					    
					    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					    message += '경도는 ' + latlng.getLng() + ' 입니다';
					    
					    $('#plc_map_x').val(x);
					    $('#plc_map_y').val(y);
					    
					    
					    var resultDiv = document.getElementById('infoDiv'); 
					    resultDiv.innerHTML = message;
					    
					   

					   
					});
					
					
					// 장소 검색 객체를 생성합니다
					var ps = new daum.maps.services.Places();

					// 키워드로 장소를 검색합니다
					ps.keywordSearch(searchMap, placesSearchCB);

					// 키워드 검색 완료 시 호출되는 콜백함수 입니다
					function placesSearchCB(status, data, pagination) {
						if (status === daum.maps.services.Status.OK) {

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
							// LatLngBounds 객체에 좌표를 추가합니다
							var bounds = new daum.maps.LatLngBounds();

							for (var i = 0; i < data.places.length; i++) {
								displayMarker(data.places[i]);
								bounds.extend(new daum.maps.LatLng(
										data.places[i].latitude,
										data.places[i].longitude));
							}

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							map.setBounds(bounds);
						}
					}

					// 지도에 마커를 표시하는 함수입니다
					function displayMarker(place) {

						// 마커를 생성하고 지도에 표시합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : new daum.maps.LatLng(place.latitude,	place.longitude)
						});

						// 마커에 클릭이벤트를 등록합니다
						daum.maps.event.addListener(marker,'click',	function() {
											// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
											infowindow
													.setContent('<div style="padding:5px;font-size:12px;">'
															+ place.title
															+ '</div>');
											infowindow.open(map, marker);
										});
							}
					});
					
					
				</script>
				
				<script>  //스크롤 방지기능
				$('#map').on('scroll touchmove mousewheel', function(event) {
					   event.preventDefault();
					   event.stopPropagation();

					   return false;
					});
				</script>
				
				<div id= "hiddenMap">
				
				</div>
			</div>
			
			
				<div class="form-group">
					<h1>
						<label>대표 사진</label>
					</h1>
					<div id="fileDrop" class="form-control">
					
				</div>

				</div>
				<div>
					<hr />
				</div>
				
				<div id="uploadedList">
					<div>
						<span class="mailbox-attachment-icon has-img"> <img
							style="width:200px;height:200px" src="/displayFile?fileName=${plcVO.plc_img}" />
						</span>

						<div class="mailbox-attachment-info">
							 <span style="cursor: pointer;">
								 <small data-src="${plcVO.plc_img}"><span class="glyphicon glyphicon-remove"></span></small>
							 </span> 
							 <input type="hidden" name="plc_img" value="${plcVO.plc_img}" />
						</div>
					</div>
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div>
					<hr />
				</div>
				<div class="form-group">
					<h1>
						<label>사진</label>
					</h1>
					<div id="fileDrop2" class="form-control"></div>
				</div>
				<div id="uploadedList2">
					<c:forEach items="${imageList}" var="ImageVO">
					<div>
						<span class="mailbox-attachment-icon has-img"> 
							<img style="width:200px;height:200px" src="/displayFile?fileName=${ImageVO.img_name}" />
						</span>

						<div class="mailbox-attachment-info">
							 <span style="cursor: pointer;">
								 <small data-src="${ImageVO.img_name}"><span class="glyphicon glyphicon-remove"></span></small>
							 </span> 
							 <input type="hidden" name="img_name" value="${ImageVO.img_name}" />
						</div>
					</div>
					</c:forEach>
				</div>
				<div>
					<hr />
				</div>
				
				<input type="hidden" name="plc_no" value="${plcVO.plc_no}"/>
			<div class="form-group ">
				<button type="submit" class="btn btn-primary btn-block">수정하기</button>
			</div>
			</form>
		</div>
		<%@ include file="../include/myPageFooter.jsp"%>
	</div>
<!-- </section> -->


<script id="template" type="text/x-handlebars-template">


	<div>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}"/>
		</span>
	
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">
				{{fileName}}
			</a>
			<span style="cursor:pointer;"><small data-src="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></small></span>

			<input type="hidden" name="plc_img" value="{{imageName}}"/>
		</div>
	</div>

</script>
<script id="template2" type="text/x-handlebars-template">


	<div>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}"/>
		</span>
	
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">
				{{fileName}}
			</a>
			<span style="cursor:pointer;"><small data-src="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></small></span>

			<input type="hidden" name="img_name" value="{{imageName}}"/>
		</div>
	</div>

</script>

<script src="/resources/js/upload.js"></script>

<script>
$(document).ready(function(){
		
	var result = '${msg}';
	if(result == 'success'){
		alert("등록되었습니다.")
	};
	
	var source = $('#template');
	var html = $('#template').html();
	var template = Handlebars.compile(html);

	$('#fileDrop').on('dragenter dragover', function(e) {
		e.preventDefault();
	});

	$('#fileDrop').on('drop', function(e) {
		e.preventDefault();

		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];

		var formData = new FormData();
		formData.append("file", file);

		$.ajax({
			'type' : 'post',
			'url' : '/uploadAjax',
			'data' : formData,
			'dataType' : 'text',
			'processData' : false,
			'contentType' : false,
			'success' : function(data) {
				console.log(data);
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				console.log(fileInfo);
				//$('#uploadedList').remove();
				$('#uploadedList').html(html);
			}
		});

	});

	$('#uploadedList').on('click', '.mailbox-attachment-info a:first',
			function(e) {
				e.preventDefault();
			});
	
	$('#uploadedList').on('click', 'small', function(e){
		var that = $(this);
		var data = {
				'fileName' : that.attr('data-src')
		};
		console.log(data);
		$.ajax({
			'url' : '/deleteFile',
			'type' : 'post',
			'dataType' : 'text',
			'data' : data,
			'success' : function(result) {
				if(result == 'DELETED') {
					that.parent('span').parent('div').parent('div').remove();
				}
			}
		});
	});
	
});
</script>
<script>
	var source2 = $('#template2');
	var html2 = $('#template2').html();
	var template2 = Handlebars.compile(html2);

	$('#fileDrop2').on('dragenter dragover', function(e) {
		e.preventDefault();
	});

	$('#fileDrop2').on('drop', function(e) {
		e.preventDefault();

		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];

		var formData = new FormData();
		formData.append("file", file);

		$.ajax({
			'type' : 'post',
			'url' : '/uploadAjax',
			'data' : formData,
			'dataType' : 'text',
			'processData' : false,
			'contentType' : false,
			'success' : function(data) {
				console.log(data);
				var fileInfo = getFileInfo(data);
				var html = template2(fileInfo);
				console.log(fileInfo);
				//$('#uploadedList').remove();
				$('#uploadedList2').append(html);
			}
		});

	});

	$('#uploadedList').on('click', '.mailbox-attachment-info a:first',
			function(e) {
				e.preventDefault();
			});
	
	$('#uploadedList2').on('click', 'small', function(e){
		var that = $(this);
		var data = {
				'fileName' : that.attr('data-src')
		};
		console.log(data);
		$.ajax({
			'url' : '/deleteFile',
			'type' : 'post',
			'dataType' : 'text',
			'data' : data,
			'success' : function(result) {
				if(result == 'DELETED') {
					that.parent('span').parent('div').parent('div').remove();
				}
			}
		});
	});
</script>







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
