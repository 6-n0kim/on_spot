<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
	//로그인 폼으로부터 받은 아이디와 패스워드
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	//회원테이블 DAO를 통해 회원정보 DTO 획득 
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.getMemberDTO(email, pass);
	dao.close();

	//로그인 성공여부에 따른 처리
	if (member.getEmail() != null) {
		//로그인 성공
		session.setAttribute("email", member.getEmail());
		session.setAttribute("user_name", member.getUser_name());
		session.setAttribute("nickname", member.getNickname());
		session.setAttribute("user_id", member.getUser_id());
		session.setAttribute("tel", member.getTel());
		session.setAttribute("gender", member.getGender());
		session.setAttribute("birth", member.getBirth());
		session.setAttribute("introduce", member.getIntroduce());
		session.setAttribute("profile_image", member.getProfile_image());
		session.setAttribute("pass", member.getPass());
	%>
	
	
	<script>
		alert("로그인 완료. 메인 창으로 이동합니다.");
		location.href = "main.jsp";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("이메일과 비밀번호를 확인하세요.");
		history.go(-1);
	</script>
	<%
	}
	%>

</body>
</html>