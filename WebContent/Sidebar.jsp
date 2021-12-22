<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">
	
	.w3-sidebar{
   		color: whitesmoke;
   		background-color: 0F4C81;
	}
	.w3-teal{
		background-color: 0F4C81;
	}
	
</style>


<div class="w3-sidebar w3-dark-blue w3-bar-block" style="width:20%; height:100%;background-color: #0F4C81" >
	<br>
	
	<h1 class="w3-bar-item" style="font-size: 2rem;text-align: center;text-shadow:2px 2px 2px black;margin-top:5%;margin-bottom:0%;color:white;"><b>I'm <span style="color:orange">R</span>eady&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br> 
			&nbsp&nbsp&nbsp&nbsp <span style="color:orange">2</span> re<span style="color:orange">V</span>iew</h1>
  		<p style="font-size: 20px; text-align: right; "> <%= session.getAttribute("Nickname") %>님 &nbsp&nbsp&nbsp</p><br><br><br><br><br><br>
  		<a href="../Notice/notice.jsp" class="w3-bar-item w3-button" style="font-size: 2rem;text-align: center;padding:0.3rem;">공지 사항</a>  <br>
  		<a href="../LearnList/LearnList.jsp" class="w3-bar-item w3-button" style="font-size: 2rem;text-align: center;padding:0.3rem;">강의 목록</a>  <br>
		<a href="../Free/Free_Board.jsp" class="w3-bar-item w3-button" style="font-size: 2rem;text-align: center;padding:0.3rem;">자유 게시판</a><br>
		<a href="../Review/Review_Board.jsp" class="w3-bar-item w3-button" style="font-size: 2rem;text-align: center;padding:0.3rem;">리뷰 게시판</a><br>
	  	<br><br><br><br><br><br>
	  	<div style="text-align: center;">
	  		<a href="../Mypage/MyPage.jsp?usernum=<%= session.getAttribute("usernum")%>"  style="font-size: 1.5rem;color:orange;text-shadow:1px 1px 1px black;">My page</a>
	  		&nbsp&nbsp&nbsp&nbsp
	  		<a href="../Mypage/Logout.jsp"  style="font-size: 1.5rem;color:orange;text-shadow:1px 1px 1px black;">Logout</a><br>
	  	</div>

	  	
	  	
</div>



      
