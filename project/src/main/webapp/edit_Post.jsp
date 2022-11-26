<%@ page import="post.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String post_id = request.getParameter("post_id");

postDAO dao = new postDAO();

postDTO dto = dao.postView(post_id);

dao.close();

%> 
 
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시물 페이지</title>
  <link rel="stylesheet" href="css/login_form.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://kit.fontawesome.com/3004eb4abf.js" crossorigin="anonymous"></script>
  <style>
  
    .profileImg {
      border-radius: 50%;
      width: 40px;
    }
	
    .centermain {
      padding-top: 70px;
      margin-left: 200px;
      margin-right: 200px;
	  z-index: 2;
    }

    .totalcontent {
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

    .noneunderline {
      text-decoration: none;
      color: black;
      border: none;
    }
  
    .box {
      margin-bottom: 10px;
      background-color: #white;
      box-sizing: border-box;
      border: 1px solid #b0b0b9;
      border-radius: 5px;
    }

    .post_pic {
      text-align: center;
    }

    div {
      display: block;
    }

    textarea {
      width: 100%;
      resize : none;
      height: 100px;
    }
    
    textarea.inlineToBlock.box {
    height: 110px;
}
    img.postfile {
    width: 53%;
    margin-top: 48px;
    margin-bottom: 19px;
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

#center{
text-align : center;}
  </style>
</head>

<body>
<!-- 게시판 작성자가 아니면 설정 아이콘 없앰 -->
<jsp:include page="header.jsp" />
  <div class="centermain">
    <section class="totalcontent">
    <form action="edit_Post_process.jsp" method="post" class="flex_colum" name="form"
			onsubmit="return validateForm(this);">
		<input type="hidden" name="post_id" value="<%=dto.getPost_id() %>" />
		<div class="noneunderline" id="left_float" style="font-size : 25px;font-weight: 400;"><img class="profileImg" src="Uploads/<%=dto.getProfile_image() %>"
            alt="게시자 프로필"><%=dto.getNickname() %></div>
      <input type="text" class="noneunderline inlineToBlock box" id="left_float" name="loc" style="font-size : 20px;"value='<%=dto.getLocation() %>'>
      <div class="post_pic"><img class="postfile" src="Uploads/<%=dto.getPost_file() %>" alt="게시물 사진" ></div>
      <div id="center"><p class="p" style="color:red;"> *게시물 사진은 수정 불가*</p>
      </div>
      
      <div id="RL_padding">
        <p id="left_float3"><textarea class="inlineToBlock box" name="content" cols=10><%=dto.getContent().replace("\r\n","<br/>") %> </textarea></p>
      </div>
 		<div id="center"><p class="p"> 수정을 하지 않은 칸은 이전 정보 그대로 유지됩니다.</p></div>
	  <div id="center"><button type="button" class="btn btn-outline-primary" onclick="history.go(-1);">뒤로가기</button>
      			  <button class="btn btn-outline-primary" type="submit">수	정</button>
      </div>
      <!-- <div style="visibility: visible;opacity: 1;display:fixed"> -->
    </form>
    </section>
  </div>
  <script type="text/javascript">
	  function validateForm(form) {
		  if (form.loc.value == "") {
		        alert("위치를 입력하세요.");
		        form.loc.focus();
		        return false;
		    }
		    if (form.content.value == "") {
		        alert("내용을 입력하세요.");
		        form.content.focus();
		        return false;
		    }
		}
	  
  </script>
  
  
</body>
</html>