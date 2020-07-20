/**
 * 체험 등록 스크립트
 */
$("#materials_div")
		.click(
				function() {
					var input = "<div><i class='fas fa-times ep_mater_icon'></i><br><input type='text' class='form-control bg-light border-0 small ep_mater_ic' name='value' placeholder='여기에 항목을 입력하세요'><br></div>";
					$("#materials_div1").append(input);
					/* mater icon 이밴트 */
					$(".ep_mater_icon").click(function(e) {
						$(e.target).parent().remove();

					});
				});
function doOpenCheck(chk) {
	var obj = document.getElementsByName("ep_fiedset");
	for (var i = 0; i < obj.length; i++) {
		if (obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}
/* 타입 설정 */
$("#ep_info_type").click(function() {
	$(this).attr('class', 'btn btn-danger btn-icon-split');
	$("#ep_info_type1").attr('class', 'btn border-left-danger btn-icon-split');
	$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=31");
});
$("#ep_info_type1").click(function() {
	$(this).attr('class', 'btn btn-danger btn-icon-split');
	$("#ep_info_type").attr('class', 'btn border-left-danger btn-icon-split');
	$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=41");
});
/* 가격 시간 이벤트 */
function check_price_time() {
	var price_timeFrom = document.price_timeFrom;
	var obj = document.getElementsByName("ep_fiedset");
	var price = price_timeFrom.price.value;
	if (!price) {
		alert("가격을 입력해주세요");
		return;
	} else {
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				price_timeFrom.submit();
				return;
			}
		}
		alert("시간을 선택해주세요");
	}
}
/* 주소 이벤트 */
function check_loc() {
	var locFrom = document.locFrom;
	var value = locFrom.value.value;
	if (!value) {
		alert("주소를 입력해주세요");
	} else {
		locFrom.submit();
	}
}
/* 자기소개 이벤트 */
function check_intr() {
	var intrFrom = document.intrFrom;
	var value = intrFrom.value.value;
	if (!value) {
		alert("자기소개를 입력해주세요");
	} else {
		intrFrom.submit();
	}
}
/* 제목 */
function check_title() {
	var titleFrom = document.titleFrom;
	var value = titleFrom.value.value;
	if (!value) {
		alert("제목를 입력해주세요");
	} else {
		titleFrom.submit();
	}
}
/* 프로그램 */
function check_program() {
	var programFrom = document.programFrom;
	var value = programFrom.value.value;
	if (!value) {
		alert("프로그램에 대한 설명을 입력해주세요");
	} else {
		programFrom.submit();
	}
}
/* 타입 이벤트 */
$("#ep_type_btn").click(function() {
	var href = $('#ep_type_btn').attr('href');
	if (href == '#') {
		alert("체험 유형의 입력해주세요");
		return;
	}
});
/* 나가기 모달 */
function ep_model() {
	$("#ep_colse_modal").modal('show');
	$(".fileimg_modalBody").scrollTop(300);
}
/* 최종 제출 모달 */
function ep_insert_intr() { /*     aaaaaaaaaaaaaaaaaaaaaaaaaaaa*/
	 var fileconut=$('img[name=srcvalue]').length
	 if(fileconut>6){
		 $('#ep_insert_total_modal').modal('show');
		 
	 }else{
		 alert("사진 6개 이상 선택헤주세요.");
	 }
}

$(".ep_mater_icon").click(function(e) {
	$(e.target).parent().remove();

});

$(".eq_GoHome1").click(function() {
	$.ajax({
		url:"/ep_insert",
		dataType :"json",
		success : function(data){
			$('#ep_colse_modal').modal('hide');
		},
		error : function(err){
			alert(err);
		}
	})
});
$(".eq_GoHome2").click(function() {
	location.href = "/ep/GoHome";
});
$(".eq_GoHome3").click(function() {
	                       ////////////////////////////////////// 
	var InsertImgFrom = document.InsertImgFrom;
	InsertImgFrom.submit();
});
$(".eq_modal_close").click(function() {
	$('#ep_insert_total_modal').modal('hide');
});

$(".ep_file_label").click(function(event) { /*  1  */
	var index = $(".ep_file_label").index(this);
	$(".inp-img")[index].click();
});

$(".inp-img").on('change', function() { /* 2  */
	var index = $(".inp-img").index(this);
	readInputFile(this, index);
});

function readInputFile(input, index) { /* 3  */
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('.ep_file_label').eq(index).html(
					"<img src=" + e.target.result + " name='srcvalue'> <input type='hidden' name='index' value="+parseInt(index)+">");
			$('.fileimg_modal').eq(index).html(
					"<img src=" + e.target.result + " name='srcvalue'>");
		}
		reader.readAsDataURL(input.files[0]);
	}
}


/*$(".fileinsertBtn")
		.click(function() {
					$('.col').append(
                           	"<div class='col-md-7 ep_file_label'> <img src='/resources/css/images/defaultImg.jpg'> </div> <input type='file' name='' style='display: none;' class='inp-img' accept=''.gif, .jpg, .png'>");

					$(".ep_file_label").click(function(event) {
						var index = $(".ep_file_label").index(this);
						$(".inp-img")[index].click();
					});

					$(".inp-img").on('change', function() {
						var index = $(".inp-img").index(this);
						
						readInputFile(this, index);
					});
					
					function readInputFile(input, index) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$('.ep_file_label').eq(index).html(
										"<img src=" + e.target.result + ">");
							}
							reader.readAsDataURL(input.files[0]);
						}
					}
				});*/

/*$(".fileinsertBtn").click(function(){
	var fileconut=$('img[name=srcvalue]').length
	 if(fileconut<7){
		 alert("갤러리 사진을 모두 선택헤주세요");
		 
	 }else{
		 $("#inp-imgplus").click();
		 
		 
	 }
});
$("#inp-imgplus").on('change', function() { /* 2  
	readInputFile1(this);
});

function readInputFile1(input) { /* 3  
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			
			$('.col').append(
           	"<div class='col-md-7 ep_file_label1' > <img src=" + e.target.result + " name='srcvalue'> </div>");
			$('.fileimg_modalBody').append("<div class='fileimg_modal'><img src=" + e.target.result + " name='srcvalue'></div>")
			$('.ep_file_label1').click(function(event){
				
				$(this).remove();
			});
		}
		reader.readAsDataURL(input.files[0]);
	}
}
*/