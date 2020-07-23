//신고 모달
$('#houseReportModal').on('show.bs.modal', (event) => {
	$("#btnHouseReport").prop("disabled", true);
	
	let body = $("#houseReportModalBody");
	body.empty();
	$.get("/report/selType", function(data) {
		$(data).each(function(key, value){
			let html = "";
			html += '<div class="custom-control custom-radio">';
			html += '<input type="radio" name="jb-radio" id="jb-radio-'+ value.rynum +'" class="custom-control-input">';
			html += '<label class="custom-control-label" for="jb-radio-'+ value.rynum +'">'+ value.content +'</label>';
			html += '<hr>';
			body.append(html);
		});
		let html = "";
		html += '<div class="custom-control custom-radio">';
		html += '<input type="radio" name="jb-radio" id="jb-radio-etc" class="custom-control-input">';
		html += '<label class="custom-control-label" for="jb-radio-etc">기타</label>';
		body.append(html);
		
		$("#houseReportModalBody input[type='radio']").click(function(){
			$("#btnHouseReport").prop("disabled", false);
		});
	});
});

$("#btnHouseReport").click(function(){
	
});
