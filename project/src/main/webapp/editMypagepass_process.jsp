<%@ page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
</head>
<body>
<%
String pass = request.getParameter("pass");

MemberDTO dto = new MemberDTO();
dto.setPass(pass);
dto.setUser_id(session.getAttribute("user_id").toString());

MemberDAO dao = new MemberDAO();
int result = dao.editPass(dto);
dao.close();

if(result == 1 ){
%>
<script>
	alert("비밀번호가 수정됐습니다.");
	location.href = "editMypagepass.jsp";
</script>
<%
} else {
//찾기 실패
%>
<script type="text/javascript">
	alert("안될이유가 없다.");
	history.go(-1);
</script>
<%
}
%>
</body>
</html>