<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="include/header.jsp" %>
<style>

.slidesImage {
	background: no-repeat;
}

.slidesImagetext {
	position: absolute;
	background: #000000;
	opacity: 0;
	text-align: center;
	color: #ffffff;
	padding: 30px;
}

.slidesImage:hover .slidesImagetext h1{
	text-align: center;
	padding-top: 20%;
	font-size: 70px;
	color: white;
}

.slidesImage:hover .slidesImagetext h6{
	text-align: left;
	padding-top: 15%;
	padding-left: 5%;
	font-size: 15px;
	color: #EAEAEA;
	line-height:150%;
}

.slidesImage:hover .slidesImagetext{
	opacity: 0.8;
	top: 190px;
	left: 155px;
}

/* 랜덤테마 정보 스타일 */
.random_theme {
	background: no-repeat;
}

.random_text {
	position: absolute;
	top: 100px;
	left: 15px;
	background: #000000;
	opacity: 0.7;
	text-align: center;
	width: 1140px;
	height: 300px;
}

/* 여기어때?*/
.random_theme h4 { 
 	position: absolute; 
 	top: 60px; 
 	text-align: center; 
	font-weight: bolder;
 	width: 1140px; 
 	color: #f98d8d;

 } 

 .random_theme h3 { 
 	position: absolute; 
 	top: 100px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 .random_theme h5 { 
 	position: absolute; 
 	top: 140px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 .random_theme h6 { 
 	position: absolute; 
 	top: 170px; 
 	text-align: center; 
 	width: 1140px; 
 	color: #ffffff; 

 } 
 /* 랜덤테마 정보 스타일 끝 */




</style>

<!-- start slider Section -->
<section id="slider_sec" style="background-color: #353638; background-image: url('../resources/img/mainImg.jpg');'">
	<div class="container">
		<div class="row">
			<div class="slider">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
<!-- 				  Indicators -->
<!-- 				  <ol class="carousel-indicators"> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 				  </ol> -->





	 			   <!-- Wrapper for slides -->
	 <div style="margin-top: -45px" class="carousel-inner" role="listbox">
		 <c:forEach items="${locationList}" var="Location" begin="0" end="${locationList.size() }" varStatus="status">
		      	 
		      	 <c:choose>
	      			<c:when test="${status.count == 1}">
					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel slidesImage" style="">
							 <a href="/place/location?loc_no=${Location.loc_no}&page=1&plc_category=" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${Location.loc_img}" style="width:860px;height:460px;"  alt="">
                                <div class="slidesImagetext" style="width:300px;height:460px;">
                                	<h1>${Location.loc_name}</h1>
                                	<h6>${Location.loc_info}</h6>
                                </div>
                            </a>
						  </div>						
						</div>
					</div>
					</c:when>
			 
				   <c:otherwise>
				     <div class="item">
				       <div class="wrap_caption">
						  <div class="caption_carousel slidesImage" style="">
							 <a href="/place/location?loc_no=${Location.loc_no}&page=1&plc_category="" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${Location.loc_img}" style="width: 860px; height: 460px;"  alt="">
                                <div class="slidesImagetext" style="width:300px; height: 460px;">
                                	<h1>${Location.loc_name}</h1>
                                	<h6>${Location.loc_info}</h6>
                                </div>
                            </a>
						  </div>						
						</div>
				      </div> 
				      </c:otherwise>
				      </c:choose>
				</c:forEach>
								
				  </div> 
				  <!-- Controls -->
				  <a class="left left_crousel_btn" href="#carousel-example-generic" role="button" data-slide="prev">
					<i class="fa fa-angle-left"></i>
					<span class="sr-only">Previous</span>
				  </a>
				  <a class="right right_crousel_btn" href="#carousel-example-generic" role="button" data-slide="next">
					<i class="fa fa-angle-right"></i>
					<span class="sr-only">Next</span>
				  </a>

				</div>
			</div>	
		</div>			
	</div>	
</section>
<!-- End slider Section -->


<br/>
<br/>
<br/>
<br/>
<br/>


<!-- start Recommend course Section -->
<section id="lts_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>Recommand Course </h1>
					<p> (Best 3)</p>
					<div class="block2">
						<ul id="ticker2" style="width:170px">
							<c:forEach items="${list2}" var="CourseVO" varStatus="status">
								<li><a class="page-scroll" href="/course/detail?cour_no=${CourseVO.cour_no}&page=1"><span>${status.count}.</span> ${CourseVO.cour_title}</a></li>
							</c:forEach>
						</ul>
						<div class="navi2">
							<button class="prev2 w3-button w3-small w3-black">up</button>
							<button class="next2 w3-button w3-small w3-black">down</button>
						</div>
					</div>
				</div>			
			</div>		
			<br><br><br><br><br><br>
			<c:forEach items="${list}" var="CourseVO" varStatus="status2">
			<div class="col-lg-4 col-md-4 col-sm-12">
			
				<div class="lts_pst col-lg-12 col-md-12 col-sm-12">		
					<div id="myCarousel${status2.count}" class="carousel slide" data-ride="carousel" >			

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <c:forEach varStatus="status"  begin="0" end="${CourseVO.listPlcImg.size()}" items="${CourseVO.listPlcImg}" var="listPlcImg">
      <c:choose>
      	<c:when test="${status.count == 1}">
	      <div class="item active">
	        <img src="/displayFile?fileName=${listPlcImg}" alt="" style="width:350px;height:300px">     
	      </div>
      	</c:when>
      	<c:otherwise>
	      <div class="item">
	        <img src="/displayFile?fileName=${listPlcImg}" alt="" style="width:350px;height:300px">     
	      </div>
      	</c:otherwise>
      </c:choose>
	</c:forEach>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel${status2.count}" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel${status2.count}" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
					</div>
					<div>
						<h1>${CourseVO.cour_title}</h1>
						<p>${CourseVO.cour_hashtag}</p>
						<a href="/course/detail?cour_no=${CourseVO.cour_no}&page=1">Read more <i class="fa fa-long-arrow-right"></i></a>					
					</div>
					
				</div>
				
			</div>			
</c:forEach>

			<div class="post_btn">
				<div class="hover_effect_btn" id="hover_effect_btn">
					<a href="#hover_effect_btn" data-hover="view more post"><span>view more post</span></a>
				</div>
			</div>			
			
		</div>
	</div>
</section>
<!-- End Recommend course Section -->
<br/><br/><br/><br/><br/><br/>

<!-- start Recommend theme Section -->
<section id="lts_sec">
	<div class="container">
		<div class="row">
			
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>Recomend Theme </h1>
					<p> (Best 3)</p>
					<div class="block">
						<ul id="ticker1" style="width:100px">
							<c:forEach items="${themeListTop10 }" var="ThemeVO"  varStatus="status">
							<li><a href="/theme/themeDetail?theme_no=${ThemeVO.theme_no }"><span>${status.count }.</span>  ${ ThemeVO.theme_title }</a></li>
							
							</c:forEach>			
						</ul>
						<div class="navi">
							<button class="prev w3-button w3-small w3-black">up</button>
							<button class="next w3-button w3-small w3-black">down</button>
						</div>
					</div>
				</div>			
			</div>		
			<br><br><br><br><br><br>
			<c:forEach items="${themeListTop3}" var="ThemeVO">
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="/displayFile?fileName=${ThemeVO.theme_img}" alt="" style="width:350px;height:300px">
					<h2>${ThemeVO.theme_title }</h2>
					<p>${ThemeVO.theme_content }</p>
					<p>${ThemeVO.theme_hashtag }</p>
					<a href="theme/themeDetail?theme_no=${ThemeVO.theme_no }">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>
			</c:forEach>	
		</div>
	</div>
</section>
<!-- End Recommend theme Section -->

<br><br><br><br><br><br>


<!-- start Recommend place Section -->
<section id="lts_sec">
	<div class="container">
		<div class="row">
			
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>Recomend Hot Place </h1>
					
				</div>			
			</div>		
<!-- -------------------------------------------------------------------------------------- -->
			<!-- category별 1위 -->
			<br><br><br><br><br><br>
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst" style="width:360px; height:382px;">		
					<span class="label label-primary">숙박 1위</span>				
					<img style="width:350px; height:300px;" src="displayFile?fileName=${plc_bestList.get(0).plc_img}" alt=""/>
					<h2>${plc_bestList.get(0).plc_name}</h2>
					<a href="/place/placeDetail?plc_no=${plc_bestList.get(0).plc_no}&loc_no=${plc_bestList.get(0).loc_no}">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>			
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst" style="width:360px; height:382px;">	
					<span class="label label-success">명소 1위</span>						
					<img style="width:350px; height:300px;" src="displayFile?fileName=${plc_bestList.get(1).plc_img}" alt=""/>
					<h2>${plc_bestList.get(1).plc_name}</h2>
					<a href="/place/placeDetail?plc_no=${plc_bestList.get(1).plc_no}&loc_no=${plc_bestList.get(1).loc_no}">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>		
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst" style="width:360px; height:382px;">
					<span class="label label-danger">맛집 1위</span>							
					<img style="width:350px; height:300px;" src="displayFile?fileName=${plc_bestList.get(2).plc_img}" alt=""/>
					<h2>${plc_bestList.get(2).plc_name}</h2>
					<a href="/place/placeDetail?plc_no=${plc_bestList.get(2).plc_no}&loc_no=${plc_bestList.get(2).loc_no}">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>
			<!-- category별 1위 -->
			
			<div class="post_btn">
				<div class="hover_effect_btn" id="hover_effect_btn">
					<a href="#hover_effect_btn" data-hover="view more post"><span>view more post</span></a>
				</div>
			</div>			

		</div>
	</div>
</section>
<!-- End Recommend place Section -->

<br><br><br><br><br><br>

<!-- -------------------------------------------------------------------------------------- -->
<!-- 랜덤 테마 Section -->
<section style="background-color: #353638; height: 400px; ">
	<div class="container">
		<div class="row">
			<div class="slider">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
<!-- 				  Indicators -->
<!-- 				  <ol class="carousel-indicators"> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 				  </ol> -->





	 			   <!-- Wrapper for slides -->
	 <div style="margin-top: -45px" class="carousel-inner" role="listbox">
		<c:forEach items="${random_Theme}" var="themeVO" begin="0" end="${random_Theme.size() }" varStatus="status">
		      	 
		      	 <c:choose>
	      			<c:when test="${status.count == 1}">
					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel random_theme" style="">
							 <a href="/theme/themeDetail?theme_no=${themeVO.theme_no}" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${themeVO.theme_img}" style="width:1140px; height:300px; margin-top: -90px;"  alt="">
                                <div class="random_text" style="width:1140px;height:300px;">
                                	<h4>여기어때?</h4>
                                	<h3>${themeVO.theme_title}</h3>
                                	<h5>${themeVO.theme_content}</h5>
                                	<h6>- ${themeVO.mem_id}</h6>
                                </div>
                            </a>
						  </div>						
						</div>
					</div>
					</c:when>
			 
				   <c:otherwise>
				     <div class="item">
				       <div class="wrap_caption">
						  <div class="caption_carousel random_theme" style="">
							 <a href="/theme/themeDetail?theme_no=${themeVO.theme_no}" class="portfolio-popup" title="Project Title">
                                <img src="/displayFile?fileName=${themeVO.theme_img}" style="width:1140px;height:300px; margin-top: -90px;"  alt="">
                                <div class="random_text" style="width:1140px;height:300px;">
                                	<h4>여기어때?</h4>
                                	<h3>${themeVO.theme_title}</h3>
                                	<h5>${themeVO.theme_content}</h5>
                                	<h6>- ${themeVO.mem_id}</h6>
                                </div>
                            </a>
						  </div>						
						</div>
				      </div> 
				      </c:otherwise>
				      </c:choose>
				</c:forEach>
								
				  </div> 
			
				</div>
			</div>	
		</div>			
	</div>	
</section>
<!-- 랜덤 테마 Section 끝 -->





<%@ include file="include/footer.jsp" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <!--  <script src="/resources/js/vendor/jquery-1.11.3.min.js"></script> -->

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

// $(document).ready(function(){


//    $('.show_hide').showHide({			 
// 		speed: 1000,  // speed you want the toggle to happen	
// 		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
// 		changeText: 1, // if you dont want the button text to change, set this to 0
// 		showText: 'View',// the button text to show when a div is closed
// 		hideText: 'Close' // the button text to show when a div is open
					 
// 	}); 


// });

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
	var result = '${msg1}';

	if(result == 'success'){
		alert('임시 비밀번호가 등록된 이메일로 발송되었습니다.'); 
		
	}else if(result == 'fail'){
		alert('아이디/이메일을 다시 확인해 주세요.');
	}

	
	
	var result2 = '${msg2}';
	if(result2 == 'fail2'){
		alert('블라인드 처리 되었습니다. 문의사항은 travelline606@gmail.com');
	}
	
	
	
	
	
	
    $("body").css("overflow", "hidden");
});

// Show Overflow of Body when Everything has Loaded 
$(window).load(function(){
    $("body").css("overflow", "invisible");        
    var nice=$('html').niceScroll({
	cursorborder:"5",
	cursorcolor:"#00AFF0",
	cursorwidth:"3px",
	boxzoom:true, 
	autohidemode:true
	});

});
</script>

<script>
jQuery(function($)
		{
		    var ticker2 = function()
		    {
		        timer = setTimeout(function(){
		            $('#ticker2 li:first').animate( {marginTop: '-20px'}, 400, function()
		            {
		                $(this).detach().appendTo('ul#ticker2').removeAttr('style');
		            });
		            ticker2();
		        }, 2000);         
		      };
		// 0번 이전 기능
		      $(document).on('click','.prev2',function(){
		        $('#ticker2 li:last').hide().prependTo($('#ticker2')).slideDown();
		        clearTimeout(timer);
		        ticker2();
		        if($('#pause2').text() == 'Unpause2'){
		          $('#pause2').text('Pause2');
		        };
		      }); // 0번 기능 끝
		  
		// 1. 클릭하면 다음 요소 보여주기... 클릭할 경우 setTimeout 을 clearTimeout 해줘야 하는데 어떻게 하지..
		      $(document).on('click','.next2',function(){
		            $('#ticker2 li:first').animate( {marginTop: '-20px'}, 400, function()
		                    {
		                        $(this).detach().appendTo('ul#ticker2').removeAttr('style');
		                    });
		            clearTimeout(timer);
		            ticker2();
		            //3 함수와 연계 시작
		            if($('#pause2').text() == 'Unpause2'){
		              $('#pause2').text('Pause2');
		            }; //3 함수와 연계
		          }); // next 끝. timer 를 전연변수보다 지역변수 사용하는게 나을 것 같은데 방법을 모르겠네요.

		  //2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
		  var autoplay = true;
		      $(document).on('click','.pause2',function(){
		            if(autoplay==true){
		              clearTimeout(timer);
		              $(this).text('재생');
		              autoplay=false;
		            }else{
		              autoplay=true;
		              $(this).text('정지');
		              ticker2();
		            }
		          }); // 재생정지기능 끝  
		  // 3. 재생정지 함수 시작. 2와 기능 동일함.
		    var ticker2pause2 = function()
		  {
		    $('#pause2').click(function(){
		      $this = $(this);
		      if($this.text() == 'Pause2'){
		        $this.text('Unpause2');
		        clearTimeout(timer);
		      }
		      else {
		        ticker2();
		        $this.text('Pause2');
		      }
		    });
		   
		  };
		  ticker2pause2();
		  //3 재생정지 함수 끝
		  //4 마우스를 올렸을 때 기능 정지
		  var ticker2over = function()
		  {
		    $('#ticker2').mouseover(function(){
		      clearTimeout(timer);
		    });
		    $('#ticker2').mouseout(function(){
		      ticker2();
		    });  
		  };
		  ticker2over();
		  // 4 끝
		    ticker2();
		    
		});

</script>


<script>
jQuery(function($)
		{
		    var ticker1 = function()
		    {
		        timer = setTimeout(function(){
		            $('#ticker1 li:first').animate( {marginTop: '-20px'}, 400, function()
		            {
		                $(this).detach().appendTo('ul#ticker1').removeAttr('style');
		            });
		            ticker1();
		        }, 2000);         
		      };
		// 0번 이전 기능
		      $(document).on('click','.prev',function(){
		        $('#ticker1 li:last').hide().prependTo($('#ticker1')).slideDown();
		        clearTimeout(timer);
		        ticker1();
		        if($('#pause').text() == 'Unpause'){
		          $('#pause').text('Pause');
		        };
		      }); // 0번 기능 끝
		  
		// 1. 클릭하면 다음 요소 보여주기... 클릭할 경우 setTimeout 을 clearTimeout 해줘야 하는데 어떻게 하지..
		      $(document).on('click','.next',function(){
		            $('#ticker1 li:first').animate( {marginTop: '-20px'}, 400, function()
		                    {
		                        $(this).detach().appendTo('ul#ticker1').removeAttr('style');
		                    });
		            clearTimeout(timer);
		            ticker1();
		            //3 함수와 연계 시작
		            if($('#pause').text() == 'Unpause'){
		              $('#pause').text('Pause');
		            }; //3 함수와 연계
		          }); // next 끝. timer 를 전연변수보다 지역변수 사용하는게 나을 것 같은데 방법을 모르겠네요.

		  //2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
		  var autoplay = true;
		      $(document).on('click','.pause',function(){
		            if(autoplay==true){
		              clearTimeout(timer);
		              $(this).text('재생');
		              autoplay=false;
		            }else{
		              autoplay=true;
		              $(this).text('정지');
		              ticker1();
		            }
		          }); // 재생정지기능 끝  
		  // 3. 재생정지 함수 시작. 2와 기능 동일함.
		    var ticker1pause = function()
		  {
		    $('#pause').click(function(){
		      $this = $(this);
		      if($this.text() == 'Pause'){
		        $this.text('Unpause');
		        clearTimeout(timer);
		      }
		      else {
		        ticker1();
		        $this.text('Pause');
		      }
		    });
		   
		  };
		  ticker1pause();
		  //3 재생정지 함수 끝
		  //4 마우스를 올렸을 때 기능 정지
		  var ticker1over = function()
		  {
		    $('#ticker1').mouseover(function(){
		      clearTimeout(timer);
		    });
		    $('#ticker1').mouseout(function(){
		      ticker1();
		    });  
		  };
		  ticker1over();
		  // 4 끝
		    ticker1();
		  
		    if ('${msg}' == 'fail') {
		    	
// 				$('#modalController').trigger('click');
		    	document.getElementById('id01').style.display='block';
		    	$('#failMessage').show();
			}
		    
});
		
	

</script>

</body>
</html>
