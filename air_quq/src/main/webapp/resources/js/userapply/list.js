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
		$("#reviewContent").text(data.content);
		
		$(data).each(function(key, value){
//			if(value.gradeName === "cleanGrade"){
//				$("#cleanGrade").parent().parent().find("span").each(function(){
//					if(value.grade == $(this).text()){
//						return false;
//					}
//					if($(this).hasClass() === false){
//						$(this).trigger("click");
//					}
//				});
//			}
			$(`#${value.gradeName}`).parent().parent().find("span").each(function(){
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

$('#reviewAndGradeModal').on('hidden.bs.modal', function () {
	$("#reviewContent").val("");
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
			console.log(data);
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