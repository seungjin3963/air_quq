<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="now" value="${today }" pattern="yyyyMMdd" />
<link href="/resources/css/userapply/list.css" rel="stylesheet" type="text/css">
<div class="container">
	<div class="row text-center">
		<h1>예약 현황</h1>
	</div>
	<div class="navbar navbar-expand-lg navbar-light bg-light mb-5">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active border-bottom-danger" id="houseNavItem">
					<a class="nav-link" href="javascript:houseApplyList();">숙소</a>
				</li>
				<li class="nav-item" id="expNavItem">
					<a class="nav-link" href="javascript:expApplyList()">체험</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered" id="houseDataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th class="d-none">예약 번호</th>
						<th class="d-none">숙소 번호</th>
						<th>숙소 제목</th>
						<th>시작 날짜</th>
						<th>종료 날짜</th>
						<th>상태</th>
						<th>인원 수</th>
						<th>결제 금액</th>
						<th>리뷰 작성 여부</th>
						<th>리뷰 & 평점</th>
						<th>예약 취소</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="table table-bordered" id="expDataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th class="d-none">예약 번호</th>
						<th class="d-none">숙소 번호</th>
						<th>숙소 제목</th>
						<th>시작 날짜</th>
						<th>상태</th>
						<th>결제 금액</th>
						<th>리뷰 작성 여부</th>
						<th>리뷰 & 평점</th>
						<th>예약 취소</th>
						<th>체험 참여</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="reviewAndGradeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">리뷰 & 평점</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="rtnum">
				<input type="hidden" id="hinum">
				<div class="container">
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">청결도</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="clean">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="cleanGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">정확성</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="accuracy">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="accuracyGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">의사소통</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="commu">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="commuGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">위치</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="position">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="positionGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">체크인</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="checkin">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="checkinGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 text-center align-self-center">
							<p class="h4 mt-3">가격 대비 만족도</p>
						</div>
						<div class="col-md-5 marginAuto">
							<div class="starRev">
								<input type="hidden" value="satis">
								<span class="starR1 on">0.5</span>
								<span class="starR2 on">1.0</span>
								<span class="starR1 on">1.5</span>
								<span class="starR2 on">2.0</span>
								<span class="starR1 on">2.5</span>
								<span class="starR2 on">3.0</span>
								<span class="starR1 on">3.5</span>
								<span class="starR2 on">4.0</span>
								<span class="starR1 on">4.5</span>
								<span class="starR2 on">5.0</span>
							</div>
						</div>
						<div class="col-md-2 text-center marginAuto">
							<p class="h3 mt-3 text-danger" id="satisGrade">5.0</p>
						</div>
					</div>
					<div class="row">
						<textarea class="form-control" rows="5" id="reviewContent"></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<button class="btn btn-danger" id="btnReviewAndGradeSave">저장</button>
			</div>
		</div>
	</div>
</div>
<!-- 승진 -->
<div class="modal fade" id="refunddata" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">환불하기</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<input type="hidden" id="rtnumhidden">
					<textarea rows="10" cols="50" placeholder="환불 사유를 써주세요"></textarea>
					<br>
					<input type="checkbox" id="selectaccount">
					다른 계좌로 환불 받기
					<br>
					<div id="diffrentaccount">
						<select id="banknumber">
							<option value="03">기업은행</option>
							<option value="04">국민은행</option>
							<option value="05">외한은행</option>
							<option value="07">수협중앙회</option>
							<option value="11">농형중앙회</option>
							<option value="20">우리은행</option>
							<option value="23">sc제일은행</option>
							<option value="31">대구은행</option>
							<option value="32">부산은행</option>
							<option value="34">광주은행</option>
							<option value="37">전북은행</option>
							<option value="39">경남은행</option>
							<option value="53">한국씨티은행</option>
							<option value="71">우체국</option>
							<option value="81">하나은행</option>
							<option value="88">통합신한은행(신한,조흥)</option>
						</select>
						<div class="row">
							<div class="col-md-3">예금주</div>
							<div class="col-md-9">
								<input type="text" id="accountname">
							</div>
						</div>
						<div class="row" id="accountdiv">
							<div class="col-md-3">계좌번호</div>
							<div class="col-md-9">
								<input type="text" id="accountnumber" placeholder="숫자로만 입력해 주세요">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<button class="btn btn-danger" id="refundcheck">환불</button>
			</div>
		</div>
	</div>
</div>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="https://localhost:3000/socket.io/socket.io.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="/resources/js/userapply/list.js"></script>