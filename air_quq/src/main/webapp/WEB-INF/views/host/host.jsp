<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ hostStep == 1 }">
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 25%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 2 }">
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 50%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 3 }">
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 75%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 4 }">
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 100%"></div>
	</div>
</c:if>
<br>
<div class="container">
	<div class="jumbotron">
		<c:if test="${ hostStep == 1 }">
			<h1 class="display-4">에어비앤비 호스트가 되어 수입을 올려보세요</h1>
			<p class="lead"></p>
			<hr class="my-4">
			<p>숙소에 대해 간략하게 알려주세요.</p>
			<form action="/host/regist/1" method="post" id="host_regist">
				<p>
					<input class="form-control form-control-lg" type="text" placeholder="주소 검색하기" id="searchPassport" name="addr" readonly="readonly">
				</p>

				<div class="row">
					<div class="col">
						<p>
							<select class="form-control form-control-lg" name="roomStatus">
								<option value="all">집 전체</option>
								<option value="privateRoom">개인실</option>
								<option value="publicRoom">다인실</option>
							</select>
						</p>
					</div>
					<div class="col">
						<p>
							<select class="form-control form-control-lg" name="clientCount">
								<option value="1">숙박인원 1명</option>
								<option value="2">숙박인원 2명</option>
								<option value="3">숙박인원 3명</option>
								<option value="4">숙박인원 4명</option>
								<option value="5">숙박인원 5명</option>
								<option value="6">숙박인원 6명</option>
								<option value="7">숙박인원 7명</option>
								<option value="8">숙박인원 8명</option>
								<option value="9">숙박인원 9명</option>
								<option value="10">숙박인원 10명</option>
							</select>
						</p>
					</div>
				</div>
				<input type="hidden" value="2" name="next"> 
				<input type="submit" class="btn btn-outline-primary" role="button" value="시작하기">
			</form>
		</c:if>
		<c:if test="${ hostStep == 2 }">
			<h1 class="display-4">집의 상세 설명을 입력해주세요.</h1>
			<p class="lead"></p>
			<hr class="my-4">
			<p>숙소에 대해 자세히 알려주세요. 숙소Home에 보여지게 됩니다.</p>
			<form action="/host/regist/2" method="post" id="host_regist2">
				<p>
					<input class="form-control form-control-lg" type="text"
						placeholder="제목" name="hostTitle">
				</p>

				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">상세내용</span>
					</div>
					<textarea class="form-control" aria-label="With textarea"
						name="hostContent" rows="16"></textarea>
				</div>
				<br> <input type="hidden" value="3" name="next"> <input
					type="submit" class="btn btn-outline-primary" role="button"
					value="다음 단계로 진행">
			</form>
		</c:if>
		<c:if test="${ hostStep == 3 }">
			<link rel="stylesheet" type="text/css" media="screen"
				href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
			<h1 class="display-4">숙소의 가격및 기타 설정</h1>
			<p class="lead"></p>
			<hr class="my-4">
			<p>일일 숙박 가격, 최대인원수, 침대개수, 체크아웃시간 입력, 시작일, 종료일</p>
			<form action="/host/regist/3" method="post" id="host_regist3">
				<div class="input-group" id="host-ig">
					<input type="text" class="col-xs-3" name="v_grade" placeholder="가격을 입력해주세요." id="host_grade" v-model="message">&nbsp;
					<div class="input-group-append">
						<span class="input-group-text">￦</span> <span class="input-group-text" id="v_grade" >{{message}} 원</span>
					</div>
				</div>
				<br>
				<hr class="my-4">
				<div class="container">
					<div class="row">
						<div class="col-sm">
							<div class="card border-primary mb-3" style="max-width: 18rem;">
								<div class="card-header">최대 숙박 인원수</div>
								<input type="hidden" name="pcount" id="hpnt" value="1">
								<div class="card-body text-primary">
									<button type="button"
										class="btn btn-outline-info rounded-circle" id="pcount_minus">-</button>
									&nbsp;&nbsp;<label id="pcount">1</label>&nbsp;&nbsp;
									<button type="button" class="btn btn-outline-info rounded-circle" id="pcount_plus">+</button>
								</div>
							</div>
						</div>
						<div class="col-sm">
							<div class="card border-primary mb-3" style="max-width: 18rem;">
								<div class="card-header">침대 개수</div>
								<input type="hidden" name="bcount" id="hbnt" value="1">
								<div class="card-body text-primary">
									<button type="button" class="btn btn-outline-info rounded-circle" id="bcount_minus">-</button>
									&nbsp;&nbsp;<label id="bcount">1</label>&nbsp;&nbsp;
									<button type="button" class="btn btn-outline-info rounded-circle" id="bcount_plus">+</button>
								</div>
							</div>
						</div>
						<div class="col-sm">
							<div class="card border-primary mb-3" style="max-width: 18rem;">
								<div class="card-header">체크아웃 시간</div>
								<div class="well">
									<div id="datetimepicker3" class="input-append" style="text-align: center;">
										<input data-format="HH:mm:ss PP" type="text" style="text-align: center; display: inline-block;" name="oclick"></input>
										 <span class="add-on"> <i data-time-icon="icon-time" data-date-icon="icon-calendar"><i class="fa fa-clock-o" aria-hidden="true"></i></i>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr class="my-4">
				<div class="container">
					<div id="app" style="display: inline-block; width: 18rem">
						<!-- 달력 모듈 -->
						<label>시작날짜:</label>
						<vuejs-datepicker :language="ko" :format="customFormatter" :disabled-dates="disabledDates" name="startDay"></vuejs-datepicker>
					</div>
					<div id="endPicker">
						<label>종료날짜:</label>
						<vuejs-datepicker :language="ko" :format="customFormatter" :disabled-dates="disabledDates" name="endDay"></vuejs-datepicker>
					</div>
					<br> <br> <input type="hidden" value="4" name="next">
					<input type="submit" class="btn btn-outline-primary" role="button" value="다음 단계로 진행">
			</form>
			<script type="text/javascript" src="/resources/js/host/host.js"></script>
			<script type="text/javascript"
				src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
				
			</script>
			<script type="text/javascript"
				src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
			</script>
		</c:if>
		<c:if test="${ hostStep == 4 }">
			<h1 class="display-4">상세 주소 및 숙소 사진 입력해주세요.</h1>
			<p class="lead">숙소에대한 상세한 주소입력</p>
			<hr class="my-4">
				<div class="form-group col-md-6">
			      <label for="detailAdress">주소</label>
			      <input type="text" class="form-control" id="searchDetail" placeholder="클릭하여 검색하기">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="detailAdress">상세 주소 입력</label>
			      <input type="text" class="form-control" placeholder="동/호 까지포함된 상세한 주소입력">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="adress">도로명 주소</label>
			      <input type="text" class="form-control" id="roadAddr">
			    </div>
			    <div class="form-group col-md-2">
			      <label for="zipcode">우편번호</label>
			      <input type="text" class="form-control" id="zipcode">
			    </div>
			    
			<hr class="my-4">
				<p class="lead">숙소 이미지를 올려주세요.</p>
				
				<br> <input type="hidden" value="4" name="next"> <input type="submit" class="btn btn-outline-primary" role="button" value="완료">
			</form>
			<script type="text/javascript" src="/resources/js/passport/passportDetail.js"></script>
		</c:if>
	</div>
</div>