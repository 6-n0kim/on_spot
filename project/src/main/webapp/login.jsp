<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OnSpot Login</title>
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<style>
body {
	background-color: #f9f9f9;
}

.contentsWrap {
	margin: 90px auto;
	border: none;
	padding: 20px;
	text-align: center;
	width: 452px;
}

.window {
	background-color: #fcfcfc;
	padding: 10px auto;
	border: 1px solid #dfdfdf;
	border-radius: 10px;
	width: 413px;
}

.window img {
	background-color: #fcfcfc;
	padding: 10px auto;
	border: none;
	border-radius: 10px;
	text-align: center;
}

.window * {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.box {
	margin-bottom: 10px;
	height: 37px;
	box-sizing: border-box;
	border: 1px solid #b0b0b9;
	font-size: 12px;
	font-weight: 300;
	border-radius: 5px;
}

.box:focus {
	outline: none;
}

.ordinaryLogin {
	height: 37px;
	margin-bottom: 10px;
	color: white;
	background-color: #549ec0;
	border: 1px solid #f5f5f5;
	font-size: 15px;
	font-weight: 700;
}

#onSpotLogo {
	margin: 60px auto 60px;
	max-width: 175px;
}

.inlineToBlock {
	display: block;
	background-color: #f9f9f9;
}

.p {
	color: #999999;
	font-size: 15px;
	font-weight: 700;
	opacity: 0.8;
}

.noneunderline {
	text-decoration: none;
	color: #549ec0;
}

.findidpwd {
	margin-top: 50px;
	margin-bottom: 10px;
	box-sizing: border-box;
	font-size: 15px;
	font-weight: 500;
}

.creatAccountIcon {
	width: 50px;
}


a.noneunderline {
    text-decoration: none;
}
	
	</style>
</head>

<body>

<form action="login_check.jsp" method="post" name="LoginForm">
  <div class="contentsWrap" style="width: 452px;">
    <div class="window" style="width: 413px;">
       <a href="login.jsp"><img src="img/on_spot_text.png" alt="" id="onSpotLogo"></a>
      <input type="email" placeholder="이메일" class="inlineToBlock box" name="email"required>
      <input type="password" placeholder="비밀번호" class="inlineToBlock box" name="pass" required>
      <button class="btn btn-outline-primary" type="submit">로그인</button>
      <hr>
      <p class="p">계정을 잊으셨다면?</p>
      <div>
        <a href="find_id.html" class="noneunderline findidpwd">아이디 또는 비밀번호 찾기</a>
      </div>
    </div>

    <div class="haveAccount">
      <div>
        <p class="p">계정이 없으신가요?</p>
      </div>
      <a href="createAccount.jsp" class="noneunderline">
        <img src="img/register_login_signup.png" class="creatAccountIcon"><br>가입하기</a>
    </div>
  </div>
</form>
</body>
</html>