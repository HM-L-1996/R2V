<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.enc.project1.*" %>
<%@ page import ="com.enc.project1.reviewDAO" %>
<%@ page import ="com.enc.project1.reviewVO" %>
<%@ page import ="com.enc.project1.learnDAO" %>
<%@ page import ="com.enc.project1.learnVO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 리뷰 게시판 글쓰기</title>


<style type="text/css">
	
	.w3-sidebar{
   		color: whitesmoke;
   		background-color: 0F4C81;
	}
	.w3-teal{
		background-color: 0F4C81;
	}
	.BBSWrite thead tr{ text-align:center; }
	.BBSWrite tfoot td{ text-align:right; }
	
	
	/* Dropdown Button */
.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

/* The search field */
#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 160px 12px 10px;
  border: none;
  border-bottom: 1px solid #ddd;
  position : fixed;

  
}

/* The search field when it gets focus/clicked on */
#myInput:focus {outline: 3px solid #ddd;}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 400px;
  max-height:300px;
  border: 1px solid #ddd;
  z-index: 1;
  overflow:auto;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
	

</style>

<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}

function urlReplace(url) {
	var encodeurl=encodeURLComponent(url);
	test.value = encodeurl;
	return encodeurl;
}
</script>

<!-- 반응형 사이트 테스트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;

//	String uNum = null;
//	if (session.getAttribute("usernum") != null) {
//		uNum = (String) session.getAttribute("usernum");
//	 }
	// 로그인 여부 확인
	if (session.getAttribute("id") != null) {
		Object obj_userID = session.getAttribute("id"); 
		userID = (String)obj_userID;
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../First/Sign_In.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>


	<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="../Sidebar.jsp" %>
	
	<div class="w3-container" style="margin-left:20%;width:80%;height:100%; position:fixed;">
		
		
	<%
	request.setCharacterEncoding("UTF-8"); 
	String leartnTitle = request.getParameter("learnTitle") == null ? "": request.getParameter("learnTitle");
	String learnNum = request.getParameter("learn_num") == null ? "": request.getParameter("learn_num");	
	%>	
		
		<div class="container">
			<h2 style="margin-top: 7%; margin-bottom: 5%; text-align: center">리뷰 게시판 글쓰기</h2>
				<div class="form-group">
					<div class="dropdown">
					  <button onclick="myFunction()" class="dropbtn">강의 목록</button>
					  <div id="myDropdown" class="dropdown-content" >
					    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()"> 
					    
					    <%
					    ArrayList<learnVO> review_learn_title_array = new ArrayList<learnVO>();
					    reviewDAO rvDAO = new reviewDAO();
						int Learn_num = -1;

						if (request.getParameter("Learn_num") != null) { Learn_num = Integer.parseInt(request.getParameter("Learn_num")); }
						
						review_learn_title_array = rvDAO.getAllLearnTitle();
						
						if(review_learn_title_array != null){
							for(int i = 0; i < review_learn_title_array.size(); i++) {							
								learnVO review_learn_title = review_learn_title_array.get(i);
								
			                     String replacelink = review_learn_title.getLearn_title();
			                    replacelink = replacelink.replace("<", "[");
			                    replacelink = replacelink.replace(">", "]");
			                    replacelink = replacelink.replace("]", "&#93");
			                    replacelink = replacelink.replace("[", "&#91");
			                    replacelink = replacelink.replace("+", "&#43");
			                    replacelink = replacelink.replace("%", "%25");
			                    replacelink = replacelink.replace("&", "%26");
			                    replacelink = replacelink.replace("#", "%23");
			                    replacelink = replacelink.replace("?", "%3F");
			                    replacelink = replacelink.replace("=", "%3D");
			                    replacelink = replacelink.replace("/", "%2F");
			                    replacelink = replacelink.replace("\n", "%0A");
			                    
			                    
			                    
			                    
			                    
			                    String replacetitle = leartnTitle;
			                    replacetitle = replacetitle.replace("&#93","]");
			                    replacetitle = replacetitle.replace("&#91","[");
			                    replacetitle = replacetitle.replace("%25","%");
			                    replacetitle = replacetitle.replace("%26","&");
			                    replacetitle = replacetitle.replace("%23","#");
			                    replacetitle = replacetitle.replace("%3F","?");
			                    replacetitle = replacetitle.replace("%3D","=");
			                    replacetitle = replacetitle.replace("%2F","/");
			                    replacetitle = replacetitle.replace("%0A","\n");
			                    
			                    replacetitle = replacetitle.replace("&#43","+");
			                    
			                    //replacetitle = replacetitle.replace("{", "<");
			                    //replacetitle = replacetitle.replace("}", ">");
			                    
			                    
			                    String test11= review_learn_title.getLearn_title();
			                    test11 = test11.replace("<","[");
			                    test11 = test11.replace(">","]");
			                  %>
			                  <a href="Write.jsp?learnTitle=<%=replacelink%>
			                                 &learn_num=<%=review_learn_title.getLearn_num()%>">
			                                 <%=test11 %></a>
								<%}
								}%>
					  </div>
					</div>
				</div>
				<form action="ReviewWriteAction.jsp" method="post">
				<div class="form-group">
					<label for="title">제목</label>

					<input type="text" class="form-control" id="learn_title" placeholder=""
						name="learn_title" maxlength="1000" required="required" pattern=".{4,1000}" value="<%=leartnTitle%>" readonly>
				</div>
				
				<input type="hidden" id="learn_num" name="learn_num" value="<%=learnNum%>"> <!-- 런 넘버를 넘겨주기 위해 히든 값으로 넘김 -->
				<input type="hidden" id="usernum" name="usernum" value="<%=session.getAttribute("usernum")%>"> <!-- 유저 넘버를 넘겨주기 위해 히든 값으로 넘김 -->
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="review_article" name="review_article"
						placeholder="내용 작성"></textarea>
				</div>
				<button type="submit" class="btn btn-default">작성</button>
				<button type="reset" class="btn btn-default">
					<a href="Review_Board.jsp"> 취소</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>