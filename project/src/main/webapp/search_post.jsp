<%@ page import="post.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
postDAO dao = new postDAO();

Map<String,Object> param = new HashMap<String, Object>();
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
    param.put("searchWord", searchWord);
}
List<postDTO> postLists = dao.selectList(param);
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
	width: 140px;
	float: left;
    margin: 15px;
    border: 0.2px solid black;
    border-radius: 5%;
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
  <input type="text" class="form-control" name="searchWord" placeholder="위치를 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Button</button>
</div>
 </form>

<div>
<% if (postLists.isEmpty()) {%>
<table width="100%" >
     <tr>
            <td colspan="1" align="center">
                <p class ="p">등록된 위치가 없습니다.</p>
            </td>
        </tr>
        </table>
<%
}
else if(searchWord == null){%>
<table width="100%" >
<tr>
<td colspan="3" align="center">
    <p class ="p">찾을 위치를 검색해주세요.</p>
</td>
</tr>
</table>
<%
}
else{
   for (postDTO dto : postLists){
%>
        <div><a href="post.jsp?post_id=<%= dto.getPost_id()%>">
        <img src="Uploads/<%= dto.getPost_file() %>" alt="게시물 사진" class="search_pic"></a></div>
<%
    }
}
%>
</div>
			</div>
		</section>
	</div>

</body>
</html>