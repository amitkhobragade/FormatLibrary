package logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UploadedFileInfo;
import beans.UploadedFiles;
import beans.users;
import dao.UserDao;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/AdminServ")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("admin_id") != null)
	     {  System.out.println("in Admin.java inside doGet() ");
				UserDao usedao=new UserDao();
				ResultSet info;
				try {
					info = usedao.getAllVideoinfo();
					
					HashMap<Integer, UploadedFileInfo> hashMap = new HashMap<>();
					//List<UploadedFiles> uploadedFiles = new ArrayList<>();
					while(info.next()){
						int video_info_id = info.getInt("video_info_id");
						System.out.println("video_info_id ::"+video_info_id +"::"+info.getInt("file_id"));
						if(hashMap.containsKey(video_info_id)){
							UploadedFileInfo uploadedFileInfo = hashMap.get(video_info_id);
							List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
							if(uploadedFiles !=null && !uploadedFiles.isEmpty()){
								uploadedFiles.add(getUploadedFiles(info));
								uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
							}else{
								List<UploadedFiles> uploadedFiles2 = new ArrayList<>();
								uploadedFiles2.add(getUploadedFiles(info));
								uploadedFileInfo.setListOfUploadedFiles(uploadedFiles2);
							}
							
							hashMap.put(video_info_id, uploadedFileInfo);
							
						}else{
							UploadedFileInfo uploadedFileInfo = new UploadedFileInfo();
							uploadedFileInfo.setPrimary_file_ext(info.getString("primary_file_ext"));
							uploadedFileInfo.setUser_id(info.getInt("user_id"));
							uploadedFileInfo.setVideo_info_id(video_info_id);
							//List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
							//uploadedFiles.add(getUploadedFiles(info));
							//uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
							
							List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
							if(uploadedFiles !=null && !uploadedFiles.isEmpty()){
								uploadedFiles.add(getUploadedFiles(info));
								uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
							}else{
								List<UploadedFiles> uploadedFiles2 = new ArrayList<>();
								uploadedFiles2.add(getUploadedFiles(info));
								uploadedFileInfo.setListOfUploadedFiles(uploadedFiles2);
							}
							hashMap.put(video_info_id, uploadedFileInfo);
						}
						
					}
					System.out.println("Key : \t getPrimary_file_ext \t" );
					for (Map.Entry<Integer, UploadedFileInfo> entry : hashMap.entrySet()) {
						System.out.print(entry.getKey()+"\t");
						UploadedFileInfo uploadedFileInfo = entry.getValue();
						System.out.print(uploadedFileInfo.getPrimary_file_ext()+"\n");
						System.out.println("file_id \t file_size \t video_file_path \t" );
						for(UploadedFiles UploadedFiles : uploadedFileInfo.getListOfUploadedFiles()){
							System.out.print(UploadedFiles.getFile_id()+"\t");
							System.out.print(UploadedFiles.getFile_size()+"\t");
							System.out.print(UploadedFiles.getVideo_file_path()+"\t");
							System.out.println();
						}
						System.out.println();
					}

					  request.setAttribute("allinfo", hashMap);
					  
					RequestDispatcher rd=request.getRequestDispatcher("/allUpload.jsp");
					rd.forward(request, response);
					
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao usedao=new UserDao();
		String array_values[] = new String[13]; // use for for 13 formfields i.e. Video file information 
		
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
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
				
				
			
			try {
				int i=0;
				ResultSet rs=usedao.checkAdmin(email,password);
				boolean flag=false;
				while(rs.next())
				{  
				 if(email.equals(rs.getString("email")) && password.equals(rs.getString("password")))
					{  //String user_id=rs.getString("id");
					   //System.out.println(user_id);
				request.getSession().setAttribute("adminmail",rs.getString("email") );
				request.getSession().setAttribute("adminpass",rs.getString("password") );
					   request.getSession().setAttribute("admin_id", rs.getInt("id"));
					   System.out.println("hii"+request.getSession().getAttribute("admin_id"));
						flag=true;
						
						ResultSet info=usedao.getAllVideoinfo();
						
						HashMap<Integer, UploadedFileInfo> hashMap = new HashMap<>();
						//List<UploadedFiles> uploadedFiles = new ArrayList<>();
						while(info.next()){
							int video_info_id = info.getInt("video_info_id");
							System.out.println("video_info_id ::"+video_info_id +"::"+info.getInt("file_id"));
							if(hashMap.containsKey(video_info_id)){
								UploadedFileInfo uploadedFileInfo = hashMap.get(video_info_id);
								List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
								if(uploadedFiles !=null && !uploadedFiles.isEmpty()){
									uploadedFiles.add(getUploadedFiles(info));
									uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
								}else{
									List<UploadedFiles> uploadedFiles2 = new ArrayList<>();
									uploadedFiles2.add(getUploadedFiles(info));
									uploadedFileInfo.setListOfUploadedFiles(uploadedFiles2);
								}
								
								hashMap.put(video_info_id, uploadedFileInfo);
								
							}else{
								UploadedFileInfo uploadedFileInfo = new UploadedFileInfo();
								uploadedFileInfo.setPrimary_file_ext(info.getString("primary_file_ext"));
								uploadedFileInfo.setUser_id(info.getInt("user_id"));
								uploadedFileInfo.setVideo_info_id(video_info_id);
								//List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
								//uploadedFiles.add(getUploadedFiles(info));
								//uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
								
								List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
								if(uploadedFiles !=null && !uploadedFiles.isEmpty()){
									uploadedFiles.add(getUploadedFiles(info));
									uploadedFileInfo.setListOfUploadedFiles(uploadedFiles);
								}else{
									List<UploadedFiles> uploadedFiles2 = new ArrayList<>();
									uploadedFiles2.add(getUploadedFiles(info));
									uploadedFileInfo.setListOfUploadedFiles(uploadedFiles2);
								}
								hashMap.put(video_info_id, uploadedFileInfo);
							}
							
						}
						System.out.println("Key : \t getPrimary_file_ext \t" );
						for (Map.Entry<Integer, UploadedFileInfo> entry : hashMap.entrySet()) {
							System.out.print(entry.getKey()+"\t");
							UploadedFileInfo uploadedFileInfo = entry.getValue();
							System.out.print(uploadedFileInfo.getPrimary_file_ext()+"\n");
							System.out.println("file_id \t file_size \t video_file_path \t" );
							for(UploadedFiles UploadedFiles : uploadedFileInfo.getListOfUploadedFiles()){
								System.out.print(UploadedFiles.getFile_id()+"\t");
								System.out.print(UploadedFiles.getFile_size()+"\t");
								System.out.print(UploadedFiles.getVideo_file_path()+"\t");
								System.out.println();
							}
							System.out.println();
						}

						  request.setAttribute("allinfo", hashMap);
						  
						RequestDispatcher rd=request.getRequestDispatcher("/allUpload.jsp");
						rd.forward(request, response);
					}
				}
				if(flag==false)
				{   request.setAttribute("message",
				        "<font color=red>Please Enter valid details</font>");
					/*PrintWriter out=response.getWriter();
					out.println("<font color=red>Please Enter valid details</font>");*/
					RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
					rd.include(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		
	}

	private UploadedFiles getUploadedFiles(ResultSet info) throws SQLException {
		UploadedFiles uploadedFiles = new UploadedFiles();
		uploadedFiles.setFile_id(info.getInt("file_id"));
		uploadedFiles.setFile_size(info.getString("file_size"));
		uploadedFiles.setVideo_file_path(info.getString("video_file_path"));
		return uploadedFiles;
	}
		
	}


