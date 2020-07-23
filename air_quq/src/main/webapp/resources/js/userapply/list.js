let rowIndex = 0;

$('.starRev span').click(function() {
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
	
	let gradeName = $(this).parent().children().eq(0).val();
	
	let grade = $(this).text();
	$(`#${gradeName}Grade`).text(grade);
	
	return false;
});

$('#reviewAndGradeModal').on('show.bs.modal', (event) => {
	let target = $(event.relatedTarget);
	let rtnum = target.data("rtnum");
	let hinum = target.data("hinum");
	
	$("#rtnum").val(rtnum);
	$("#hinum").val(hinum);
	
	$.post("/user/selReviewGrade",{rtnum,hinum},(data) => {
		$(data).each(function(key, value){
			if(value.gradeName == "content"){
				$("#reviewContent").text(value.content);
			}
			
			$(`#${value.gradeName}`).parent().parent().find("span[class^=star]").each(function(){
				if(value.grade == $(this).text()){
					return false;
				}
				if($(this).hasClass() === false){
					$(this).trigger("click");
				}
			});
		});
	});
});

$("#btnReviewAndGradeSave").click( () => {
	let vo = {rtnum:$("#rtnum").val()
			, hinum:$("#hinum").val()
			, content:$("#reviewContent").val()
			, cleanGrade:parseFloat($("#cleanGrade").text())
			, accuracyGrade:parseFloat($("#accuracyGrade").text())
			, commuGrade:parseFloat($("#commuGrade").text())
			, positionGrade:parseFloat($("#positionGrade").text())
			, checkinGrade:parseFloat($("#checkinGrade").text())
			, satisGrade:parseFloat($("#satisGrade").text())};
	$.post("/user/apply/reviewAndGradeSave", vo, (data) => {
		if(data === "success"){
			alert("리뷰 및 평점 저장 성공");
			$("#reviewAndGradeModal").modal("hide");
		}else{
			location.href = "/error";
		}
	});
	
	//리뷰 작성 후 '리뷰 작성 여부' 아이콘 수정
	let tr = $("#dataTable tbody tr").eq(rowIndex);
	tr.children().eq(8).empty();
	
	let html = "<i class='fa fa-check text-info fa-2x'></i>";
	tr.children().eq(8).html(html);
});

$("#dataTable tbody td").click(function() {
	//테이블 선택 row 저장
	rowIndex = $(this).parent().index();
});

function applyCancel(rtnum){
	if(confirm("선택하신 예약을 취소하시겠습니까?") === true){
		$.post("/user/apply/cencel", {rtnum}, (data) => {
			if(data === 'success'){
				alert("예약 취소 완료");
				
				//삭제한 row(tr)에 class 추가(배경색 변경)
				let tr = $("#dataTable tbody tr").eq(rowIndex);
				tr.addClass("cencelBackColor");
				
				//테이블의 '상태' text 수정
				tr.children().eq(5).empty();
				tr.children().eq(5).html("취소");
			}else{
				location.href = "/error";
			}
		});
	}else{
		return;
	}
}

/*승진*/

$("#refundcheck").click(function(){
	rtnum=$("#rtnumhidden").val();
});

/*계좌 선택하기*/
$("#selectaccount").change(function(){
	var check=$(this).prop("checked");
	if(check){
		$("#diffrentaccount").css('display','block');
	}else{
		$("#accountname").val("");
		$("#accountnumber").val("");
		$("#diffrentaccount").css('display','none');
	}
})

/*환불 모달 나오게 하기*/
function refundmodal(rtnum){
	$("#rtnumhidden").val(rtnum);
	$("#refunddata").modal();
}

var refund=function(merchant_uid,amount,reason,banknumber,accountname,accountnumber){
	$.ajax({
	    "url": "http://www.myservice.com/payments/cancel",
	    "type": "POST",
	    "contentType": "application/json",
	    "data": JSON.stringify({
	      "merchant_uid": merchant_uid, // 주문번호
	      "cancel_request_amount": amount, // 환불금액
	      "reason": reason // 환불사유
	      "refund_holder": accountname, // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
	      "refund_bank": banknumber // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
	      "refund_account": accountnumber // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
	    }),
	    "dataType": "json"
	  });
	}
}

$("#refundcheck").click(function(){
	var rtnum=$("#rtnumhidden").val();
	var reason=$("#rtnumhidden").next().val();
	var banknumber=$("#banknumber").val();
	var accountname=$("#accountname").val();
	var accountnumber=$("#accountnumber").val();

	
	$.ajax({
		url : "/rent/select",
		dataType : "json",
		data : {"rtnum" : rtnum,},
		success : function(data) {
			/*refund(data.merchant_uid,data.pay_price,reason,banknumber,accountname,accountnumber);*/
		}
	})
	
});
