<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");

	//회원테이블 DAO를 통해 회원정보 DTO 획득 
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.findIdDTO(name, tel, birth);
	dao.close();

	//아이디 찾기 성공여부에 따른 처리
	if (member.getEmail() != null) {
	%>
	<script>
		alert(
	"<%=request.getParameter("name") + "님의 아이디는 " + member.getEmail() + " 입니다."%>"
		);
		location.href = "login.jsp";
	</script>
	<%
	} else {
	//찾기 실패
	%>
	<script type="text/javascript">
		alert("이름 전화번호 생년월일을 확인하세요.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>