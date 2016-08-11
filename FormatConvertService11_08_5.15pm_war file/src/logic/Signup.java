package logic;

import java.awt.Dialog;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import javafx.scene.control.DialogEvent;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

import beans.users;
import dao.UserDao;

@WebServlet("/Signupserv")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    Connection con;
    
    
@Override
/*public void init(ServletConfig config) throws ServletException
    {
	super.init(config);
	con=(Connection)config.getServletContext().getAttribute("jdbccon");
	
	}*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String pwd=request.getParameter("password");
		String repassword=request.getParameter("re_password");
		if(pwd.equals(repassword))
		{	
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
				
		
		users u=new users();
		u.setFirst_name(request.getParameter("first_name"));
		u.setLast_name(request.getParameter("last_name"));
		u.setEmail(request.getParameter("email"));
		
		u.setPassword(password);
		u.setCompany(request.getParameter("company"));
		u.setAddress(request.getParameter("address"));
		u.setCountry(request.getParameter("country"));
	
				
		UserDao usedao=new UserDao();
		try {
			int n=usedao.addUser(u);
			if(n==1)
			{ System.out.println("now i am going to show popup");
				request.getSession().setAttribute("userinfo", u);
				request.setAttribute("message","<font color=red>Your account has been created successfully. Please wait for admin approval.</font>");
				/*final JDialog dialog = new JDialog();
				dialog.setAlwaysOnTop(true);    
				JOptionPane.showMessageDialog(dialog,"<font color=red>Now you can login after Seequestor authorization.</font>");*/
				
				RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
				rd.include(request, response);
				
			}
			else
			{   
				
				request.setAttribute("message","<font color=red>Please Enter valid details</font>");
				/*PrintWriter out=response.getWriter();
				out.println("<font color=red>Please Enter valid details</font>");*/
				RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}else{
		//JOptionPane.showMessageDialog(null,"<font color=red>Your password doesnt match</font>");
		request.setAttribute("message","<font color=red>Your password doesnt match. Please try again</font>");
		/*PrintWriter out=response.getWriter();
		out.println("<font color=red>Please Enter valid details</font>");*/
		RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
		rd.include(request, response);
	}	
				
	}

}
