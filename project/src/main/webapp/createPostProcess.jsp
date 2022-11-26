<%@ page import="post.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads"); // 저장할 디렉터리
int maxPostSize = 1024 * 1000; // 파일 최대 크기(1MB)
String encoding = "UTF-8"; // 인코딩 방식

try {
	// MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

	String fileName = mr.getFilesystemName("post_file"); // 현재 파일 이름
	String ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 확장자
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	
	String uid =(String)session.getAttribute("user_id") + "_uid";
	String file = uid + now + ext; // 새로운 파일 이름("업로드일시.확장자")
	
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + file);
	oldFile.renameTo(newFile);
	
	String loc = mr.getParameter("location");
	String content = mr.getParameter("content");

	// DTO 생성
	postDTO dto = new postDTO();
	dto.setContent(content);
	dto.setLocation(loc);
	dto.setPost_file(file);
	dto.setUser_id(session.getAttribute("user_id").toString());

	// 6. DAO를 통해 데이터베이스에 반영
	postDAO dao = new postDAO();
	dao.insertWrite(dto);
	dao.close();
%>
<script>
	alert("글 작성 완료. 메인 창으로 이동합니다.");
	location.href = "main.jsp";
</script>
<%
} catch (Exception e) {
e.printStackTrace();
%>
<script type="text/javascript">
	alert("왜 안될까");
	history.go(-1);
</script>
<%
}
%>
