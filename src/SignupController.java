

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enc.project1.userDAO;
import com.enc.project1.userVO;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String username = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		userVO uVo = new userVO();
		uVo.setId(id);
		uVo.setNickname(nickname);
		uVo.setPw(pw);
		uVo.setUsername(username);
		uVo.setBirth(birth);
		uVo.setEmail(email);
		uVo.setInterest(0);
		
		
		if(id == "" || pw == "" || nickname == "" || username == "" || email == ""|| birth == "")
		 { 

			out.print("<script>");
			out.print("alert('?????? ????????? ????????????.');");
			out.print("location.href = './First/Sign_Up.jsp';");
			out.print("</script>");
			out.close();

		} 
		else if(!pw.equals(pw2))
		{
			out.print("<script>");
			out.print("alert('??????????????? ???????????? ????????????.');");
			out.print("location.href = './First/Sign_Up.jsp';");
			out.print("</script>");
			out.close();
		 }
		else if(!email.contains("@")){ 
			out.print("<script>");
			out.print("alert('????????? ????????? ?????? ????????????.');");
			out.print("location.href = './First/Sign_Up.jsp';");
			out.print("</script>");
			out.close();
					 
		}
		
		else {
			userDAO UserDAO = new userDAO();
			int result = UserDAO.join(uVo);
			if (result == -1){
				out.print("<script>");
				out.print("alert('????????? or ????????? ??????');");
				out.print("location.href = './First/Sign_Up.jsp';");
				out.print("</script>");
				out.close();
			}
				
			else  { 
				out.print("<script>");
				out.print("alert('?????? ????????? ?????????????????????');");
				out.print("location.href = './First/Sign_In.jsp';");
				out.print("</script>");
				out.close();
						
			}
		}
		
	}

}
