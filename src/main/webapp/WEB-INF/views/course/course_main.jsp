<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id}"/>
<!-- 타이틀 -->
<section id="blg_sec" class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
	<div class="container">
		<div class="row">
			<div class="title_sec">
				<br>
				<h1>Our Course</h1>
				<h2>당신의 여행을 위한 코스를 추천합니다</h2>
			</div>
			
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center"> 
				<form role="form" class="form-inline" action="/course/main">    
					<div class="input-group">
						<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword}" required="required" placeholder="검색어를 입력해주세요">
					<div class="input-group-btn">
						<input type="hidden" name="page" value="${pageMaker.cri.page}"/>
						<button type="submit" class="btn btn-primary btn-md">검색하기</button>
					</div>
					</div>
				</form>
			</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-right"><h5>총 ${pageMaker.totalCount} 개의 코스가 있습니다</h5></div>
				
	<!-- 코스 -->			
	<div class="container">
		<div class="row ">
		<c:forEach items="${list}" var="CourseVO">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 w3-margin-top">
			<hr>
				<div class="title_sec col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<h1>${CourseVO.cour_title}<small> | 
						<c:choose>
						<c:when test="${(CourseVO.cour_days).equals('4')}">
						 장기코스
						</c:when>
						<c:otherwise>
						 ${CourseVO.cour_days}일 코스
						</c:otherwise>
						</c:choose>
					</small></h1>
					<h2>${CourseVO.cour_hashtag}</h2>
					<c:choose>
						<c:when test="${CourseVO.cour_totalscore == 0}">
						<span class="label label-danger w3-margin-right" id="cour_totalscore">평점 없음</span>
						</c:when>
						<c:otherwise>
						<span class="label label-danger w3-margin-right" id="cour_totalscore"> 평점 | 
							<c:forEach begin="1" end="${CourseVO.cour_totalscore}">
							★
							</c:forEach>
						</span>
						</c:otherwise>
					</c:choose>
					<span class="label label-primary">리뷰수 | ${CourseVO.reviewCount}</span>
					<div class="w3-margin-top">
					<a href="/course/detail?cour_no=${CourseVO.cour_no}&page=1">Read more <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>			
					
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs8">
				<div class="all_team w3-margin-top">
					<c:forEach begin="0" end="${CourseVO.listPlcImg.size()}" items="${CourseVO.listPlcImg}" var="listPlcImg">
						<div class="sngl_team">						
							<img style="width:130px ; height:130px" src="/displayFile?fileName=${listPlcImg}" alt=""/>						
						</div>
					</c:forEach>									
				</div>								
			</div>			
		</div>
			</c:forEach>
		</div>
	</div>						
	<!-- 코스 -->	
			
		</div>
		<!-- 페이징 -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
					<li>
						<a href="/course/main?page=${pageMaker.cri.page - 1}">Prev</a>
					</li>
					</c:if>
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li>
						<a href="/course/main?page=${idx}">${idx}</a>
					</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
					<li>
						<a href="/course/main?page=${pageMaker.cri.page + 1}">Next</a>
					</li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 페이징 -->
		
		<!-- 코스 추가 버튼 여기 아이디 임의로 넣었음!!!!!!! 바꿔야함 -->
		<c:if test="${sessionScope.login.mem_id != null}">
		<button type="button" class="btn btn-primary btn-block" onclick="location.href='/course/add'">코스 추가하기</button>
		</c:if>
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