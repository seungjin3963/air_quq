$(function(){
/* paging button 페이지 이동으로 처리 */
	$("#next").click(function() {
				var pagenum = $("#pageNum").val();
				var fieldcopy=$("#fieldcopy").val();
				var keywordcopy=$("#keywordcopy").val();

				location.href = "/admin/house_info/list?pageNum="
						+ (Number(pagenum) + 1) +"&field="+fieldcopy+"&keyword="+keywordcopy;
			});

	$("#previous").click(function() {
				var pagenum = $("#pageNum").val();
				var fieldcopy=$("#fieldcopy").val();
				var keywordcopy=$("#keywordcopy").val();
				
				location.href = "/admin/house_info/list?pageNum="
						+ (Number(pagenum) - 1) +"&field="+fieldcopy+"&keyword="+keywordcopy;
			});

	/* 검색창 type 변경 */
	$("#selectoption").change(function() {
		var option = $(this).val();

		if (option == 'startdate' || option == 'enddate') {
			$("#selecttext").prop("type", "date");
		} else {
			$("#selecttext").prop("type", "text");
		}
		$("#selecttext").val("");
	});

	/* 대한민국 표준시 yyyy-mm-dd로 변경 */
	var datechange = function(datetime) {
		return datetime.toISOString().slice(0, 10);
	}

	/* 상세정보 modal 나오게 하기 */
	$(".hovertr").click(function() {
		var hinum = $(this).children().eq(0).html();

		$.get("/json/houseone", {
			"hinum" : hinum
		}, function(data) {
			$.each(data, function(key, value) {
				if (key == "houseimg") {
					$(".modal-body").children().eq(0).prop("src", "/resources/img/house_img/"+value.houseimg);
				}
				if (key == "vo") {
					var starttemp = new Date(value.startdate);
					var endtemp = new Date(value.enddate);

					var startdate = datechange(starttemp);
					var enddate = datechange(endtemp);
					
					$(".modal-body").children().eq(4).val(value.title);
					$(".modal-body").children().eq(7).text(value.content);
					$(".modal-body").children().eq(10).val(value.addr);
					$(".modal-body").children().eq(12).val(value.addr_detail);
					$(".modal-body").children().eq(16).val(value.price);
					$(".modal-body").children().eq(20).val(value.bedroom);
					$(".modal-body").children().eq(24).val(value.checkin_time);
					$(".modal-body").children().eq(28).val(startdate);
					$(".modal-body").children().eq(32).val(enddate);
					$(".modal-body").children().eq(34).val(value.hinum);
				}

			});

		}, "json")

		$("#house_infomodal").modal();
	});
	
	/* house_info data 삭제하기 */
	$("#house_infoDel").click(function(){
		var hinum=$(".modal-body").children().eq(34).val();
		console.log(hinum);
	});
	
	/* 호스트 집 목록 모달 닫기 */
	$("#house_infoDel").next().click(function(){
		$("#house_infomodal").modal("hide");
	});
});