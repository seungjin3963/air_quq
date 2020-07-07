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
                    <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                    <p class="mb-4">아래에 이메일주소를 입력하시면, 비밀번호를 재설정할수있는 메일이 전송됩니다!</p>
                  </div>
                  <form class="userforget" action="/forget/member">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" name="email" aria-describedby="emailHelp" placeholder="이메일주소를 입력하세요.">
                    </div>
                    <input type="submit" class="btn btn-primary btn-user btn-block" value="재설정 이메일 보내기">
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
