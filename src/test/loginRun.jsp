
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../include/header.jsp" %> --%>


<style>
.img-responsive {
	/* 	boarder: 1px solid; */
	/* 	opacity: 0.6 !important; */
	/* 	filter: alpha(opacity = 50); */
	/* 	onmouseover: opacity:1.0; */
	filter: alpha(opacity = 70);
	
	opacity: 0.7;
	-webkit-opacity: 0.7;
}
/* img-responsive:hover {
	opacity: 1.0;
	 filter:alpha(opacity=100);
} */
.carousel-caption {
	/* 277 × 277 pixels */
	bottom: 300px;
	color: white;
	-webkit-text-fill-color: white;
	-webkit-text-stroke-color: #353638;
	​-webkit-text-stroke-width: 1px;
}

</style>

<!-- start slider Section -->
<section id="slider_sec">
	<div class="container">
		<div class="row">
			<div class="slider">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
<!-- 				  <ol class="carousel-indicators"> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 					<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 				  </ol> -->

				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							 <a href="/resources/img/Hae.JPG" class="portfolio-popup" title="Project Title">
	                               <p class="aa"><img class="img-responsive " src="/resources/img/Hae.JPG"   alt=""></p>
	                                <div class="carousel-caption">
											<h1>해운대</h1>
								</div>
                            </a>
						  </div>						
						</div>
					</div>					
					<div class="item">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							 <a href="/resources/img/Nam.JPG" class="portfolio-popup" title="Project Title">
                                <img src="/resources/img/Nam.JPG" alt="">
                            </a>
						  </div>						
						</div>
					</div>					
					<div class="item ">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							 <a href="/resources/img/Seo.JPG" class="portfolio-popup" title="Project Title">
                                <img src="/resources/img/Seo.JPG" alt="">
                            </a>
						  </div>						
						</div>
					</div>	
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
						<ul id="ticker2">
							<li><a href="#"><span>1.</span> a</a></li>
							<li><a href="#"><span>2.</span> b</a></li>
							<li><a href="#"><span>3.</span> c</a></li>
							<li><a href="#"><span>4.</span> d</a></li>
							<li><a href="#"><span>5.</span> e</a></li>
							<li><a href="#"><span>6.</span> f</a></li>
							<li><a href="#"><span>7.</span> g</a></li>
							<li><a href="#"><span>8.</span> h</a></li>
							<li><a href="#"><span>9.</span> i</a></li>
						</ul>
						<div class="navi2">
							<button class="prev2 w3-button w3-small w3-black">up</button>
							<button class="next2 w3-button w3-small w3-black">down</button>
						</div>
					</div>
				</div>			
			</div>		
			<br><br><br><br><br><br>
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img2.jpg?10828543012475550494" alt=""/>
					<h2>How to fix your bug</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="single.html">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>			
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img3.jpg?16122351990094232768" alt=""/>
					<h2>Pellentesque nibh libero</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>		
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img1.jpg?1960436319992241823" alt=""/>
					<h2>pharetra eu tempor vel</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>

		</div>
	</div>
</section>
<!-- End Recommend course Section -->

<br/><br/><br/><br/><br/><br/>

<!-- start Recommend Thema Section -->
<section id="lts_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					<h1>Recomend Thema </h1>
					<p> (Best 3)</p><div class="block">
						<ul id="ticker1">
							<li><a href="#"><span>1.</span> a</a></li>
							<li><a href="#"><span>2.</span> b</a></li> 
							<li><a href="#"><span>3.</span> c</a></li>
							<li><a href="#"><span>4.</span> d</a></li>
							<li><a href="#"><span>5.</span> e</a></li>
							<li><a href="#"><span>6.</span> f</a></li>
							<li><a href="#"><span>7.</span> g</a></li>
							<li><a href="#"><span>8.</span> h</a></li>
							<li><a href="#"><span>9.</span> i</a></li>
						</ul>
						<div class="navi">
							<button class="prev w3-button w3-small w3-black">up</button>
							<button class="next w3-button w3-small w3-black">down</button>
						</div>
					</div>
				</div>			
			</div>		
			<br><br><br><br><br><br>
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img2.jpg?10828543012475550494" alt=""/>
					<h2>How to fix your bug</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="single.html">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>			
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img3.jpg?16122351990094232768" alt=""/>
					<h2>Pellentesque nibh libero</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>		
			<div class="col-lg-4 col-md-4 col-sm-12">
				<div class="lts_pst">						
					<img src="http://cdn.shopify.com/s/files/1/1039/5466/files/blog-img1.jpg?1960436319992241823" alt=""/>
					<h2>pharetra eu tempor vel</h2>
					<p>Nullam metus arcu, pharetra eu tempor vel, consectetur nec metus. Praesent malesuada, purus et euismod rutrum, augue nisi facilisis diam, vitae auctor nisl libero nec eros. Vivamus vitae pulvinar augue. Nulla facilisi. Quisque rutrum ante interdum</p>
					<a href="">Read more <i class="fa fa-long-arrow-right"></i></a>					
				</div>
			</div>
			<div class="post_btn">
				<div class="hover_effect_btn" id="hover_effect_btn">
					<a href="#hover_effect_btn" data-hover="view more post"><span>view more post</span></a>
				</div>
			</div>			

		</div>
	</div>
</section>


<!-- End Recommend Thema Section -->
<%-- <%@ include file="../include/footer.jsp" %> --%>

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
<!-- Google Map js -->
        <script src="https://maps.googleapis.com/maps/api/js"></script>
		<script>
			function initialize() {
			  var mapOptions = {
				zoom: 14,
				scrollwheel: false,
				center: new google.maps.LatLng(41.092586000000000000, -75.592688599999970000)
			  };
			  var map = new google.maps.Map(document.getElementById('googleMap'),
				  mapOptions);
			  var marker = new google.maps.Marker({
				position: map.getCenter(),
				animation:google.maps.Animation.BOUNCE,
				icon: '/resources/img/map-marker.png',
				map: map
			  });
			}
			google.maps.event.addDomListener(window, 'load', initialize);
		</script>
<script src="/resources/js/main.js"></script>

<script src="/resources/js/showHide.js" type="text/javascript"></script>

<script type="text/javascript">

// $(document).ready(function(){


//    $('.show_hide').showHide({			 
// 		speed: 1000,  // speed you want the toggle to happen	
// 		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
// 		changeText: 1, // if you dont want the button text to change, set this to 0
// // 		showText: 'View',// the button text to show when a div is closed
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
		    
		});

</script>










    </body>
</html>
