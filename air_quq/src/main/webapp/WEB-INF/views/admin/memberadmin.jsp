<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 20px;">
	<h1 style="text-align: center;">회원정보</h1>
<div style="float: right;">
	<select name="memberfield" class="form-control" style="width: 120px; display: inline-block;">
		<option value="id" selected="selected">아이디</option>
		<option value="addr">주소</option>				
		<option value="email">이메일</option>
		<option value="phone">전화번호</option>
	</select>
	<input type="text" name="memberkeyword" class="form-control form-control" style="width: 200px; display: inline-block; border: none;">
</div>
	<table class="table table-striped">
	  <tr>
	  	<td>아이디</td>
	  	<td>비밀번호</td>
	  	<td>주소</td>
	  	<td>이메일</td>
	  	<td>전화번호</td>
	  	<td>성별</td>
	  	<td>카카오아이디 여부</td>
	  </tr>
	  <c:forEach var="vo" items="${ Memberlist }">
		<tr style="font-weight:bold;">
			<td>${vo.id}</td>
			<td>${vo.pwd}</td>
			<td>${vo.addr}</td>
			<td>${vo.email}</td>
			<td>${vo.phone}</td>
			<td>${vo.gender}</td>
			<c:choose>
				<c:when test="${vo.identi_kakao == 1}">
					<td>카카오아이디</td>
				</c:when>
				<c:otherwise>
					<td>일반아이디</td>
				</c:otherwise>
			</c:choose>
		</tr>	
	  </c:forEach>
	</table>
</div>