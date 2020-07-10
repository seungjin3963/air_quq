<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="button" onclick="ep_model()"
			class="btn btn-danger btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;" value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">가격 및 이용시간</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h2>클래스 가격을 설정해 주세요.</h2>
		<br>
		<p>1인당 클래스를 이용시 발생 되는 비용으로 합리적인 비용은 많은 <br>체험자들의 관심을 얻을수 있습니다.</p>
		<form action="/experience/ep_insert/price_time" name="price_timeFrom">
		<br> <input type="text" cols="10"
			class="form-control bg-light border-3 small"
			placeholder="평균 25.000원" name="price" value="${ep_price }"> <br>
		<h2>클래스 이용 시간</h2>
		<br>
		<p>해당 체험 및 클래스를 이용하는데에 걸리는 시간을 설정해주세요.</p><br>
		<fieldset >
			<legend>선택</legend>
			<br>
			
			<input type="checkbox" name="ep_fiedset" value="2" <ep:if test="${ep_fiedset==2 }">checked="checked"</ep:if> onclick="doOpenCheck(this);">&nbsp; 2시간
			<input type="checkbox" name="ep_fiedset" value="3" <ep:if test="${ep_fiedset==3 }">checked="checked"</ep:if> onclick="doOpenCheck(this);">&nbsp; 3시간
			<input type="checkbox" name="ep_fiedset" value="5" <ep:if test="${ep_fiedset==5 }">checked="checked"</ep:if> onclick="doOpenCheck(this);">&nbsp; 5시간
			<input type="checkbox" name="ep_fiedset" value="6" <ep:if test="${ep_fiedset==6 }">checked="checked"</ep:if> onclick="doOpenCheck(this);">&nbsp; 5시간 이상
		</fieldset>
		<div>
				<input type="button" value="선택하기" onclick="check_price_time()"
					class="btn btn-danger btn-icon-split ep_botton">
			</div>
		</form>
	</div>

</div>