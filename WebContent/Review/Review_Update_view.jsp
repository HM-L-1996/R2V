<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.reviewDAO"%>
<%@page import="com.enc.project1.reviewVO"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 리뷰 게시판 수정</title>
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
	
	reviewDAO ntDAO = new reviewDAO();
	int reviewNumber = -1;
	if (request.getParameter("reviewNumber") != null) { reviewNumber = Integer.parseInt(request.getParameter("reviewNumber")); }

%>

	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position: relative;">
		<div class="container">
			<h2 style="margin-top: 7%; margin-bottom: 5%; text-align: center">수정하기</h2>
			<form action="Review_UpdateAction.jsp" method="post">
				<div class="form-group">
					<tr>
						<td><label for="content">내용</label>
							<textarea class="form-control" rows="5" id="review_article" name="review_article"
							placeholder="내용 작성"></textarea></td>
					</tr>
					<input type="hidden" id="review_num" name="review_num" value="<%=reviewNumber%>"> <!-- 리뷰 넘버를 넘겨주기 위해 히든 값으로 넘김 -->
				</div>			
				<button type="submit" class="btn btn-default" value="수정">수정하기</button>
				<button type="reset" class="btn btn-default">
					<a href = 'javascript:history.go(-1)' class="btnWrite">취소</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>