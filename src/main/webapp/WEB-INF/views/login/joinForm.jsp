<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
.td_sytle {
	backgroud-color: red;
}

#fileDrop{
	width : 80%;
	height : 100px;
	border : 1px dotted gray;
	background-color: #e1e9ef;
	margin : 0 auto;
}

#uploadedList > div {
	float : left;
	margin : 10px;
}

#failMessage2, #successMessage2 {
 	display: none; 
 } 
</style>
<script>
$(document).ready(function() {
	
	$('#btnCheckId').click(function() {
		var mem_id = $('#mem_id').val();
		$.ajax({
			type : 'POST',
			url : './idCheck',
			data : {mem_id : mem_id},
			success: function(msg){
				var v = msg.trim();		
// 				console.log("v", "----" + v + "-----");
				if(v == 'success'){
					$('#failMessage2').hide();
					$('#successMessage2').show();
					
				}else {
					$('#successMessage2').hide();
					$('#failMessage2').show();
				}
				
			}
			
		});
	});

	
	
	
});
	
</script>
<script type="text/javascript">
function passwordCheckFunction(){
	var userPassword1 = $('#userPassword1').val();
	var userPassword2 = $('#userPassword2').val();
	if(userPassword1 != userPassword2){
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
	}else{
		$('#passwordCheckMessage').html('');
		
	}
}
</script>


<!-- start contact us Section -->
<section id="ctn_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
				<br/><br/><br/><br/><br/>
					<h1>Join</h1> 
				</div>			
			</div>		
					<form id="contact-form" class="contact" name="contact-form" method="post" action="/login/joinRun">
			<div class="col-sm-6"> 
				<div id="cnt_form">
						<div class="form-group">
						<h4><label>ID</label><button type="button" class="btn btn-primary" id="btnCheckId" 
						style="margin-left:30px;">ID 중복체크</button></h4>
						
						
								<div id="failMessage2">
									<p style="color:red;">이미 사용중인 아이디 입니다.</p>
								</div>
							
							<div id="successMessage2">
								<p style="color:blue;">사용 가능한 아이디 입니다.</p> 
							</div>
						
						<input type="text" name="mem_id" id="mem_id" class="form-control name-field" required="required" placeholder="Your Id">
						</div>
						<div class="form-group">
						<h4><label>PASSWORD</label></h4>
							<input type="password" name="mem_pw" id="userPassword1" class="form-control mail-field" onkeyup="passwordCheckFunction();" required="required" placeholder="Your Password">
						</div> 
						<div class="form-group">
						<h4><label>PASSWORD CHECK</label></h4>
							<input type="password" name="mem_pw2"id="userPassword2" class="form-control mail-field" onkeyup="passwordCheckFunction();" required="required" placeholder="Your Password">
							<h5 style="color:red;" id="passwordCheckMessage"></h5>
						</div> 
						<div class="form-group">
						<h4><label>NAME</label></h4>
							<input type="text" name="mem_name" class="form-control mail-field" required="required" placeholder="Your Name">
						</div> 
						<div class="form-group">
						<h4><label>E-MAIL</label></h4>
							<input type="email" name="mem_email" class="form-control mail-field" required="required" placeholder="Your Email">
						</div>

					
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="cnt_info">
					<div class="form-group">
					<h4><label>프로필 사진</label></h4>
					<div id="fileDrop">
					
					</div>
				</div>
					
				<div>
					<hr/>
				</div>
				<div id="uploadedList">
				
				 
					
					
				</div>

 
				</div>
			</div>
			<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 ">
					<button type="submit" class="w3-button w3-block w3-black w3-margin-top">Join</button>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs6 ">
					<button type="button"
						class="w3-button w3-block w3-black w3-margin-top"
						onclick="history.back()">cancel</button>
				</div>
			</div>
			</form> 

		</div>
	</div>
</section>
<!-- End contact us  Section -->

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

			<input type="hidden" name="mem_img" value="{{imageName}}"/>
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
