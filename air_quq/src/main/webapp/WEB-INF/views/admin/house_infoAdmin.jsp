<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	/* 최상의 div 위로 올리기 */
	#divmain {
		margin-top: 20px;
	}
	/* 글자 가운데 */
	#fontcenter{
		text-align: center;
	}
	/* 검색 */
	#selectdiv {
		float: right;
		margin-bottom: 10px;
	}

	#selectoption {
		width: 120px;
		display: inline-block;
	}

	#selecttext {
		width: 200px;
		display: inline-block;
	}
	
	/* 이전, 다음 버튼 */	
	#previous, #next {
		border: none;
		outline: none;
		background: none;
		text-align: center;
	}
	
	/* 페이징 숫자 정렬 */
	#pagingborder {
		display: inline-block;
	}
	
	#fontred {
		color: red;
	}
	
	#hovertr:hover{
		background-color: #cfd1d6;
	}
</style>
<div class="container" id="divmain">
	<h1 id="fontcenter">호스트가 등록한 집 목록</h1>
	<div id="selectdiv">
		<form action="/admin/house_info/list" method="post">
			<select name="field" class="form-control" id="selectoption">
				<option value="title">제목</option>
				<option value="addr">주소</option>
				<option value="startdate">시작날짜</option>
				<option value="enddate">마지막날짜</option>
			</select> <input type="text" name="keyword" class="form-control form-control" id="selecttext">
			<input type="submit" value="검색" class="btn btn-danger" style="width: 75px;"> 
		</form>
	</div>
	<table class="table table-striped">
		<tr>
			<th>등록된 집 번호</th>
			<th>제목</th>
			<th>주소</th>
			<th>가격</th>
			<th>시작날짜</th>
			<th>마지막날짜</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr id="hovertr">
				<td>${vo.hinum }</td>
				<td>${vo.title }</td>
				<td>${vo.addr }</td>
				<td>${vo.price }</td>
				<td>${vo.startdate }</td>
				<td>${vo.enddate }</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="fontcenter">
		<button id="previous">
			<i class="fas fa-backward"></i>
		</button>
		<div id="pagingborder">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum == i }">
						<a href="/admin/house_info/list?pageNum=${i}"><span id="fontred">[${i}]</span></a>
					</c:when>
					<c:otherwise>
						<a href="/admin/house_info/list?pageNum=${i}"><span>[${i}]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<button id="next">
			<i class="fas fa-forward"></i>
		</button>
</div>