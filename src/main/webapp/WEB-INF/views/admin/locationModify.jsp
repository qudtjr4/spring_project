<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/myPageHeader.jsp"%>
<style>
.td_sytle{
	backgroud-color:red;
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

#fileDrop {
	width : 80%;
	height : 100px;
	border : 1px dotted gray;
	background-color: #e1e9ef;
	margin : 0 auto;
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


<!-- 로케이션 상세페이지 start blog Section -->
<section id="blg_sec">
	<div class="container">
		<div class="row">
			<div class="title_sec">
				<h1>지역 수정 페이지</h1>
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				

<!-- 로케이션 수정 게시판 -->
		<form role="form" id="locationModifyForm" method="post" action="/admin/locationModify">
			<button type="button" class="btn btn-primary" id="btnPrev" onclick="history.back()">목록으로</button>
			<div class="form-group">
				<h1><label for="locationName">지역 이름</label></h1>
				<input type="text" name="loc_name" class="form-control locationName"
					required="required" value="${locVO.loc_name}">
			</div>

			<div class="form-group">
				<h1><label for="locationInfo">지역 정보</label></h1>
				<textarea name="loc_info" class="form-control info" id="info" required="required" rows="10">${locVO.loc_info }</textarea>
			</div>
			
			<div class="form-group">
				<h1><label>사진</label></h1>
				
				<div id="fileDrop">
				
				</div>
			</div>
			
			<input type="hidden" name="loc_no" value="${locVO.loc_no}"/>
			<div>
				<hr/>
			</div>
			
			
			<div id="uploadedList">
				<div>
					<span class="mailbox-attachment-icon has-img"> <img style="width:400px;height:400px"
						src="/displayFile?fileName=${locVO.loc_img}" />
					</span>

					<div class="mailbox-attachment-info">
						 <span style="cursor: pointer;">
							 <small data-src="${locVO.loc_img}"><span class="glyphicon glyphicon-remove"></span></small>
						 </span> 
						 <input type="hidden" name="loc_img" value="${locVO.loc_img}" />
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
				
			<div class="form-group ">
				<button type="submit" class="btn btn-primary btn-block">수정하기</button>
			</div>
		</form>
			</div>

<!-- 로케이션 수정 게시판 끝-->

			</div>
		</div>
</section>
<!-- 로케이션 상세페이지 끝 end Blog Section -->



<%@ include file="../include/footer.jsp" %>

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
			<input type="hidden" name="loc_img" id="loc_img" value="{{imageName}}"/>
		</div>
	</div>

</script>

<script src="/resources/js/upload.js"></script>

<script>
$(document).ready(function(){
		
	$('#locationModifyForm').submit(function(e){
		e.preventDefault();
		var that = $(this);
		if($('#loc_img').val() == '' || $('#loc_img').val() == null){
			alert('이미지를 추가해 주세요');
		}else {that.get(0).submit()}
	});
	
	
	
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
