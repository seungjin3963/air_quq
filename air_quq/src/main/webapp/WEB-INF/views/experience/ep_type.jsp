<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Page Heading -->

<h1 class="h3 mb-4 text-gray-800">체험 유형</h1>
<div class="ep_type">
	<div id="ep_type_div">
		<h1>
			어떤 유형의 체험을 호스팅할 <br>계획이신가요?
		</h1>
		<br>
		<p>
			온라인 체험은 동영상을 통해 전 세계 어디서나 호스팅하실 수 있으며, 대면으로<br> 진행되는 체험은 특정 장소에서
			진행됩니다. <br> <br>
		</p>
		<ep:choose>
			<ep:when test="${sessionVo.div_type==31 || sessionVo.div_type==39}">
				<a href="#" class="btn btn-danger btn-icon-split" id="ep_info_type">
			</ep:when>
			<ep:otherwise>
				<a href="#" class="btn border-left-danger btn-icon-split"
					id="ep_info_type">
			</ep:otherwise>
		</ep:choose>
		<div>
			<br>
			<h5>온라인 체험</h5>
			<span>게스트는 줌 화상 회의<br>소프트웨어를 통해 온라인으로<br>체험에 참여하게
				됩니다.<br>
			</span>
		</div>
		</a>
		<ep:choose>
			<ep:when test="${sessionVo.div_type==41 || sessionVo.div_type==49}">
				<a href="#" class="btn btn-danger btn-icon-split" id="ep_info_type1">
			</ep:when>
			<ep:otherwise>
				<a href="#" class="btn border-left-danger btn-icon-split"
					id="ep_info_type1">
			</ep:otherwise>
		</ep:choose>
		<div>
			<br>
			<h5>대면으로 진행되는 체험</h5>
			<span>게스트와 현장에서 직접<br>대면하고 함께 참여하는<br>체험입니다.<br>
			</span>
		</div>
		</a> <a href="#" class="btn btn-danger btn-icon-split" id="ep_type_btn"><div>선택하기</div></a>

	</div>

</div>