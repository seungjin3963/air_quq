<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#hostEnrollment{
		width:1110px;
		height: 640px;
	}
	
	
</style>
<script src="/resources/js/demo/chart.js/Chart.min.js"></script>
<script src="/resources/js/demo/chart-area-demo.js"></script>

<canvas id="hostEnrollment"></canvas>
<input type="hidden" value="${hostcnttot }" id="hostcntdata">

<script>
var ctx = document.getElementById("hostEnrollment");
var hostcntdata=$("#hostcntdata").val().split("/");

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

</script>