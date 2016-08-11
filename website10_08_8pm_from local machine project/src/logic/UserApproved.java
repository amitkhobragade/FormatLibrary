package logic;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class UserApproved
 */
@WebServlet("/UserApproved")
public class UserApproved extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		 if(request.getSession().getAttribute("admin_id") != null)
		 {
			UserDao usedao=new UserDao();
			
			request.getSession().getAttribute("usermail");
			request.getParameter("param");
			System.out.println(request.getParameter("param"));
			String email = request.getParameter("param");
			System.out.println("my mail="+email);
			try {
				    int n=usedao.approvedUser(email);
				
					RequestDispatcher rd=request.getRequestDispatcher("ApprovalServlet");
					rd.include(request, response);
					
		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		 }else{
			    request.setAttribute("message","<font color=red>You have to login first</font>");
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
		 }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
