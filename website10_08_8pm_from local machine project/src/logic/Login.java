package logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.users;
import dao.UserDao;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
   
	/*@Override
	public void init(ServletConfig config) throws ServletException {
			super.init(config);
			con=(Connection)config.getServletContext().getAttribute("jdbccon");
	}
*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("user_id") != null){
			RequestDispatcher rd=request.getRequestDispatcher("/upload.jsp");
			rd.forward(request, response);
			
		}else{
			
			request.setAttribute("message","<font color=red>You have to login first</font>");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		int approved= 1;
		String password = null;
		//Create MessageDigest object for MD5
				MessageDigest digest;
				try {
					digest = MessageDigest.getInstance("MD5");
								
					//Update input string in message digest
					digest.update(pwd.getBytes(), 0, pwd.length());

					//Converts message digest value in base 16 (hex) 
					 password = new BigInteger(1, digest.digest()).toString(16);
				
				   } catch (NoSuchAlgorithmException e) 
				   {
					 e.printStackTrace();
				   }
				//System.out.println(password);
				
				
			UserDao usedao=new UserDao();
			try {
					ResultSet rs=usedao.checkUser(email,password);
					boolean flag=false;
					while(rs.next())
						{  
						 if(email.equals(rs.getString("email")) && password.equals(rs.getString("password")))
							{  //String user_id=rs.getString("id");
							   //System.out.println(user_id);
							 flag=true;
								  if(approved==(rs.getInt("approved")))
								  {  
								   request.getSession().setAttribute("user_id", rs.getInt("id"));
								   System.out.println("hii="+request.getSession().getAttribute("user_id"));
								   
									
									users uobj=new users();
									
									request.getSession().setAttribute("userinfo", uobj);
									//request.getSession().setAttribute(arg0, arg1);
									RequestDispatcher rd=request.getRequestDispatcher("/upload.jsp");
									rd.forward(request, response);
								  }
								  else
								  {
									  request.setAttribute("message","<font color=red>Your approval is pending. Please contact Seequestor Administration</font>");
										/*PrintWriter out=response.getWriter();
										out.println("<font color=red>Please Enter valid details</font>");*/
										RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
										rd.include(request, response);
								 }
						}
					}
					
					if(flag==false)
					{   
						
						request.setAttribute("message","<font color=red>Login credentials entered are invalid. Please try again!</font>");
						/*PrintWriter out=response.getWriter();
						out.println("<font color=red>Please Enter valid details</font>");*/
						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
					}
				 
			}
				catch (SQLException e) 
				{
					e.printStackTrace();
				}		
		
	}
}


