<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="button" onclick="ep_model()"
			class="btn btn-danger btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;" value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">게스트 준비물</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h2>게스트가 챙겨야 할 준비물 추가하기</h2>
		<br>
		<p>
			체험 진행 중에 필요한 사항을 설명하면 게스트가 체험 예약 여부를 결정하는 데 <br>도움이 되며, 에어비앤비가
			제출된 체험을 평가하는 데도 도움이 됩니다. 따라서 <br>가능하면 자세히 설명해 주세요. 체험이 검토 절차를
			통과하지 못하는 흔한 이유 중의 하나가 불충분한 설명 때문입니다.<br> <br> 체험이 게시되고 예약을
			받으면, 게스트가 체험 액티비티를 준비할 수 있도록 여기에 입력하신 정보가 게스트에게 이메일로 전달됩니다.
		</p>
		<p>한 번에 하나씩 추가하거나 비슷한 항목을 함께 묶으세요.</p>
		<form action="/experience/ep_insert/materials">
			<ep:forEach var="i" items="${ep_mater}">
				<div><i class='fas fa-times ep_mater_icon'></i><br><input type='text' class='form-control bg-light border-0 small ep_mater_ic' name='value' value="${i }" placeholder='여기에 항목을 입력하세요'><br></div>
			</ep:forEach>
			<div></div>
			<div id="materials_div1"></div>
			
			<a href="#" id="materials_div">+ 항목 추가하기</a><br>
			<br>
			<br>
			<div>
				<input type="submit" value="선택하기"
					class="btn btn-danger btn-icon-split" id="ep_type_mater">
			</div>
		</form>
	</div>

</div>