<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="css/EntInfo.css">
</head>
<script src="js/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#updateUser").on('click', function() {
					location.href = "/updateEntInfo"
				});

				$("#deleteUser").on(
						'click',
						function() {
							if (confirm("정말로 탈퇴하시겠습니까?")) {
								$.ajax({
									url : 'deleteUser',
									data : {
										'memId' : "${memId}"
									},
									type : 'get',
									success : function(res) {
										alert("회원 탈퇴가 완료되었습니다.");
										location.href = "/logout";
									},
									error : function(request, status, e) {
										alert("코드=" + request.status + "\n메시지="
												+ request.responseText
												+ "\nerror=" + e);
									}
								});
							} else {
								alert("회원 탈퇴를 취소합니다.");
							}

						});

			});
</script>
<body>
	<%@ include file="header.jsp"%>
	<aside id="sidebar">
			<ul id='menusList'>
				<li class='menuItem' id=''><a href="/entInfo">기업 정보</a></li>
				<li class='menuItem' id=''><a href="#">내 브랜드 조회</a></li>
			</ul>
	</aside>
	<div class="containers">
		<article>
			<div class='menuDivs' id='menuDiv1'>
				<h2>기업 정보</h2>
				<p>고객님이 등록한 기업정보를 확인하실 수 있습니다.</p>
				<table id='myinfo'>
					<tr>
						<td>아이디</td>
						<td>${loginUser.memId}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>********</td>
					</tr>
					<tr>
						<td>대표이름</td>
						<td>${loginUser.memName}</td>
					</tr>
					<tr>
						<td>브랜드이름</td>
						<td>${loginUser.memNick}</td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td>${loginUser.memEmail}</td>
					</tr>
					<tr>
						<td>승인여부</td>
						<td></td>
					</tr>
				</table>
				<div class="bt_wrap">
					<button type="button" id="updateUser">기업정보 수정</button>
					<button id="deleteUser">회원 탈퇴</button>
				</div>
			</div>
		</article>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>