<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.noticeDAO"%>
<%@page import="com.enc.project1.noticeVO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 공지 사항 수정</title>
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
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../First/Sign_In.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	noticeDAO ntDAO = new noticeDAO();
	int noticeNumber = -1;
	if (request.getParameter("noticeNumber") != null) {
		noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	}
	%>
	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position: relative;">
		<div class="container">
			<h2 style="margin-top: 7%; margin-bottom: 5%; text-align: center">수정하기</h2>
			<form action="updateAction.jsp?noticeNumber=<%=noticeNumber%>" method="post">
				<div class="form-group">
					<thead>
						<tr>
							<th style="text-align: center;">제목</th>
						</tr>
					</thead>
					<tr>
						<td><input type="text" class="form-control" id="notice_title" placeholder="제목 입력(4-100)"
							name="notice_title" maxlength="100" required="required" pattern=".{4,100}"></td>
					</tr>
					<tr>
						<td><label for="content">내용</label> <textarea class="form-control" rows="5"
								id="notice_article" name="notice_article" placeholder="내용 작성"></textarea></td>
					</tr>


				</div>

				<button type="submit" class="btn btn-default" value="수정">수정하기</button>
				<button type="reset" class="btn btn-default">
					<a href="notice.jsp"> 취소</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>

