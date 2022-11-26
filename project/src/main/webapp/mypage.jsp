<%@ page import="membership.*"%>
<%@ page import="post.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3004eb4abf.js"
	crossorigin="anonymous"></script>
<style>
.centermain {
	padding-top: 70px;
	margin-left: 200px;
	margin-right: 200px;
}

.totalcontent {
	align-items: stretch;
	border: 0;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	position: relative;
}

.botline {
	border-bottom: 1px solid black;
	display: flex;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">

			<div class="botline">
			<span><img src="Uploads/<%=session.getAttribute("profile_image")%>"alt="프로필 사진" class="profileImg"></span>
			
			<span>
				<div><h2><%=session.getAttribute("nickname")%></h2></div>
				<div><h4><%=session.getAttribute("user_name")%></h4></div>
				<div><p><%=session.getAttribute("introduce")%></p></div>
			</span>
			
			<span><h4>팔로워</h4></span>
			<span><p>count</p></span>
			
			<span><h4>팔로잉</h4></span>
			<span><p>count</p></span>
			<span><i class="fa-solid fa-gear" onclick="location.href='editMyPage.jsp'"></i></span>
</div>
			<div>my feed</div>

















		</section>
	</div>

</body>
</html>