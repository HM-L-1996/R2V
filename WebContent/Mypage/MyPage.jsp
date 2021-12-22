<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.enc.project1.userDAO" %>
<%@page import="com.enc.project1.userVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R2V - 마이페이지</title>
<style>
.submit{
	  width: 50%;
  display:block;
  margin-left:25%;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.5em;
  letter-spacing: 2px;
}
.input_join{ 
  height: 50px;
  padding-left:1rem;
  border-radius: 20px;
  margin-left: 5px;
  border: 1px solid black;
  outline: none;
  font-size:25px;
}
</style>
</head>
<body>
<%

userVO myPageVO = new userVO();
userDAO UserDAO = new userDAO();
myPageVO =  UserDAO.getUserInfo(Integer.parseInt(request.getParameter("usernum")));

%>
	<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="../Sidebar.jsp" %>		
		<div class="w3-container" style="margin-left:20%; width:80%;height:100%; position:fixed;overflow:scroll;">	
			<div style ="margin-left:35%;margin-right:15%;" >
			 <span style="color:#0F4C81;font-size: 90px; text-shadow:3px 3px 3px gray;margin-left:10%;
  			margin-right:0%;" >R2V</span> <br>
  			<span style="color:orange;font-size: 60px; text-shadow:3px 3px 3px gray;margin-left:3%;
  			margin-right:0%;" >마이페이지</span>
 			
			 <div style = " width:50%;">
			 <form method = "post" action = "MyPage_Test.jsp">
			  <div style = "display: flex; flex-direction: column;margin-top:5%">
			  <span style ="font-size:30px;">ID</span><input class="input_join" type="text" name="id" value= "<%= session.getAttribute("id")%>" maxlength="12" readonly="true"> 
			  </div>
			   <!-- 변경 불가 ID -->
			   
		  	  <div style = "display: flex; flex-direction: column;margin-top:5%">
		  	  <span style ="font-size:30px;">NickName</span><input class="input_join" type="text" name="nickname" value= "<%= session.getAttribute("Nickname")%>" maxlength="12">
		  	  </div>
		  	   
			  <div style = "display: flex; flex-direction: column;margin-top:5%">
			  <span style ="font-size:30px;">Password</span><input type="text" class="input_join" name="pw" id = "pw" value = "" maxlength="12">
			  </div>
			  
			   <div style = "display: flex; flex-direction: column;margin-top:5%">
			  <span style ="font-size:30px;">Password Check</span><input type="text" class="input_join" name="pw2" id = "pw2" maxlength="12">
			  </div>
			   
			  <div style = "display: flex; flex-direction: column;margin-top:5%">
			 <span style ="font-size:30px;"> UserName</span><input type="text" class="input_join" name="name" value = "<%= myPageVO.getUsername() %>"  maxlength="4">
			  </div>
			   
			  <div style = "display: flex; flex-direction: column;margin-top:5%">
			  <span style ="font-size:30px;">Birth</span><input type="text" class="input_join" name="birth" value = "<%= myPageVO.getBirth() %>" maxlength="6">
			  </div>
			  
			  <div style = "display: flex; flex-direction: column;margin-top:5%">
			 <span style ="font-size:30px;"> E-mail</span><input type="text" class="input_join" name="email"value = "<%= myPageVO.getEmail() %>" maxlength="20">
			  </div>
			  			  
   		  		<div class= "submit" style= "margin-top:50px; margin-bottom:50px;margin-top:10%">
                <input type="submit" value="수정하기" >
 				</div>
 				</form>
	</div>
</body>
</html>

