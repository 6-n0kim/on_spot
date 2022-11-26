<%@ page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<%
MemberDTO dto = new MemberDTO();
dto.setUser_id(session.getAttribute("user_id").toString());

MemberDAO dao = new MemberDAO();
int result = dao.deleteMem(dto);
dao.close();

if(result == 1 ){
%>
<script>
	alert("회원 탈퇴 성공. 로그인 창으로 이동합니다.");
	location.href = "login.jsp";
</script>
<%
} else {
//회원 탈퇴 실패
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