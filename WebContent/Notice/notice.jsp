<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enc.project1.noticeDAO"%>
<%@ page import="com.enc.project1.noticeVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>R2V - 공지 사항</title>
<%
	request.setCharacterEncoding("UTF-8");
String searchType = request.getParameter("searchType") == null ? "제목" : request.getParameter("searchType");
String search = request.getParameter("search") == null ? "" : request.getParameter("search");

int pageNumber = 1;
if (request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
request.setCharacterEncoding("UTF-8");
String userID = null;
Object ad_userID = session.getAttribute("id");
userID = (String) ad_userID;
%>
</head>
<body>
	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left: 20%; width: 80%; height: 100%; position:fixed">
	
		
			<div class="container">
				<h1 style="margin-top: 7%; margin-bottom: 5%; text-align: center">공지사항</h1>
				
				<div class="row">
					<form method="post" name="search" action="notice.jsp">
						<table class="table table-hover">
							<tr>
								<td><select class="form-control" name="searchType">
										<option value="제목" <%if (searchType.equals("제목")) { out.println("selected"); }%>>제목</option>
										<option value="내용" <%if (searchType.equals("내용")) { out.println("selected"); }%>>내용</option>
								</select></td>
								<td><input type="text" class="form-control" placeholder="검색어 입력" name="search"
									maxlength="100" value=<%=search%>></td>
								<td><button type="submit" class="btn btn-info">검색</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<table class="table table-hover" align="center">
				<thead style="text-align:center">
					<tr>
						<td style="width:10%; " >번호</td>
						<td style="width:40%; " >제목</td>
						<td style="width:10%; " >조회수</td>
						<td style="width:20%; " >작성일</td>
					</tr>
				</thead>
				<tbody style="text-align:center">
					<%
						ArrayList<noticeVO> notice_array = new ArrayList<noticeVO>();
					noticeDAO ntDAO = new noticeDAO();
					notice_array = new noticeDAO().getList(searchType, search, pageNumber);

					if (notice_array != null) {
						for (int i = 0; i < notice_array.size(); i++) {
							if (i == 10)
						break;
							noticeVO notice = notice_array.get(i);
					%>
					<tr>
						<td><%=notice.getNotice_num()%></td>
						<td><a href="Notice_view.jsp?noticeNumber=<%=notice.getNotice_num()%>"
							style="text-decoration: none;"><%=ntDAO.getnotice_title(notice.getNotice_num())%></a></td>
						<td><%=notice.getNotice_watch()%></td>
						<td><%=notice.getNotice_date()%></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
				
				<tfoot style="text-align:center">
					<tr>
					<td colspan="4"><div class="pagination">
									<%
										// 페이지네이션
									int maxpage = new noticeDAO().getnoticeCount(searchType, search);
									int len = 10;
									int pageLength = 10;
									int totalPages = maxpage / len;
									if (totalPages == 0) {
										totalPages = 0;
									}
									else if(totalPages==1 && maxpage==len){
										totalPages=0;
									}
									int startPage = ((int) ((pageNumber - 1) / pageLength)) * pageLength + 1;
									int endPage = startPage + pageLength;
				
									if (endPage > totalPages) {
										endPage = totalPages + 2;
									}
									if (maxpage == 0) {
										startPage = 1;
										endPage = 2;
										out.print("<h1 style='margin-top:30%;'>검색 결과가 없습니다.</h1>");
									} else {
										if (startPage != 1) {
									%>
									<a
										href="notice.jsp?pageNumber=<%=startPage - 1%>&search=<%=search%>&searchType=<%=searchType%>">&laquo;</a>
									<%
										} else {
									%>
									<a href="#">&laquo;</a>
									<%
										}
									for (int i = startPage; i < endPage; i++) {
									%>
									<a href="notice.jsp?pageNumber=<%=i%>&search=<%=search%>&searchType=<%=searchType%>"><%=i%></a>
									<%
										}
									if (totalPages == endPage - 2) {
									%>
									<a href="#">&raquo;</a>
									<%
										} else {
									%>
									<a href="notice.jsp?pageNumber=<%=endPage%>&search=<%=search%>&searchType=<%=searchType%>">&raquo;</a>
									<%
										}
									}
									%>
									</div>	
					</td>
					</tr>
				</tfoot>	
			</table>
			
		<!-- 공지사항 버튼  -->
		<%
			// 삭제, 수정 접근 권한 확인		            
		if (userID != null && userID.equals("admin")) {
		%>
		<div class="col-lg-12">
			<button type="button" class="btn btn-outline btn-primary pull-right">
				<a href="../Notice/Writer01.jsp">공지사항 작성</a>
			</button>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
