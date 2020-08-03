<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/css/userapply/userapply.css" rel="stylesheet" type="text/css">

<!-- 카카오 맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddd2f94399ee8ea1c0cfd63741aef9b0"></script>

<script src="/resources/js/userapply/userapply.js"></script>
<input type="hidden" id="hinum" value="${infovo.hinum }">
<div class="container">
	<h1>${infovo.title }</h1>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<img src="/resources/img/적분이_001.JPG" id="bigphoto">
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row" id="applydivision">
		<div class="col-md-11" id="usernumber">
			<span>최대 인원 ${infovo.max_n }명 · 침실${infovo.bedroom }</span>
		</div>
		<div class="col-md-1">
			<img onerror="this.src='/resources/img/Hourglass.png';" src="/user/apply/memberimg?menum=${infovo.menum }" class="applypofile" id="memberprofile1">
		</div>
	</div>

	<div class="row" id="applydivision">
		<div class="col-md-12" id="housecontent">
			${infovo.content }
		</div>
	</div>
	<div class="row" id="applydivision2">
		<div class="col-md-12">
			<c:choose>
				<c:when test="${conven ne null}">
					<h3>편의 기능</h3>
					<span>${conven }</span><br>
					<input type="button" value="추가 편의 기능" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#convendetail">
				</c:when>
				<c:otherwise>
					<h3>편의 기능 없습니다.</h3>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="row" id="applydivision1">
		<div class="col-md-12" id="usecal" >
			<div id="rentdate" data-toggle="modal" data-target="#myModal">O박O일</div>
			<br>
			<div class="usercheck" data-toggle="modal" data-target="#myModal">사용자가 입력한 시작날짜 - 사용자가 입력한 끝날짜</div><br>
			<div class="usercheck" data-toggle="modal" data-target="#myModal">인원수</div><br>
			<input type="button" value="수정하기" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#myModal">
		</div>
	</div>
	<div class="row" id="applydivision3">
		<c:choose>
			<c:when test="${review ne null }">
				<div class="col-md-12">
					<div class="row">
						<div class="row" id="middlediv"><i class="fas fa-star" id="starcolor"></i>${revieavg.scoretot }점(후기 ${revieavg.reviewgradecnt }개)</div>
					</div>
					<div class="row">
						<div class="col-md-3">청결도</div><div class="col-md-3">${revieavg.clean }</div><div class="col-md-3">정확성</div><div class="col-md-3">${revieavg.accuracy }</div>
					</div>
					<div class="row">
						<div class="col-md-3">의사소통</div><div class="col-md-3">${revieavg.commu }</div><div class="col-md-3">위치</div><div class="col-md-3">${revieavg.position }</div>
					</div>
					<div class="row">
						<div class="col-md-3">체크인</div><div class="col-md-3">${revieavg.checkinscore }</div><div class="col-md-3">가격 대비 만족도</div><div class="col-md-3">${revieavg.satis }</div>
					</div>
				</div>
				<div id="middlediv">
					<input type="button" value="후기보기" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#reviewmodal">
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-md-12">첫 후기를 남겨 주세요!!</div>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="row" id="applydivision1">
		<div class="col-md-12">
			<div id="locationfont">위치</div>
			<div>${infovo.addr }</div>
			<div id="map"></div>
		</div>
	</div>
	<div class="row" id="applydivision4">
		<div class="col-md-12">
			<img onerror="this.src='/resources/img/적분이_001.JPG';" src="/user/apply/memberimg?menum=${infovo.menum }" class="applypofile" id="memberprofile2">${infovo.id }<br>
			<input type="button" value="호스트에게 연락하기" class="btn btn-danger btn-icon-split">
		</div>
	</div>
</div>
<div id="quickmenu">
	<a href="#" class="align-self-center bg-gradient-warning text-gray-900" data-toggle="modal" data-target="#houseReportModal"> 숙소 신고하기 </a>
	<br>
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<i class="far fa-calendar-alt fa-3x"></i>
		<br>
		체크인
		<br>
		<input type="text" value="${usercheck.checkIn }" readonly="readonly" id="checkin" class="quickmenufont">
	</div>
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<i class="fa fa-calendar-alt fa-3x"></i>
		<br>
		체크아웃
		<br>
		<input type="text" value="${usercheck.checkOut }" readonly="readonly" id="checkout" class="quickmenufont">
	</div>
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<i class="fas fa-users fa-3x"></i>
		<br>
		인원수
		<br>
		<input type="text" value="${usercheck.max_n }" readonly="readonly" id="checkcnt" class="quickmenufont">
	</div>
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<i class="fas fa-coins fa-3x"></i>
		<br>
		총금액
		<br>
		<input type="text" readonly="readonly" id="summoney" class="quickmenufont">
	</div>
	<div id="quickmenulayer">
		<input type="button" value="예약하기" class="btn btn-danger btn-icon-split" id="btnApply">
		<input type="button" value="수정하기" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#myModal">
	</div>
</div>
<input type="hidden" value="1">
<input type="hidden" value="${infovo.startdate }" id="hoststartdate">
<input type="hidden" value="${infovo.enddate }" id="hostenddate">
<input type="hidden" value="${chekcdatepicker }" id="chekcdatepicker">
<input type="hidden" value="${imgarr }" id="imgarr">
<input type="hidden" value="${infovo.lat}" id="lat">
<input type="hidden" value="${infovo.lnt}" id="lnt">
<%-- <input type="text" value="${review.menum }"> --%>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">예약 정보 수정</h3>
				<button type="button" class="close" data-dismiss="modal" id="modalexit">X</button>
			</div>
			<div class="modal-body" id="mymodalborder">
				<div id="calclick">
					<div id="mymodallayer">
						체크인
						<br>
						<input type="text" id="startmodified" readonly="readonly" class="checkdate">
						<i class="far fa-calendar-alt fa-1x" id="startcal"></i>
					</div>
					<div id="mymodallayer">
						체크아웃
						<br>
						<input type="text" id="endmodified" readonly="readonly" class="checkdate">
						<i class="fa fa-calendar-alt fa-1x" id="endcal"></i>
					</div>
					<div id="bundle">
						<div id="cal"></div>
						<div>
							<input type="button" value="닫기" class="btn btn-danger btn-icon-split" id="userapplybuttonOk">
						</div>
					</div>
					<div>
						인원
						<br>
						<button type="button" id="manusbutton" class="usercount">
							<i class="fas fa-minus-circle" id="manus"></i>
						</button>
						<input type="text" id="h-cnt" readonly="readonly">
						<button type="button" id="addbutton" class="usercount">
							<i class="fas fa-plus-circle" id="add"></i>
						</button>
					</div>
					<div id="totmoney">
						일일금액
						<span>${infovo.price }</span>
						<br>
						숙박일
						<span>선택한 숙박일</span>
						<br>
						<hr>
						총금액
						<span>숙박금액*숙박일</span>
					</div>
					<div id="modalbuttonOk1">
						<input type="button" value="수정" class="btn btn-danger btn-icon-split" id="modalbuttonOk2">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="alert" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">정보 확인</h3>
				<button type="button" class="close" data-dismiss="modal" id="modalexit">X</button>
			</div>
			<div class="modal-body">이전 날짜 입니다.</div>
			<div class="modal-footer">
				<input type="button" value="확인" class="btn btn-danger btn-icon-split" id="alertclose">
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="houseallimg" role="dialog" aria-labelledby="myFullsizeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">하우스 모든 사진 보기</h3>
				<button type="button" class="close" data-dismiss="modal" id="modalexit">X</button>
			</div>
			<div class="modal-body" id="houseimgall">
			</div>
			<div class="modal-footer">
				<input type="button" value="확인" class="btn btn-danger btn-icon-split" id="imgclose" >
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="convendetail" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">편의 시설</h3>
				<button type="button" class="close" data-dismiss="modal" id="modalexit">X</button>
			</div>
			<div class="modal-body">${convendetail }</div>
			<div class="modal-footer">
				<input type="button" value="확인" class="btn btn-danger btn-icon-split" id="alertclose">
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reviewmodal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">후기</h3>
				<button type="button" class="close" data-dismiss="modal" id="modalexit">X</button>
			</div>
			<div class="modal-body">
				<c:forEach var="reviewdata" items="${membernumid }">
					<div id="usecal">
						<img onerror="this.src='/resources/img/적분이_001.JPG';" src="/memberimg?menum=${ reviewdata.menum}" class="reviewmodalimg">${ reviewdata.id}<br>
						<div>${ reviewdata.content}</div>
						<br>			
					</div>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<input type="button" value="확인" class="btn btn-danger btn-icon-split" id="reviewmodalexit">
			</div>
		</div>
	</div>
</div>

