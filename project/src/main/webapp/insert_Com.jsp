<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@ page import="comment.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String post_id = request.getParameter("post_id");
String user_id = session.getAttribute("user_id").toString();
String comment = request.getParameter("comment");
String profile_image = session.getAttribute("profile_image").toString();
String nickname = session.getAttribute("nickname").toString();

// out.println(post_id);
// out.println(user_id);
// out.println(comment);
// out.println(profile_image);
// out.println(nickname);


commentDTO dto =new commentDTO();
dto.setPost_id(post_id);
dto.setUser_id(user_id);
dto.setC_content(comment);
dto.setProfile_image(profile_image);
dto.setNickname(nickname);

commentDAO dao =new commentDAO();
int result = dao.insertCom(dto);
out.print(result);
dao.close();

if(result == 1){
%>
<script type="text/javascript">
location.href='post.jsp?post_id=<%=dto.getPost_id() %>';
</script>
<%}else{%>
<script>
alert("안됐음");
//history.go(-1);
</script>
<% }%>
</body>
</html>