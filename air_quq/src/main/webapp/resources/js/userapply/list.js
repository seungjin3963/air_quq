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
});

