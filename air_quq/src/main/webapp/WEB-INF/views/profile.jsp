<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="#" class="list-group-item list-group-item-action active">프로필 정보</a>
              
              
            </div> 
		</div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>프로필 정보</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form action="/profile/updateOk" method="post" enctype="multipart/form-data">
		                    <input type="hidden" name="menum" value="${ menum }">
                              <div class="form-group row">
                                <label for="id" class="col-4 col-form-label">아이디</label> 
                                <div class="col-8">
                                  <input id="id" name="id" placeholder="Username" class="form-control here" required="required" type="text" value="${ member.id }" readonly="readonly">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="pwd" class="col-4 col-form-label">비밀번호</label> 
                                <div class="col-8">
                                  <input id="pwd" name="pwd" placeholder="비밀번호" class="form-control here" type="password" value="${ member.pwd }">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="addr" class="col-4 col-form-label">주소</label> 
                                <div class="col-8">
                                  <input id="addr" name="addr" placeholder="주소" class="form-control here" type="text" value="${ member.addr }">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">이메일</label> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="이메일" class="form-control here" required="required" type="email" value="${ member.email }">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="phone" class="col-4 col-form-label">폰번호</label> 
                                <div class="col-8">
                                  <input id="phone" name="phone" placeholder="폰번호" class="form-control here" required="required" type="text" value="${ member.phone }">
                                </div>
                              </div>
                              <div class="form-group row" id="profileUp">
                                <label for="profileImg" class="col-4 col-form-label">프로필 사진</label> 
                                <img src="/member/profile/img?menum=${ menum }" width="250" id="profileImg">
                                
                                <input type=file name='file1' style='display: none;'>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button name="submit" type="submit" class="btn btn-primary">회원정보 수정완료</button>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//이미지 클릭시 업로드창 실행
	$("#profileImg").click(function(){
		//alert('test');
		$("input[name='file1']").click();
	});
	
	
	$("input[name='file1']").change(function(){
		readURL(this);
	});
	
	//이미지 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#profileImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>