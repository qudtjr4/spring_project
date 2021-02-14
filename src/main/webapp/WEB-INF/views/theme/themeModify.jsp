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
				<hr><h1>${sessionScope.login.mem_id}님의 테마를 수정해주세요</h1><hr>
			</div>
			<!-- 폼 -->
			<form id="registerForm" role="form" method="post" action="/theme/themeModifyRun">
					
					<input type="hidden" name="mem_id" id="mem_id" value="${sessionScope.login.mem_id}" />
					<input type="hidden" name="theme_no" value="${vo.theme_no }"/>
					<div class="form-group">
						<label for="cour_title">Title</label>
						<input type="text" name="theme_title" id="theme_title"class="form-control" placeholder="${vo.theme_title }" value="${vo.theme_title }">
					</div>
					
					<div class="form-group">
						<label for="cour_content">설명</label>
						<input type="text" name="theme_content" id="theme_content"class="form-control" placeholder="${vo.theme_content }" value="${vo.theme_content }">
					</div>
					<div class="form-group">
						<label for="cour_hashtag">해쉬태그</label>
						<input type="text" name="theme_hashtag" id="theme_hashtag"class="form-control" placeholder="${vo.theme_hashtag }" value="${vo.theme_hashtag }">
					</div>
					
					<div class="form-group">
						<label for="cour_hashtag">대표이미지를 설정해주세요(Drop File Here)</label>
						<div id="fileDrop"class="form-control" ></div>
					</div>
					<div>
						<hr/>
					</div>
					<div id="uploadedList">
						<div>
							<span class="mailbox-attachment-icon has-img">
								<img src="/displayFile?fileName=${vo.theme_img}"/>
							</span>
							
							<div class="mailbox-attachment-info">
								<a href="{{getLink}}"
									class="mailbox-attachment-name"></a>
							<span style="cursor:pointer;"><small data-src="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></small></span>
							
							<input type="hidden" name="theme_img" value="${vo.theme_img}"/>
							</div>
						</div>
						
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
									        	<td><img style="width:50px;height:50px;" id="plcImg" src="/displayFile?fileName=${PlaceVO.plc_img}" class="img-circle" alt=""/></td>
									        	<td class="name">${PlaceVO.plc_name}
									        	<input type="hidden" id="plc_no" name="plc_no" value="${PlaceVO.plc_no}"></input></td>
									        	<td><button class="btn btn-default btn-sm btn">테마에 추가하기</button></td>
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
									    	<c:forEach items="${plcList}" var="PlaceVO">
									    	<tr>
												<td class="category">${PlaceVO.plc_category }</td>
											  	<td><img style="width:50px;height:50px;" id="plcImg" src="/displayFile?fileName=${PlaceVO.plc_img}" alt=""/></td>
											 	<td class="name">${PlaceVO.plc_name }</td>
											 	<td><span class="glyphicon glyphicon-remove"></span></td>
												<td><input type="hidden" name="theme_plc_no" id="plc_no" value="${PlaceVO.plc_no }"/><td>
											</tr>
											</c:forEach>
									    </tbody>
									</table>
								</td>

							</tr>
						</table>
						<hr>
						</div>

				<button type="submit" class="btn btn-danger btn-block">테마 수정하기</button>
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
	
	<input type="hidden" name="theme_img" value="{{imageName}}"/>
	</div>
</div>

</script>

<!--  이미지 AJAX -->
<script>
$(document).ready(function() {

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


<!-- 장소 선택하기 핸들바즈 -->

<script id="template" type="text/x-handlebars-template">

<tr>
	<td class="category">{{plc_category}}</td>
  	<td><img style="width:50px;height:50px;" id="plcImg" src="{{plcImg}}" alt=""/></td>
 	<td class="name">{{plc_name}}</td>
 	<td><span class="glyphicon glyphicon-remove"></span></td>
	<td><input type="hidden" name="theme_plc_no" id="plc_no" value={{theme_plc_no}}><td>
</tr>
	
</script>
<script id="template2" type="text/x-handlebars-template">
<tr>
   	<td class="category">{{plc_category}}</td>
    <td><img style="width:50px;height:50px;" id="plcImg" src="{{plcImg}}" class="img-circle" alt=""/></td>
    <td class="name">{{plc_name}}
	<input type="hidden" id="plc_no" name="plc_no" value="{{theme_plc_no}}"></input></td>
    <td><button class="btn btn-default btn-sm btn">테마에 추가하기</button></td>
</tr>
</script>

<script>

$(document).ready(function() {
	
	var source = $('#template').html();
	var source2 = $('#template2').html();
	var template = Handlebars.compile(source);
	var template2 = Handlebars.compile(source2);
	var i = 1;

	$('#cartTbody').on('click', ' .btn', function(e) {
		e.preventDefault();
		var that = $(this);
		var category = that.parent('td').parent('tr').find('.category').text();
		var name = that.parent('td').parent('tr').find('.name').text();
		var no = that.parent('td').parent('tr').find('#plc_no').val();
		var plcImg = that.parent('td').parent('tr').find('#plcImg').attr('src');
		console.log(plcImg)
		var templateData = { 
				plc_category : category,
				index: i, 
				plc_name: name, 
				theme_plc_no : no,
				plcImg : plcImg
		}
		var html = template(templateData);
		i++;
		$('#courseList').append(html);
		that.parent('td').parent('tr').remove();
	});
	
	$('#courseList').on('click', 'span', function(e) {
		e.preventDefault();
		var that = $(this);
		var category = that.parent('td').parent('tr').find('.category').text();
		var name = that.parent('td').parent('tr').find('.name').text();
		var no = that.parent('td').parent('tr').find('#plc_no').val();
		console.log('!!!!!!!!!!!!!!!111넘버'+no);
		var plcImg = that.parent('td').parent('tr').find('#plcImg').attr('src');
		var templateData = { 
				plc_category : category,
				plc_name: name, 
				theme_plc_no : no,
				plcImg : plcImg
		}
		console.log(templateData);
		var html = template2(templateData);
		$('#cartTbody').append(html);
		that.parent('td').parent('tr').remove();
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