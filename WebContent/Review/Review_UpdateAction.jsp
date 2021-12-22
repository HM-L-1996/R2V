<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.reviewDAO"%>
<%@page import="com.enc.project1.reviewVO"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="reviewVO" class="com.enc.project1.reviewVO" scope="page" />
<jsp:setProperty name="reviewVO" property="review_num" />
<jsp:setProperty name="reviewVO" property="review_article" />
<jsp:setProperty name="reviewVO" property="usernum" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
			script.println("location.href = '../First/Sign_In.jsp'");
			script.println("</script>");
		} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
			if (reviewVO.getReview_article() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		reviewDAO rvDAO = new reviewDAO(); // 공란 없음 -> 게시글 작성
		
		Object lobj_article = request.getParameter("review_article");
	    String replace_article = (String)lobj_article;
	    replace_article=replace_article.replace("\r\n", "<br>");	      
	    int result = rvDAO.update( Integer.parseInt(request.getParameter("review_num")), replace_article);

		if (result == -1) { // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글 수정에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 게시글  수정
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글이 수정되었습니다.')");
			script.println("location.href = 'Review_Board.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
			script.println("</script>");
		}
			}
		}
	%>
</body>
</html>