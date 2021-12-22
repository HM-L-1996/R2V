<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.freeDAO"%>
<%@page import="com.enc.project1.freeVO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="freeVO" class="com.enc.project1.freeVO" scope="page" />
<jsp:setProperty name="freeVO" property="free_title" />
<jsp:setProperty name="freeVO" property="free_article" />
<jsp:setProperty name="freeVO" property="usernum" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 자유 게시판 작성</title>
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
			script.println("location.href = '../first/Sign_in.jsp'");
			script.println("</script>");
		} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
			if (freeVO.getFree_title() == null || freeVO.getFree_article() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		freeDAO freeDAO = new freeDAO(); // 공란 없음 -> 게시글 작성
		freeVO.setFree_article(freeVO.getFree_article().replace("\r\n", "<br>"));
		int result = freeDAO.write(freeVO);
		if (result == -1) { // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글 작성에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 게시글 작성 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글이 등록되었습니다.')");
			script.println("location.href = 'Free_Board.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
			script.println("</script>");
		}
			}
		}
	%>
</body>
</html>
</html>