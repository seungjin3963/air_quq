<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>회원정보</h1>
<table border="1">
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
	<tr>
		<td>${vo.id}</td>
		<td>${vo.pwd}</td>
		<td>${vo.addr}</td>
		<td>${vo.email}</td>
		<td>${vo.phone}</td>
		<td>${vo.gender}</td>
		<td>${vo.identi_kakao}</td>
	</tr>	
  </c:forEach>
</table>
