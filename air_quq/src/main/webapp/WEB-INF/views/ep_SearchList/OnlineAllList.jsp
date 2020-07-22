<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/OnlineList.css" rel="stylesheet">

<div class="OnlineList_img">
	<div id="OnLinediv1">
		<img src="/resources/img/onlineEcperience.jpeg">
		<div id="OnLinediv2">
			<h1>온라인 체험</h1>
			<h3>
				세계적으로 유명한 셰프와 함께하는 쿠킹 <br>체험 등 집에서 특별한 활동을 즐겨보세요.
			</h3>
		</div>
	</div>
	<div>
		<br> <br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md">
				<div class="onlinePageBtn"><input type="button" value="-" id="Ep_cookBtnM">&nbsp;<span id="onlinePagenum1">${cookPageUtil.pageNum }</span> / <span id="onlineTotalPage1">${cookPageUtil.totalPageCount}</span>&nbsp;<input type="button" value="+" id="Ep_cookBtnP"></div>
				<input type="hidden" value="${cookPageUtil.totalRowCount }" id="cooktotalR">
				<h2>쉐프와 함께 만드는 요리</h2>
				<br>
				<div id="CookList">
				<ep:forEach var="i" items="${CookList }">
					
				<div class="onlinecooklist">
					<div class="onlinecooklist_div">
						<input type="hidden" value="${i.hinum }">
						<img src="/resources/img/house_img/${i.img }">
						${i.subname}
						<br>
						<br>
						<h5>${i.title }</h5>
						1인당 ￦${i.price }원 부터  。${i.times } 시간<br>
						별점
						
					</div>
				</div>
					
				</ep:forEach>
				</div>
				<br>
				<br>
				<br>
				<div class="onlinePageBtn"><input type="button" value="-" id="Ep_sportBtnM">&nbsp;<span id="onlinePagenum2">${sportPageUtil.pageNum }</span> / <span id="onlineTotalPage2">${sportPageUtil.totalPageCount}</span>&nbsp;<input type="button" value="+" id="Ep_sportBtnP"></div>
				<input type="hidden" value="${sportPageUtil.totalRowCount }" id="sporttotalR">
				<h2>액티비티 스포츠</h2>
				<br>
				<div id="sportlist">
				<ep:forEach var="i" items="${sportlist }">
					
				<div class="onlinecooklist">
					<div class="onlinecooklist_div">
						<input type="hidden" value="${i.hinum }">
						<img src="/resources/img/house_img/${i.img }">
						${i.subname}
						<br>
						<br>
						<h5>${i.title } </h5>
						1인당 ￦${i.price }원 부터  。${i.times } 시간<br>
						별점
						
					</div>
				</div>			
				</ep:forEach>
				</div>
				<br>
				<br>
				<br>
				<div class="onlinePageBtn"><input type="button" value="-" id="Ep_regdateBtnM">&nbsp;<span id="onlinePagenum3">${regdatePageUtil.pageNum }</span> / <span id="onlineTotalPage3">${regdatePageUtil.totalPageCount}</span>&nbsp;<input type="button" value="+" id="Ep_regdateBtnP"></div>
				<input type="hidden" value="${regdatePageUtil.totalRowCount }" id="regdatetotalR">
				<h2>신규 등록한 온라인 체험</h2>
				<br>
				<div id="regdatelist">
				<ep:forEach var="i" items="${regdatelist }">
					
				<div class="onlinecooklist">
					<div class="onlinecooklist_div">
						<input type="hidden" value="${i.hinum }">
						<img src="/resources/img/house_img/${i.img }">
						${i.subname}
						<br>
						<br>
						<h5>${i.title } </h5>
						1인당 ￦${i.price }원 부터  。${i.times } 시간<br>
						별점
						
					</div>
				</div>			
				</ep:forEach>
				 </div>
			
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/experience/onlinelist.js"></script>