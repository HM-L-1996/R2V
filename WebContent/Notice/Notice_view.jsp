<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enc.project1.noticeDAO"%>
<%@ page import="com.enc.project1.noticeVO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- 반응형 웹으로 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>R2V - 공지 사항</title>
<!-- 부트스트랩, 커스텀 CSS 추가 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<!-- 하이퍼링크로 인해 제목이 밑줄 친 파란색으로 표시되는 것 방지 -->
<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
		
		table th {
			background-color: #eeeeee;
			}
		.noticeContent {
		border-collapse: collapse;
				}
		
		.noticeContent thead tr{
			text-align:center;
			border-bottom: 3px solid #168;
		}
		.noticeContent tbody td{
			text-align:center;
			border-bottom: 1px solid #ddd;
		}
		.noticeContent tfoot tr{
			text-align:center;
		}
		.btnclass {
			color : white;
			background: #6698cb;
			padding: 4px 12px;  
  			font-size: 12px;
  			text-align: center;
  			box-shadow: 0px 4px #74a3b0;
  			border-radius:5px;
}
</style>
</head>
<body>
	<%
		String userID = null;
	Object ad_userID = session.getAttribute("id");
	userID = (String) ad_userID;
	//Object obj_userID = session.getAttribute("id"); 
	//userID = (String)obj_userID;

	// 로그인 여부 확인
	if (userID != null && userID.equals("admin")) {	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자가 아닙니다.')");
		script.println("location.href = 'Notice_view.jsp'");
		script.println("</script>");
		script.close();
		return ;
	}
	%>
	<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position: fixed;">

		<p style="font-size: 30px; text-align: center">공지사항</p>

		<table class="noticeContent" align="center">
			<thead>
				<tr>
					<%
						int noticeNumber = -1;
					if (request.getParameter("noticeNumber") != null) {
						noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
					}

					noticeDAO ntDAO = new noticeDAO();
					ntDAO.watch(noticeNumber);
					%>
					<td style="width: 10%">제목</td>
					<td style="width: 60%"><p><%=ntDAO.getnotice_title(noticeNumber)%></p></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>내용</td>
					<td><p><%=ntDAO.getnoticeContent(noticeNumber)%></p></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<%
						// 삭제, 수정 접근 권한 확인		            
					if (userID != null && userID.equals("admin")) {
					%>

					<td style="text-align:left"><a onclick="return confirm('정말로 삭제하시겠습니까?')"
						href="deleteAction.jsp?noticeNumber=<%=noticeNumber%>" class="btnclass">삭제</a> <!-- 글 삭제 페이지로 보냄 -->
						&nbsp&nbsp&nbsp<a href="update.jsp?noticeNumber=<%=noticeNumber%>" class="btnclass">수정</a>
						<!-- 글 수정 페이지로 보냄 --> <%
 	}
 %>
					<td style="text-align: right"><a href='notice.jsp' class="btnclass">목록</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>