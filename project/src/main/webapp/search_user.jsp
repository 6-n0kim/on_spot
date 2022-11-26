<%@ page import="membership.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MemberDAO dao = new MemberDAO();

Map<String,Object> param = new HashMap<String, Object>();
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
    param.put("searchWord", searchWord);
}
List<MemberDTO> MemberLists = dao.selectList(param);
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<script src="https://kit.fontawesome.com/3004eb4abf.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/login_form.css">
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.centermain {
    padding-top: 170px;
    margin-left: 16%;
    margin-right: 21%;
}

.totalcontent {
	align-items: stretch;
	border: 0;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	position: relative;
	display: flex;
}

.botline {
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 0;
	font: inherit;
	font-size: 100%;
	position: relative;
	text-align: center;
}

.category{
text-decoration: none;
color : #007bff;;
}

.c_m {
    border: 1px solid #007bff;
  	height: 192px;
    margin-right: 20px;
}

.c_m1{
margin : 40px;}

.inlineToBlock {
    display: block;
    margin-bottom: 29px;
}

.search_pic{
	width: 47px;
    border-radius: 50%;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">
			<div class="rightline">
			<div class="c_m"><a href="search_user.jsp" class= "category"><h2 class="c_m1">유저 찾기</h2></a></div>
			<div class="c_m"><a href="search_post.jsp" class= "category"><h2 class="c_m1">게시물 찾기</h2></a></div>
			</div>
			<div class="botline">
			<form>
		<div class="input-group mb-3">
		
  <input type="text" class="form-control" name="searchWord" placeholder="닉네임을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Button</button>
 
</div>
 </form>
<table width="100%" >

<% if (MemberLists.isEmpty()) {%>
     <tr>
            <td colspan="3" align="center">
                <p class ="p">등록된 닉네임이 없습니다.</p>
            </td>
        </tr>
<%
}
else if(searchWord == null){%>
<tr>
<td colspan="3" align="center">
    <p class ="p">찾을 닉네임을 검색해주세요.</p>
</td>
</tr>
<%
}
else{
   for (MemberDTO dto : MemberLists){
	   if(dto.getNickname() != session.getAttribute("nickname")){ 
%>
        <tr align="center">
            <td width="20%"><img src="Uploads/<%= dto.getProfile_image() %>" alt="프로필 사진" class="search_pic"></td>
            <td align="center" width="60%"> 
                <a href="View.jsp?user_id=<%= dto.getUser_id() %>"><%= dto.getNickname() %> <p class="p"><%= dto.getUser_name() %></p></a>
            </td>
            <td width="20%"><input type="checkbox" class="btn-check" id="btn-check-outlined" autocomplete="off">
<label class="btn btn-outline-primary" for="btn-check-outlined">follow</label><br></td>
        </tr>
<%   }
    }
}
%>
</table>
			</div>
		</section>
	</div>

</body>
</html>