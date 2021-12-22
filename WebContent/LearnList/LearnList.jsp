<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.enc.project1.learnDAO" %>
    <%@ page import="com.enc.project1.learnVO" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta content="text/html; charset=UTF-8"/>
		<title>강의 목록</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script type="text/javascript">
		
			function inputNumberFormat(obj) {
			     obj.value = comma(uncomma(obj.value));
			 }
	
			 function comma(str) {
			     str = String(str);
			     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			 }
	
			 function uncomma(str) {
			     str = String(str);
			     return str.replace(/[^\d]+/g, '');
			 }
		</script>
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
		</style>
	</head>
	<body>
			
		<%@include file="../Sidebar.jsp" %>
			
		<div class="w3-container" style="margin-left:20%; width:80%;height:100%; position:fixed; overflow:scroll;">
			<%
				request.setCharacterEncoding("UTF-8"); 
				String searchType = request.getParameter("searchType") == null ? "강의 제목": request.getParameter("searchType");
				String search = request.getParameter("search") == null ? "": request.getParameter("search");
				String sortType = request.getParameter("sortType") == null ? "최신순": request.getParameter("sortType");
				int pageNumber = 1; // 기본 페이지
				if (request.getParameter("pageNumber") != null) { pageNumber = Integer.parseInt(request.getParameter("pageNumber")); }
			%>
			<h1 style="text-align:center; margin-top:5%;"> 강의 목록</h1>
			<hr>
			<br>
			<form method="get" name="search" action="LearnList.jsp">
				<table class="table table-hover" align="center" style="width:50%">
				<tr>
					<td>
						<select class="form-control" name="searchType">
						<option value="강의 제목" <% if (searchType.equals("강의 제목")) { out.println("selected"); } %>>강의 제목</option>
						<option value="강사" <% if (searchType.equals("강사")) { out.println("selected"); } %>>강사</option>
						</select>
					</td>
					<td>
					<input type="text" class="form-control"
										placeholder="검색어 입력" name="search" maxlength="40" value=<%= search %>>
					
					</td>
					<td>
					<button type="submit" class="btn btn-info">검색</button>
					</td>
					<td>
					
						
						<select class="form-control" name="sortType" onchange="if(this.value) location.href=('LearnList.jsp?pageNumber=<%=pageNumber%>&search=<%=search %>&searchType=<%=searchType%>&sortType='+this.value)">
							<option value="최신순" <% if (sortType.equals("최신순")) { out.println("selected"); } %>> 최신순</option>
							<option value="가격 낮은순" <% if (sortType.equals("가격 낮은순")) { out.println("selected"); } %>>가격 낮은순</option>
							<option value="가격 높은순" <% if (sortType.equals("가격 높은순")) { out.println("selected"); } %>>가격 높은순</option>
							<option value="가나다순" <% if (sortType.equals("가나다순")) { out.println("selected"); } %>>가나다순</option>
						</select>
						
					</td>
				</tr>	
			</table>
			</form>
		
			<div class="container" style="margin-top:1%;padding-left: 0%; padding-right: 0%;">
			
			<% 
				
				NumberFormat nf = NumberFormat.getNumberInstance();
				ArrayList<learnVO> learn_array = new ArrayList<learnVO>();
				learn_array = new learnDAO().getList(searchType, search, pageNumber,sortType);%>
			
					<%
					if(learn_array != null){
						for(int i = 0; i < learn_array.size(); i++) {
							if(i == 24) break;
							learnVO learn = learn_array.get(i);
							
					%>
						<%if (i%4==0){
							out.print("<div class= 'row'>");
						}
						%>
						
						
					<div class = "col-2.5" style="width:20%; height:50%; margin-left:4%; margin-bottom:3%">
						<div class="card" style=" height:70%; cursor: pointer;"onclick="window.open('<%=learn.getLearn_link() %>')">
							<img src=<%=learn.getImage_link()%> alt=""/>
								<div class="card-title" style="margin-top:5%">
									<%=learn.getLearn_title() %>	
								</div>
								<p class="card-text"> 강사 : <%=learn.getLearn_teacher() %>	</p>
								<%
									if(learn.getPrice()==-1){
										out.print("<p class='card-text'> 무료 </p>");
									}
									else{
										if(learn.getSale_price() == 0){
								%>
											<p class="card-text"> <%=nf.format(learn.getPrice())%>원</p>	
										<%
										}
										else{
																												
										%>
											<p class="card-text"> <del><%=nf.format(learn.getSale_price()) %>원</del>
											<%=nf.format(learn.getPrice())%>원
											</p>
											
										<% 
								
										}
									} %>
								
						</div>
						
						
					</div>
				
				
					<%if (i%4==3){
							out.print("</div>");
						}
					%>
			<% } } %>
			</div>
			<center>
			<div class="pagination">
			
				<%// 페이지네이션
					int maxpage = new learnDAO().getlearnCount(searchType, search);
					int len = 24;
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
						<a href="LearnList.jsp?pageNumber=<%=startPage - 1%>&search=<%=search %>&searchType=<%=searchType%>&sortType=<%=sortType%>">&laquo;</a>
					<% 
					}
					else{
					%>
						<a href="#">&laquo;</a>
					<% 
					}
					
					for (int i = startPage; i < endPage; i++) {
					%>
							<a href="LearnList.jsp?pageNumber=<%=i%>&search=<%=search %>&searchType=<%=searchType%>&sortType=<%=sortType%>"><%=i %></a>
					<% 
					}
					if(totalPages==endPage-2){
					%>
						<a href="#">&raquo;</a>
					<% 
					}
					else{
					%>
						<a href="LearnList.jsp?pageNumber=<%=endPage%>&search=<%=search %>&searchType=<%=searchType%>&sortType=<%=sortType%>">&raquo;</a>
					<% 
					}}
					%>
				</div>
			</center>
			
 										
		</div>			
					
			
		
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	</body>
</html>