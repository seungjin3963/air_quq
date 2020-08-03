<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/resources/css/admin/statisticsadmin.css" rel="stylesheet" type="text/css">

<h1 id="fontcenter">통계</h1>
 	<ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#applycntdiv">월별 예약자수</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#hostmonthcnt">월별 호스트 등록수</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#hostmoneycnt">금액별 호스트 수</a>
	    </li>
  	</ul>
 
 <div class="tab-content">
    <div id="applycntdiv" class="container tab-pane active"><br>
		<canvas id="applycnt"></canvas>
		<input type="hidden" value="${rentcnttot }" id="applycntdata">
    </div>
    <div id="hostmonthcnt" class="container tab-pane fade"><br>
    	<canvas id="hostEnrollment"></canvas>
		<input type="hidden" value="${hostcnttot }" id="hostcntdata">
    </div>
    <div id="hostmoneycnt" class="container tab-pane fade"><br>
      <canvas id="hostonemoney"></canvas>
	  <input type="hidden" value="${houseprice }" id="houseprice">
	  <input type="hidden" value="${pricerange }" id="pricerange">
    </div>
 </div>

<script src="/resources/js/demo/chart.js/Chart.min.js"></script>
<script src="/resources/js/admin/statisticsadmin.js"></script>