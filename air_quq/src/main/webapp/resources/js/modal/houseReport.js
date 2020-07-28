//신고 모달
$('#houseReportModal').on('show.bs.modal', (event) => {
	$("#btnHouseReport").prop("disabled", true);
	
	let body = $("#houseReportModalBody");
	body.empty();
	$.get("/report/selType", function(data) {
		$(data).each(function(key, value){
			let html = "";
			html += '<div class="custom-control custom-radio">';
			html += '<input type="radio" name="jb-radio" id="jb-radio-'+ value.rynum +'" class="custom-control-input" value="'+ value.content +'">';
			html += '<label class="custom-control-label" for="jb-radio-'+ value.rynum +'">'+ value.content +'</label>';
			html += '<hr>';
			body.append(html);
		});
		let html = "";
		html += '<div class="custom-control custom-radio">';
		html += '<input type="radio" name="jb-radio" id="jb-radio-etc" class="custom-control-input">';
		html += '<label class="custom-control-label" for="jb-radio-etc">기타</label>';
		html += '<textarea class="form-control" rows="5" id="reportContent" disabled=true></textarea>';
		body.append(html);
		
		$("#houseReportModalBody input[type='radio']").change(function(){
			$("#btnHouseReport").prop("disabled", false);
			
			if($(this).prop("id") === "jb-radio-etc"){
				$("#reportContent").prop("disabled", false);
			}else{
				$("#reportContent").val("");
				$("#reportContent").prop("disabled", true);
			}
		});
	});
});

$("#btnHouseReport").click(function(){
	if(confirm("신고하시겠습니까?") === true){
		$("#houseReportModalBody input[type='radio']").each(function(){
			if($(this).prop("checked") === true){
				houseReportSave($(this));
				return false;
			}
		});
	}
});

function houseReportSave(target){
	let hinum = $("#hinum").val();
	let content;
	if(target.prop("id") === "jb-radio-etc"){
		let contentText = $("#reportContent").val();
		content = `기타 - ${contentText}`;
	}else{
		content = target.val();
	}
	
	$.post("/report/save",{hinum, content},function(data){
		if(data === "success"){
			alert("신고 완료");
			$("#houseReportModal").modal("hide");
		}else{
			location.href = "/error";
		}
	});
}



$('.Declaration').click(function(){
	$('#houseReportModal').modal('show');
})