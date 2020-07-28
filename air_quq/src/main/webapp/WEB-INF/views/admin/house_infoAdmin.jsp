<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/admin/Adminhouse_info.css" rel="stylesheet" type="text/css">

<script src="/resources/js/admin/Adminhouse_info.js"></script>
<div class="container" id="divmain">
	<h1 id="fontcenter">호스트가 등록한 집 목록</h1>
	<div id="selectdiv">
		<form action="/admin/house_info/list" method="post">
			<select name="field" class="form-control" id="selectoption">
				<option value="title" <c:if test="${field == 'title' }">selected="selected"</c:if>>제목</option>
				<option value="addr" <c:if test="${field == 'addr' }">selected="selected"</c:if>>주소</option>
				<option value="startdate" <c:if test="${field == 'startdate' }">selected="selected"</c:if>>시작날짜</option>
				<option value="enddate" <c:if test="${field == 'enddate' }">selected="selected"</c:if>>마지막날짜</option>
			</select> <input <c:if test="${field == 'enddate' or field == 'startdate' }"> type="date" </c:if>
				<c:if test="${field == 'title' or field == 'addr' or field == ''}"> type="text" </c:if> name="keyword" class="form-control form-control"
				id="selecttext"> <input type="submit" value="검색" class="btn btn-danger" style="width: 75px;">
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
			<th>삭제여부</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr class="hovertr">
				<td>${vo.hinum }</td>
				<td>${vo.title }</td>
				<td>${vo.addr }</td>
				<td>${vo.price }</td>
				<td>${vo.startdate }</td>
				<td>${vo.enddate }</td>
				<c:choose>
					<c:when test="${vo.del_yn == 'n'}">
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

<div id="fontcenter">
	<button id="previous" <c:if test="${pu.pageNum == 1 }">disabled="disabled"</c:if>>
		<i class="fas fa-backward"></i>
	</button>
	<div id="pagingborder">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<a href="/admin/house_info/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span id="fontred">[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/admin/house_info/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<button id="next" <c:if test="${pu.pageNum == pu.totalPageCount }">disabled="disabled"</c:if>>
		<i class="fas fa-forward"></i>
	</button>
	<input type="hidden" value="${pu.pageNum }" id="pageNum">
	<input type="hidden" value="${field }" id="fieldcopy">
	<input type="hidden" value="${keyword }" id="keywordcopy">
</div>

<div class="modal fade" id="house_infomodal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" id="modalscroll">
			<div class="modal-header">
				<h3 class="modal-title">상세보기</h3>
				<button type="button" class="close" data-dismiss="modal" class="exitbutton">X</button>
			</div>
			<div class="modal-body">
				<img src="" id="houseimg"><br>
				<label>제목</label><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>내용</label>
				<div id="contentscroll"></div>
				<label>주소</label><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>가격</label><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>침대수</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>체크인 시간</label><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>시작날짜</label><br> 
				<input type="text" readonly="readonly" class="exitbutton"><br> 
				<label>마지막날짜</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<input type="hidden">
				<div id="fontcenter">
					<button type="button" class="btn btn-danger" id="house_infoDel">삭제</button>
					<button type="button" class="btn btn-danger">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
