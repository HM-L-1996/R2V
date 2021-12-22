<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 공지 사항 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String userID = null;
	Object ad_userID = session.getAttribute("id");
	userID = (String) ad_userID;
	//	Object obj_userID = session.getAttribute("id"); 
	//	userID = (String)obj_userID;

	// 로그인 여부 확인
	if (userID != null && userID.equals("admin")) {
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자가 아닙니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	%>

	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position: relative;">
		<div class="container">
			<h2 style="margin-top: 7%; margin-bottom: 5%; text-align: center">공지사항 글쓰기</h2>
			<form action="writeAction.jsp" method="post">
				<div class="form-group">
					<label for="title">제목</label>
					<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
					<!-- required 속성을 설정하면 필수입력 사항이된다. -->
					<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->

					<input type="text" class="form-control" id="notice_title" placeholder="제목 입력(4-100)"
						name="notice_title" maxlength="100" required="required" pattern=".{4,100}">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
					<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
					<textarea class="form-control" rows="5" id="notice_article" name="notice_article"
						placeholder="내용 작성"></textarea>
				</div>
				<!-- 				<div class="form-group"> -->
				<!-- 					<label for="writer">작성자</label> <input type="text" class="form-control" id="writer" -->
				<!-- 						placeholder="작성자(2자-10자)" name="writer"> -->
				<!-- 				</div> -->
				<button type="submit" class="btn btn-default">작성</button>
				<button type="reset" class="btn btn-default">
					<a href="notice.jsp"> 취소</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>

