<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.enc.project1.*"%>
<%@page import="com.enc.project1.freeDAO"%>
<%@page import="com.enc.project1.freeVO"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 자유 게시판 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String userID = null;

	// 로그인 여부 확인
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../First/Sign_In.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	%>

	<%@include file="../Sidebar.jsp"%>

	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position: relative;">

		<div class="container">
			<h2 style="margin-top: 7%; margin-bottom: 5%; text-align: center">자유게시판 글쓰기</h2>
			<form action="writeAction2.jsp" method="post">
				<div class="form-group">
					<label for="title">제목</label> 
					
					<input type="text" class="form-control" id="free_title"
						placeholder="제목 입력(4-100)" name="free_title" maxlength="100" required="required"
						pattern=".{4,100}">
				</div>
				<input type="hidden" id="usernum" name="usernum" value="<%=session.getAttribute("usernum")%>"> <!-- 유저 넘버를 넘겨주기 위해 히든 값으로 넘김 -->
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="free_article" name="free_article"
						placeholder="내용 작성"></textarea>
				</div>

				<button type="submit" class="btn btn-default">작성</button>
				<button type="reset" class="btn btn-default">
					<a href="Free_Board.jsp"> 취소</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>

