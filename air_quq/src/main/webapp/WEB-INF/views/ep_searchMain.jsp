<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/css/kakaomap.css">
<div class="clearfix"></div>
<section class="search-box">
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-5 listing-block">
<!--//////////  -->

	<c:forEach items="${ exlist }" var="exlist">
	<form action="/ep/apply" method="post" class="formId2">
		<button type="submit" style="border:none; width:100%; text-align: left;" class="btn btn-light">
		<input type="hidden" value="${ addr }" name="addr">
		<input type="hidden" value="${ day }" name="day">
		<input type="hidden" value="${ cnt }" name="cnt">
		<input type="hidden" value="${ exlist.lat }" name="lat">
		<input type="hidden" value="${ exlist.lnt }" name="lnt">
		<input type="hidden" value="${ exlist.title }" name="title">
	        <div class="media">
	              <img class="d-flex align-self-start" src="/resources/img/house_img/${ exlist.img }">
	              <div class="media-body pl-3">
	                <div class="price">￦${  exlist.price }원<small>${ exlist.loc }</small></div>
	                <div class="address"></div>
	                <div class="titlw"><big>${ exlist.title }</big></div>
	                <div type="hidden" value="" id="locationAdress"></div>
	                <div class="stats">
	                    <span><i class="fa fa-users" aria-hidden="true"></i>${ cnt }</span>
	                    <span><i class="fa fa-calendar" aria-hidden="true"></i>${ day }</span>
	                </div>
	              </div>
	            </div>
	     </button>
     </form>
     </a>    
   </c:forEach>
   <!-- Pagning -->

   <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	   <c:choose>
	    	<c:when test="${ pageUtil.pageBlockCount > pageUtil.totalPageCount || pageUtil.pageNum ==1 }">
		    	<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">이전</a>
			    </li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item">
			      <a class="page-link" href="/search/host?pageNum=${ pageUtil.endPageNum - 1 }&locationAdress=${addr}&start_day=${start_day}&end_day=${end_day}&people_count=${people_count}" tabindex="-1">이전</a>
			    </li>
	    	</c:otherwise>
	   </c:choose>
	    
	    <c:forEach var="i" begin="${ pageUtil.startPageNum }" end="${ pageUtil.endPageNum }">
    		<c:choose>
    			<c:when test="${ pageUtil.pageNum == i }">
    				<li class="page-item active"><a class="page-link" href="/search/host?pageNum=${ i }&locationAdress=${addr}&start_day=${start_day}&end_day=${end_day}&people_count=${people_count}">${ i }</a></li>   	
    			</c:when>
    			<c:otherwise>
    				<li class="page-item"><a class="page-link" href="/search/host?pageNum=${ i }&locationAdress=${addr}&start_day=${start_day}&end_day=${end_day}&people_count=${people_count}">${ i }</a></li>   	
    			</c:otherwise>
    		</c:choose>
	    </c:forEach>
		<c:if test="${ pageUtil.pageNum == pageUtil.totalPageCount + 1 }">
			<li class="page-item active"><a class="page-link" href="/search/host?pageNum=${ i }&locationAdress=${addr}&start_day=${start_day}&end_day=${end_day}&people_count=${pageUtil.pageNum}">${ pageUtil.pageNum }</a></li>   	
		</c:if>
	    <c:choose>
	    	<c:when test="${ pageUtil.pageBlockCount < pageUtil.totalPageCount }">
	    		<li class="page-item page-item">
			   		<a class="page-link" href="/search/host?pageNum=${ pageUtil.endPageNum + 1 }&locationAdress=${addr}&start_day=${start_day}&end_day=${end_day}&people_count=${people_count}">다음</a>
				</li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item page-item  disabled">
			   		<a class="page-link" href="#">다음</a>
				</li>
	    	</c:otherwise>
	    </c:choose>
	  </ul>
	</nav>
   <!--//////////  -->
		</div>
		<div class="col-md-7 map-box mx-0 px-0">
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=406ad69f366b925b30509f2bc766e47f&libraries=services"></script>
<script type="text/javascript">
	var lat = $("input[name='lat']");
	var lnt = $("input[name='lnt']");
	var price = $("input[name='price']");
	var title = $("input[name='title']");
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
	console.log($(lat[0]).val());
	console.log($(lnt[0]).val());
    mapOption = { 
        center: new kakao.maps.LatLng($(lat[0]).val(), $(lnt[0]).val()), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];

for(var i=0; i<lat.length; i++){
	positions.push(
		{
			title: $(title[i]).val(),
			latlng: new kakao.maps.LatLng($(lat[i]).val(), $(lnt[i]).val())
		}		
	);
}

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].title // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>