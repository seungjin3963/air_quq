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
	
	
</style>
<script src="/resources/js/demo/chart.js/Chart.min.js"></script>
<script src="/resources/js/demo/chart-area-demo.js"></script>
<script src="/resources/js/demo/chart-bar-demo.js"></script>

<div class="container">
		<h1 id="fontcenter">통계</h1>
		<div class="row">
			<div class="col-8">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
  						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#hostmonthcnt" role="tab"
							aria-controls="nav-home" aria-selected="true">월별 호스트 등록수</a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#applycntdiv" role="tab"
							aria-controls="nav-profile" aria-selected="false">월별 예약수</a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
							aria-controls="nav-profile" aria-selected="false">지역별 호스트 등록수</a>
					</div>
				</nav>
			</div>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="hostmonthcnt" role="tabpanel" aria-labelledby="nav-home-tab">
				<canvas id="hostEnrollment"></canvas>
				<input type="hidden" value="${hostcnttot }" id="hostcntdata">
			</div>
		</div>

		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="applycntdiv" role="tabpanel" aria-labelledby="nav-home-tab">
				<canvas id="applycnt"></canvas>
				<input type="hidden" value="${rentcnttot }" id="applycntdata">
			</div>
		</div>
	</div>
</div>
			

<script>
var ctx = document.getElementById("hostEnrollment");
var hostcntdata=$("#hostcntdata").val().split("/");
var applycntdata=$("#applycntdata").val().split("/");

console.log(hostcntdata);
var myLineChart = new Chart(ctx, {
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

var ctx = document.getElementById("applycnt");
var myBarChart = new Chart(ctx, {
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

</script>