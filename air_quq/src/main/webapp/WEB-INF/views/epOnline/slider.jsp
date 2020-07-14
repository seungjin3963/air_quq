<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 

<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
<link rel="stylesheet" href="/resources/css/slider.css"> 
<script src="/resources/js/epOnline/slider.js"></script> 

<div class="home__slider"> 
    <div class="bxslider" style="width: 1358px; height: 583px;"> 
        <div>
        	<table>
		        <c:forEach var="img" items="${list1 }">
		        	<tr>
		        		<a href="/online/details?einum=${img.outslider.einum }"><img src="${img.outslider.img }"></a>
		        	</tr>
		        	<tr>
		        		${img.outslider.loc }
		        	</tr>
		        	<tr>
		        		${img.outslider.title }
		        	</tr>
		        	<tr>
		        		1인당 ${img.outslider.price }원 ,${img.outslider.times }시간
		        	</tr>
		        	<tr>
		        		별 ${img.outslider.score }
		        	</tr>
		        </c:forEach>
		        	<tr>보기(<c:out value="${list1.outslider.total }"></c:out>)</tr>
	        </table>
        </div>
    </div> 
</div> 


