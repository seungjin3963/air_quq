<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="button" onclick="ep_model()"
	class="btn btn-danger btn-icon-split"
	style="float: right; width: 8%; height: 30px; margin-right: 10px;"
	value="나가기">
<h1 class="h3 mb-4 text-gray-800">사진 추가</h1>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col">
		
		<h2>체험에 사진을 추가해보세요</h2>
		<p>
			이 이미지는 체험 페이지 맨 위에 게시됩니다. 그러니 멋진 첫인상을 남길 수 있도록 <br>최대한 고품질의 사진을
			올려주세요. 언제든 되돌아가서 변경하실 수 있습니다.
		</p>
		<br>
	<!--  <input type="file" name="" style="display: none;" id="inp-imgplus"
			accept=".gif, .jpg, .png"> -->	
		<h5>커버 사진</h5>
		<p>체험의 특징을 잘 보여주는 사진을 1장 고르세요. 게스트가 체험을 검색할 때 첫인상을 결정하는 사진입니다.</p>
		
		
		<form action="/ep/modalImg" enctype="multipart/form-data" method="post" name="InsertImgFrom">
		<div class="col-md-7 ep_file_label">
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==1}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png"> <br>
		<br>
		<br>
		<h5>갤러리 사진</h5>
		<div>미디어 갤러리에 올릴 고화질 사진을 6장 이상 업로드하세요.><i class="fas fa-plus-circle fa-4x fileinsertBtn" ></i><br><span id="fileinsertspan">사진 추가</span></div>
		<br>
		<br>
		<div class="col-md-7 ep_file_label"> <!-- 1 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==2}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
		
		<div class="col-md-7 ep_file_label"> <!-- 2 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==3}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
			
		<div class="col-md-7 ep_file_label"> <!-- 3 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==4}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
			
		<div class="col-md-7 ep_file_label"> <!-- 4 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==5}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
			
		<div class="col-md-7 ep_file_label"> <!-- 5 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==6}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
			
		<div class="col-md-7 ep_file_label"> <!-- 6 -->
			<ep:forEach var="i" items="${epimglist }">
				<ep:if test="${i.ordernum==7}">
					<img src="/resources/img/house_img/${i.img }" name='srcvalue'>
				</ep:if>
			</ep:forEach>
			<ep:if test="${empty epimglist }">
					<img src="/resources/css/images/defaultImg.jpg">
			</ep:if>
		</div>
		<input type="file" name="EpImgfile" style="display: none;" class="inp-img"
			accept=".gif, .jpg, .png">
			<!--     appendChild      -->
	
	</div>
	</form>
	
	
	<div class="col-md-3"></div>
</div>
<br>
<br>
<div class="row">
<input type="button" value="제출하기" onclick="ep_insert_intr()"
	class="btn btn-danger btn-icon-split" id="ep_imgbtn">
</div>



<script>
	
</script>