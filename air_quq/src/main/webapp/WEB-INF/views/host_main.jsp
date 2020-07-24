<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	h2{float:left; width:100%; color:#fff; margin-bottom:40px; font-size: 14px; position:relartive; z-index:3; margin-top:30px}
	h2 a{color:#fff; font-weight:bold;}
	.search-box{width:95%; margin:0 auto 40px; box-shadow:20px 20px 0 rgba(0,0,0,0.2);}
	.listing-block{background:#fff; height:750px; padding-top:20px; overflow-y:scroll;}
	.media {background:#fff; position:relative; margin-bottom:15px;}
	.media img{width:200px;margin:0; height:136px;}
	.media-body{border:1px solid #bcbcbc; border-left:0; height:136px;}
	.media .price{float:left; width:100%; font-size:30px;font-weight:600; color:#4765AB;}
	.media .price small{display:block; font-size:17px; color:#232323;}
	.media .stats{float:left; width:100%; margin-top:10px;}
	.media .stats span{float:left; margin-right:10px; font-size:15px;}
	.media .stats span i{margin-right:7px; color:#4765AB;}
	.media .address{float:left; width:100%;font-size:14px; margin-top:5px; color:#888;}
	.media .fav-box{position:absolute; right:10px; font-size:20px; top:4px; color:#E74C3C;}
</style>
<div class="clearfix"></div>
<section class="search-box">
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-5 listing-block">
<!--//////////  -->
	<c:forEach items="${ hostSearch }" var="hitem">
	<a href="/user/apply" onclick='submitPostData(event)'>
	<form action="/user/apply" method="post" class="formId">
	
	<input type="hidden" value="${ hitem.addr_detail }" name="addr_detail">
	<input type="hidden" value="${ hitem.lat }" name="lat">
	<input type="hidden" value="${ hitem.lnt }" name="lnt">
	<input type="hidden" value="${ hitem.hinum }" name="hinum">
	<input type="hidden" value="${ start_day }" name="stary_day">
	<input type="hidden" value="${ end_day }" name="end_day">
	<input type="hidden" value="${ people_count }" name="people_count">
        <div class="media">
            <div class="fav-box"><i class="fa fa-heart-o" aria-hidden="true"></i>
		</div>
              <img class="d-flex align-self-start" src="/resources/img/house_img/${ hitem.img }">
              <div class="media-body pl-3">
                <div class="price">￦${ hitem.price }원<small>${ hitem.addr }</small></div>
                <div class="address">${ hitem.addr_detail }</div>
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
   <!--//////////  -->
     
		</div>
		<div class="col-md-7 map-box mx-0 px-0">
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
	</div>
</div>
<%-- <input type="hidden" value="${ hostSearch.hinum }" id="locationAdress"> --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=406ad69f366b925b30509f2bc766e47f&libraries=services"></script>
<!-- <script type="text/javascript" src="/resources/js/kakao_map/hostSearch_loadmap.js"></script> -->
<script type="text/javascript">
	var lat = $("input[name='lat']");
	var lnt = $("input[name='lnt']");
	var addr_detail = $("input[name='addr_detail']");
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
	console.log($(lat[0]).val());
	console.log($(lnt[0]).val());
    mapOption = { 
        center: new kakao.maps.LatLng($(lat[0]).val(), $(lnt[0]).val()), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

for(var i=0; i<lat.length; i++){
	
}
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    
];

for(var i=0; i<lat.length; i++){
	positions.push(
		{
			title: $(addr_detail[i]).val(),
			latlng: new kakao.maps.LatLng($(lat[i]).val(), $(lnt[i]).val())
		}		
	);
}

//console.log("loc : " + positions[0].title);

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>