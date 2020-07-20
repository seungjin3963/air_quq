<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/admin/adminmember.css" rel="stylesheet" type="text/css">

<div class="container" id="divmain">
	<h1 id="fontcenter">회원정보</h1>
	<div id="selectdiv">
		<select name="field" class="form-control" id="selectoption">
			<option value="id">아이디</option>
			<option value="email">이메일</option>
		</select> <input type="text" name="keyword" class="form-control form-control" id="selecttext">
	</div>
	<table class="table table-striped">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>성별</th>
			<th>이메일</th>
			<th>카카오아이디 여부</th>
			<th>회원상태</th>
			<th>회원 프로필 사진</th>
			<th>회원 정보 상세 보기</th>
		</tr>
		<c:forEach var="vo" items="${ Memberlist }">
			<tr>
				<td>${vo.menum }</td>
				<td>${vo.id}</td>
				<td>${vo.gender}</td>
				<td>${vo.email}</td>
				<c:choose>
					<c:when test="${vo.identi_kakao == 1}">
						<td>카카오아이디</td>
					</c:when>
					<c:otherwise>
						<td>일반아이디</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${vo.del_yn == 'n'}">
						<td><input type="button" value="강퇴" class="btn btn-danger" onclick="memberexit(this)"></td>
					</c:when>
					<c:otherwise>
						<td><input type="button" value="복구" class="btn btn-danger" onclick="memberexit(this)"></td>
					</c:otherwise>
				</c:choose>
				<td><input type="button" value="프로필 보기" class="btn btn-danger" onclick="memberprofile(${vo.menum })"></td>
				<td><input type="button" value="상세보기" class="btn btn-danger" onclick="detailmodal(${vo.menum })"></td>
			</tr>
		</c:forEach>
	</table>
	<div id="fontcenter">
		<button id="previous">
			<i class="fas fa-backward"></i>
		</button>
		<div id="pagingborder">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum == i }">
						<a href="/admin/member/list?pageNum=${i}"><span id="fontred">[${i}]</span></a>
					</c:when>
					<c:otherwise>
						<a href="/admin/member/list?pageNum=${i}"><span>[${i}]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<input type="hidden" value="${pu.pageNum}" id="pageNum">
		<input type="hidden" id="fieldcopy"> 
		<input type="hidden" id="keywordcopy"> 
		<button id="next">
			<i class="fas fa-forward"></i>
		</button>
	</div>
</div>

<div class="modal fade" id="membermodal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">회원 프로필</h3>
				<button type="button" class="close" data-dismiss="modal" class="exitbutton">X</button>
			</div>
			<div class="modal-body" id="fontcenter">
				<img onerror="this.src='/resources/img/적분이_001.JPG';" id="memberimg"><br>
				<i class="fas fa-exclamation-circle fa-2x" id="photochange"></i>
				<input type="hidden" id="menumphoto"><br>
				<input type="button" value="확인" class="btn btn-danger" id="buttonsort">
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="memberdetail" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">회원 정보 상세보기</h3>
				<button type="button" class="close" data-dismiss="modal" class="exitbutton">X</button>
			</div>
			<div class="modal-body" id="medetail">
				<label>아이디</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<label>비밀번호</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<label>주소</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<label>이메일</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<label>전화번호</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<label>성별</label><input type="text" readonly="readonly" class="exitbutton"><br>
				<input type="button" value="닫기"  class="btn btn-danger" id="buttonsort">
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/admin/adminmember.js"></script>