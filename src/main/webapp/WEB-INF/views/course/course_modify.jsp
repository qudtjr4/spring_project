<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<script>
var listPointX = [];
var listPointY = [];
var locateNumber = [];
var listPlcName = [];
</script>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>
<!-- 타이틀 -->
<section id="blg_sec">
	<div class="container">
		<div class="row">
			<div class="title_sec">
				<br>
				<h1>코스 수정하기 폼</h1>
			</div>
			<!-- 폼 -->
			<form id="courseModifyForm" role="form" method="post" action="/course/modify">
					<hr><h1>${CourseVO.mem_id}님 코스를 수정해주세요</h1><hr>
					<input type="hidden" name="mem_id" id="mem_id"  value="${CourseVO.mem_id}" />
					<input type="hidden" name="cour_no" id="cour_no" value="${CourseVO.cour_no}" />
					<div class="form-group">
						<label for="cour_title">Title</label>
						<input type="text" name="cour_title" id="cour_title"class="form-control" value="${CourseVO.cour_title}">
					</div>
					<div class="form-group">
						<label for="cour_days">코스기간</label><br>
						<input type="radio" name="cour_days" id="cour_days1" value="1">1일코스
						<input type="radio" name="cour_days" id="cour_days2" value="2">2일코스
						<input type="radio" name="cour_days" id="cour_days3" value="3">3일코스
						<input type="radio" name="cour_days" id="cour_days4" value="4">그외
					</div>
					<div class="form-group">
						<label for="cour_hashtag">해쉬태그</label>
						<input type="text" name="cour_hashtag" id="cour_hashtag"class="form-control" value="${CourseVO.cour_hashtag}">
					</div>
					

					<div class="form-group"><hr>
						<label>코스 장소 선택하기</label><hr>
						<table class="table text-center">
							<tr>
								
								<td>
									<div>${mem_id}님의 저장한 장소</div><br>
									<table class="table" id="cartList">
									    <tbody>
									    <c:forEach items="${cart_list_plc}" var="placeVO">
									      <tr>
									      	<td class="category">${placeVO.plc_category}</td>
									        <td><img src="/displayFile?fileName=${placeVO.plc_img}" class="img-circle" alt="" style="width: 60px; height: 60px""/></td>
									        <td class="name">${placeVO.plc_name}
									        <input type="hidden" id="plc_no" name="plc_no" value="${placeVO.plc_no}"></input><td>
									        <td><button class="btn btn-default btn-sm btn">코스에 추가하기</button></td>
									       <td><input type="hidden" id="plc_name" name="plc_name" value="${placeVO.plc_name}"/></td>
									      	<td><input type="hidden" id="plc_img" name="plc_img" value="${placeVO.plc_img}"/></td>
									      	<td><input type="hidden" id="plc_map_x" name="plc_map_x" value="${placeVO.plc_map_x}"/></td>
									      	<td><input type="hidden" id="plc_map_y" name="plc_map_y" value="${placeVO.plc_map_y}"/></td>
									      </tr>
									     </c:forEach>

									   </tbody>
								  </table>
								</td>
						
								
								<td style="background-color: #F6F6F6">
								<div>${mem_id}님의 선택한 일정순서</div><br>
								<div></div>
									<table class="table" style="background-color: #F6F6F6; border-left-style: solid; text-align: left;">
									    <tbody id="courseList">
									    <c:forEach items="${listPlace}" var="PlaceVO" varStatus="status">
									    	<tr>
												<td><input type="hidden" name="cour_plc_no" id="cour_plc_no" value="${PlaceVO.plc_no}"></input>
												<td>${PlaceVO.plc_category}</td>
											  	<td><img src="/displayFile?fileName=${PlaceVO.plc_img}" alt="" style="width: 60px; height: 60px;"/></td>
											 	<td>${PlaceVO.plc_name}</td>
											 	<%-- <td><input type="hidden" id="exist_plc_map_x" value="${PlaceVO.plc_map_x}"/></td>
											 	<td><input type="hidden" id="exist_plc_map_y" value="${PlaceVO.plc_map_y}"/></td>
											 	<td><input type="hidden" id="exist_plc_name" value="${PlaceVO.plc_name}"/></td> --%>
											 	
											 	<td><input type="hidden" id="exist_locateNumber" value="${status.index}${PlaceVO.plc_name}"/></td>
											 	<td><span class="glyphicon glyphicon-remove"></span></td>
											</tr>
											<script>
											listPointX.push(${PlaceVO.plc_map_x});
											listPointY.push(${PlaceVO.plc_map_y});
											listPlcName.push('${PlaceVO.plc_name}');
											locateNumber.push('${status.index}${PlaceVO.plc_name}');
											console.log('!!!!!!1!!!!!!!!!!!!'+listPointX);
											console.log('!!!!!!1!!!!!!!!!!!!'+listPointY);
											console.log('!!!!!!1!!!!!!!!!!!!'+listPlcName);
											console.log('!!!!!!1!!!!!!!!!!!!'+locateNumber);
											</script>
									    </c:forEach>
									    </tbody>
									</table>
								</td>

							</tr>
						</table>
						<hr>
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
<!-- 				<button class="btn btn-default" onclick="setBounds()">전체 코스 한눈에 보기</button>  -->
				</div>
			</div>	
			</div>
		</div>
	</div>
</div>
</section>
<!-- map -->

				<button type="submit" class="btn btn-danger btn-block">코스 추가하기</button>
			</form>
		</div>
	
		<!-- 코스 추가 버튼 -->
	</div>
</section>
<!-- start Blog Section -->


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

<script src="/resources/js/main.js"></script>

<script src="/resources/js/showHide.js" type="text/javascript"></script>

<script id="template" type="text/x-handlebars-template">


<tr>
	<td><input type="hidden" name="cour_plc_no" id="cour_plc_no" value={{cour_plc_no}}></input></td>
	<td>{{plc_category}}</td>
  	<td><img src="/displayFile?fileName={{plc_img}}" alt="" style="width: 60px; height: 60px"/></td>
 	<td>{{plc_name}}</td>
	<td><input type="hidden" id="exist_plc_map_x" value=""/></td>
 	<td><input type="hidden" id="exist_plc_map_y" value=""/></td>
	<td><input type="hidden" id="exist_plc_name" value=""/></td>
	<td><input type="hidden" id="exist_locateNumber" value="{{index}}"/></td>
 	<td><span class="glyphicon glyphicon-remove"></span></td>
</tr>

	
</script>
<script src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990"></script>
<script>

$(document).ready(function() {

	
	
	var source = $('#template').html();
	var template = Handlebars.compile(source);
	var listPlaceSize = ${listPlace.size()};
	var abc = ${listPlace.size()};
	var locate = 0;
	
	/* var exist_x = ('#exist_plc_map_x').val();
	var exist_y = ('#exist_plc_map_y').val();
	var exist_name = ('#exist_plc_name').val();
	var exist_locateNumber = ('#exist_locateNumber').val();
	
	for(var i=0; i< abc; i++){
		listPointX.push(exist_x);
		listPointY.push(exist_y);
		listPlcName.push(exist_name);
		locateNumber.push(exist_locateNumber);
	}
	 */
	// 맵맵맵
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
	    content : '<div style="padding:5px;" class="text-center">'+ (i+1) + '번째 장소 | '+ listPlcName[i] + '</div>' // 인포윈도우에 표시할 내용
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
	 
	 
	 
	 
	 
	 
	 
	
	$('#cartList .btn').on('click', function(e) {
		
		e.preventDefault();
		var that = $(this);
		var category = that.parent('td').parent('tr').find('.category').text();
		var name = that.parent('td').parent('tr').find('#plc_name').val();
		var no = that.parent('td').parent('tr').find('#plc_no').val();
		var img = that.parent('td').parent('tr').find('#plc_img').val();
		var x = that.parent('td').parent('tr').find('#plc_map_x').val();
		var y = that.parent('td').parent('tr').find('#plc_map_y').val();
		listPointX.push(x);
		listPointY.push(y);
		listPlcName.push(name);
		locateNumber.push(abc+name);
		listPlaceSize++;
		var templateData = { 
				plc_category : category,
				index: abc+name, 
				plc_name: name, 
				cour_plc_no : no,
				plc_img : img
		}
		var html = template(templateData);
		abc++;
		$('#courseList').append(html);
	
		
		//플레이스 사이즈가 필요함
		console.log("listPointX : " + listPointX);
		console.log("listPointY : " + listPointY);
		console.log("listPlcName : " + listPlcName);
		console.log("listsize : " + listPlaceSize);
		
		
		// 맵맵맵
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
	    content : '<div style="padding:5px;" class="text-center">'+ (i+1) + '번째 장소 | '+ listPlcName[i] + '</div>' // 인포윈도우에 표시할 내용
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

		
		
	});
	
	$('#courseList').on('click', 'span', function() {
		var that = $(this);
		locate = 0;
		name = that.parent('td').parent('tr').find('#name').val();
		position =  that.parent('td').parent('tr').find('#locateNumber').val();
	   	
	   	locate = locateNumber.indexOf(position);
	   	locateNumber.splice(locate, 1);
	   	listPointX.splice(locate, 1);
		listPointY.splice(locate, 1);
		locateNumber.splice(locate, 1);
		listPlcName.splice(locate, 1);
		listPlaceSize--;
		console.log('locate : '+locate);
		console.log('position : ' + position);
		that.parent('td').parent('tr').remove();
		
		// 맵맵맵
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
		
		
	});
	

	
});
</script>
<!-- MAP -->


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
