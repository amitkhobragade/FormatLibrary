package logic;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.Iterator;

import beans.UploadedFileInfo;
import beans.users;
import dao.UserDao;

/**
 * Servlet implementation class ApprovalServlet
 */
@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		  if(request.getSession().getAttribute("admin_id") != null)
		  {
				List<Object> al = new ArrayList<Object>() ;
				UserDao usedao=new UserDao();
				try {
					ResultSet  info=usedao.getAllusers();
					
					while (info.next())
					  {
						 int as=0;
					/*	 String first_name, last_name, email, password, company, address, country;
						first_name = last_name = email = password =company = address =country = null;*/
						users useobj=new users();
					    useobj.setFirst_name(info.getString("first_name"));
					    useobj.setLast_name(info.getString("last_name"));
					    useobj.setEmail(info.getString("email"));
					    useobj.setCompany(info.getString("company"));
					    useobj.setAddress(info.getString("address"));
					    useobj.setCountry(info.getString("country"));
					    useobj.setId(info.getInt("id"));
					    useobj.setCreated_on(info.getTimestamp("created_on"));
					    al.add(as++, useobj);
					    System.out.println(info.getString("first_name"));
					    System.out.println(info.getString("last_name"));
					    System.out.println(info.getString("email"));
					    System.out.println(info.getString("company"));
					    System.out.println(info.getString("address"));
					    System.out.println(info.getString("country"));
					    System.out.println(info.getInt("id"));
					    System.out.println(info.getTimestamp("created_on"));
					     
					  }
					  
					  request.setAttribute("allinfo", al);
					
					  
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				RequestDispatcher rd=request.getRequestDispatcher("userapproval.jsp");
				rd.forward(request, response);
		  }
		  else
		  {
			  request.setAttribute("message","<font color=red>You have to login first</font>");
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
		  }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
