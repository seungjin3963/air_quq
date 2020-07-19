<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	label{
		width: 130px;
		text-align: left;
	}

</style>
<div class="container" style="margin-top: 20px;">
	<h1 style="text-align: center;">회원정보</h1>
	<div style="float: right; margin-bottom: 10px;">
		<select name="field" class="form-control" style="width: 120px; display: inline-block;">
			<option value="id">아이디</option>
			<option value="email">이메일</option>
		</select> <input type="text" name="keyword" class="form-control form-control" style="width: 200px; display: inline-block;">
	</div>
	<table class="table table-striped">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>성별</th>
			<th>회원상태</th>
			<th>카카오아이디 여부</th>
			<th>회원 프로필 사진</th>
			<th>회원 정보 상세 보기</th>
		</tr>
		<c:forEach var="vo" items="${ Memberlist }">
			<tr>
				<td>${vo.menum }</td>
				<td>${vo.id}</td>
				<td>${vo.gender}</td>
				<c:choose>
					<c:when test="${vo.del_yn == 'n'}">
						<td>일반</td>
					</c:when>
					<c:otherwise>
						<td>삭제</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${vo.identi_kakao == 1}">
						<td>카카오아이디</td>
					</c:when>
					<c:otherwise>
						<td>일반아이디</td>
					</c:otherwise>
				</c:choose>
				<td><input type="button" value="프로필 보기" class="btn btn-danger" onclick="memberprofile(${vo.menum },'${vo.del_yn}')"></td>
				<td><input type="button" value="상세보기" class="btn btn-danger" onclick="memberdetail"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: center;">
		<button id="previous" style="border: none; outline: none; background: none">
			<i class="fas fa-backward"></i>
		</button>
		<div style="display: inline-block;" id="pagingborder">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum == i }">
						<a href="/admin/member/list?pageNum=${i}"><span style="color: red;">[${i}]</span></a>
					</c:when>
					<c:otherwise>
						<a href="/admin/member/list?pageNum=${i}"><span>[${i}]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<input type="hidden" value="${pu.pageNum}" id="pageNum">
		<input type="hidden" id="fieldcopy"> 
		<input type="hidden" id="keywordcopy"> 
		<button id="next" style="border: none; outline: none; background: none">
			<i class="fas fa-forward"></i>
		</button>
	</div>
</div>

<div class="modal fade" id="membermodal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">회원 프로필</h3>
				<button type="button" class="close" data-dismiss="modal" style="outline: none;">X</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<img onerror="this.src='/resources/img/적분이_001.JPG';" src="" id="memberimg" style="width: 150px; height: 150px; border-radius: 100%;"><br>
				<i class="fas fa-exclamation-circle fa-2x" id="photochange" style="position: relative; left: 60px; bottom: 35px;"></i>
				<input type="hidden"><br>
				<div style="text-align: center; margin-bottom: 20px;">
					<input type="button" value="강퇴" id="memberexit" style="width: 100px;">
				    <input type="button" value="복구"  style="width: 100px;">
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="memberdetail" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">회원 정보 상세보기</h3>
				<button type="button" class="close" data-dismiss="modal" style="outline: none;">X</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<label>아이디</label><span></span><br>
				<label>비밀번호</label><span></span><br>
				<label>주소</label><span></span><br>
				<label>이메일</label><span></span><br>
				<label>전화번호</label><span></span><br>
				<label>성별</label><span></span><br>
			</div>
		</div>
	</div>
</div>
<script>
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
			var memberstate;
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
					memberstate = "일반";
				} else {
					memberstate = "삭제";
				}
				$("table").append(
						"<tr class='backcolor'><td>" + value[i].menum + "</td><td>" + value[i].id
								+ "</td><td>" + value[i].gender + "</td><td>" + memberstate +"</td><td>" + kakaocheck
								+ "</td><td><button type='button' class='btn btn-danger' onclick='memberprofile("+value[i].menum+")'>프로필 보기</button><td><button type='button' class='btn btn-danger' onclick=''>상세보기</button></tr>"
								)
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
	function memberprofile(menum,del_yn){
		$("#memberimg").prop("src","/memberimg?menum="+menum);
		$("#photochange").next().val(menum);
		/* console.log(typeof(del_yn));
		console.log(del_yn);
		console.log(del_yn.length);
		if(del_yn == 'n'){
			$("#memberexit").prop("disabled","disabled")
		}else{
			$("#memberexit").next().prop("disabled","disabled")
		} */ 
		$("#membermodal").modal();
	}
	
	paging('${pu.pageNum}', '${pu.totalPageCount}');
	
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
	$("input[name='keyword']").keyup(function() {
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
	location.href="/admin/memberimgreset?menum="+menum;
});
	
	
</script>