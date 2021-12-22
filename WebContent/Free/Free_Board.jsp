<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enc.project1.freeDAO"%>
<%@ page import="com.enc.project1.freeVO"%>
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
<title>R2V - 자유 게시판</title>
<%
	request.setCharacterEncoding("UTF-8"); 
	String searchType = request.getParameter("searchType") == null ? "제목": request.getParameter("searchType");
	String search = request.getParameter("search") == null ? "": request.getParameter("search");

	int pageNumber=1;
	if (request.getParameter("pageNumber") != null) { pageNumber = Integer.parseInt(request.getParameter("pageNumber")); }

%>
</head>
<body>
	<%@include file="../Sidebar.jsp"%>
	<div class="w3-container" style="margin-left:20%;width:80%;height:100%; position:fixed;">		
			<div class="container">
				<h1 style="margin-top: 7%; margin-bottom: 5%; text-align: center">자유게시판</h1>
				<div class="row">
					<form method="post" name="search" action="Free_Board.jsp">
						<table class="table table-hover">
							<tr>
								<td>
									<select class="form-control" name="searchType">
										<option value="제목" <% if (searchType.equals("제목")) { out.println("selected"); } %>>제목</option>
										<option value="내용" <% if (searchType.equals("내용")) { out.println("selected"); } %>>내용</option>
									</select>
								</td>
								<td><input type="text" class="form-control"
									placeholder="검색어 입력" name="search" maxlength="100" value=<%= search %>></td>
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
						<td style="width:20%; " >작성자</td>
						<td style="width:10%; " >조회수</td>
						<td style="width:20%; " >작성일</td>
					</tr>
				</thead>
				<tbody style="text-align:center">
					<%
						
						ArrayList<freeVO> free_array = new ArrayList<freeVO>();
						freeDAO feDAO = new freeDAO();
						free_array = new freeDAO().getList(searchType, search, pageNumber);
						
						if(free_array != null) {
							for(int i = 0; i < free_array.size(); i++) {
								if(i == 10) break;
								freeVO free = free_array.get(i);
					%>
					<tr>
						<td ><%= free.getFree_num() %></td>
						<td ><a href="Free_view_Page.jsp?freeNumber=<%= free.getFree_num() %>&User_num=<%=free.getUsernum()%>" 
							style="text-decoration: none;"><%= feDAO.getFree_title(free.getFree_num())%></a></td>						
						<td><%= feDAO.getuserNickname(free.getUsernum()) %></td>
						<td><%= free.getFree_watch() %></td>
						<td><%= free.getFree_date()  %></td>
					</tr>
				 <% 
						}       
					} 
                 %>
				</tbody>
				
				<tfoot style="text-align:center">
			<tr>
			<td colspan="5"><div class="pagination">
			
							<%// 페이지네이션
								int maxpage = new freeDAO().getFreeCount(searchType, search);
								int len = 10;
								int pageLength = 10;
								int totalPages = maxpage/len;
								if(totalPages==0){
									totalPages=0;
								}
								else if(totalPages==1 && maxpage==len){
									totalPages=0;
								}
								
								
								int startPage = ((int)((pageNumber-1)/pageLength)) * pageLength+1;
								int endPage = startPage + pageLength;
								
								
								if(endPage>totalPages){
									endPage=totalPages+2;
								}
								if(maxpage==0){
									startPage=1;
									endPage=2;
									out.print("<h1 style='margin-top:30%;'>검색 결과가 없습니다.</h1>");
								}
								else{
								if (startPage!=1){
								%>
									<a href="Free_Board.jsp?pageNumber=<%=startPage - 1%>&search=<%=search %>&searchType=<%=searchType%>">&laquo;</a>
								<% 
								}
								else{
								%>
									<a href="#">&laquo;</a>
								<% 
								}
								for (int i = startPage; i < endPage; i++) {
								%>
										<a href="Free_Board.jsp?pageNumber=<%=i%>&search=<%=search %>&searchType=<%=searchType%>"><%=i %></a>
								<% 
								}
								if(totalPages==endPage-2){
								%>
									<a href="#">&raquo;</a>
								<% 
								}
								else{
								%>
									<a href="Free_Board.jsp?pageNumber=<%=endPage%>&search=<%=search %>&searchType=<%=searchType%>">&raquo;</a>
								<% 
								}}
								%>
							</div>
			</td>
			</tr>
			<tr>	
				<td colspan="5" style="text-align:right">
								<!--작성 버튼  -->
					<div class="col-lg-12">
						<button type="button" class="btn btn-outline btn-primary pull-right">
							<a href="../Free/Writer02.jsp">자유게시판 작성</a>
						</button>
					</div>
				</td>
			</tr>
		</tfoot>					
	</table>
	</div>
</body>
</html>
