<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String pass = request.getParameter("pass");
	String birth = request.getParameter("birth");
	String nickname = request.getParameter("nickname");
	String gender = request.getParameter("gender");
	
	MemberDTO dto = new MemberDTO();
	dto.setEmail(email);
	dto.setUser_name(name);
	dto.setTel(tel);
	dto.setPass(pass);
	dto.setBirth(birth);
	dto.setNickname(nickname);
	dto.setGender(gender);

	//DB에 반영
	MemberDAO dao = new MemberDAO();
	int result = dao.createMem(dto);
	
	dao.close();
	//비밀번호 찾기 성공여부에 따른 처리
	if (result == 1) {
	%>
	<script>
		alert(
	"회원가입 완료. 로그인 창으로 이동합니다.");
		location.href = "login.jsp";
	</script>
	<%
	} else {
	//찾기 실패
	%>
	<script type="text/javascript">
		alert("이미 사용중인 이메일 또는 전화번호 또는 닉네임입니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>