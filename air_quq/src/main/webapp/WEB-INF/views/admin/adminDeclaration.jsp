<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <br>
    <br>
<div class="container">
	<h1 id="fontcenter">신고 목록</h1>
	<br>
	<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">신고 번호</th>
						<th scope="col">신고 회원</th>
						<th scope="col">나쁜놈 번호</th>
						<th scope="col">내 용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${reportVo }">
						<tr>
						<td>${i.rpnum }</td>
						<td>${i.menum }</td>
						<td>${i.hinum }</td>
						<td>${i.content }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
