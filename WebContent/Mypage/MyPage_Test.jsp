<%@page import="java.io.PrintWriter"%>
<%@ page import ="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.enc.project1.userDAO" %>
<%@page import="com.enc.project1.userVO" %> 
<% 
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String nickname = request.getParameter("nickname");
String pw = request.getParameter("pw");
String pw2 = request.getParameter("pw2");
String username = request.getParameter("name");
String birth = request.getParameter("birth");
String email = request.getParameter("email");

if(id == "" || pw == "" || nickname == "" || username == "" || email == ""|| birth == "")
{ %>
<script>
alert(" 필수 정보가 없습니다.");
history.go(-1);

</script> 
<% } 
else if(!pw.equals(pw2))
{%>
<script>
alert("비밀번호가 일치하지 않습니다.");
history.go(-1);

</script> 

<% }
else if(!email.contains("@")){ %>
<script>
alert("이메일 형식에 맞지 않습니다.");
history.go(-1);
</script>
<%}
else{
userDAO UserDAO = new userDAO();
int result = UserDAO.update(id,nickname,pw,username,birth,email,0);
if (result == -1){%>
	<script>
	alert("수정실패");
	history.go(-1);

	</script>
<% }else  { %>
	<script>
	alert("수정완료" );
	document.location.href="../First/Sign_In.jsp";
	</script>
<% }

}
%>








