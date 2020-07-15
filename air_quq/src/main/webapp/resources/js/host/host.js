//체크아웃 시간
for(var i=0; i<=24; i++){
	$("#checkout_clock").append(`<option>${i}</option>`);
}
for(var i=0; i<=59; i++){
	$("#checkout_min").append(`<option>${i}</option>`);
}

//최대숙박 인원수
var pcount = $("#pcount").text();
var bcount = $("#bcount").text();
pcountDisable(pcount);
bcountDisable(bcount);

$("#pcount_plus").click(function(){
	pcount++;
	pcountDisable(pcount);
	$("#pcount").text(pcount);
	console.log(pcount);
});

$("#bcount_plus").click(function(){
	bcount++;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
	console.log(bcount);
});


$("#pcount_minus").click(function(){
	pcount--;
	pcountDisable(pcount);
	$("#pcount").text(pcount);
	console.log(pcount);
});

$("#bcount_minus").click(function(){
	bcount--;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
	console.log(bcount);
});

function pcountDisable(pcount){
	if(pcount <= 1){
		$("#pcount_minus").attr("disabled", true);
	} else {
		$("#pcount_minus").attr("disabled", false);
	}
}

function bcountDisable(bcount){
	if(bcount <= 1){
		$("#bcount_minus").attr("disabled", true);
	} else {
		$("#bcount_minus").attr("disabled", false);
	}
}


//금액 숫자만 입력가능
$("#host_grade").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});