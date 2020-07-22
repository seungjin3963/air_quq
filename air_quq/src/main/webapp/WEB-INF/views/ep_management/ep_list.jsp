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
		<form method="post" name="ManagementFrom" action="">
			<input type="hidden" name="hinum" value="${i.hinum }"
				class="ep_hinum_val"> <input type="hidden" name="sessionnum"
				value="${i.sessionnum }">
			<div class="row ep_mangement_list">

				<div class="col-md-9">
					<br>
					<div class="border-left-danger">
						&nbsp;&nbsp;상태 >
						<ep:choose>
							<ep:when test="${i.div_type==39 || i.div_type==49}">
								&nbsp;&nbsp;반 려 ㅜㅜ
							</ep:when>
							<ep:otherwise>
								&nbsp;&nbsp;등록 중
							</ep:otherwise>
						</ep:choose>
					</div>
					<br>

					<ep:if test="${i.div_type==31 || i.div_type==39}">▶ 온라인 체험</ep:if>
					<ep:if test="${i.div_type==41 || i.div_type==49}">▶ 대면 체험</ep:if>
					<br> <br>
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
					<br>
					<ep:choose>
						<ep:when test="${i.div_type==39 || i.div_type==49}">
							<p>반려 사유: ${i.reason }</p>
						</ep:when>
						<ep:otherwise>
							<p>제출하기 전에 몇가지 정보를 추가 작성하여야 합니다.</p>
						</ep:otherwise>
					</ep:choose>
					
				</div>
				<div class="col-md-3">
					<div class="ep_mangement_list_img">
						<ep:forEach var="img" items="${imgvo }">
							<ep:if test="${i.hinum==img.hinum }">
								<img src="/resources/img/house_img/${img.img }" />
							</ep:if>
						</ep:forEach>
					</div>
				</div>
			</div>
			<div class="row ep_mangement_list_btn">

				<input type="button" value="계속"
					class="btn btn-danger btn-icon-split actionA"> <input
					type="button" value="삭제"
					class="btn btn-danger btn-icon-split actionB">
			</div>

		</form>
	</ep:forEach>
</div>
	<!-- 영노 -->
	<script type="text/javascript" src="/resources/js/experience/ep_inserting.js"></script>

