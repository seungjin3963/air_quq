Date.prototype.toDateInputValue = (function() {
    var local = new Date(this);
    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
    return local.toJSON().slice(0,10);
});

let today = new Date().toDateInputValue();
let startdate = $("#startdate").val();
let enddate = $("#enddate").val();
if(startdate == ""){
	$("#startdate").val(today);
}
if(enddate == ""){
	$("#enddate").val(today);
}

$("#startdate").change(function(e) {
	if ($(this).val() > $("#enddate").val()) {
		alert("시작일이 종료일보다 더 큽니다.");
		$(this).val($("#enddate").val());
	}
});
