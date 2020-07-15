<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 20px;">
	<h1 style="text-align: center;">회원정보</h1>
<div style="float: right;">
	<select name="field" class="form-control" style="width: 120px; display: inline-block;">
		<option value="id" selected="selected">아이디</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="keyword" class="form-control form-control" style="width: 200px; display: inline-block; border: none;">
</div>
	<table class="table table-striped">
	  <tr>
	  	<td>회원번호</td>
	  	<td>아이디</td>
	  	<td>비밀번호</td>
	  	<td>이메일</td>
	  	<td>성별</td>
	  	<td>카카오아이디 여부</td>
	  </tr>
	  <c:forEach var="vo" items="${ Memberlist }">
		<tr style="font-weight:bold;">
			<td>${ vo.memun }</td>
			<td>${vo.id}</td>
			<td>${vo.pwd}</td>
			<td>${vo.email}</td>
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
	<div style="text-align: center;">
		<button id="previous" style="border: none; outline: none; background: none">
			<i class="fas fa-backward"></i>
		</button>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }" >
			<span><a href="/admin/member/list?pageNum=${i}">[${i}]</a></span>
		</c:forEach>
		<button id="next" style="border: none; outline: none; background: none">
			<i class="fas fa-forward"></i>
		</button>
	</div>
</div> 
<script>
	if(${pu.pageNum} == 1){
		$("#previous").attr('disabled',true);
	}else{
		$("#previous").attr('disabled',false);
	};
	
	if(${pu.pageNum} == ${pu.totalPageCount}){
		$("#next").attr('disabled',true);
	}else{
		$("#next").attr('disabled',false);
	};
	
	$("#previous").click(function(){
		location.href="/admin/member/list?pageNum=${pu.pageNum-1}";
	});

	$("#next").click(function(){
		location.href="/admin/member/list?pageNum=${pu.pageNum+1}";
	});
	
	$("input[name='memberkeyword']").change(function(){
		
	})
</script>