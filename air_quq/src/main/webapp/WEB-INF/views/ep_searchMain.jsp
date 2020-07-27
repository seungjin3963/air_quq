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
	<c:forEach items="${ hostSearch }" var="hitem">
	<a href="/" onclick='submitPostData(event)'>
	<form action="/user/apply?pageNum=1" method="post" class="formId2">
	<input type="hidden" value="${ addr }" name="addr">
	<input type="hidden" value="${ day }" name="day">
	<input type="hidden" value="${ cnt }" name="cnt">
        <div class="media">
              <img class="d-flex align-self-start" src="/resources/img/house_img/${ hitem.img }">
              <div class="media-body pl-3">
                <div class="price">￦${ hitem.price }원<small>${ hitem.addr }</small></div>
                <div class="address">${ hitem.addr_detail }</div>
                <div class="titlw"><big>${ hitem.title }</big></div>
                <div type="hidden" value="${ hitem.addr_detail }" id="locationAdress"></div>
                <div class="stats">
                    <span><i class="fa fa-users" aria-hidden="true"></i>${ hitem.max_n }</span>
                    <span><i class="fa fa-calendar" aria-hidden="true"></i>${ hitem.startdate } ~ ${ hitem.enddate }</span>
                </div>
              </div>
            </div>
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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    


function submitPostData(event){
	event.preventDefault();
	$(".formId2").submit();
}
</script>