<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="email" placeholder="이메일" class="inlineToBlock box" name="email" onkeydown="inputIdChk()" autofocus required style="width: 90%">
<%
	String email = request.getParameter("email"); 
%>
<%=request.getParameter("email") %>
</body>
</html>