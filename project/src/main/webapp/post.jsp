<%@ page import="post.*" %>
<%@ page import="comment.*" %>
<%@ page import="membership.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String post_id = request.getParameter("post_id");
//post
postDAO dao = new postDAO();
postDTO dto = dao.postView(post_id);

//comment
commentDAO com = new commentDAO();

Map<String,Object> map = new HashMap<String, Object>();
map.put("post_id", post_id);
List<commentDTO> commentLists = com.selectList(map);

com.close();
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

    .noneunderline:hover {
      text-decoration: none;
      color: rgb(61, 58, 58);
    }

    #right_float {
      float: right;
      margin-right: 22px;
      margin-bottom: 3px;
    }
	 #right_float2 {
      float: right;
      margin-right : 69px;
      margin-bottom: 3px;
      font-size: 25px;
      color: black;
    }
    #left_float {
      float: left;
      padding-right: 20px;
      margin-bottom: 3px;
    }

    #RL_padding {
    padding-left: 20px;
    padding-right: 20px;
    margin-bottom: 30px;
	}

    .box {
      margin-bottom: 10px;
      background-color: #f5f5f5;
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

    input {
      width: 94%;
      float: left;
    }

    #icon_check{
      width: 4%;
      float: left;
    }
    img.postfile {
    width: 53%;
    margin-top: 48px;
    margin-bottom: 19px;
}

	.pop_inner {
    float: right;
    margin-right: 22px;
}
    
    button#pop {
    color: black;
    background: antiquewhite;
    border-radius: 9%;
    border: none;
    font-size:19px;
}
	button#pop:hover {
    color: antiquewhite;
    background: black;
    border-radius: 9%;
    border: none;
}
button.noneunderline {
    background: white;
    height: 35px;
}
img.search_pic {
    width: 15%;
    border-radius: 50%;
}
a.prof {
    text-decoration: none;
    color: black;
    font-size: 20px;
}

.commentWindow {
    margin: 52px auto;
}
  </style>
</head>

<body>

<jsp:include page="header.jsp" />
  <div class="centermain">
    <section class="totalcontent">
      <div><a href="#" class="noneunderline" id="left_float" style="font-size : 25px;font-weight: 400;"><img class="profileImg" src="Uploads/<%=dto.getProfile_image() %>"
            alt="게시자 프로필"><%=dto.getNickname() %></a> </div>
      <div><a href="#" class="noneunderline" id="left_float" style="font-size : 20px;"><%=dto.getLocation() %></a>
      <a href="#setting" id="right_float2" class="btn_open"><i class="fa-solid fa-bars" ></i></a>
      <a class="btn btn-primary" href="#" role="button" id="right_float">follow</a>
      <div id="setting" class="pop_wrap" style="display:none;">
      <div class="pop_inner">
      <button type="button" class="but" id="pop" onclick="location.href='edit_Post.jsp?post_id=<%=dto.getPost_id()%>';">수정</button>
      <button type="button" class="but" id="pop" onclick="deletePost()">삭제</button>
      <button type="button" class="btn_close" id="pop" >닫기</button>
      </div>
  	  </div>
      </div>
      <div class="post_pic"><img class="postfile" src="Uploads/<%=dto.getPost_file() %>" alt="게시물 사진" ></div>
      
      <div id="RL_padding">
        <p id="left_float3"><%=dto.getContent()%></p>
      </div>

      <div id="RL_padding">
      <i class="fa-regular fa-thumbs-up" id="left_float"></i>
        <p id="left_float"><%=dto.getLikecount() %></p> <i class="fa-solid fa-thumbs-up" id="left_float"></i>
      </div>
  <!-- 댓글창 -->
  	  <div class= "commentWindow">
  	   <table>
  	  <%
  	  if(commentLists.isEmpty()){%>
  	  <tr><td>
  	  <p class="p">등록된 댓글이 없습니다.</p>
  	  </td></tr>
  	  <%
  	  }
  	  else{
  		  for(commentDTO comdto : commentLists){
  			%>  		  

  		 <tr>
            <td align="center" width="20%">  
               <a href="#" class="prof"><img src="Uploads/<%= comdto.getProfile_image() %>" alt="프로필 사진" class="search_pic">
               <%= comdto.getNickname() %></a>
            </td>
            <td width="80%"><%= comdto.getC_content() %> </td>
        </tr>
  	  <% }
  	  }%>
  	  </table>
  	  </div>
  
      <div><form method="get" action="insert_Com.jsp" onsubmit="return insertCom(this)">
      <input type="hidden" name="post_id" value="<%=dto.getPost_id() %>" />
      <input type="text" class="box" placeholder="댓글 쓰기" name="comment" />
      <span><button type="submit" class="noneunderline"><i class="fa-solid fa-check" id="icon_check"></i></button></span>
      </form></div>
	  <div><button type="button" class="btn btn-outline-primary" onclick="history.go(-1);">뒤로가기</button></div>
      <!-- <div style="visibility: visible;opacity: 1;display:fixed"> -->
    </section>
  </div>
 <script>
  	  //작성자가 맞으면 block 아니면 none
  	    if('<%=session.getAttribute("user_id")%>' != '<%=dto.getUser_id()%>'){		
  	    	document.getElementById("right_float2").style.display ='none'; 	
  	    }else{ 		
  	    	document.getElementById("right_float2").style.display ='block'; 	
  	    }

var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}

//삭제전 confirm
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?");
    if (confirmed) {
    	location.href='delete_Post.jsp?post_id=<%=dto.getPost_id()%>';
    }
}

//댓글 작성 
function insertCom(form){
	if(form.comment.value == ""){
		alert("공백으로 댓글을 남길 수 없습니다.");
		return false;
	}
}

</script>
</body>

</html>