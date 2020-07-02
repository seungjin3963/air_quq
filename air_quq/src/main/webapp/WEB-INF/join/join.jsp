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
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" action="/upload/memberjoin" enctype="multipart/form-data">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" placeholder="아이디" name="id">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" placeholder="주소" name="addr">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" placeholder="Email Address" name="email">
                </div>
                <div class="form-group row">
	                <div class="col-sm-12 mb-3 mb-sm-0">
	                  <input type="text" class="form-control form-control-user" placeholder="폰번호" name="phone">
	                </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password" name="pwd">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div>
                </div>
                
                <!-- 성별 드랍다운 메뉴 -->
	           	
		          <div class="dropdown no-arrow mb-4">
		             <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                	성별을 선택해 주세요.
		             </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                  <a class="dropdown-item" name="man">남자</a>
		                  <a class="dropdown-item" name="woman">여자</a>
		                </div>
		               
	             </div>
	           
	            <div class="form-group">
                 	 <b>프로필 사진&nbsp;&nbsp;&nbsp;<input type="file" name="file1">
                </div>
                
                <a href="login.html" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="/login/forgotpwd">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="/login">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
