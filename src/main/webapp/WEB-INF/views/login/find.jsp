<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- start contact us Section -->
<section id="ctn_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
				<br/><br/><br/><br/><br/>
					<h1>비밀번호 찾기</h1> 
				</div>			
			</div>		
					<form id="contact-form" class="contact" name="contact-form" method="post" action="/login/findPassword">
			<div class="col-sm-6"> 
				<div id="cnt_form">
						<div class="form-group">
						<h4><label>ID</label></h4>
						<input type="text" name="mem_id" id="mem_id" class="form-control name-field" required="required" placeholder="Your Id">
						</div>
						<div class="form-group">
						<h4><label>E-MAIL</label></h4>
							<input type="email" name="mem_email" class="form-control mail-field" required="required" placeholder="Your Email">
						</div>
				</div>
			</div>
			
			<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 ">
					<button type="submit" class="w3-button w3-block w3-black w3-margin-top">임시 비밀번호 받기</button>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 ">
					<button type="button"
						class="w3-button w3-block w3-black w3-margin-top"
						onclick="history.back()">돌아가기</button>
				</div>
			</div>
			</form> 

		</div>
	</div>
</section>
<!-- End contact us  Section -->

<%@ include file="../include/footer.jsp" %>



<script>
$(document).ready(function(){
		
	var result = '${msg}';
	if(result == 'success'){
		alert("등록되었습니다.")
	};
	
	
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
		
		$("body").css("overflow", "hidden");

		$('.show_hide').showHide({
			speed : 1000, // speed you want the toggle to happen	
			easing : '', // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
			changeText : 1, // if you dont want the button text to change, set this to 0
			showText : 'View',// the button text to show when a div is closed
			hideText : 'Close' // the button text to show when a div is open

		});
		
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
		
		$("body").css("overflow", "visible");
		var nice = $('html').niceScroll({
			cursorborder : "5",
			cursorcolor : "#00AFF0",
			cursorwidth : "3px",
			boxzoom : true,
			autohidemode : true
		});
		
// 		$('#idCheckBtn').click(function(){
// 			var inputMem_id = $('#mem_id').val();

// 		});

	});
</script>

</body>
</html>
