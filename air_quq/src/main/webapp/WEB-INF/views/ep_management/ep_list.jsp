<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/ep_mangement.css" rel="stylesheet">
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-2">
			<h2>내 체험</h2>
		</div>
		<div class="col-md-8"></div>
		<div class="col ep_mangement">
			<a href="/experience/myexperience"
				class="btn btn-danger btn-icon-split"><div>새로운 체험 만들기</div></a>
		</div>
	</div>
	<ep:forEach var="i" items="${vo }">
		<form action="/ep_management/ep_list" method="post">
			<input type="hidden" name="hinum" value="${i.hinum }">
			<div class="row ep_mangement_list">

				<div class="col-md-9">
					<br>
					<div class="border-left-danger">
						등록 중 >
						<ep:if test="${i.div_type==31 }">온라인 체험</ep:if>
						<ep:if test="${i.div_type==41 }">대면 체험</ep:if>
					</div>
					<br>
					<h4>
						<ep:choose>
							<ep:when test="${i.title==null }">
						 체험 제목....
					</ep:when>
							<ep:otherwise>
						${i.title }
					</ep:otherwise>
						</ep:choose>
					</h4>
					<p>제출하기 전에 몇가지 정보를 추가 작성하여야 합니다.</p>
					<br>
				</div>
				<div class="col-md-3">
					<div class="ep_mangement_list_img"></div>
				</div>
			</div>
			<div class="row ep_mangement_list_btn">
				<input type="button" value="계속"
					class="btn btn-danger btn-icon-split"> <input type="button"
					value="삭제" class="btn btn-danger btn-icon-split">
			</div>
			
		</form>
	</ep:forEach>
</div>

