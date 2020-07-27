let rowIndex = 0;
houseApplyList();
function houseApplyList(){
	$("#houseNavItem").addClass("active border-bottom-danger");
	$("#expNavItem").removeClass("active border-bottom-danger");
	
	$("#houseDataTable").removeClass("d-none");
	$("#expDataTable").addClass("d-none");
	
	let table = $("#houseDataTable");
	table.find("tbody").empty();
	
	getApplyHouseList().then(function(data){
		let html = "";
		$(data).each(function(key ,value){
			let status;
			let statusBackColor;
			if(value.status == 9){
				status = "취소";
				statusBackColor = "cencelBackColor";
			}else{
				status = "예약";
				statusBackColor = "";
			}
			let startrent = datechange(new Date(value.startrent));
			let endrent = datechange(new Date(value.endrent));
			html += `<tr class="${statusBackColor}">`;
			html += `<td class="d-none">${value.rtnum }</td>`;
			html += `<td class="d-none">${value.hinum }</td>`;
			html += `<td>${value.title }</td>`;
			html += `<td>${startrent}</td>`;
			html += `<td>${endrent}</td>`;
			html += `<td>${value.status }</td>`;
			html += `<td>${value.person }</td>`;
			html += `<td>${value.pay_price }</td>`;
			html += "<td>";
			if(value.rag_yn = "n"){
				html += `<i class="fa fa-times text-danger fa-2x"></i>`;
			}else{
				html += `<i class="fa fa-check text-info fa-2x"></i>`;
			}
			html += "</td>";
			
			html += "<td>";
			let now = new Date();
			if(endrent <= now){
				html += `<a class="text-success openReviewAndGrade" href="#" data-toggle="modal" data-target="#reviewAndGradeModal" data-rtnum="${value.rtnum }" data-hinum="${value.hinum }"><i class="fa fa-thumbs-up fa-2x"></i></a>`;
			}else{
				html += `<a class="text-Secondary disable"><i class="fa fa-thumbs-up fa-2x"></i></a>`;
			}
			html += "</td>";
			html += "<td>";
			if(startrent >= now){
				html += `<a href="javascript:refundmodal(${value.rtnum })" class="text-warning"><i class="fa fa-calendar-times-o fa-2x"></i></a>`;
			}else{
				html += `<a class="text-Secondary disable"><i class="fa fa-calendar-times-o fa-2x"></i></a>`;
			}
			html += "</td>";
			html += "</tr>";
		});
		table.find("tbody").append(html);
	});
}

function getApplyHouseList(){
	return new Promise(function(resolve, reject) { 
		$.get("/user/apply/getApplyHouseList",function(data){
			resolve(data);
		});
	});
}

function datechange(datetime) {
	return datetime.toISOString().slice(0, 10);
}

function expApplyList(){
	$("#houseDataTable").addClass("d-none");
	$("#expDataTable").removeClass("d-none");
	
	$("#houseNavItem").removeClass("active border-bottom-danger");
	$("#expNavItem").addClass("active border-bottom-danger");
	
	let table = $("#expDataTable");
	table.find("tbody").empty();
	
	getApplyExpList().then(function(data){
		let html = "";
		$(data).each(function(key ,value){
			let status;
			let statusBackColor;
			if(value.status == 2){
				status = "체험";
				statusBackColor = "";
			}else if(value.status == 3){
				status = "온라인";
				statusBackColor = "";
			}else{
				status = "취소";
				statusBackColor = "cencelBackColor";
			}
			let startrent = datechange(new Date(value.startrent));
			let endrent = datechange(new Date(value.endrent));
			html += `<tr class="${statusBackColor}">`;
			html += `<td class="d-none">${value.rtnum }</td>`;
			html += `<td class="d-none">${value.hinum }</td>`;
			html += `<td>${value.title }</td>`;
			html += `<td>${startrent}</td>`;
			html += `<td>${value.status }</td>`;
			html += `<td>${value.pay_price }</td>`;
			html += "<td>";
			if(value.rag_yn = "n"){
				html += `<i class="fa fa-times text-danger fa-2x"></i>`;
			}else{
				html += `<i class="fa fa-check text-info fa-2x"></i>`;
			}
			html += "</td>";
			
			html += "<td>";
			let now = new Date();
			if(endrent <= now){
				html += `<a class="text-success openReviewAndGrade" href="#" data-toggle="modal" data-target="#reviewAndGradeModal" data-rtnum="${value.rtnum }" data-hinum="${value.hinum }"><i class="fa fa-thumbs-up fa-2x"></i></a>`;
			}else{
				html += `<a class="text-Secondary disable"><i class="fa fa-thumbs-up fa-2x"></i></a>`;
			}
			html += "</td>";
			html += "<td>";
			if(startrent >= now){
				html += `<a href="javascript:refundmodal(${value.rtnum })" class="text-warning"><i class="fa fa-calendar-times-o fa-2x"></i></a>`;
			}else{
				html += `<a class="text-Secondary disable"><i class="fa fa-calendar-times-o fa-2x"></i></a>`;
			}
			html += "</td>";
			html += "</tr>";
		});
		table.find("tbody").append(html);
	});
}

function getApplyExpList(){
	return new Promise(function(resolve, reject) {
		$.get("/user/apply/getApplyExpList", function(data){
			resolve(data);
		});
	});
}

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
	
	// 리뷰 작성 후 '리뷰 작성 여부' 아이콘 수정
	let tr = $("#dataTable tbody tr").eq(rowIndex);
	tr.children().eq(8).empty();
	
	let html = "<i class='fa fa-check text-info fa-2x'></i>";
	tr.children().eq(8).html(html);
});

$("#dataTable tbody td").click(function() {
	// 테이블 선택 row 저장
	rowIndex = $(this).parent().index();
});

function applyCancel(rtnum){
	if(confirm("선택하신 예약을 취소하시겠습니까?") === true){
		$.post("/user/apply/cencel", {rtnum}, (data) => {
			if(data === 'success'){
				alert("예약 취소 완료");
				
				// 삭제한 row(tr)에 class 추가(배경색 변경)
				let tr = $("#dataTable tbody tr").eq(rowIndex);
				tr.addClass("cencelBackColor");
				
				// 테이블의 '상태' text 수정
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

/* 승진 */

$("#refundcheck").click(function(){
	rtnum=$("#rtnumhidden").val();
});

/* 계좌 선택하기 */
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

/* 환불 모달 나오게 하기 */
function refundmodal(rtnum){
	$("#rtnumhidden").val(rtnum);
	$("#refunddata").modal();
}

/*
 * var
 * refund=function(merchant_uid,amount,reason,banknumber,accountname,accountnumber){
 * $.ajax({ "url": "http://www.myservice.com/payments/cancel", "type": "POST",
 * "contentType": "application/json", "dataType": "json", "data":
 * JSON.stringify({ "merchant_uid": merchant_uid, // 주문번호
 * "cancel_request_amount": amount, // 환불금액 "reason": reason, // 환불사유
 * "refund_holder": accountname, // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주 "refund_bank":
 * banknumber, // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
 * "refund_account": accountnumber // [가상계좌 환불시 필수입력] 환불 수령계좌 번호 }), success :
 * function(data){ console.log(data) }, error : function(request,status,error){
 * alert("code = "+request.status +" /message ="+request.responseText +
 * "/error="+error );
 * alert(merchant_uid+","+amount+","+reason+","+banknumber+","+accountname+","+accountnumber); },
 * complete : function(data){ console.log("실패했어도 출력"+data); } });
 * console.log("출력"); }
 * 
 * $("#refundcheck").click(function(){ var rtnum=$("#rtnumhidden").val(); var
 * reason=$("#rtnumhidden").next().val(); var banknumber=$("#banknumber").val();
 * var accountname=$("#accountname").val(); var
 * accountnumber=$("#accountnumber").val();
 * 
 * 
 * $.ajax({ url : "/rent/select", dataType : "json", data : {"rtnum" : rtnum,},
 * success : function(data) {
 * refund(data.merchant_uid,data.pay_price,reason,banknumber,accountname,accountnumber);
 * accesstoken(data.imp_uid,data.pay_price,reason,banknumber,accountname,accountnumber); } })
 * 
 * });
 * 
 * var
 * accesstoken=function(imp_uid,amount,reason,banknumber,accountname,accountnumber){
 * var access_token=null; $.ajax({ url: "/refund/access_token", type: "POST",
 * dataType: "json", data: ({ "imp_key": "2639303209953632", // [아임포트 관리자] REST
 * API키 "imp_secret":
 * "kZf9sSdHyBBVFUbIP6g8JEqhzCSKvM3PLiZebcVJNxFtrQchWsqF7QXGsPrXCuMnMMBXYxHM4ngwdsNa" //
 * [아임포트 관리자] REST API Secret }), success : function(data){ $.each(data,
 * function(key, value) { if(key == "response"){
 * console.log(value.access_token);
 * refunduse(imp_uid,amount,reason,banknumber,accountname,accountnumber,value.access_token); } }) },
 * error : function(request,status,error){ alert("code = "+request.status +"
 * /message ="+request.responseText + "/error="+error ); } }); }
 * 
 * var
 * refunduse=function(imp_uid,amount,reason,banknumber,accountname,accountnumber,access_token){
 * $.ajax({ url: "/refund/use", type: "POST", dataType: "json", data: ({
 * "Authorization": access_token, "reason":reason, "imp_uid": imp_uid,
 * "amount":amount, "refund_holder":accountname, "refund_bank":banknumber,
 * "refund_account":accountnumber }), success : function(data){
 * console.log(data); }, error : function(request,status,error){ alert("code =
 * "+request.status +" /message ="+request.responseText + "/error="+error ); }
 * }); }
 */

