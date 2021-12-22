

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enc.project1.userDAO;

/**
 * Servlet implementation class SigninController
 */
@WebServlet("/SigninController")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String uId = request.getParameter("id");
		String uPwd = request.getParameter("pwd");
			
		userDAO UserDAO = new userDAO();
		int result = UserDAO.login(uId, uPwd);
		
		if(result == 1){
			userDAO sessionDAO = new userDAO();  
			String nn = sessionDAO.getNickname(uId);
			int num = sessionDAO.getDAOUsernum(uId);
			HttpSession session = request.getSession();
			session.setAttribute("id",uId);
			session.setAttribute("usernum",num);
			session.setAttribute("Nickname",nn);
			response.sendRedirect("./First/First.jsp");
		}
		else if(result == 0) { 
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.');");
			out.print("location.href = './First/Sign_In.jsp';");
			out.print("</script>");
			out.close();
		}else if(result == -1) { 
			out.print("<script>");
			out.print("alert('아이디가 존재하지 않습니다.');");
			out.print("location.href = './First/Sign_In.jsp';");
			out.print("</script>");
			out.close();
		}else if(result == -2) { 
			out.print("<script>");
			out.print("alert('데이터베이스 오류입니다.');");
			out.print("location.href = './First/Sign_In.jsp';");
			out.print("</script>");
			out.close();
		}	

	}

}
