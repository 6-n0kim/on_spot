<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>헤더</title>
  <script src="https://kit.fontawesome.com/3004eb4abf.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href ="css/header.css">
</head>

<body>
  <header style="z-index: 1;background: #fff;">
    <div id="flex">
      <div class="leftPosition"><a href="main.jsp"><img class="logo" src="img/on_spot_logo_final.png" alt="logo"></a></div>
      <div class="rightPosition">
        <span><a href="search_user.jsp" class="icon"><i class="fa-solid fa-magnifying-glass" id="btn"></i></a></span>
        <span><a href="main.jsp" class="icon"><i class="fa-solid fa-house" id="btn"></i></a></span>
        <span><a href="createpost.jsp" class="icon"><i class="fa-regular fa-square-plus" id="btn"></i></a></span>
        <span><a href="#" class="icon"><i class="fa-solid fa-comments" id="btn"></i></a></span>
        <span><a href="#" class="icon"><i class="fa-regular fa-heart" id="btn"></i></a></span>
        <span><a href="Logout.jsp" class="icon"><i class="fa-solid fa-right-from-bracket" id="btn"></i></a></span>
        <span><a href="mypage.jsp" class="icon" ><%=session.getAttribute("nickname") %></a></span>
        <span><a href="mypage.jsp" class="icon"><img src="Uploads/<%=session.getAttribute("profile_image")%>" alt="프로필 사진" class="profileImg"></a></span>
      </div>
    </div>
  </header>
</body>

</html>