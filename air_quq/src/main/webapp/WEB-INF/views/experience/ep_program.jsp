<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a href="#"
			class="btn btn-primary btn-icon-split" style="float:right; width: 8%; height:30px;"><div>저장 </div></a>
<a href="#"
			class="btn btn-primary btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;"><div>나가기</div></a>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">프로그램</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h2>체험에서 할 활동 소개</h2>
		<br>
		<p>체험 설명을 잘 작성하면 게스트의 예약과 참여를 유도할 수 있습니다. 게스트를 위해 세심하게 고안한 체험 일정의
			자세한 내용을 알려주세요.</p>
		<br>
		<h6>체험을 처음부터 끝까지 실제 진행 순서대로 설명해 주세요</h6>
		<form action="/experience/ep_insert/program" name="programFrom">
			<br>
			<input type="text" cols="10"
				class="form-control bg-light border-0 small"
				id="ep_info_program" name="value" value="${ep_pro}"> 
			<br>
			<p>참고: 게스트는 혼자서는 접하기 힘든 장소나 활동을 경험할 수 있는 특별한 체험을 찾습니다. 특별한 기회 기준에
				대해 자세히 알아보세요.</p>


			<div>
				<input type="button" value="선택하기" onclick="check_program()"
					class="btn btn-primary btn-icon-split" id="ep_type_materials">
			</div>
		</form>
	</div>


</div>