<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ECO LINK ADMIN LOGIN</title>
        <link href="/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script>
			function adminlogin() {
				if(document.getElementById("inputId").value==''){
					alert("아이디를 입력해주십시오.");
					document.getElementById("inputId").focus();
					return false;
				}
				if(document.getElementById("inputPassword").value==''){
					alert("암호를 입력해주십시오.");
					document.getElementById("inputPassword").focus();
					return false;
				}
				document.getElementById('adminlogin').submit();
				}
	</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">ECO LINK 관리자 페이지 로그인</h3></div>
                                    <div class="card-body">
                                        <form id="adminlogin" action="/admin/login" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" name="memId" type="text" placeholder="..." />
                                                <label for="inputId">아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="memPw" type="password" placeholder="Password" />
                                                <label for="inputPassword">비밀번호</label>
                                            </div>
                                            <!-- <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div> -->
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <h5 style="color:red">${loginfail}</h5>
                                                <a class="btn btn-primary" href="#" onclick="return adminlogin()">Login</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; ECO LINK 2023</div>
                            <div>
                                
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/admin_scripts.js"></script>
    </body>
</html>
    