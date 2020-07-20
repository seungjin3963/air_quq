<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="button" onclick="ep_model()"
			class="btn btn-danger btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;" value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">자기소개</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h2>좀 더 자세하게 자기소개를 해주세요.</h2>
		<br>
		<p>
			다른 사람보다 내가 이 체험을 더 잘 진행할 수 있는 이유를 설명하는 섹션입니다.<br>시간을 들여 체험 주제에
			대한 애정과 지식을 갖게 된 배경을 설명해주세요.
		</p>
		<br>
		<h6>게스트에게 자기 소개와 함께 체험 진행에 있어 나만의 특별함을 알려주세요</h6>
		<form action="/experience/ep_insert/introduce" name="intrFrom">

			<br>
			<input type="text" cols="10"
				class="form-control bg-light border-3 small"
				placeholder="게스트에게 자기 소개와 함께 체험 진행에 있어 나만의 특별함을 알려주세요" id="ep_info_intr" name="value" value="${sessionVo.intr}">
			<br>
			<p>참고: 게스트는 해당 분야의 전문가를 찾고 있습니다. 전문성 기준에 대해 자세히 알아보세요.</p>


			<div>
				<input type="button" value="선택하기" onclick="check_intr()"
					class="btn btn-danger btn-icon-split ep_botton">
			</div>

		</form>


	</div>

</div>