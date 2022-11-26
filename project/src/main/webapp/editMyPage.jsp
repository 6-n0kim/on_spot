<%@ page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 수정</title>
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

.inlineToBlock {
	display: block;
	font-size : 18px;
}

form.flex_colum {
    height: 395px;
}


button.btn.btn-outline-primary {
    margin-top: 51px;
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

.c_m {
	color:#007bff;
	background: white;
    align-items: center;
    width: 237px;
    border: 1px solid #007bff;
    height: 192px;
    margin-right: 20px;
    font-size: 25px;
    text-align: center;
    display: flex;
    justify-content: center;
}

.c_m:hover{
   text-decoration: none;
   color: white;
   background : #007bff;
}
.flex_colum{
align-items: stretch;
	border: 0;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 0;
	font: inherit;
	font-size: 100%;
	position: relative;
}

.profileImg2{
    border-radius: 50%;
    width: 40px;}

.form-control-sm, .input-group-sm>.form-control, .input-group-sm>.input-group-append>.btn, .input-group-sm>.input-group-append>.input-group-text, .input-group-sm>.input-group-prepend>.btn, .input-group-sm>.input-group-prepend>.input-group-text {
    padding: 0.25rem 0.5rem;
    font-size: .875rem;
    margin-top: 10px;
    margin-bottom: 17px;
    
</style>
</head>
<body>
	<script type="text/javascript">
function validateForm(form) {
	
	if (form.file.value == "") {
		var que = confirm("프로필 사진을 유지하시겠습니까?");
		if(que){
			}
		}
	}
	
	if (form.name.value == "") {
		form.name.value == "<%=session.getAttribute("user_name")%>"
	} 
    if (form.nickname.value == "") {
        form.nickname.value == "<%=session.getAttribute("nickname")%>"
    }
    if (form.tel.value == "") {
        form.tel.value == "<%=session.getAttribute("tel")%>"
    }
    if (form.birth.value == "") {
        form.birth.value == "<%=session.getAttribute("birth")%>"
    }
    if (form.introduce.value == "") {
        form.introduce.value == "<%=session.getAttribute("introduce")%>"
    }
}
</script>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">
		
			<div class="rightline">
			<div><button class="c_m" onclick="location.href='editMyPage.jsp';">프로필 편집</button></div>
			<div><button class="c_m" onclick="location.href='editMypagepass.jsp';">비밀번호 변경<br/>/<br/>회원 탈퇴</button></div>
			<div><button class="c_m" onclick="">내 활동</button></div>
			</div>
			<div class="botline">
			<form action="editMypage_process.jsp" method="post" class="flex_colum" enctype="multipart/form-data" name="form"
			onsubmit="return validateForm(this);">
			<div class="margin101"><h6><img src="Uploads/<%=session.getAttribute("profile_image")%>"alt="프로필 사진" class="profileImg2">
			<%=session.getAttribute("nickname")%></h6>
			</div>
			프로필 사진 변경 <input type="file"  class="form-control form-control-sm" id="formFileSm" name="file">
			
				  <input type="text" class="inlineToBlock box" name="name" value='<%=session.getAttribute("user_name")%>' autofocus>
			      <input type="text" class="inlineToBlock box" name='nickname' value ='<%=session.getAttribute("nickname")%>'>
      			  <input type="tel" class="inlineToBlock box" name="tel" maxlength="11"  value ='<%=session.getAttribute("tel")%>' >
      			  <input type="text" class="inlineToBlock box" name="birth" maxlength="6" value ='<%=session.getAttribute("birth")%>'>
		          <input type="text" class="inlineToBlock box" name="introduce"  value ='<%=session.getAttribute("introduce")%>' >
      			  <p class="p"> 수정을 하지 않은 칸은 이전 정보 그대로 유지됩니다.</p>
      			  <button class="btn btn-outline-primary" type="submit">수	정</button>
      </form>
			</div>
		
		</section>
	</div>

</body>
</html>