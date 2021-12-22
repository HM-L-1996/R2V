<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>  
.join_title{
font-size:25px;
text-align:left;
margin-top:30px;
margin-bottom:30px;
}
span.join_input input {
  width: 50%;
  height: 50px;
  padding-left:1rem;
  border-radius: 30px;
  margin-left: 5px;
  border: 1px solid black;
  outline: none;
}
.submit {
  width: 50%;
  display:block;
  margin-left:10%;
  margin-right:0%;
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
 <script > 
 var pw = document.getElementById('pw').value;
 var pw2 = document.getElementById('pw2').value;
 
 function check() {
	 if(pw.value !=dd){
		 alert("비번 틀림")
		 document.location.href="Sign_Up.jsp"
	 }
 }
 </script>
<head>
<meta charset="UTF-8">
<title>R2V - 회원가입</title>
</head>
<body>
<%@include file="Before_Login_Sidebar.jsp" %>	


<div class="w3-container" style="margin-left:20%; width:80%; height:100%; position:fixed; overflow:scroll;" >

<!-- <form name = "signinControlloer" method = "post" action = "Sign_Up_Test.jsp"> -->
	<form action = "../SignupController" method = "post">	
		<div style ="margin-left:35%;margin-right:15%">

		 <span style="color:#0F4C81;font-size: 90px; text-shadow:3px 3px 3px gray;margin-left:10%;
  			margin-right:0%;" >R2V</span>

		 <div>
           <h3 class="join_title"><label for="id">아이디</label></h3>
           <span class="join_input">
               <input type="text" name="id" maxlength="12">
           </span>          
    	 </div>
    	 
           <div>
	      <span class="error_next_box"></span>
	       <h3 class="join_title"><label for="id">닉네임</label> </h3>
	       <span class="join_input">
	           <input type="text" name="nickname"  maxlength="12">
	       </span>
	     </div>
	     
          <div >
          <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
          <span class="join_input">
              <input type="password" name="pw" id = "pw" maxlength="12">            
          </span> 
          </div>
          
          <div> 
     	 <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
          <span class="join_input">
          <input type="password" name="pw2" id = "pw2" maxlength="12">
          </span>
 		 </div>
 		 
     	 <div>
       <h3 class="join_title"><label for="name">이름</label></h3>
       <span class="join_input">
           <input type="text" name="name" maxlength="4">
       </span>
       </div>
       
     	 <div>
           <h3 class="join_title">
		<label for="id">생년월일</label></h3>
           <span class="join_input">
               <input type="text" name="birth"  maxlength="6">
           </span>
        </div>
        
      	 <div>
           <h3 class="join_title">
		<label for="id">이메일</label></h3>
           <span class="join_input">
               <input type="text" name="email"  maxlength="20">
           </span>
        </div>
          
   		  <div class= "submit" style= "margin-top:50px; margin-bottom:50px">
                <input type="submit" value="회원가입" >
 			</div>
 		</div>
   		 </form>
</div>

</body>
</html>