<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	label {
		width: 225px;
		text-align: left;
	}
	
	/* 최상의 div 위로 올리기 */
	#divmain {
		margin-top: 20px;
	}
	/* 글자 가운데 */
	#fontcenter{
		text-align: center;
	}
	/* 검색 */
	#selectdiv {
		float: right;
		margin-bottom: 10px;
	}

	#selectoption {
		width: 120px;
		display: inline-block;
	}

	#selecttext {
		width: 200px;
		display: inline-block;
	}
	
	/* 이전, 다음 버튼 */	
	#previous, #next {
		border: none;
		outline: none;
		background: none;
		text-align: center;
	}
	
	/* 페이징 숫자 정렬 */
	#pagingborder {
		display: inline-block;
	}
	
	#fontred {
		color: red;
	}
	
	.hovertr:hover{
		background-color: #cfd1d6 !important;
	}
	
	/* 버튼 css 설정 */
	.exitbutton {
		border: none;
		outline: none;
		background: none;
	}
	
	/* 상세정보 정렬 */
	#modalscroll input {
		width: 230px;
	}
	
	/* 스크롤 */
	#modalscroll{
		overflow: auto; 
		width: 700px; 
		height: 900px;
	}
	
	#contentscroll{
		overflow:auto; 
		width: 465px; 
		height: 300px;
		color: black;
	}
	
</style>
<div class="container" id="divmain">
	<h1 id="fontcenter">호스트가 등록한 집 목록</h1>
	<div id="selectdiv">
		<form action="/admin/house_info/list" method="post">
			<select name="field" class="form-control" id="selectoption">
				<option value="title">제목</option>
				<option value="addr">주소</option>
				<option value="startdate">시작날짜</option>
				<option value="enddate">마지막날짜</option>
			</select> <input type="text" name="keyword" class="form-control form-control" id="selecttext">
			<input type="submit" value="검색" class="btn btn-danger" style="width: 75px;"> 
		</form>
	</div>
	<table class="table table-striped">
		<tr>
			<th>등록된 집 번호</th>
			<th>제목</th>
			<th>주소</th>
			<th>가격</th>
			<th>시작날짜</th>
			<th>마지막날짜</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr class="hovertr">
				<td>${vo.hinum }</td>
				<td>${vo.title }</td>
				<td>${vo.addr }</td>
				<td>${vo.price }</td>
				<td>${vo.startdate }</td>
				<td>${vo.enddate }</td>
				<c:choose>
					<c:when test="${vo.del_yn == 'n'}">
						<td>일반</td>
					</c:when>
					<c:otherwise>
						<td>삭제</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="fontcenter">
		<button id="previous" <c:if test="${pu.pageNum == 1 }">disabled="disabled"</c:if>>
			<i class="fas fa-backward"></i>
		</button>
		<div id="pagingborder">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum == i }">
						<a href="/admin/house_info/list?pageNum=${i}"><span id="fontred">[${i}]</span></a>
					</c:when>
					<c:otherwise>
						<a href="/admin/house_info/list?pageNum=${i}"><span>[${i}]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<button id="next" <c:if test="${pu.pageNum == pu.totalPageCount }">disabled="disabled"</c:if>>
			<i class="fas fa-forward"></i>
		</button>
		<input type="hidden" value="${pu.pageNum }" id="pageNum">
</div>

<div class="modal fade" id="house_infomodal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" id="modalscroll">
			<div class="modal-header">
				<h3 class="modal-title">상세보기</h3>
				<button type="button" class="close" data-dismiss="modal" class="exitbutton">X</button>
			</div>
			<div class="modal-body">
				<img src=""><br>
				<label>제목</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>내용</label>
				<div id="contentscroll"></div>
				<label>주소</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>가격</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>침대수</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>체크인 시간</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>시작날짜</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<label>마지막날짜</label><br>
				<input type="text" readonly="readonly" class="exitbutton"><br>
				<div id="fontcenter">
					<button type="button" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-danger">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	/* paging button 페이지 이동으로 처리 */
	$("#next").click(function(){
		var pagenum=$("#pageNum").val();
		location.href="/admin/house_info/list?pageNum="+(Number(pagenum)+1);
	});
	
	$("#previous").click(function(){
		var pagenum=$("#pageNum").val();
		location.href="/admin/house_info/list?pageNum="+(Number(pagenum)-1);
	});
	
	/* 검색창 type 변경 */
	$("#selectoption").change(function(){
		var option=$(this).val();
		
		if(option == 'startdate' || option == 'enddate'){
			$("#selecttext").prop("type","date");
		}else{
			$("#selecttext").prop("type","text");
		}
		$("#selecttext").val("");
	});
	
	/* 대한민국 표준시 yyy-mm-dd로 변경 */
	var datechange=function(datetime){
		return datetime.toISOString().slice(0, 10);
	}
	
	/* 상세정보 modal 나오게 하기 */
	$(".hovertr").click(function(){
		var hinum=$(this).children().eq(0).html();
		
		$.get("/json/houseone", {"hinum":hinum}, function(data) {
				console.log(data);
			$.each(data, function(key, value) {
				if(key == "houseimg"){
					console.log(value);
					$(".modal-body").children().eq(0).prop("src",value)
				}
				if(key == "vo"){
					var starttemp=new Date(value.startdate);
					var endtemp=new Date(value.enddate);
					
					var startdate=datechange(starttemp);
					var enddate=datechange(endtemp);
					
					$(".modal-body").children().eq(4).val(value.title);
					$(".modal-body").children().eq(7).text(value.content);
					$(".modal-body").children().eq(10).val(value.addr);
					$(".modal-body").children().eq(12).val(value.addr_detail);
					$(".modal-body").children().eq(16).val(value.price);
					$(".modal-body").children().eq(20).val(value.bedroom);
					$(".modal-body").children().eq(24).val(value.checkin_time);
					$(".modal-body").children().eq(28).val(startdate);
					$(".modal-body").children().eq(32).val(enddate);	
				}
				
			});
		
		}, "json")
		
		$("#house_infomodal").modal();
	});
	
</script>