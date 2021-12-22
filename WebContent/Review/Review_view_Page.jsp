<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="com.enc.project1.*" %>
<%@ page import ="com.enc.project1.reviewDAO" %>
<%@ page import ="com.enc.project1.reviewVO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.io.PrintWriter"%>
<% 
request.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

	<title>R2V - 리뷰 게시판 글 보기</title>
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
		
		.reviewContent {
			border-collapse: collapse;
		}
		
		.reviewContent thead tr{
			text-align:center;
			border-bottom: 3px solid #168;
		}
		.reviewContent tbody td{
			text-align:center;
			border-bottom: 1px solid #ddd;
		}
		.reviewContent tfoot tr{
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


	<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="../Sidebar.jsp" %>
	<div class="w3-container" style="margin-left:20%;width:80%;height:100%; position:fixed;">
		
	<p style="font-size:30px; text-align:center" >리뷰 게시판</p>
	
	<table class="reviewContent" align="center">
		<thead>
		<tr>
			<%
			reviewDAO rvDAO = new reviewDAO();
			int reviewNumber = -1; int Learn_num = -1; int User_num = -1;
			if (request.getParameter("reviewNumber") != null) { reviewNumber = Integer.parseInt(request.getParameter("reviewNumber")); }
			if (request.getParameter("Learn_num") != null) { Learn_num = Integer.parseInt(request.getParameter("Learn_num")); }
			if (request.getParameter("User_num") != null) { User_num = Integer.parseInt(request.getParameter("User_num")); }
			rvDAO.watch(reviewNumber);
			%>
			<td style="width:10%">강의 이름</td>
			<td style="width:60%"><p><%=rvDAO.getlearn_title(Learn_num) %></p></td>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>리뷰 내용</td>
				<td><p><%=rvDAO.getreviewContent(reviewNumber) %></p></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>		
				<% 
				// 삭제, 수정 접근 권한 확인
				int SSusernum = (Integer)session.getAttribute("usernum");
				
			 	if((SSusernum == User_num) || (SSusernum == 1))
			 	{ %>
			 		<td style="text-align:left"><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="Review_DeleteAction.jsp?reviewNumber=<%=reviewNumber%>" class="btnclass">삭제</a>
						 &nbsp&nbsp&nbsp<a href="Review_Update_view.jsp?reviewNumber=<%=reviewNumber%>" class="btnclass">수정</a>					
					</td>
			 	<% }
			 	else { %>
					<td></td>
			 	<% }
			 	%>			 				
				<td style="text-align:right"><a href = 'Review_Board.jsp' class="btnclass">목록</a></td>
			</tr>
		</tfoot>	
	</table>
	


	</div>
</body>
</html>