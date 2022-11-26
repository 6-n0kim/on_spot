<%@ page import="post.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String post_id =request.getParameter("post_id");

postDTO dto = new postDTO();
dto.setPost_id(post_id);

postDAO dao = new postDAO();
int result = dao.deletePost(dto);
dao.close();

if(result == 1){
%>
<script>
	alert("게시물 삭제 성공. 메인 창으로 이동합니다.");
	location.href = "main.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("안될이유가 없다.");
	history.go(-1);
</script>
<%
}
%>
