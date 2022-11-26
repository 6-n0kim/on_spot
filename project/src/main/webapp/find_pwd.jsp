<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	

	 MemberDTO dto = new MemberDTO();
	  dto.setEmail(email);
	  dto.setUser_name(name);
	  dto.setTel(tel);
	  
	  //DB에 반영 : Member테이블에 email과 같은 row를 update 
	  MemberDAO dao = new MemberDAO();
	  int result = dao.resetPass(dto);
	  dao.close();
	//비밀번호 찾기 성공여부에 따른 처리
	if(result == 1 ){
	%>
	<script>
		alert(
	"<%=request.getParameter("name") + "님의 비밀번호는 1234로 초기화 됐습니다."%>");
		location.href = "login.jsp";
	</script>
	<%
	} else {
	//찾기 실패
	%>
	<script type="text/javascript">
		alert("이메일 이름 전화번호를 확인하세요.");
		history.go(-1);
	</script>
	<%
	}
	%>
	</body>
</html>