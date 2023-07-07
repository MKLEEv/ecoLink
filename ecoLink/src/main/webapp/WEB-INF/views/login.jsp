<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/common.css">
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function(){
	const loginForm = document.getElementById("login_form");	
	const loginBtn = document.getElementById("login_submit_btn");
	const loginId = document.getElementById("login_form_id");
	const loginPassword= document.getElementById("login_form_password");
	//const loginErrorMsg ="아이디 또는 비밀번호를 잘못입력했습니다. 다시확인해주세요. ";
	/* const loginLink= "http://localhost:8081/team_running/team1.html"; */
	
	$("#login_submit_btn").on('click', function(event){
		    //서브밋 우선 막기.
		 	event.preventDefault();

			//아이디, 비번에 빈칸 입력시 경고창. + 둘 다 입력시 submit
		    if (loginId.value.trim() === "" || loginPassword.value.trim() === "") {
		      alert("빈칸을 입력해주세요"); 
		    } else {
		      loginForm.submit(); 
		    }
		});//loginBtn click

	  //엔터로 다음칸 가기 : (순서) 아이디-> pw-> 로그인버튼
	  loginId.addEventListener("keydown", function(event) {
	    if (event.keyCode === 13) {
	      event.preventDefault(); 
	      loginPassword.focus();
	    }
	  });//keydown

	  loginPassword.addEventListener("keydown", function(event) {
	    if (event.keyCode === 13) {
	      event.preventDefault(); 
	      loginBtn.click(); 
	    }
	    });//keydown
});//ready end

//아이디 저장 체크박스
window.addEventListener("DOMContentLoaded", function() {
  var checkbox = document.getElementById("member_check_save_id0");
  var backgroundUrlOff = "/images/icon_input_checkbox_off.svg";
  var backgroundUrlOn = "/images/icon_input_checkbox_on.svg";

  checkbox.addEventListener("change", function() {
    if (checkbox.checked) {
      checkbox.style.backgroundImage = "url(" + backgroundUrlOn + ")";
      // 아이디 정보를 저장하는 로직 추가
    } else {
      checkbox.style.backgroundImage = "url(" + backgroundUrlOff + ")";
      // 저장된 아이디 정보를 제거하는 로직 추가
    }
  });
});
</script>
</head>
<body>
<div id="container">
<div id="header">
            <div class="logo">
                <a href="/">
                    <img src="/images/logo1.png" alt="" class="max">
                </a>
            </div>
</div>
<div id="contents">
    <div class="page page-account">
        <div class="container-mypage">
            <div class="row">
                <div class="col-lg-4">
                    <form id="login_form" name="" action="login" method="post">
                        <div class="xans-element- xans-member xans-member-login ec-base-box typeThin">
                            <div class="login">
                                <table class="type-full">
                                    <tbody>
                                        <tr>
                                            <th>아이디</th>
                                            <td><input id="login_form_id" name="login_form_id" class="inputTypeText" placeholder="" value="" type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호</th>
                                            <td><input id="login_form_password" name="login_form_password" autocomplete="off" value="" type="password"></td>
                                        </tr>
                                        <tr class="checkbox">
                                            <td class="id-pw-td">
                                                <div class="id-save">
                                                    <input id="member_check_save_id0" name="check_save_id" value="T" type="checkbox">
                                                    <label for="member_check_save_id0">아이디 저장</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#none" class="btn-primary full" id="login_submit_btn">로그인</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div>
                                    <ul class="find">
                                        <li><a href="/join">회원가입</a></li>
                                        <li><a href="/findId">아이디</a>/<a href="/findPw">비밀번호 </a>찾기</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>