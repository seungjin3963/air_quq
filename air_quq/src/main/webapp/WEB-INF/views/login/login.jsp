  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                  </div>
                  <form action="/member/login" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="idl" placeholder="아이디를 입력해주세요.">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="pwdl" placeholder="비밀번호">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">자동 로그인</label>
                      </div>
                    </div>
                    <input type="submit" class="btn btn-primary btn-user btn-block" value="로그인" >
                  </form>
                    <hr>
                    <div class="text-center">
                		<a href="https://kauth.kakao.com/oauth/authorize?client_id=f5b5ae84edd2bb27cfdebdebaa48bc3f&redirect_uri=http://localhost:8090/kakao/login&response_type=code">
                   			<img src="/resources/img/kakao_login_medium_wide.png">
                		</a>
                	</div>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/login/forgotpwd">비밀번호를 잊으셨나요?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/member/join">새로운 회원이 되보세요!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

