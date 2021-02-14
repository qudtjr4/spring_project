<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
	<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>
	<section>
		<div>
			<div>
				<div>----------------------------------------------</div>
			</div>
		</div>
	</section>
<!-- 테마listTop3 부분 --> 
	<section id="slider_sec"  style="background-color: #353638; background-image: url('../resources/img/mainImg.jpg');'">
		<div class="container">
			<div class="row">
				<div class="slider">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
					<c:if test="${listTop3.size() >= 3}">
					
					<div class="item active">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							<h1>${listTop3.get(0).theme_title}</h1>
							<p>${listTop3.get(0).theme_content}</p>
						  </div>						
						</div>
					</div>					
					<div class="item">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							<h1>${listTop3.get(1).theme_title}</h1>
							<p>${listTop3.get(1).theme_content}</p>
						  </div>						
						</div>
					</div>					
					<div class="item ">
						<div class="wrap_caption">
						  <div class="caption_carousel">
							<h1>${listTop3.get(2).theme_title}</h1>
							<p>${listTop3.get(2).theme_content}</p>
						  </div>						
						</div>
					</div>			
				  </c:if>
				  
				  </div>
						

						<!-- Controls -->
						<a class="left left_crousel_btn" href="#carousel-example-generic"
							role="button" data-slide="prev"> <i class="fa fa-angle-left"></i>
							<span class="sr-only">Previous</span>
						</a> <a class="right right_crousel_btn"
							href="#carousel-example-generic" role="button" data-slide="next">
							<i class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
						</a>
						<div class="post_btn">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End slider Section -->





	<!-- start portfolio Section -->
	<section id="protfolio_sec">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">

							<button id="regBtn_Theme" class="btn btn-primary" >
      						<i class="fa fa-map-pin w3-margin-right"></i>테마등록하기</button>

					<div class="title_sec">
						<h1>테마별 코스</h1>
						<h2>다양한 테마를 경험하세요</h2>
					</div>
				</div>
				<div class="col-lg-12">
<!-- 테마 검색창 부분 --> 
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
					<form role="form" class="form-inline" action="/theme/theme">
					<div class="input-group">
						<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword}" required="required" placeholder="제목/내용/#해쉬태그">
					<div class="input-group-btn">
						<input type="hidden" name="page" value="${pageMaker.cri.page}"/>
						<button id="searchBtn" type="submit" class="btn btn-primary btn-md">검색하기</button>
					</div>
					</div>
					
					</form>
					</div>
<!-- 테마 정렬 버튼 -->
					<div>
						<a href="/theme/theme${pageMaker.cri.makeQuery(1 ,pageMaker.cri.keyword,'star')}">별점 순 </a>| 
						<a href="/theme/theme${pageMaker.cri.makeQuery(1 ,pageMaker.cri.keyword,'view')}"> 조회수 순 </a>| 
						<a href="/theme/theme${pageMaker.cri.makeQuery(1 ,pageMaker.cri.keyword,'char')}"> 가나다 순</a> |
						<a href="/theme/theme?page=1&keyword=&lineUp=">처음으로</a>
					</div>
					<div class="all-portfolios">

<!-- 테마 메인 아이템들 -->
						<c:forEach items="${list}" var="ThemeVO">

							<div class="col-sm-12  col-lg-12 col-md-12 col-xs-12 ">
								<div class="single-portfolio web-design">
									<div class="sngl_pricing">
										<h2 class="title_bg_1 ">${ThemeVO.theme_title}</h2>
											<a href="themeDetail${pageMaker.cri.makeQuery(pageMaker.cri.page ,pageMaker.cri.keyword,pageMaker.cri.lineUp)}&theme_no=${ThemeVO.theme_no}">
											<img class="img-responsive" style="height: 255px"
												src="/displayFile?fileName=${ThemeVO.theme_img}"
												alt=""></a>
										<!-- 	<div class="carousel-caption" style="color:black;"></div>	 -->
											
										조회수
										<h1 class="fa fa-user counter">${ThemeVO.viewcount}</h1> / 별점 
									<c:choose>
											<c:when test="${ThemeVO.theme_totalscore <= 0}">
											☆☆☆☆☆
										</c:when>
											<c:when
												test="${ThemeVO.theme_totalscore < 2 && ThemeVO.theme_totalscore >= 1}">
											★☆☆☆☆
										</c:when>
											<c:when test="${ThemeVO.theme_totalscore < 3 && ThemeVO.theme_totalscore >= 2}">
											★★☆☆☆
										</c:when>
										<c:when test="${ThemeVO.theme_totalscore < 4 && ThemeVO.theme_totalscore >= 3}">
											★★★☆☆
										</c:when>
										<c:when test="${ThemeVO.theme_totalscore < 5 && ThemeVO.theme_totalscore >= 4}">
											★★★★☆
										</c:when>
										<c:otherwise>
											★★★★★										
										</c:otherwise>
									</c:choose>
									<!-- <h1>${ThemeVO.theme_hashtag}</h1> -->
									</div>
									
									<%-- <a href="/themeDetail?theme_no=${ThemeVO.theme_no}"
										class="btn pricing_btn">자세히 보기</a> --%>

								</div>
							</div>
						</c:forEach>


					</div>


				</div>
				<!-- <div class="post_btn">
					<div class="hover_effect_btn" id="hover_effect_btn">
						<a href="#hover_effect_btn" data-hover="view more post"><span>더보기</span></a>
					</div>
				</div> -->
			</div>
<!-- 페이징 -->
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
						<li><a href="/theme/theme${pageMaker.cri.makeQuery(pageMaker.cri.page - 1,pageMaker.cri.keyword,pageMaker.cri.lineUp)}">Prev</a></li>
						</c:if>
						
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li><a href="/theme/theme${pageMaker.cri.makeQuery(idx,pageMaker.cri.keyword,pageMaker.cri.lineUp)}">${idx}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
						<li><a href="/theme/theme${pageMaker.cri.makeQuery(pageMaker.cri.page + 1,pageMaker.cri.keyword,pageMaker.cri.lineUp)}">Next</a></li>
						</c:if>
				
					</ul>
				</div>
			</div>
			<!-- 페이징 -->
		</div>
	</section>
	<!-- End Portfolio Section -->


<%@ include file="../include/footer.jsp" %>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="/resources/js/vendor/jquery-1.11.3.min.js"></script>
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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

var result = '${msg}';
if (result == 'SUCCESS') {
	alert('등록되었습니다.');
} 
</script>

<script type="text/javascript">
$(document).ready(function() {
//테마 등록하기 버튼 클릭
	$('#regBtn_Theme').click(function(e){
		e.preventDefault();
		if('${sessionScope.login.mem_id}' != ''){
		location.href='/theme/themeRegist';
		}else{
			document.getElementById('id01').style.display='block';
		
		}
	})
	
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
