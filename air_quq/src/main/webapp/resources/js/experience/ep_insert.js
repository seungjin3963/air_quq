/**
 * 체험 등록 스크립트
 */
	$("#materials_div")
			.click(
					function() {
						var input = "<div><i class='fas fa-times ep_mater_icon'></i><br><input type='text' class='form-control bg-light border-0 small ep_mater_ic' name='value' placeholder='여기에 항목을 입력하세요'><br></div>";
						$("#materials_div1").append(input);
						/*mater icon 이밴트*/
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
		$(this).attr('class','btn btn-danger btn-icon-split');
		$("#ep_info_type1").attr('class','btn border-left-danger btn-icon-split');
		$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=31");
	});
	$("#ep_info_type1").click(function() {
		$(this).attr('class','btn btn-danger btn-icon-split');
		$("#ep_info_type").attr('class','btn border-left-danger btn-icon-split');
		$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=41");
	});
	/* 가격 시간 이벤트*/
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
	/*주소 이벤트*/
	function check_loc() {
		var locFrom = document.locFrom;
		var value = locFrom.value.value;
		if (!value) {
			alert("주소를 입력해주세요");
		} else {
			locFrom.submit();
		}
	}
	/*자기소개 이벤트*/
	function check_intr() {
		var intrFrom = document.intrFrom;
		var value = intrFrom.value.value;
		if (!value) {
			alert("자기소개를 입력해주세요");
		} else {
			intrFrom.submit();
		}
	}
	/*제목*/
	function check_title() {
		var titleFrom = document.titleFrom;
		var value = titleFrom.value.value;
		if (!value) {
			alert("제목를 입력해주세요");
		} else {
			titleFrom.submit();
		}
	}
	/*프로그램*/
	function check_program() {
		var programFrom = document.programFrom;
		var value = programFrom.value.value;
		if (!value) {
			alert("프로그램에 대한 설명을 입력해주세요");
		} else {
			programFrom.submit();
		}
	}
	/*타입 이벤트*/
	$("#ep_type_btn").click(function() {
		var href = $('#ep_type_btn').attr('href');
		if (href == '#') {
			alert("체험 유형의 입력해주세요");
			return;
		}
	});
	/*나가기 모달*/
	function ep_model() {
		$("#ep_colse_modal").modal('show');
	}
	/*최종 제출 모달*/
	function ep_insert_intr() {
		$('#ep_insert_total_modal').modal('show');
	}

	$(".ep_mater_icon").click(function(e) {
		$(e.target).parent().remove();

	});

	$(".eq_GoHome1").click(function() {
		location.href="/ep/GoHome?num=1";
	});
	$(".eq_GoHome2").click(function() {
		location.href="/ep/GoHome?num=2";
	});
	$(".eq_GoHome3").click(function() {
		location.href="/ep/GoHome?num=3";
	});
	$(".eq_modal_close").click(function(){
		$('#ep_insert_total_modal').modal('hide');
	})
	