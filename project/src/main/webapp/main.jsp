<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
<script src="https://kit.fontawesome.com/3004eb4abf.js" crossorigin="anonymous"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca148034e5dfe927c455bc42777513f0"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/common.css">
<style>
.centermain {
	padding-top: 70px;
	margin-left: 200px;
	margin-right: 200px;
	text-align: center;
	z-index: 2;
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
}

#btnsize {
	height: 150px;
	margin-top: 63px;
	background-color: white;
	color: #007bff;
	border: 1px solid #007bff;
}

#btnsize:hover {
	background: #007bff;
	color: white;
	border: 1px solid white;
}

#map {
	text-align: center;
}

.icon {
	text-decoration: none;
	"
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">
			<div id="map" style="width: 100%; height: 650px;"></div>
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-primary" onclick="location.href='post_rank.jsp';">Rank Post</button>
				<button type="button" class="btn btn-primary" onclick="location.href='post_fol.jsp';">Follow Post</button>
				<button type="button" class="btn btn-primary" onclick="location.href='post_recent.jsp';">Recent Post</button>
			</div>
		</section>
	</div>
	<script src="js/common.js"></script>
</body>

</html>