<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3004eb4abf.js" crossorigin="anonymous"></script>
</head>
<body>
<input type="text" class="username_input" name="username" check_result="fail" required />
<button type="button" class="id_overlap_button" onclick="id_overlap_check()">중복검사</button>
<i class="fa-solid fa-check" id="id_check_sucess"></i>


<script>
function id_overlap_check() {

    $('.username_input').change(function () {
      $('#id_check_sucess').hide();
      $('.id_overlap_button').show();
      $('.username_input').attr("check_result", "fail");
    })


    if ($('.username_input').val() == '') {
      alert('이메일을 입력해주세요.')
      return;
    }

    id_overlap_input = document.querySelector('input[name="username"]');

    $.ajax({
      url: "{% url 'lawyerAccount:id_overlap_check' %}",
      data: {
        'username': id_overlap_input.value
      },
      datatype: 'json',
      success: function (data) {
        console.log(data['overlap']);
        if (data['overlap'] == "fail") {
          alert("이미 존재하는 아이디 입니다.");
          id_overlap_input.focus();
          return;
        } else {
          alert("사용가능한 아이디 입니다.");
          $('.username_input').attr("check_result", "success");
          $('#id_check_sucess').show();
          $('.id_overlap_button').hide();
          return;
        }
      }
    });
  }
  
  </script>
</body>
</html>