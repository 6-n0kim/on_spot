<%@ page import="membership.*"%>
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

	String file;
	String fileName;
	String ext;
	String now;
	String uid = (String)session.getAttribute("user_id"); 
	// 파일은 보안성때문에 자동으로 값을 넣는게 불가능하다.
	if(mr.getFilesystemName("file") == null){
	file =(String)session.getAttribute("profile_image");
	}else{

	fileName= mr.getFilesystemName("file");
	ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 확장자
	now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	file = now + uid + ext; // 새로운 파일 이름("업로드일시+유저id.확장자")
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + file);
	oldFile.renameTo(newFile);
	}
	
	String name = mr.getParameter("name");
	String nickname = mr.getParameter("nickname");
	String tel = mr.getParameter("tel");
	String birth = mr.getParameter("birth");
	String introduce = mr.getParameter("introduce");

	
	// DTO 생성
	MemberDTO dto = new MemberDTO ();
	dto.setNickname(nickname);
	dto.setUser_name(name);
	dto.setTel(tel);
	dto.setBirth(birth);
	dto.setIntroduce(introduce);
	dto.setProfile_image(file);
	dto.setUser_id(session.getAttribute("user_id").toString());
	
	
	session.setAttribute("email", dto.getEmail());
	session.setAttribute("user_name", dto.getUser_name());
	session.setAttribute("nickname", dto.getNickname());
	session.setAttribute("tel", dto.getTel());
	session.setAttribute("birth", dto.getBirth());
	session.setAttribute("introduce", dto.getIntroduce());
	session.setAttribute("profile_image", dto.getProfile_image());
	
	
	// 6. DAO를 통해 데이터베이스에 반영
	MemberDAO dao = new MemberDAO();
	dao.editPage(dto);
	dao.close();
%>
<script>
	alert("수정 완료.");
	location.href = "editMyPage.jsp";
</script>
<%
} catch (Exception e) {
e.printStackTrace();
%>
<script type="text/javascript">
	alert("왜 안될까용");
	history.go(-1);
</script>
<%
}
%>