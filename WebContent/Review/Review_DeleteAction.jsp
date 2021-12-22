<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.reviewDAO"%>
<%@page import="com.enc.project1.reviewVO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="reviewVO" class="com.enc.project1.reviewVO" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시물 삭제</title>
</head>
<body>
	<%
		String userID = null;
		// 로그인 여부 확인
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href ='../First/Sign_In.jsp'");
			script.println("</script>");
		} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
		
			reviewDAO rvDAO = new reviewDAO(); // 공란 없음 -> 게시글 작성
			
		 	int result = rvDAO.delete(Integer.parseInt(request.getParameter("reviewNumber")));
		
		if (result == -1) { // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 게시글  수정
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글이 삭제되었습니다.')");
			script.println("location.href = 'Review_Board.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
			script.println("</script>");
		}
			}
		
	%>
</body>
</html>