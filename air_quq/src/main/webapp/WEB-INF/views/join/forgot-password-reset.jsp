    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">비밀번호 재설정 페이지</h1>
                    <p class="mb-4">아래에 인증번호와 비밀번호를 입력해주세요.</p>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="forgetKey" aria-describedby="emailHelp" placeholder="인증번호">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="pwd" aria-describedby="emailHelp" placeholder="비밀번호를 입력하세요.">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="pwdChk" aria-describedby="emailHelp" placeholder="비밀번호 확인">
                    </div>
                    <a href="/forget/member/success" class="btn btn-primary btn-user btn-block">
                      	비밀번호 변경 요청 완료
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/member/join">새로운 회원이 되보세요!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/login">이미회원이신가요? 로그인하러가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
