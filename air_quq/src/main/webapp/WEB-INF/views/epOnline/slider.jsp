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
		        		<a href="/online/details?einum=${img.hinum }"><img src="${img.img }"></a>
		        	</tr>
		        	<tr>
		        		${img.loc }
		        	</tr>
		        	<tr>
		        		${img.title }
		        	</tr>
		        	<tr>
		        		1�몃�� ${img.price }�� ,${img.times }��媛�
		        	</tr>
		        	<tr>
		        		蹂� ${img.score }
		        	</tr>
		        </c:forEach>
	        </table>
        </div>
    </div> 
</div> 


