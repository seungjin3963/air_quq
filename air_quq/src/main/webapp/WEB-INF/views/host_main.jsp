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
	<form action="/user/apply" method="post" id="formId">
	
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
<script type="text/javascript" src="/resources/js/kakao_map/hostSearch_loadmap.js"></script>
<script type="text/javascript">
	function submitPostData(event){
		event.preventDefault();
		$("#formId").submit();
	}
</script>