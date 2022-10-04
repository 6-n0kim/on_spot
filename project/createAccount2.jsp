<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="createAccount_check.jsp">
<%@ include file="start_display.jsp"%>
      <input type="email" placeholder="이메일" class="inlineToBlock box" name="email"  autofocus required>
      <input type="password" placeholder="비밀번호 영문,숫자포함" class="inlineToBlock box" name="pwd" required>
      <input type="text" placeholder="이름" class="inlineToBlock box" name="name" required>
      <input type="tel" placeholder="전화번호 하이폰(-) 제외" class="inlineToBlock box" name="tel" maxlength="11" required>
      <button class="btn btn-outline-primary" type="submit">회원가입</button>
      
</form>
</body>
</html>