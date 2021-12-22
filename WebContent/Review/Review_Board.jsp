<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.enc.project1.*" %>
<%@ page import ="com.enc.project1.reviewDAO" %>
<%@ page import ="com.enc.project1.reviewVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 리뷰 게시판</title>

<style type="text/css">
	.pagination {
  		display: inline-block;
	}	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	}	
	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  
	}
	.pagination a:hover:not(.active) {background-color: #ddd;}
	
	.btnWrite { background-color:#168; color:white; padding:10px; border-radius:5px;
				text-decoration: none;}
	
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="../Sidebar.jsp" %>
	<div class="w3-container" style="margin-left:20%;width:80%;height:100%; position:fixed;">
		
	<h1 style="margin-top: 7%; margin-bottom: 5%; text-align: center">리뷰 게시판</h1>
	
	
	<!-- 게시판 영역 시작 -->
	
	<%
	request.setCharacterEncoding("UTF-8"); 
	String searchType = request.getParameter("searchType") == null ? "강좌 제목": request.getParameter("searchType");
	String search = request.getParameter("search") == null ? "": request.getParameter("search");
	%>
	
	<!-- 검색 테이블 -->
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="Review_Board.jsp">
				<table class="table table-hover">
					<tr>
						<td>
							<select class="form-control" name="searchType">
								<option value="강좌 제목" <% if (searchType.equals("강좌 제목")) { out.println("selected"); } %>>강좌 제목</option>
								<option value="리뷰 내용" <% if (searchType.equals("리뷰 내용")) { out.println("selected"); } %>>리뷰 내용</option>
							</select>
						</td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="search" maxlength="100" value="<%= search %>"></td>
						<td><button type="submit" class="btn btn-info">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- 게시판 테이블 -->
	<table class="table table-hover" align="center">
		<!-- 게시판 목록 -->
		<thead style="text-align:center">
		<tr>
			<td style="width:10%; " >번호</td>
			<td style="width:40%; " >강의 이름</td>
			<td style="width:20%; " >작성자</td>
			<td style="width:10%; " >조회수</td>
			<td style="width:20%; " >날짜</td>
		</tr>
		</thead>
		<tbody style="text-align:center">
		<!-- 게시판 글 List -->
		<% 	
		
			int pageNumber = 1; // 기본 페이지
			if (request.getParameter("pageNumber") != null) { pageNumber = Integer.parseInt(request.getParameter("pageNumber")); }
			
			ArrayList<reviewVO> review_array = new ArrayList<reviewVO>();
			reviewDAO rvDAO = new reviewDAO();
			review_array = rvDAO.getList(searchType, search, pageNumber);
			
			if(review_array != null){
				for(int i = 0; i < review_array.size(); i++) {
					if(i == 10) break;
					reviewVO review = review_array.get(i);
					%>
				<tr>
					<td><%= review.getReview_num() %></td>
					<td><a href="Review_view_Page.jsp?reviewNumber=<%=review.getReview_num()%>&Learn_num=<%=review.getLearn_num()%>&User_num=<%=review.getUsernum()%>" 
							style="text-decoration: none;"><%= rvDAO.getlearn_title(review.getLearn_num()) %></a></td>
					<td><%= rvDAO.getuserNickname(review.getUsernum()) %></td>
					<td><%= review.getReview_watch() %></td>
					<td><%= review.getReview_date() %></td>
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
					int maxpage = new reviewDAO().getreviewCount(searchType, search); // 표현할 게시물 갯수
					int len = 10;					//	한 페이지당 표시 게시물 수
					int pageLength = 10;			//	페이지 길이
					int totalPages = maxpage/len;	// 총 페이지 수
					if(totalPages==0){
						totalPages=0;
					}
					else if(totalPages==1 && maxpage==len){
						totalPages=0;
					}
					
					int startPage = ((int)((pageNumber-1)/pageLength)) * pageLength + 1;	// 시작 페이지
					int endPage = startPage + pageLength;									// 
					
					
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
						<a href="Review_Board.jsp?pageNumber=<%=startPage - 1%>&search=<%=search %>&searchType=<%=searchType%>">&laquo;</a>
					<% 
					}
					else{
					%>
						<a href="#">&laquo;</a>
					<% 
					}
					for (int i = startPage; i < endPage; i++) {
					%>
							<a href="Review_Board.jsp?pageNumber=<%=i%>&search=<%=search %>&searchType=<%=searchType%>"><%=i %></a>
					<% 
					}
					if(totalPages==endPage - 2){
					%>
						<a href="#">&raquo;</a>
					<% 
					}
					else{
					%>
						<a href="Review_Board.jsp?pageNumber=<%=endPage%>&search=<%=search %>&searchType=<%=searchType%>">&raquo;</a>
					<% 
					}}
					%>
							</div>
			</td>
			</tr>
			<tr>	<!-- 글쓰기 버튼 -->
				<td colspan="5" style="text-align:right">
					<div class="col-lg-12">
						<button type="button" class="btn btn-outline btn-primary pull-right">
							<a href="Write.jsp">글쓰기</a>
						</button>
					</div>
				</td>
			</tr>
		</tfoot>	
	</table>
	
	</div>
	
</body>
</html>