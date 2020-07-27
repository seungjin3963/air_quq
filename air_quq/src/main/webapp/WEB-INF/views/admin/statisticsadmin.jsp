<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#hostEnrollment{
		width: 1110px;
		height: 640px;
	}
	
	#applycnt{
		width: 1110px;
		height: 640px;
	}
	
	#hostonemoney{
		width: 1110px;
		height: 640px;
	}
	
	#fontcenter{
		text-align: center;
		margin-top: 20px;
	}
	
</style>

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

<script>
var hostEnrollment = document.getElementById("hostEnrollment");
var applycnt = document.getElementById("applycnt");
var hostonemoney = document.getElementById("hostonemoney");

var hostcntdata=$("#hostcntdata").val().split("/");
var applycntdata=$("#applycntdata").val().split("/");
var houseprice=$("#houseprice").val().split("/");
var pricerange=$("#pricerange").val().split("/");

$(".nav-tabs a").click(function(){
	$(this).tab('show');
  });

var myLineChart = new Chart(hostEnrollment, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "등록된 집 수",
      lineTension: 0,
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: hostcntdata,
    }],
  },
  options: {
	responsive: false,
	maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    }  ,
    scales: {
      xAxes: [{
        gridLines: {
          display: false,
          drawBorder: false
        }
      }] ,
      yAxes: [{
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        } 
      }],
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
    }   
  }
});

	
	var myBarChart = new Chart(applycnt, {
	  type: 'bar',
	  data: {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    datasets: [{
	      label: "예약자수",
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      data: applycntdata,
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        gridLines: {
	          display: false,
	          drawBorder: false
	        }
	      }],
	      yAxes: [{
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	  }
	});	
	
	var myPieChart = new Chart(hostonemoney, {
	  type: 'doughnut',
	  data: {
	    labels: pricerange,
	    datasets: [{
	      data: houseprice,
	      backgroundColor: ['#FF1493', '#FF46C5', '#FF1E9D', '#FF50CF', '#FF28A7', '#FF5AD9', '#FF32B1', '#FF64E3', '#FF3CBB', '#FF6EED'],
	      hoverBackgroundColor: ['#B9062F', '#CD4275', '#B91A4D', '#D24C7F', '#BE2457', '#D75689', '#2c9faf', '#C32E61', '#DC6093', '#C8386B'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
		  tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      FontSize: 15,
	      borderWidth: 0,
	      xPadding: 30,
	      yPadding: 30,
	      displayColors: false,
	      caretPadding: 10, 
	    },
	    cutoutPercentage: 0
	  },
	});


</script>
