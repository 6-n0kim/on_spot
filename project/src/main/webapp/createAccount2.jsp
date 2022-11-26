<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.nomargin{
	margin:0px;
}
.inputNbtn {
    display: flex;
}
button.id_overlap_button {
    margin-bottom: 10px;
    border-radius: 6px;
    width: 78px;
    font-size: 13px;
    border: 0.1px solid;
}
</style>

<script type="text/javascript">
/* function id_overlap_check(email){
	var regex= /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(email.length ==0 || email=="" || regex.test(email)){
		alert("이메일을 입력해주세요.")
		form.email.focus();
		}else if(! id_overlap_check(email) ) {
		  	$(".result-email").text('이메일 형식으로 적어주세요');
			
			
		//	window.open("${contextPath}/member/checkId")
	    window.open("/project/emailcheck.jsp", "", "width=500, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
		}
	} */
	
function id_overlap_check(email){
	var regex= /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return(email !='' && email !='undefined' && regex.test(email));
	}
	$("input[type=email]").blur(function(){
		  var email = $(this).val();
		  if( email == '' || email == 'undefined') return;
		  if(! email_check(email) ) {
		  	$(".result-email").text('이메일 형식으로 적어주세요');
		    $(this).focus();
		    return false;
		  }else {
			$(".result-email").text('');
		  }
		});
</script>

</head>
<body>
<form action="createAccountProcess.jsp" name="form">
<%@ include file="start_display.jsp"%>
      <div class="inputNbtn">
      <input type="email" placeholder="이메일" class="inlineToBlock box" name="email" onclick="inputIdChk()" autofocus required style="width: 90%">
      <button type="button" class="id_overlap_button" name ="checkId" onclick="id_overlap_check()">중복확인</button>
      </div>
      <img id="id_check_sucess" style="display: none;">
      
      <input type="password" placeholder="비밀번호 영문,숫자포함" class="inlineToBlock box" name="pass" id="password" required>
      <input type="text" placeholder="이름" class="inlineToBlock box" name="name" required>
      <input type="tel" placeholder="전화번호 하이폰(-) 제외" class="inlineToBlock box" name="tel" maxlength="11" required>
      <input type="text" placeholder="생년월일YYMMDD EX)961211" class="inlineToBlock box" name="birth" maxlength="6" required>
	  <input type="text" placeholder="닉네임" class="inlineToBlock box" name="nickname" required>
	  	  <label class= "gender"><input type="radio"   name="gender" value='man'  checked />남성
	  <input type="radio"  name="gender" value='woman' />여성 </label>
      <button class="btn btn-outline-primary" type="submit">회원가입</button>
</form>

</body>
</html>
