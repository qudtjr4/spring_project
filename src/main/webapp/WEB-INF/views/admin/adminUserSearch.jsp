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
      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>코스추가</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-diamond w3-margin-right"></i>테마추가</button>
      <button class="w3-button w3-white w3-hide-small"  onclick="location.href='/admin/adminUserSearch'"><i class="fa fa-user fa-fw w3-margin-right"></i>유저리스트</button>
    </div>
    </div>
  </header>


<!-- place 관리 페이지 -->
<section>
	<div class="container">

		<div class="row col-lg-12 col-md-12 col-sm-12 col-xs12">
			<div class="title_sec">
				<h1>회원 리스트</h1>
			</div>
			<table class="table table-striped  text-center">
    <thead>
      <tr>
        <th class="text-center">ID</th>
        <th class="text-center">이름</th>
        <th class="text-center">Email</th>
        <th class="text-center">회원상태</th>
        <th></th>
      </tr>
    </thead>
    <tbody id="btnBlind">
    <c:forEach var="MemberVO" items="${MemberList}">
      <tr>
        <td class="mem_id">${MemberVO.mem_id}</td>
        <td>${MemberVO.mem_name}</td>
        <td>${MemberVO.mem_email}</td>
        <td>
        <input type="hidden" id="mem_blind" value="${MemberVO.mem_blind}">
        <c:choose>
        	<c:when test="${MemberVO.mem_blind == 0}">
        	<p><span class="glyphicon glyphicon-eye-open"></span></p>
        	</c:when>
        	<c:otherwise>
        	<p><span class="glyphicon glyphicon-eye-close"></span></p>
        	</c:otherwise>
        </c:choose>     
        </td>
        <td>
        <c:if test="${MemberVO.mem_id != 'admin'}">
        <c:choose>
        	<c:when test="${MemberVO.mem_blind == 0}">
            <button type="button" class="btn btn-danger">블라인드 적용</button>
        	</c:when>
        	<c:otherwise>
        	<button type="button" class="btn btn-primary">블라인드 해제</button>
        	</c:otherwise>
        </c:choose>   
        </c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>


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

<script>
$(document).ready(function() {
	
// 지역 등록 버튼
	$('#btnLocRegist').click(function() {
		location.href = '/locationInput';
	});
	
	$('#btnBlind').on('click','button', function(e) {
		var that = $(this);
		var blind = that.parent('td').parent('tr').find('#mem_blind').val();
		var id = that.parent('td').parent('tr').find('.mem_id').text();
		if (blind == 0) {
			console.log(id," -> 블라인드 먹이기");
			
			var formData = new FormData();
			formData.append("mem_id", id);
			
			$.ajax({
				'type' : 'post',
				'url' : '/admin/updateBlindTrue',
				'data' : formData,
				'dataType' : 'text',
				'processData' : false,
				'contentType' : false,
				'success' : function(data) {
					console.log(data);
					alert("블라인드 적용 성공");
					location.href = '/admin/adminUserSearch';
				}
			});

		}else {
			console.log(id," -> 블라인드 풀기");
			
			var formData = new FormData();
			formData.append("mem_id", id);
			
			$.ajax({
				'type' : 'post',
				'url' : '/admin/updateBlindFalse',
				'data' : formData,
				'dataType' : 'text',
				'processData' : false,
				'contentType' : false,
				'success' : function(data) {
					console.log(data);
					alert("블라인드 풀기 성공");
					location.href = '/admin/adminUserSearch';
				}
			});
		}
	});
	
	
	

});

</script>

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
