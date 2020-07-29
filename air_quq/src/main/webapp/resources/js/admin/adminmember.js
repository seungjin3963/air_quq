/* 검색 확인 */

	var datasearch=function(keyword,field){
		if(keyword === undefined){
			keyword='';
		}
		
		if(field === undefined){
			field='';			
		}
	}
	/* 페이지 다시 출력  */
	var pagedata = function(key, value) {
		if (key == "Memberlist") {
			var kakaocheck;
			for (var i = 0; i < 10; i++) {
				$("tr").first().next().remove();
			}
			for (var i = 0; i < value.length; i++) {
				if (value[i].identi_kakao == 1) {
					kakaocheck = "카카오아이디";
				} else {
					kakaocheck = "일반아이디";
				}

				if (value[i].del_yn === 'n') {
				$("table").append(
						"<tr><td>" + value[i].menum + "</td><td>" + value[i].id
								+ "</td><td>" + value[i].gender + "</td><td>" + value[i].email + "</td><td>" + kakaocheck
								+ "</td><td><input type='button' value='강퇴' class='btn btn-danger' onclick='memberexit(this)'></td><td><button type='button' class='btn btn-danger' onclick='memberprofile("+value[i].menum+")'>프로필 보기</button><td><button type='button' class='btn btn-danger' onclick='onclick=detailmodal("+value[i].menum+")'>상세보기</button></tr>"
								)
				} else {
				$("table").append(
						"<tr class='backcolor'><td>" + value[i].menum + "</td><td>" + value[i].id
								+ "</td><td>" + value[i].gender + "</td><td>" + value[i].email + "</td><td>" + kakaocheck
								+ "</td><td><input type='button' value='복구' class='btn btn-danger' onclick='memberexit(this)'></td><td><button type='button' class='btn btn-danger' onclick='memberprofile("+value[i].menum+")'>프로필 보기</button><td><button type='button' class='btn btn-danger' onclick='onclick=detailmodal("+value[i].menum+")'>상세보기</button></tr>"
								)
				}
			}
		}
	}

	/* 페이징 숫자 */
	var pageNumber=function(key,value){
		if (key == "pu") {
			$("#pagingborder").empty();
			for (var i = value.startPageNum; i <= value.endPageNum; i++) {
				if (value.pageNum == i) {
					if (i == value.startPageNum) {
						$("#pagingborder").append("<a href='#'><span style='color : red;' onclick='pageclick("+i+")'>[" + i + "]</span></a>");
					} else {
						$("#pagingborder").append("<a href='#'><span style='color : red; margin-left: 6px;' onclick='pageclick("+i+")'>["+ i + "]</span></a>");
					}
				} else {
					if (i == value.startPageNum) {
						$("#pagingborder").append("<a href='#'><span onclick='pageclick("+i+")'>[" + i + "]</span></a>");
					} else {
						$("#pagingborder").append("<a href='#'><span style='margin-left: 6px;' onclick='pageclick("+i+")'>[" + i + "]</span></a>");
					}
				}
			}
			$("#pageNum").val(value.pageNum);
			paging(value.pageNum, value.totalPageCount);
		}	
	}
	
	/* 다음,이전 버튼 설정 */
	var paging = function(pagenum, totalpage) {
		if (pagenum == 1) {
			$("#previous").attr('disabled', true);
		} else {
			$("#previous").attr('disabled', false);
		};

		if (pagenum == totalpage) {
			$("#next").attr('disabled', true);
		} else {
			$("#next").attr('disabled', false);
		};

	}
	/* 프로필 확인 */
	function memberprofile(menum){
		$("#memberimg").prop("src","/memberimg?menum="+menum);
		$("#menumphoto").val(menum);
		$("#membermodal").modal();
	}
	/* 강퇴 복구 기능 */
	function memberexit(data){
		if($(data).val() == '강퇴'){
			var result=confirm("정말 강퇴 하겠습니까?");
			
			if(result){
				console.log("강퇴");
				$(data).val("복구");
			}
		}else{
			var result=confirm("정말 복구 하겠습니까?");
			
			if(result){
				console.log("복구");
				$(data).val("강퇴");
			}
		}
	}
	
	/* 회원 상세 정보 보기 */
	function detailmodal(menum){
		$.ajax({
			url : "/json/memberone",
			dataType : "json",
			data : {menum : menum},
			success : function(data) {
				$("#medetail").children().eq(1).val(data.id);
				$("#medetail").children().eq(4).val(data.pwd);
				$("#medetail").children().eq(7).val(data.addr);
				$("#medetail").children().eq(10).val(data.email);
				$("#medetail").children().eq(13).val(data.phone);
				$("#medetail").children().eq(16).val(data.gender);
				$("#memberdetail").modal();
			}
		})
	}
	
	/* 페이징 버튼 처리 */
	$("#previous").click(function(e) {
		e.preventDefault();
		
		var keyword=$("#keywordcopy").val();
		var field=$("#fieldcopy").val();
		
		datasearch(keyword,field);
		
		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {"pageNum" : Number($("#pageNum").val()) - 1,"field" : field, "keyword" : keyword},
			success : function(data) {
				$.each(data,function(key, value) {
					pagedata(key, value);
					pageNumber(key,value);
				})
			}
		})
	});

	$("#next").click(function(e) {
		e.preventDefault();
		
		var keyword=$("#keywordcopy").val();
		var field=$("#fieldcopy").val();
		
		datasearch(keyword,field);
		
		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {"pageNum" : Number($("#pageNum").val()) + 1, "field" : field, "keyword" : keyword},
			success : function(data) {
				$.each(data,function(key, value) {
					pagedata(key, value);
					pageNumber(key,value);
				})
			}
		})
	});
	
	/* 페이징 클릭 처리 */
	var pageclick=function(i){
		
		var keyword=$("#keywordcopy").val();
		var field=$("#fieldcopy").val();
		
		datasearch(keyword,field);
		
		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {"pageNum" : i, "field" : field, "keyword" : keyword},
			success : function(data) {
				$.each(data,function(key, value) {
					pagedata(key, value);
					pageNumber(key,value);
				})
			}
		})
	};

	/* 검색 ajax */
	$("input[class='form-control form-control']").keyup(function() {
		var fielddata = $("select[name='field']").val();
		var keyworddata = $("input[name='keyword']").val();
		
		$("#fieldcopy").val(fielddata);
		$("#keywordcopy").val(keyworddata);
		
		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {"keyword" : keyworddata,"field" : fielddata},
			success : function(data) {
				$.each(data, function(key, value) {
					pagedata(key, value);
					pageNumber(key, value);
				})
			}
		})
	});
	
	/* 프로필사진 초기화*/
$("#photochange").click(function(){
	var menum=$(this).next().val();
	alert("프로필 이미지가 초기화 되었습니다.");
	location.href="/admin/memberimgreset?menum="+menum;
	
});

	/* 이미지 모달 나가기 */
$("input[value='확인']").click(function(){
	$("#membermodal").modal("hide");
});
/*상세정보 모달 나가기*/
$("input[value='닫기']").click(function(){
	$("#memberdetail").modal("hide");
});




