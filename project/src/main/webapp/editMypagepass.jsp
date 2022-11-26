<%@ page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 수정</title>
<script src="https://kit.fontawesome.com/3004eb4abf.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/login_form.css">
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.centermain {
    padding-top: 170px;
    margin-left: 16%;
    margin-right: 21%;
}

form.flex_colum {
    height: 383px;
}
.totalcontent {
	align-items: stretch;
	border: 0;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	position: relative;
	display: flex;
}

button.btn.btn-outline-primary {
    margin-top: 51px;
}

.botline {
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 0;
	font: inherit;
	font-size: 100%;
	position: relative;
	text-align: center;
}

.c_m {
	color:#007bff;
	background: white;
    align-items: center;
    width: 237px;
    border: 1px solid #007bff;
    height: 192px;
    margin-right: 20px;
    font-size: 25px;
    text-align: center;
    display: flex;
    justify-content: center;
}

.c_m:hover{
   text-decoration: none;
   color: white;
   background : #007bff;
}
.flex_colum{
align-items: stretch;
	border: 0;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 0;
	font: inherit;
	font-size: 100%;
	position: relative;
}

.profileImg2{
    border-radius: 50%;
    width: 40px;}


.inlineToBlock {
    display: block;
    margin-bottom: 29px;
}

input.inlineToBlock.box {
    margin-top: 12px;
}

p.p {
    margin-top: 23px;
    margin-bottom: -19px;
}

.inlineToBlock {
	display: block;
	background-color: #f9f9f9;
}

</style>
</head>
<body>
	<script type="text/javascript">
function validateForm(form) {
	if (form.pass.value != form.passcheck.value) {
		  alert("비밀번호가 일치하지 않습니다.");
          return false;
    }
}

function validateForm2(form) {
	if (form.pass.value == <%=session.getAttribute("pass")%>) {
		var ok = confirm("정말 탈퇴하시겠습니까?");
		if(ok){return true;}else{return false;}
	}else {alert("비밀번호가 일치하지 않습니다.");return false;}
}

</script>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">
			<div class="rightline">
			<div><button class="c_m" onclick="location.href='editMyPage.jsp';">프로필 편집</button></div>
			<div><button class="c_m" onclick="location.href='editMypagepass.jsp';">비밀번호 변경<br/>/<br/>회원 탈퇴</button></div>
			<div><button class="c_m" onclick="">내 활동</button></div>
			</div>
			<div class="botline">
			<form action="editMypagepass_process.jsp" method="post" class="flex_colum" onsubmit="return validateForm(this);">
				  <input type="password" class="inlineToBlock box" name="pass" placeholder="새 비밀번호" autofocus required>
		          <input type="password" class="inlineToBlock box" name="passcheck" placeholder="새 비밀번호 재입력" required>
      			 <p class="p"> 비밀번호는 영문,숫자포함 10자 이상으로 입력해주세요.</p>
      			  <button class="btn btn-outline-primary" type="submit">비밀번호 변경</button>
      </form>
      
	<form action="deleteUser_process.jsp" method="post" class="flex_colum" onsubmit="return validateForm2(this);">
		<input type="password" class="inlineToBlock box" name="pass" placeholder="비밀번호" autofocus required>
		 
		  <p class="p"> 회원 탈퇴를 위해 현재 비밀번호를 입력해주세요.</p>
		 <button class="btn btn-outline-primary" type="submit">회원 탈퇴</button>
		</form>
		</div>
		
		</section>
	</div>

</body>
</html>