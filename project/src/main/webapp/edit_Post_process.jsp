<%@ page import="post.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
<%

String post_id = request.getParameter("post_id");
String loc = request.getParameter("loc");
String content = request.getParameter("content");


postDTO dto = new postDTO();
dto.setContent(content);
dto.setLocation(loc);
dto.setPost_id(post_id);

postDAO dao =new postDAO();
int result = dao.editPost(dto);

if(result == 1){
%>
<script>
		alert(
	"게시물 수정 완료. 메인 창으로 이동합니다.");
		location.href = "main.jsp";
	</script>
	<%
	} else {
	out.print(post_id);
	out.print(loc);
	out.print(content);
	//찾기 실패
	%>
	<script type="text/javascript">	
	alert("수정 불가");
	history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>