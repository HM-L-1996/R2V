<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.noticeDAO"%>
<%@page import="com.enc.project1.noticeVO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="noticeVO" class="com.enc.project1.noticeVO" scope="page" />
<jsp:setProperty name="noticeVO" property="notice_title" />
<jsp:setProperty name="noticeVO" property="notice_article" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<%
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
	} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
		if (noticeVO.getNotice_title() == null || noticeVO.getNotice_article() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			noticeDAO noticeDAO = new noticeDAO(); // 공란 없음 -> 게시글 작성
			noticeVO.setNotice_article(noticeVO.getNotice_article().replace("\r\n", "<br>"));
			int result = noticeDAO.write(noticeVO);
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
		script.println("location.href = 'notice.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
		script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
</html>