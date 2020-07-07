<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="h3 mb-4 text-gray-800">주요 주제 선택</h1>
<br>

<ep:if test="${sub=='subject' }">
	<h1>${category }</h1>
	<br>
	<ep:forEach var="i" items="${list}">

		<a
			href="/experince/ep_insert/subject?num=${i.expernum }&name=${i.subname}"
			class="btn btn-primary btn-icon-split"
			style="width: 30%; height: 70px; margin: 15px;"><div
				class="ep_sub_div">${i.subname}</div></a>

	</ep:forEach>
</ep:if>

<ep:if test="${sub=='detailsub' }">
	<a href="/experience/ep_insert/ep_type?num=3"><h1>${category }에는
			무엇이 포함되나요?</h1></a>
	<br>
	<ep:forEach var="i" items="${list}">

		<a href="#" class="btn btn-primary btn-icon-split"
			style="width: 30%; height: 70px; margin: 15px;"><div
				class="ep_sub_div">${i.subname}</div></a>

	</ep:forEach>
</ep:if>


