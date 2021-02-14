<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>
<style>
#fileDrop {
	width : 80%;
	height : 100px;
	border : 1px dotted gray;
	background-color: #eeeeee;
	margin : 0 auto;
}

#uploadedList > div {
	float : left;
	margin : 10px;
}
</style>

<!-- 타이틀 -->
<section id="blg_sec">
	<div class="container">
		<div class="row">
			<div class="title_sec">
				<br>
				<hr><h1>${sessionScope.login.mem_id}님의 테마를 작성해주세요</h1><hr>
				<input type="button" class="btn btn-primary" style="float:right" onclick="history.back()" value="목록으로">
			</div> 
			<!-- 폼 -->
			<form id="registerForm" role="form" method="post" action="/theme/themeAdd">
					
					<input type="hidden" name="mem_id" id="mem_id" value="${sessionScope.login.mem_id}" />
					
					<div class="form-group">
						<label for="cour_title">Title</label>
						<input type="text" name="theme_title" id="theme_title"class="form-control" placeholder="테마 타이틀 입력">
					</div>
					
					<div class="form-group">
						<label for="cour_content">설명</label>
						<input type="text" name="theme_content" id="theme_content"class="form-control" placeholder="content">
					</div>
					<div class="form-group">
						<label for="cour_hashtag">해쉬태그</label>
						<input type="text" name="theme_hashtag" id="theme_hashtag"class="form-control" placeholder="해쉬 태그 입력">
					</div>
					
					<div class="form-group">
						<label for="cour_hashtag">대표이미지를 설정해주세요(Drop File Here)</label>
						<div id="fileDrop"class="form-control" ></div>
					</div>
					<div>
						<hr/>
					</div>
					<div id="uploadedList">
						
						
					</div>
					<hr/>
					<hr/>
					<hr/>
					<hr/>
					<hr/>
					<hr/>

					<div class="form-group"><hr>
						<label for="plc_no">테마 장소 선택하기</label><hr>
						<table class="table text-center">
							<tr>
								
								<td>
									<div>${sessionScope.login.mem_id}님의 저장한 장소</div><br>
									<table class="table" id="cartList">
									    <tbody id="cartTbody">
									    <c:forEach items="${cartPlaceList}" var="PlaceVO">
									      <tr>
									      	<td class="category">${PlaceVO.plc_category}</td>
									        <td><img id="plcImg" src="/displayFile?fileName=${PlaceVO.plc_img}" style="width: 60px; height: 60px" class="img-circle" alt=""/></td>
									        <td class="name">${PlaceVO.plc_name}
									        <input type="hidden" id="plc_no" name="plc_no" value="${PlaceVO.plc_no}"></input></td>
									      	<td><input type="hidden" id="plc_map_x" name="plc_map_x" value="${PlaceVO.plc_map_x}"/></td>
									      	<td><input type="hidden" id="plc_map_y" name="plc_map_y" value="${PlaceVO.plc_map_y}"/></td>
									        <td><input type="button" class="btn btn-default btn-sm btn" value="테마에 추가하기"/>
									      </tr>
									     </c:forEach> 
									   </tbody>
								  </table>
								</td>
						
								
								<td style="background-color: #F6F6F6">
								<div>${sessionScope.login.mem_id}님의 선택한 테마장소</div><br>
								<div></div>
									<table class="table" style="background-color: #F6F6F6; border-left-style: solid;">
									    <tbody id="courseList">
									    
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

				<button type="submit" class="btn btn-danger btn-block">테마 추가하기</button>
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
<script src="/resources/js/upload.js"></script>

<script src="/resources/js/showHide.js" type="text/javascript"></script>

 <!-- 이미지 핸들바즈 -->
<script id="templateImage" type="text/x-handlebars-template">

<div>
	<span class="mailbox-attachment-icon has-img">
		<img src="{{imgsrc}}"/>
	</span>
	
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}"
			class="mailbox-attachment-name">{{fileName}}</a>
	<span style="cursor:pointer;"><small data-src="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></small></span>
	
	<input type="hidden" id="theme_img" name="theme_img" value="{{imageName}}"/>
	</div>
</div>

</script>

<!--  이미지 AJAX -->
<script>
$(document).ready(function() {
	
	$('#registerForm').submit(function(e){
		e.preventDefault();
		var that = $(this);
		if($('#theme_title').val() == ''){
			alert('타이틀을 입력하세요');
			console.log($('#theme_title').val());
		}else if($('#theme_content').val() == ''){
			alert('내용을 입력하세요');
		}else if($('#theme_img').val() == '' || $('#theme_img').val() == null){
			alert('이미지를 추가해 주세요');
			console.log($('#theme_img').val());
		}else if($('#theme_plc_no').val() == '' || $('#theme_plc_no').val() == null){
			alert('장소를 최소한 하나 선택하세요, 저장한 장소가 없다면 장소페이지에서 카트에 추가해주세요');
			console.log($('#theme_plc_no').val());
		}else if($('#mem_id').val() == '' || $('#mem_id').val() == null){
			alert('로그인 해주세요');
		}else(
		
		that.get(0).submit() // 폼 전송, get(0)
		)
	});
	
	
	var source = $('#templateImage');
	var html = $('#templateImage').html();
	var template = Handlebars.compile(html);
	
	// 파일 드래그 영역의 브라우저 기본 기능(파일 열기)을
	// 동작하지 않도록 함 (마우스 진입/오버)
	$('#fileDrop').on('dragenter dragover', function(e) {
		e.preventDefault();
	});
	
	// 파일 드래그 영역에 마우스 릴리즈
	$('#fileDrop').on('drop', function(e) {
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			'type' : 'post',
			'url' : '/uploadAjax',//deleteFile
			'data' : formData,
			'dataType' : 'text',
			'processData' : false,
			'contentType' : false,
			'success' : function(data) {
					console.log(data);
				var fileInfo = getFileInfo(data); // JSON 형식으로 리턴 받음
				console.log(fileInfo);
				
				var html = template(fileInfo);
				$('#uploadedList').html(html);
			}
		});
	
	});
	$('#uploadedList').on('click', '.mailbox-attachment-info a:first', 
			function(e) {
		//e.preventDefault();
	});
	$('#uploadedList').on('click','small', function(e) {
		
		
		var that = $(this);
		var data = {
				'fileName' : that.attr('data-src')
		};
		$.ajax({
			'url' : '/deleteFile',
			'type' : 'post',
			'data' : data,
			'dataType' : 'text',
			'success' : function(result) {
				if (result == 'DELETED') {
					that.parent('span').parent('div').parent('div').remove();
				}
			}
		}); 
});

// 폼 전송
 /*  $('#registerForm').submit(function (e){
	e.preventDefault();
	var that = $(this);
	
	var str = '';
	
	$('#uploadedList .delBtn').each(function(index) {
		
	 	str = '<input type="hidden" name="theme_img"'
			+ ' value="' + $(this).attr('href') + '"/>';
		that.append(str);
	});
	
	that.get(0).submit(); // 폼 전송, get(0) -> form 엘리먼트(DOM)
	
	}); */
}); 
</script>
<script src="//apis.daum.net/maps/maps3.js?apikey=d7a07220a476beb39a9e7ba8b0f7d990"></script>

<!-- 장소 선택하기 핸들바즈 -->

<script id="template" type="text/x-handlebars-template">

<tr>
	<td class="category">{{plc_category}}</td>
  	<td><img id="plcImg" src="{{plcImg}}" style="width: 60px; height: 60px" alt=""/></td>
 	<td class="name"s>{{plc_name}}
 	<td><span class="glyphicon glyphicon-remove"></span></td>
	<input type="hidden" name="theme_plc_no" id="theme_plc_no" value="{{theme_plc_no}}"></input></td>
	<td><input type="hidden" id="plc_map_x" name="plc_map_x" value="{{plc_map_x}}"/></td>
	<td><input type="hidden" id="plc_map_y" name="plc_map_y" value="{{plc_map_y}}"/></td>
	<td><input type="hidden" id="locateNumber" value="{{index}}"/></td>
</tr>
	
</script>
<script id="template2" type="text/x-handlebars-template">
<tr>
   	<td class="category">{{plc_category}}</td>
    <td><img id="plcImg" src="{{plcImg}}" style="width: 60px; height: 60px" alt=""/></td>
    <td class="name">{{plc_name}}
	<input type="hidden" id="plc_no" name="plc_no" value="{{plc_no}}"></input></td>
	<td><input type="hidden" id="plc_map_x" name="plc_map_x" value="{{plc_map_x}}"/></td>
	<td><input type="hidden" id="plc_map_y" name="plc_map_y" value="{{plc_map_y}}"/></td>
    <td><input type="button" class="btn btn-default btn-sm btn" value="테마에 추가하기"/></td>
</tr>
</script>

<script>

$(document).ready(function() {
	
	var source = $('#template').html();
	var source2 = $('#template2').html();
	var template = Handlebars.compile(source);
	var template2 = Handlebars.compile(source2);
	var i = 1;
	
	var listPlaceSize = 0;
	var listPointX = [];
	var listPointY = [];
	var locateNumber = [];
	var listPlcName = [];
	var abc = 0;
	var locate = 0;

	$('#cartTbody').on('click', ' .btn', function(e) {
		e.preventDefault();
		var that = $(this);
		var category = that.parent('td').parent('tr').find('.category').text();
		var name = that.parent('td').parent('tr').find('.name').text();
		var no = that.parent('td').parent('tr').find('#plc_no').val();
		console.log(no);
		var plcImg = that.parent('td').parent('tr').find('#plcImg').attr('src');
		var x = that.parent('td').parent('tr').find('#plc_map_x').val();
		var y = that.parent('td').parent('tr').find('#plc_map_y').val();
		
		listPointX.push(x);
		listPointY.push(y);
		listPlcName.push(name);
		locateNumber.push(abc+name);
		listPlaceSize++;
		var templateData = { 
				plc_category : category,
				index: i, 
				plc_name: name, 
				theme_plc_no : no,
				plcImg : plcImg,
				plc_map_x : x,
				plc_map_y : y
		}
		var html = template(templateData);
		i++;
		abc++;
		$('#courseList').append(html);
		that.parent('td').parent('tr').remove();
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
	    content : '<div style="padding:5px;" class="text-center">'+ listPlcName[i] + '</div>' // 인포윈도우에 표시할 내용
	});
	infowindow.open(map, marker);
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
	
	
	$('#courseList').on('click', 'span', function(e) {
		e.preventDefault();
		var that = $(this);
		var category = that.parent('td').parent('tr').find('.category').text();
		var name = that.parent('td').parent('tr').find('.name').text();
		var no = that.parent('td').parent('tr').find('#theme_plc_no').val();
		var plcImg = that.parent('td').parent('tr').find('#plcImg').attr('src');
		var x = that.parent('td').parent('tr').find('#plc_map_x').val();
		var y = that.parent('td').parent('tr').find('#plc_map_y').val();
		position =  that.parent('td').parent('tr').find('#locateNumber').val();
		var templateData = { 
				plc_category : category,
				plc_name: name, 
				plc_no : no,
				plcImg : plcImg,
				plc_map_x : x,
				plc_map_y : y
		}
		locate = locateNumber.indexOf(position);
	   	locateNumber.splice(locate, 1);
	   	listPointX.splice(locate, 1);
		listPointY.splice(locate, 1);
		locateNumber.splice(locate, 1);
		listPlcName.splice(locate, 1);
		listPlaceSize--;
		console.log('locate : '+locate);
		console.log('position : ' + position);
		var html = template2(templateData);
		$('#cartTbody').append(html);
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
	    content : '<div style="padding:3px;" class="text-center">'+ listPlcName[i]+'</div>' // 인포윈도우에 표시할 내용
	});
	infowindow.open(map, marker);
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
</html>