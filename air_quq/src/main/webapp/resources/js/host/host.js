//체크아웃 시간
for(var i=0; i<=23; i++){
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
});

$("#bcount_plus").click(function(){
	bcount++;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
});


$("#pcount_minus").click(function(){
	pcount--;
	pcountDisable(pcount);
	$("#pcount").text(pcount);
});

$("#bcount_minus").click(function(){
	bcount--;
	bcountDisable(bcount);
	$("#bcount").text(bcount);
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
var value = $("#host_grade").val();
new Vue({
	el: '#host-ig',
	data: {
		message: value
	},
	watch: {
		message: function(){
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			this.message = this.message.replace(/[^0-9]/g, '').replace(regexp, ',');
		}
	}
});



Date.prototype.yyyymmdd = function() {
  var mm = this.getMonth() + 1;
  var dd = this.getDate();

  return [this.getFullYear(),
          (mm>9 ? '' : '0') + mm,
          (dd>9 ? '' : '0') + dd
         ].join('');
};


//달력
new Vue({
  el: '#d-start',
  data() {
	return{
		ko: vdp_translation_ko.js,
		disabledDates: {
			to: new Date(Date.now() + 8640000)
		}
	}
  },
  methods: {
	customFormatter(date){
		$("#start-d").val(date.yyyymmdd());
		return date.yyyymmdd();
	}
  },

  components: {
  	vuejsDatepicker
  }
});

new Vue({
  el: '#e-start',
  data() {
	return{
		ko: vdp_translation_ko.js,
		disabledDates: {
			to: new Date(Date.now() + 8640000)
		}
	}
  },
  methods: {
	customFormatter(date){
		$("#end-d").val(date.yyyymmdd());
		return date.yyyymmdd();
	}
  },

  components: {
  	vuejsDatepicker
  }
});

