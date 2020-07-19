//체크아웃 시간
/*for (var i = 0; i <= 23; i++) {
	$("#checkout_clock").append(`<option>${i}</option>`);
}
for (var i = 0; i <= 59; i++) {
	$("#checkout_min").append(`<option>${i}</option>`);
}*/

//최대숙박 인원수
var pcount = $("#pcount").text();
var bcount = $("#bcount").text();
pcountDisable(pcount);
bcountDisable(bcount);

$("#pcount_plus").click(function () {
	pcount++;
	pcountDisable(pcount);
	$("#pcount").text(pcount);
	$("#hpnt").val(pcount);
});

$("#bcount_plus").click(function () {
	bcount++;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
	$("#hbnt").val(bcount);
});


$("#pcount_minus").click(function () {
	pcount--;
	pcountDisable(pcount);
	$("#pcount").text(pcount);
	$("#hpnt").val(pcount);
});

$("#bcount_minus").click(function () {
	bcount--;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
	$("#hbnt").val(bcount);
});

function pcountDisable(pcount) {
	if (pcount <= 1) {
		$("#pcount_minus").attr("disabled", true);
	} else {
		$("#pcount_minus").attr("disabled", false);
	}
}

function bcountDisable(bcount) {
	if (bcount <= 1) {
		$("#bcount_minus").attr("disabled", true);
	} else {
		$("#bcount_minus").attr("disabled", false);
	}
}
// //////////////////////////////////////////////////////////////////////////////////////////////////////////
//유효성 체크

function checkFromRegist3(){
	//공백 체크
	var sp = $("#host_grade").val();
	
	
	if(sp != null && sp != ''){
		return true;
	} else {
		alert("금액에 공백을 입력할수없습니다.");
		return false;
	}
}

$("#host_regist3").submit(function(){
	return checkFromRegist3();
});

// 금액 숫자만 입력가능
var value = $("#host_grade").val();
new Vue({
	el: '#host-ig',
	data: {
		message: value
	},
	watch: {
		message: function () {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			this.message = this.message.replace(/[^0-9]/g, '').replace(regexp, ',');
		}
	}
});



Date.prototype.yyyymmdd = function () {
	var mm = this.getMonth() + 1;
	var dd = this.getDate();

	return [this.getFullYear(),
	(mm > 9 ? '' : '0') + mm,
	(dd > 9 ? '' : '0') + dd
	].join('');
};

// bootstrap date time
$(function () {
	$('#datetimepicker3').datetimepicker({
		pickDate: false
	});
});


function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result; 
}
// vuejs datepicker
var startDay = "";
var endDay = "";

var state = {
	highlighted: {
		to: new Date(2016, 0, 5),
		from: new Date(2016, 0, 26)
	}
}


new Vue({
	el: '#app',
	data() {
		return {
			ko: vdp_translation_ko.js,
			disabledDates: {
				to: new Date(Date.now() + 8640000)
			}
		}
	},
	methods: {
		customFormatter(date) {
			var sdate = date.yyyymmdd();
			startDay = sdate;
			return startDay;
		}
	},
	
	components: {
		vuejsDatepicker
	}
});

new Vue({
	el: '#endPicker',
	data() {
		return {
			ko: vdp_translation_ko.js,
			disabledDates: {
				to: new Date(Date.now() + 8640000)
			}
		}
	},
	methods: {
		customFormatter(date) {
			var sdate = date.yyyymmdd();
			if(startDay != '' && startDay < sdate){
				endDay = sdate;
				return endDay;
			} else {
				alert('시작일보다 작은날짜는 선택할수없습니다.');
			}
		}
	},
	
	components: {
		vuejsDatepicker
	}
});