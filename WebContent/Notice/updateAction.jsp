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
<jsp:setProperty name="noticeVO" property="notice_num" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
		script.println("alert('관리자가 아닙니다.')");
		script.println("location.href = 'Notice_view'");
		script.println("</script>");
	} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
		if (noticeVO.getNotice_title() == null || noticeVO.getNotice_article() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			noticeDAO ntDAO = new noticeDAO(); // 공란 없음 -> 게시글 작성
			
			Object lobj_article = request.getParameter("notice_article");
		    String replace_article = (String)lobj_article;
		    replace_article=replace_article.replace("\r\n", "<br>");	      
		    int result = ntDAO.update( Integer.parseInt(request.getParameter("noticeNumber")),request.getParameter("notice_title") ,replace_article );
			
			// int result = ntDAO.update(22, "123","123");
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
		script.println("location.href = 'notice.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
		script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
</html>