<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/admin/AdmainExperience_info.css" rel="stylesheet" type="text/css">
    <br>
<div class="container">
	<h1 id="host_ep_font">호스트가 등록한 체험 목록</h1>
	<div id="host_ep_div">
		<form action="/admin/ep_info/list" method="post" >
			<input type="submit" value="검색" class="btn btn-danger host_ep_btn">
			<input type="text" name="keyword" class="form-control form-control host_ep_text">
			<select name="field" class="form-control" id="host_ep_select">
				<option value="title" >제목</option>
				<option value="addr">주소</option>
			</select> 
		</form>
	</div>
	<br>
	<br>
	
	<table class="table table-striped">
		<tr>
			<th>등록된 집 번호</th>
			<th>체험 유형</th>
			<th>제목</th>
			<th>주소</th>
			<th>가격</th>
			<th>진행 시간</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach var="i" items="${experience_infolist }">
			<tr class="hovertr">
				<td>${i.hinum }</td>
				<c:choose>
					<c:when test="${i.div_type==3 }">
						<td>온라인 체험</td>
					</c:when>
					<c:otherwise>
						<td>대면 체험</td>
					</c:otherwise>
				</c:choose>
				<td>${i.title }</td>
				<td>${i.loc }</td>
				<td>${i.price }</td>
				<td>${i.times }</td>
				<c:choose>
					<c:when test="${i.del_yn == 'n'}">
						<td>일반</td>
					</c:when>
					<c:otherwise>
						<td>삭제</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	
</div>