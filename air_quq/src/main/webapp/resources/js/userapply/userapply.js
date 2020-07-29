$(function(){
		/* 대한민국 표준시 yyyy-mm-dd로 변경 */
		var datechange = function(datetime) {
			return datetime.toISOString().slice(0, 10);
		}
		
		// 시작일 마지막일 사이 구하는 함수
		var between=function(startdate,enddate){
			var startarr=startdate.split("/");
			var endarr=enddate.split("/");
			
			var startobj=new Date(startarr[0], Number(startarr[1])-1, startarr[2]);
			var endobj=new Date(endarr[0], Number(endarr[1])-1, endarr[2]);
			
			var betweendate=(endobj.getTime()-startobj.getTime())/1000/60/60/24;
			
			return betweendate;
		}
		
		// 퀵메뉴 총금액 뽑기
		var betweenday=between($("#checkin").val(),$("#checkout").val());
		$("#summoney").val(betweenday*Number($("#totmoney").children().eq(0).html()));
		
		//데이터 보내기
		var datasend=function(){
			var checkin=$("#checkin").val();
			var checkout=$("#checkout").val();
			var checkcnt=$("#checkcnt").val();
			var summoney=$("#summoney").val();
			
			$("#startmodified").val(checkin);
			$("#endmodified").val(checkout);
			$("#h-cnt").val(checkcnt);
			$("#totmoney").children().eq(2).text(betweenday);
			$("#totmoney").children().eq(5).text(summoney);
		}
		
		// 페이지 수정 페이지 값 채우기
		$("#usecal").children().eq(2).text($("#checkin").val()+"-");
		$("#usecal").children().eq(2).append($("#checkout").val());
		$("#usecal").children().eq(4).text($("#checkcnt").val());
		$("#usecal").children().eq(0).text(betweenday+"박"+(betweenday+1)+"일");
		
		// 눌렀을때 modal로 값 넘겨주는 것
		$("input[value='수정하기']").click(function(){
			datasend();
		})

		$("#usecal").click(function(){
			datasend();
		})

		$("#quickmenu").click(function(){
			datasend();
		})
		
		// 수정 눌렀을때 퀵메뉴, 수정페이지로 값 보내기
		$("input[value='수정']").click(function(){
			var startmodified=$("#startmodified").val();
			var endmodified=$("#endmodified").val();
			var cnt=$("#h-cnt").val();
			var totmoney=$("#totmoney").children().eq(5).text();
			
			$("#checkin").val(startmodified);
			$("#checkout").val(endmodified);
			$("#checkcnt").val(cnt);
			$("#summoney").val(totmoney);
			
			$("#usecal").children().eq(2).text(startmodified+"-");
			$("#usecal").children().eq(2).append(endmodified);
			$("#usecal").children().eq(3).text(cnt);
			var modifiedday=Number($("#totmoney").children().eq(2).text());
			$("#usecal").children().eq(0).text(modifiedday+"박"+(modifiedday+1)+"일");
			
			// 권준범
			let applyVo = {checkIn:startmodified,
							checkOut:endmodified,
							max_n:cnt,
							totmoney:totmoney};
			$.post("/user/apply/setApply",applyVo);
			
			$("#myModal").modal("hide");
		});
		
		// datepicker
		var hoststartdate=$("#hoststartdate").val().split("-");
		var hostenddate=$("#hostenddate").val().split("-");
		
		var startdatepicker=new Date(hoststartdate[0], Number(hoststartdate[1])-1, hoststartdate[2]);
		var endtdatepicker=new Date(hostenddate[0], Number(hostenddate[1])-1, hostenddate[2]);
		
		var onswitch=true;
		var tempdate;
		
		var applyday=$("#chekcdatepicker").val().split("/");
		
		$("#cal").datepicker({
			showOn: "both",
			closeText: "Close",
			numberOfMonths: [1,2],
			buttonText: "Calendar",
			dateFormat: "yy/mm/dd",
			yearSuffix: "년",
			showMonthAfterYear: true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			minDate : startdatepicker,
			maxDate: endtdatepicker,
			/*beforeShowDay:function(date){
				var check=false;
				
				var datetime=datechange(date)
				
				for (var i = 0; i < applyday.length; i++) {
					if(datetime == applyday[i]){
						check=true;
					}
				}
				
				
				if(check){
					return [false];
				}
				return [true];
			},*/
			onSelect:function(d){
				
				if(onswitch){
					$("#startmodified").val(d);
					$("#endmodified").val("");
					onswitch=false;
					tempdate=d;
				}else{
					if(tempdate<d){
						$("#endmodified").val(d);
						
						var betweendate=between(tempdate,d);
						
						$("#totmoney").children().eq(2).text(betweendate);
						
						var price=$("#totmoney").children().eq(0).text();
						var tot=Number(price)*betweendate;
						$("#totmoney").children().eq(5).text(tot);
						
						onswitch=true;
						$("#bundle").css({display: "none"});
					}else{
						$("#alert").modal();
					}
				}
			}
		});	
		
		/*house_img 이미지 변경*/
		
		var imgarr=$("#imgarr").val().split("/");
		var imgcnt=0;
		
		$("#bigphoto").prop("src","/resources/img/house_img/"+imgarr[1]);
		
		console.log(imgarr.length);
		
		setInterval(function() {
			
			$("#bigphoto").prop("src","/resources/img/house_img/"+imgarr[imgcnt]);
			
			imgcnt++;
			
			if(imgcnt == imgarr.length){
				imgcnt=0;
			}
				
		}, 1500)
		
		
		$("#bigphoto").click(function(){
			for (var i = 0; i < imgarr.length; i++) {
				$("#houseimgall").append("<img src='/resources/img/house_img/"+imgarr[i]+"' id='houseimgall'>")
			}
			$("#houseallimg").modal();
		});
		
		// 캘러리 아이콘을 눌렀을 때 달력 나오게 하기
		$("#startcal").click(function(){
			$("#bundle").css({display: "block"});	
		})

		$("#endcal").click(function(){
			$("#bundle").css({display: "block"});	
		})
		
		// 캘러리 닫기
		$("input[value='닫기']").click(function(){
			$("#bundle").css({display: "none"});
			onswitch=true;
			
			var checkin=$("#checkin").val();
			var checkout=$("#checkout").val();
			var betweendate=between(checkin,checkout);

			$("#startmodified").val(checkin);
			$("#endmodified").val(checkout);
			$("#totmoney").children().eq(2).text(betweendate);
			
		})
		
		// 이전 날짜 modal 닫기
		$("#alertclose").click(function(){
			$("#alert").modal("hide");
		});
		
		// 인원수 추가
		$("#addbutton").click(function(){
			var maxcnt=Number($("#h-cnt").val())+1
			
			if(maxcnt>10){
				$("#add").css({opacity:0.5});
				$(this).attr("disabled",true);
			}else{
				$("#h-cnt").val(maxcnt);
				$("#manusbutton").attr("disabled",false);
				$("#manus").css({opacity:1});
			}
			
			if(maxcnt==10){
				$("#add").css({opacity:0.5});
				$(this).attr("disabled",true);
			}
		}); 
		
		// 인원수 빼기
		$("#manusbutton").click(function(){
			var mincnt=Number($("#h-cnt").val())-1

			if(mincnt<1){
				$("#manus").css({opacity:0.5});
				$(this).attr("disabled",true);
			}else{
				$("#h-cnt").val(mincnt);
				$("#addbutton").attr("disabled",false);
				$("#add").css({opacity:1});
			}
			
			if(mincnt==1){
				$("#manus").css({opacity:0.5});
				$(this).attr("disabled",true);
			}
		});
	
		
	/*kakao 맵*/
	var lat=$("#lat").val();
	var lnt=$("#lnt").val();

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lnt), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(lat, lnt); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 권준범
	// 결제 API(아임포트)
	$("#btnApply").click(()=>{

		var checkin=$("#checkin").val();
		var checkout=$("#checkout").val();
		var checkcnt=$("#checkcnt").val();
		var checkcnt=$("#checkcnt").val();
		var summoney=$("#summoney").val();
		
		let applyVo = {checkIn:checkin,
				checkOut:checkout,
				max_n:checkcnt,
				totmoney:summoney};
		
		$.post("/user/apply/setApply",applyVo);
		
		location.href = "/user/applyCheck";
	});
})
