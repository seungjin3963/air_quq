<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 20px;">
	<h1 style="text-align: center;">회원정보</h1>
<div style="float: right;">
	<select name="field" class="form-control" style="width: 120px; display: inline-block;">
		<option value="id">아이디</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="keyword" class="form-control form-control" style="width: 200px; display: inline-block;">
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
			<td>${vo.menum }</td>
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
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<a href="/admin/member/list?pageNum=${i}"><span style="color: red;">[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<span><a href="/admin/member/list?pageNum=${i}">[${i}]</a></span>
				</c:otherwise>
			</c:choose>
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
	
	$("input[name='keyword']").keyup(function() {
		var fielddata=$("select[name='field']").val();
		var keyworddata=$("input[name='keyword']").val();
		
	$.ajax({
		url:"/json/memberlistfind",
		dataType:"json",
		data:{"keyword":keyworddata,"field":fielddata},
		success:function(data){
		 	$.each(data,function(key,value){
		 		if(key == "Memberlist"){
			 		var kakaocheck;
			 		for (var i = 0; i < 10; i++) {
				 		$("tr").first().next().remove();
					}
				 	for (var i = 0; i < value.length; i++) {
						if(value[i].identi_kakao == 1){
								kakaocheck="카카오아이디";
							}else{
								kakaocheck="일반아이디";
							}
				 			$("table").append("<tr><td>"+value[i].menum+"</td><td>"+value[i].id+"</td><td>"+value[i].pwd+"</td><td>"+value[i].email+"</td><td>"+value[i].gender+"</td><td>"+kakaocheck+"</td></tr>")
						}
			 		}
				}) 
			}
		})
	})
	
	var postSend=function (path,field,keyword){
		var form= document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", path);
		
		var hiddenfield=document.createElement("input");
		hiddenfield.setAttribute("type", "hidden");
		hiddenfield.setAttribute("name", "field");
		hiddenfield.setAttribute("value", field);

		var hiddenkeyword=document.createElement("input");
		hiddenkeyword.setAttribute("type", "hidden");
		hiddenkeyword.setAttribute("name", "keyword");
		hiddenkeyword.setAttribute("value", keyword);
		
		form.appendChild(hiddenfield);
		form.appendChild(hiddenkeyword);
		
		document.body.appendChild(form);
		form.submit();
	}
</script>