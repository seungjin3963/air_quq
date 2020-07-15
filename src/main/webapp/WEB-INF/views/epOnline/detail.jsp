<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/epOnline/userapply.css" rel="stylesheet" type="text/css">
<script src="/resources/js/epOnline/userapply.js"></script>

<div class="container mt-5">
	<h1>${list2.title}</h1>
	<div class="row">
		<div class="col-md-6">
			<img src="/resources/img/1.jpg" id="bigphoto">
		</div>
		<div class="col-md-6" id="smallphoto">
			<div class="row">
				<img src="/resources/img/1.jpg">
				<img src="/resources/img/1.jpg"> 
			</div>
			<div class="row">
				<img src="/resources/img/1.jpg"> 
				<img src="/resources/img/1.jpg">
			</div>
		</div>
	</div>

	<div class="row" id="applydivision">
		<div class="col-md-11" id="usernumber">
			<span>인원 ${list2.people }</span>
		</div>

		<div class="col-md-1">
			<img src="/resources/img/1.jpg" id="applypofile">
		</div>
	</div>

	<div class="row" id="applydivision">
		<div class="col-md-3" id="applydivision">
			프로그램
		</div>
		<div class="col" id="applydivision">
			${list2.program }
		</div>
	</div>
	<div class="row" id="applydivision">
		<div class="col-md-11">
			<h3>편의 기능</h3>
			<input type="button" value="편의시설 conven 갯수" class="btn btn-danger btn-icon-split">	
		</div>
	</div>
		<!-- <div class="row" id="applydivision1">
			<div class="col-md-12" style="text-align: center;" id="usecal">
				<div id="rentdate">O박O일</div><br>
				<div>사용자가 입력한 시작날짜 - 사용자가 입력한 끝날짜</div>
				<div>인원수</div>
				<input type="button" value="수정하기" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#myModal">
			</div>
		</div> -->
	<div class="row" id="applydivision"></div>
	<div class="row" id="applydivision3">
		<div class="col-md-12">
			첫 후기를 남겨 주세요!!
		</div>
	</div>

	<!-- <div class="row" id="applydivision1">
		<div class="col-md-12">
			<div id="locationfont">위치</div>
			<div>주소</div>
			<div id="map"></div>
		</div>
	</div> -->
	<div class="row" id="applydivision4">
		<div class="col-md-12">
			<img src="/online/image?hinum=${list2.hinum }" id="applypofile">호스트 ${list2.id }<br>
			<a href="/online/dm?hinum=${list2.hinum }&memnum=${list2.memnum}&einum=${list2.einum}">
				<input type="button" value="호스트에게 연락하기" class="btn btn-danger btn-icon-split"></a>
		</div>
	</div>
</div>
<div id="quickmenu">
	<div id="quickmenulayer">
		<i class="far fa-calendar-alt fa-3x"></i><br>체크인<br>
		<input type="text" value="2020/07/19" readonly="readonly" id="checkin" class="quickmenufont">
	</div>
	<div id="quickmenulayer">
		<i class="fa fa-calendar-alt fa-3x"></i><br>체크아웃<br>
		<input type="text" value="2020/07/22" readonly="readonly" id="checkout" class="quickmenufont">
	</div>
	<div id="quickmenulayer">
		<i class="fas fa-users fa-3x"></i><br>인원수<br>
		<input type="text" value="5" readonly="readonly" id="checkcnt" class="quickmenufont">
	</div>
	<div id="quickmenulayer">
		<i class="fas fa-coins fa-3x"></i><br>총금액<br>
		<input type="text" readonly="readonly" id="summoney" class="quickmenufont">
	</div>
	<div id="quickmenulayer">
		<input type="button" value="예약하기" class="btn btn-danger btn-icon-split">
		<input type="button" value="수정하기" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#myModal">
	</div>
</div>
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
						체크인<br>
						<input type="text" id="startmodified" readonly="readonly" class="checkdate">
						<i class="far fa-calendar-alt fa-1x" id="startcal"></i>
					</div>
					<div id="mymodallayer">
						체크아웃<br>
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
						인원<br>
						<button type="button" id="manusbutton" class="usercount"><i class="fas fa-minus-circle" id="manus"></i></button>
						<input type="text" id="h-cnt" readonly="readonly">
						<button type="button" id="addbutton" class="usercount"><i class="fas fa-plus-circle" id="add"></i></button>
					</div>
					<div id="totmoney">
						일일금액<span>30000</span><br>
						숙박일<span>선택한 숙박일</span><br>
						<hr>
						총금액<span>숙박금액*숙박일</span>
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
			<div class="modal-body">
				이전 날짜 입니다.	
			</div>
			<div class="modal-footer">
				<input type="button" value="확인" class="btn btn-danger btn-icon-split" id="alertclose">
			</div>
		</div>
	</div>
</div>
