<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 60%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid black;
  outline: none;
}

.login_pw {
  margin-top: 20px;
  width: 80%;
  padding-bottom:40px;
}

.login_pw input {
  width: 60%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid black;
  outline: none;
  
}
.submit {
  margin-top: 50px;
  width: 60%;
}
.submit input {
  width: 60%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.5em;
  letter-spacing: 2px;
}
</style>
<meta charset="UTF-8">
<title>R2V - 로그인</title>

</head>
<body>
	<!-- 기본적인 모든 페이지 구성  -->
	<%@include file="Before_Login_Sidebar.jsp" %>
	<div class="w3-container" style="margin-left:20%;width:80%;height:100%; position:fixed;">
		
		<p style="font-size: 90px;text-align: center;text-shadow:3px 3px 3px gray;margin-top:5%;margin-bottom:0%"><b>I'm <span style="color:#0F4C81">R</span>eady&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br> 
		&nbsp&nbsp&nbsp&nbsp <span style="color:#0F4C81">2</span> re<span style="color:#0F4C81">V</span>iew</p>
		<p style="color:gray;text-align:center;margin-top:5px;"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		나의 리뷰가 누군가에겐 긍정적인 힘이 될 수 있다.</p>
		
			<center>
			<form method = "post" action = "../SigninController">
			<div class="login_id">
                <h2>ID</h2>
                <input type="text" name="id" id="id">
            </div>
            <div class="login_pw">
                <h2>Password</h2>
                <input type="password" name="pwd" id="pwd" >
            </div>
            <div class="forgot_pw">
            	<a href="Sign_Up.jsp"><font style ="color:#0F4C81; font-size:25px "> Sign up</font></a>	
            </div>
            <div class="submit">
                <input type="submit" value="submit" >
            </div>
			</form>
			</center>         
	</div>
</body>
</html>