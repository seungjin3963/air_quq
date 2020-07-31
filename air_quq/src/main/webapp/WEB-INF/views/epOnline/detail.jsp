<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 결제 -->
<link href="/resources/css/epOnline/chat.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
	
<link href="/resources/css/userapply/userapply.css" rel="stylesheet" type="text/css"><!-- 결제 css -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


  


<div class="container body-content">
	<div class="container">
		<div class="row justify-content-start"
			style="padding-top: 10px; background-color:#f8f9fc;">
			
			<div class="col" style="padding-top: 5px;">
				<img alt="Image html" width="100%" height="100%"
					style="max-height: 500px; max-width: 500px; border-radius: 10px 10px 10px 10px;"
					src="/resources/img/house_img/${hinum_Img[0].img } "/>
			</div>
			<div class="col" style="padding-top: 5px;">
				<img alt="Image html" width="100%" height="100%"
					style="max-height: 500px; max-width: 500px; border-radius: 10px 10px 10px 10px;"
					src="/resources/img/house_img/${hinum_Img[1].img } "/>
			</div>
			<div class="col" style="padding-top: 5px;">
				<div class="row justify-content-mid">
					<img alt="Image html" width="90%" height="30%"
						style="max-height: 120x; max-width: 300px; border-radius: 10px 10px 10px 10px;"
						src="/resources/img/house_img/${hinum_Img[2].img }" />
				</div>
				<div class="row justify-content-mid">
					<img alt="Image html" width="90%" height="100%"
						style="max-height: 150px; max-width: 500px; border-radius: 10px 10px 10px 10px;"
						src="/resources/img/house_img/${hinum_Img[3].img }" />
				</div>
			</div>
			<div class="col" style="padding-top: 5px;">
				<img alt="Image html" width="100%" height="100%"
					style="max-height: 500px; max-width: 500px; border-radius: 10px 10px 10px 10px;"
					src="/resources/img/house_img/${hinum_Img[4].img } "/>
			</div>
		</div>
		<hr>
				<%-- <c:if test="${!empty menum }"> <!--  /////////////////////////// /////////////////////////////////////////////////-->
								<c:set var="doneLoop" value="false"/>
									<c:forEach var="i"  begin="0" end="${fn:length(basket) }">
										<c:if test="doneLoop != true">	
											<c:if test="${experienceInfo.hinum==basket[i].hinum}">
												<h4 style="float: right;margin-top: 10px;">찜</h4>
												<i class="far fa-heart fa-3x onlineMyPick1" style="display: none;"></i>
												<i class="fas fa-heart fa-3x onlineMypick2" style="display: block;"></i>	
												<c:set var="doneLoop" value="true"/>			
											</c:if>
											
											<c:if test="${i==fn:length(basket) }">
												<i class="far fa-heart fa-3x onlineMyPick1" ></i>
												<i class="fas fa-heart fa-3x onlineMypick2"></i>
											</c:if>
											${i } ///// ${fn:length(basket) }
										</c:if>
									</c:forEach>
								
				</c:if> --%>
				
				
				<c:if test="${!empty menum }">
				
					<c:set var="doneLoop" value="false"/>
					
						<c:forEach var="i"  begin="0" end="${fn:length(basket) }">
						
							<c:if test="${doneLoop != true }">
							
								<c:if test="${experienceInfo.hinum==basket[i].hinum }">
									<h4 style="float: right;margin-top: 10px;">찜</h4>
									<i class="far fa-heart fa-3x onlineMyPick1" style="display: none;"></i>
									<i class="fas fa-heart fa-3x onlineMypick2" style="display: block;"></i>
									<c:set var="doneLoop" value="true"/>
								</c:if>
								
								<c:if test="${fn:length(basket) == i}">
									<h4 style="float: right;margin-top: 10px;">찜</h4>
									<i class="far fa-heart fa-3x onlineMyPick1" ></i>
									<i class="fas fa-heart fa-3x onlineMypick2" ></i>
								</c:if>
								
							</c:if>
						</c:forEach>
				</c:if>
		<div class="row justify-content-start" style="padding-top: 10px;">
			<div class="row">
				<div class="col-md-8">
					<img src="/resources/img/pic/com.svg" viewBox="0 0 16 16"
						style="display: block; height: 16px; width: 16px; fill: currentcolor; margin-top: 4px;"
						align="left">
						<input type="hidden" value="${experienceInfo.div_type}" id="hidden_divType">
						
						<c:choose>
							<c:when test="${experienceInfo.div_type==3}">
								<h4>온라인 체험</h4>
							</c:when>
							<c:otherwise>
								<h4>대면 체험</h4>
							</c:otherwise>
						</c:choose>
				</div>
				<div class="col-md-4"></div>
				<div class="col-md-8">
					<h3 tabindex="-1">
						<b>${experienceInfo.title}</b>
						
					</h3>
				</div>
				<div class="col-md-4">
					
				</div>
				<div class="col-md-8">
					
				</div>
			</div>
		</div>
		<hr>
		<!-- ~님이 호스팅하는 온라인 체험 -->
		<div class="row justify-content-start" style="padding-top: 10px;">
			<div class="row">
				<div class="col">
					<b><label> <h5>${experienceInfo.id}</h5> 님이 호스팅하는 온라인 체험</label></b>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/img/pic/clock.svg" viewBox="0 0 16 16"
					style="display: block; height: 16px; width: 16px; fill: currentcolor; margin-top: 4px;"
					align="left">진행시간 :  <b>${experienceInfo.times}</b> 시간
			</div>
			<div class="col">
				<img src="/resources/img/pic/people.svg" viewBox="0 0 16 16"
					style="display: block; height: 16px; width: 16px; fill: currentcolor; margin-top: 4px;"
					align="left">최대 인원 수 : <b><span id="MaxPeople">${experienceInfo.people}</span></b> 명
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/img/pic/comcom.svg" viewBox="0 0 16 16"
					style="display: block; height: 16px; width: 16px; fill: currentcolor; margin-top: 4px;"
					align="left">&nbsp;<b>1</b> 인 가격 : <b> ￦ <span id="experiecePrice">${experienceInfo.price}</span> 원</b>
			</div>
			<div class="col">
				<img src="/resources/img/pic/chat.svg" viewBox="0 0 16 16"
					style="display: block; height: 16px; width: 16px; fill: currentcolor; margin-top: 4px;"
					align="left">제공 언어: 한국어
			</div>
		</div>
		<hr>
		<br>
	</div>
	<!-- 프로그램소개 -->
	<div class="row justify-content-start" style="padding-top: 10px;">
		<div class="row">
			<div class="col">
				<b><label>프로그램 설명</label></b>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">${experienceInfo.program}</div>
	</div>
	<hr>
	
	<hr>
	<div class="row justify-content-start" style="padding-top: 10px;">
		<div class="row">
			<div class="col">
				<b><label>준비물</label></b>
			</div>
		</div>
	</div>
	<div class="container">
		<c:forEach var="i" items="${mater }">
			<div class="row">
				<img src="/resources/img/pic/check.svg" viewBox="0 0 30 30"
					style="display: block; height: 24px; width: 24px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 5px;">
				<h6>${i}</h6>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div class="row justify-content-start" style="padding-top: 10px;">
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col">
			
				
				<img src="/memberimg?menum=${experienceInfo.memnum }" onerror="this.src='/resources/img/적분이_001.JPG';" viewBox="0 0 70 70"
					style="display: block; height: 56px; width: 56px; fill: currentcolor; margin-top: 4px; margin-right: 10px; border-radius: 50%;"
					align="left"> <b><label>호스트  ${experienceInfo.id } 님을 소개합니다</label></b> <br> 
				호스팅 시작 연도:(숫자)년 <br> <br>
				<div class="container">
					<div class="row">
						
						<h6>● 호스트소개 <br><br>${experienceInfo.intr }</h6>
					</div>
					<div class="row">
						<br>
						<img src="/resources/img/pic/star.svg" viewBox="0 0 30 30"
							style="display: block; height: 24px; width: 24px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 5px;">
						<h6>후기 <b>${fn:length(Review) }</b> 개</h6>
					</div>
					<div class="row">
						<img src="/resources/img/pic/shield.png" viewBox="0 0 30 30"
							style="display: block; height: 24px; width: 24px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 5px;">
						<h6>본인 인증 완료</h6>
					</div>
				</div>
			</div>
			
		</div>
		<input type="hidden" value="${hinum }" id="hinumvalue">
		<button type="button" class="btn btn-light" id="dmcall2">
			<b>호스트에게 연락하기</b>
		</button>
		<!--  영노 -->
				<a style="float: right;" class="Declaration" ><i class="fas fa-exclamation-circle"></i> 신고하기</a>
				<input type="hidden" value="${experienceInfo.hinum }" id="hinum">
		<img src="/resources/img/pic/shield.png" viewBox="0 0 30 30"
			style="display: block; height: 22px; width: 21px; fill: currentcolor; margin-top: 4px; margin-right: 5px; margin-bottom: 5px; margin-left: 50px;">
		<h6>안전한 결제를 위해 에어비앤비 웹사이트나 앱 외부에서 송금하거나 대화를 나누지 마세요.</h6>
		
		
	</div>
	<hr>
	<div class="row justify-content-start"
		style="padding-top: 10px; margin-bottom: 10px;">
		<div class="row">
			<div class="col">
				<h3>
					<strong>에어비앤비 온라인 체험</strong>
				</h3>
			</div>
			<div class="row">
				<div class="col" style="margin-right: 20px;">
					<img src="/resources/img/pic/grandma.png" viewBox="0 0 30 30"
						style="display: block; height: 48px; width: 48px; fill: currentcolor; margin-top: 4px; margin-right: 15px;; margin-right: 20px;"
						align="left">
					<h6>
						<b>세심하게 배려하는 호스트</b>
					</h6>
					전문지식을 가진 호스트를 만나보세요.
				</div>
				<div class="col">
					<img src="/resources/img/pic/activity.png" viewBox="0 0 30 30"
						style="display: block; height: 48px; width: 48px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 5px;"
						align="left">
					<h6>
						<b>소규모 액티비티</b>
					</h6>
					새로운 것을 함께 배우며 전 세계 각지의 사람들을 만나세요.
				</div>
				<div class="col">
					<img src="/resources/img/pic/comcom.svg" viewBox="0 0 30 30"
						style="display: block; height: 48px; width: 48px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 5px;"
						align="left">
					<h6>
						<b>전 세계 어디에서나 간단하게</b>
					</h6>
					복잡한 준비 없이도 집에서 간단하게 참여할 수 있습니다.
				</div>
			</div>
		</div>

		<br> <br>
	</div>
	<hr>
	<div class="row justify-content-start"
		style="padding-top: 10px; margin-bottom: 10px;">
			<div class="container">
				<div class="row">
					<div class="col">
					<img src="/resources/img/pic/star.svg"
						style="display: block; height: 30px; width: 30px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 20px;"
						align="left">
					<h4>
						<b> ${Review[0].totalscore }점  리뷰  ${fn:length(Review) } 개 </b>
					</h4>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
						<c:choose>
							<c:when test="${fn:length(Review) > 4}">
								<c:forEach var="i" begin="0" end="3">
									<div class="col-md-6" style="padding-top: 10px;">
										<img src="/memberimg?menum=${Review[i].menum }" onerror="this.src='/resources/img/적분이_001.JPG';" viewBox="0 0 30 30"
										style="display: block; height: 50px; width: 50px; fill: currentcolor; margin-top: 4px; margin-right: 15px; border-radius: 50%;"
										align="left">
										<h6>
											<b>${Review[i].id }</b>
										</h6>
								
										<br>${Review[i].content}
									</div>
								</c:forEach>		
							</c:when>
							<c:otherwise>
								<c:forEach var="review" items="${Review }">
									<div class="col-md-6"  style="padding-top: 10px;">
										<img src="/memberimg?menum=${review.menum }" onerror="this.src='/resources/img/적분이_001.JPG';" viewBox="0 0 30 30"
										style="display: block; height: 50px; width: 50px; fill: currentcolor; margin-top: 4px; margin-right: 15px; border-radius: 50%;"
										align="left">
										<h6>
											<b>${review.id }</b>
										</h6>
								
										<br>${review.content}
									</div>
								</c:forEach>	
							</c:otherwise>
						</c:choose>
						
						
						
						
					
				</div>
				<br><br>
				<input type="button" value="후기 ${fn:length(Review) }개 모두 보기" class="btn btn-danger ReviewBtn">
			</div>
				
		<br> <br>
	</div>
	<hr>

		<br>
	</div>
	<hr>
	<div class="row justify-content-start"
		style="padding-top: 10px; margin-bottom: 10px;">
			<div class="container">
			
				<div class="row">
					<div class="col">
						<h5>
							<strong>알아두어야 할 사항</strong>
						</h5>
					</div>
				</div>			
			</div>
			<div class="container">
				<div class="row">
					<div class="col">
						<h6>
							<strong>환불정책</strong>
						</h6>
						모든 체험은 예약 후 24시간 이내 또는 체험 시작 7일 전까지 취소 및 전액 환불이 가능합니다.
					</div>
					<div class="col">
						<h6>
							<strong>게스트 필수조건</strong>
						</h6>
						체험에 참여하려면 인터넷 연결과 동영상과 오디오를 전송할 수 있는 기능이 필요합니다. 예약 확정 이메일을 통해 참여
						방법에 대한 자세한 내용과 링크를 보내드립니다.
					</div>
				</div>
			</div>
		</div>
		<br> <br>
	</div>
	<hr>
	<div class="row justify-content-start"
		style="padding-top: 10px; margin-bottom: 10px;">
				<div class="container">
					<h5>
						<strong>온라인 체험 더 보기</strong>
					</h5>
				</div>
				<div class="carousel-inner">
					<div class="container">
						<div class="carousel-inner">
							<div class="row" style="margin-top: 30px;">
								<c:forEach var="rand" items="${rand }">
									<div class="col-md-2" style="margin-right: 7px;">
										<a href="/online/details?hinum=${rand.hinum }">
										<img src="/resources/img/house_img/${rand.img }" viewBox="0 0 30 30"
											style="display: block; height: 250px; width: 180px; fill: currentcolor; margin-top: 4px; border-radius: 10%;"></a>	
										<h6 style="margin-top: 10px;">${rand.subname }</h6>
										<b>${rand.title }</b><br>
										${rand.program }
										<h6 style="margin-top: 3px;">1인당 ${rand.price } 원 부터 ${rand.times } 시간 이용</h6>
									</div>
								</c:forEach>	
							</div>
						</div>
					</div>
				</div>
		<br> 
		<br>
	</div>
</div>
<div class="chatbox-holder" id="dmdm">
	<div class="chatbox" id="dmdm2">
		<!-- 헤더 -->
		<div class="chatbox-top">
			<!-- 이미지 -->
			<div class="chatbox-avatar">
				<a target="_blank"><img
					src="/resources/img/pic/pro.png" /></a>
			</div>
			<!-- 이름 -->
			<div class="chat-partner-name">
				<span class="status online"></span> <a target="_blank"
					href="https://www.facebook.com/mfreak">JHTA</a>
			</div>
			<!-- 아이콘 -->
			<div class="chatbox-icons">
				<i class="fa fa-minus"><span class="material-icons">arrow_drop_down_circle</span></i>
				<i class="fa fa-close"><span class="material-icons">cancel</span></i>
			</div>
		</div>
		<!-- 메시지 -->
		<div class="chat-messages" id="messageArea">
			<div class="message-box-holder">
				<!-- 나 -->
				<div class="message-sender">Tae Hee</div>
				<!-- 메세지보내기 -->
				<div class="message-box message-partner">Hi.</div>
			</div>
			<!-- 상대방 -->
			<div class="message-box-holder">
				<!-- 메세지보내기 -->
				<div class="message-box">How are you doing?</div>
			</div>
		</div>

		<div class="chat-input-holder">
			<textarea class="chat-input" id="message"></textarea>
			<input type="submit" value="Send" class="message-send" id="sendText"/>
		</div>
	</div>
</div>

<!--  예약 div -->
<div id="quickmenu">
	
	
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<b>체험 일</b>
		<br>
		<i class="far fa-calendar-alt fa-3x"></i>
		<br>
		<br>
		<input type="date"  id="checkin" class="quickmenufont">
	</div>
	
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<b>인원수</b><br>
		<i class="fas fa-users fa-3x"></i>
		<br>
		<br>
		<input type="button" value="-" class="btn btn-danger btn-icon-split PeopleBtnM" style="border-radius: 120px;">
		&nbsp;&nbsp;<b><span id="PeopleSpan"> 1 </span></b>&nbsp;&nbsp;
		<input type="button" value="+" class="btn btn-danger btn-icon-split PeopleBtnP"  style="border-radius: 120px;">
		<!-- <input type="text"  readonly="readonly" id="checkcnt" class="quickmenufont"> -->
	</div>
	
	<div id="quickmenulayer" data-toggle="modal" data-target="#myModal">
		<b>총금액</b><br>
		<i class="fas fa-coins fa-3x"></i>
		<br>
		<br>
		<b>￦<span id="PriceSpan"> ${experienceInfo.price }  </span> 원</b>
		<!--<input type="text" readonly="readonly" id="summoney" class="quickmenufont">-->
	</div>

	<input type="hidden" value="1">
	<input type="hidden"  id="hoststartdate">
	<input type="hidden"  id="hostenddate">
	<input type="hidden"  id="chekcdatepicker">
	<input type="hidden"  id="imgarr">
	<input type="hidden"  id="lat">
	<input type="hidden"  id="lnt">
	<div id="quickmenulayer">
		<br>		
		<input type="button" value="예약하기" class="btn btn-danger btn-icon-split test1" style="margin: auto;">		
	</div>
</div>

<!-- 전체 리뷰 보기 모달 -->
<div class="modal fade" id="detailReview">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
     
       <div class="container" style="padding: 50px;">
        <img src="/resources/img/pic/star.svg"
						style="display: block; height: 50px; width: 50px; fill: currentcolor; margin-top: 4px; margin-right: 15px; margin-bottom: 20px;"
						align="left"> &nbsp;&nbsp; <h3> ${Review[0].totalscore } 점  후기 ( <b>${fn:length(Review) }</b> 개) </h3> 
       
      </div>
      <div class="modal-body" style="padding-left: 50px">
      		<c:forEach var="review" items="${Review }">
					<div class="row">
					<div class="col-md-3">
						<img src="/memberimg?menum=${review.menum }" onerror="this.src='/resources/img/적분이_001.JPG';" viewBox="0 0 30 30"
							style="display: block; height: 50px; width: 50px; fill: currentcolor; margin-top: 4px; margin-right: 15px; border-radius: 50%;"
							align="left">
						<h6>
							<b>${review.id }</b>
							<br>
							<c:forEach var="i" begin="1" end="${review.score }">
								<img src="/resources/img/pic/star.svg"
						style="display: block; height: 15px; width: 15px; fill: currentcolor; margin-top: 10px; margin-right: 5px; margin-bottom: 20px;"
						align="left">
							</c:forEach>
							
							
						
						</h6>
					</div>
					<div class="col-md-9" >
						<h6>${review.content}</h6>
					</div>
					</div>
			</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">  닫 기</button>
      
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>

/* $("#dmcall2").on('click',function(){
	var hinum=$("#hinumvalue").val();
	console.log(hinum);
	console.log("123");
	location.href = '/online/dm?hinum='+hinum;
    $( "#dmdm" ).css('visibility','visible')
}); */
</script>
<script type="text/javascript" src="/resources/js/epOnline/chatjs.js"></script>

<script type="text/javascript" src="/resources/js/epOnline/onlineapply.js"></script><!-- 영노 -->

<script src="/resources/js/userapply/applyCheck.js"></script><!-- 결제 -->