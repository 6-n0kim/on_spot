<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>최근 게시물</title>
  <script src="https://kit.fontawesome.com/3004eb4abf.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
      display: flex;
      flex-direction: column;
      flex-grow: 1;
      flex-shrink: 0;
      font: inherit;
      font-size: 100%;
      position: relative;
      text-align: center;
    }

    .top_title {
      margin-bottom: 10px;
    }

    #btnsize {
      height: 85px;
      background-color: black;
      border: 0.1px solid white;
    }

    #thum_title {
      float: left;
      width: 150px;
      border-radius: 50%;
    }

    .margin_20px {
      margin-top: 20px;
    }

    .count {
      margin-top: 40px;
    }

    .post_thumnail {
      width: 170px;
      height: 170px;
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
      <div class="top_title">
        <div><img id="thum_title" alt="베스트 썸네일" src="img/on_spot_logo_final.png"></div>
        <div class="margin_20px">
          <h2>위치</h2>
          <p class="count">게시물 count</p>
        </div>
      </div>
      <div class="btn-group" role="group" aria-label="Basic example">
  		<button type="button" class="btn btn-primary" id="btnsize" onclick="location.href='post_rank.jsp';">Rank post</button>
        <button type="button" class="btn btn-primary" id="btnsize" onclick="location.href='post_fol.jsp';">follow post</button>
        <button type="button" class="btn btn-primary" id="btnsize" onclick="location.href='post_recent.jsp';">Recent post</button>
      </div>
    </section>
    
    <div class="post_thumnails">
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
      <div><a href="#"><img src="img/home.png" alt="" class="post_thumnail"></a></div>
    </div>
  </div>
</body>

</html>