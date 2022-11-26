<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.centermain {
	padding-top: 70px;
	margin-left: 200px;
	margin-right: 200px;
	text-align: center;
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

.p {
	color: #999999;
	font-size: 15px;
	font-weight: 700;
	opacity: 0.8;
	margin-top: 100px;
}

.inlineToBlock {
	display: block;
}

.box {
	margin-bottom: 10px;
	background-color: #f5f5f5;
	height: 37px;
	box-sizing: border-box;
	border: 1px solid #b0b0b9;
	font-size: 12px;
	font-weight: 300;
	border-radius: 5px;
	width: 100%;
}

.textarea {
	margin-bottom: 10px;
	background-color: #f5f5f5;
	box-sizing: border-box;
	border: 1px solid #b0b0b9;
	font-size: 12px;
	font-weight: 300;
	border-radius: 5px;
	width: 100%;
}

textarea {
	resize: none;
}

button.btn.btn-outline-primary {
	width: 100%;
}

div.margin {
	margin: 50px auto;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="centermain">
		<section class="totalcontent">
			<form action="createPostProcess.jsp"  method="post" enctype="multipart/form-data">
				<div class="margin">
					<p class="p">
						<input type="file" name="post_file">게시물 사진 선택
					</p>
				</div>
				<div class="margin">
					<input type="text" name="location" class="inlineToBlock box"
						placeholder="위치를 작성해주세요 EX) 서울특별시 신촌동" required>
				</div>
				<div class="margin">
					<textarea name="content" class="inlineToBlock textarea"
						placeholder="내용을 작성해주세요." cols="30" rows="20" required></textarea>
				</div>
				<div class="margin">
					<button class="btn btn-outline-primary" type="submit">등록하기</button>
				</div>
			</form>
		</section>
	</div>

</body>

</html>