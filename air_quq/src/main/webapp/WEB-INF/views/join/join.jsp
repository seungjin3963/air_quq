    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">새로운 회원으로 등록하기!</h1>
              </div>
              <form class="user" action="/upload/memberjoin" enctype="multipart/form-data" method="post" id="jid">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" placeholder="아이디(*)" name="id">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" placeholder="주소" name="addr">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" placeholder="이메일 주소(*)" name="email">
                </div>
                <div class="form-group row">
	                <div class="col-sm-12 mb-3 mb-sm-0">
	                  <input type="text" class="form-control form-control-user" placeholder="폰번호" name="phone">
	                </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="InputPassword" placeholder="비밀번호(*)" name="pwd">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="RepeatPassword" placeholder="비밀번호 확인" name="pwdChk">
                  </div>
                </div>
                
                <!-- 성별 드랍다운 메뉴 -->
	           	
		          <div class="dropdown no-arrow mb-4">
		             <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                	성별을 선택해 주세요.(*)
		             </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                  <a class="dropdown-item" name="man">남자</a>
		                  <a class="dropdown-item" name="woman">여자</a>
		                </div>
		               
	             </div>
	           
	            <div class="form-group">
                 	 <b>프로필 사진&nbsp;&nbsp;&nbsp;<input type="file" name="file1">
                </div>
                <input type="submit" id="search" value="회원가입 하기" class="btn btn-primary btn-user btn-block">
              </form>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> 구글 아이디로 가입하기
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> 페이스북 아이디로 가입하기
                </a>
              <hr>
              <div class="text-center">
                <a class="small" href="/login/forgotpwd">비밀번호를 잊으셨나요?</a>
              </div>
              <div class="text-center">
                <a class="small" href="/login">아이디가있으신가요? 로그인하기!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
