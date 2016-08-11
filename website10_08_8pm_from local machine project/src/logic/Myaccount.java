package logic;

import java.io.IOException;
import java.io.PrintWriter;
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
import dao.UserDao;

/**
 * Servlet implementation class Myaccount
 */
@WebServlet("/Myaccount")
public class Myaccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myaccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ if(request.getSession().getAttribute("user_id") != null)
	 {
		int user_session_id= (Integer) request.getSession().getAttribute("user_id");
	   
		UserDao usedao=new UserDao();
		 List<Object> al = new ArrayList<Object>() ;
	   try {
		   
		   
		   ResultSet info=usedao.getUserVideoinfo(user_session_id);
		   
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
			
			// redirects client to message page
			request.setAttribute("message","<font color=red>Your video details are submitted succesfully. You can check it in 'My account'.</font>");  
			RequestDispatcher rd=request.getRequestDispatcher("/message.jsp");
			rd.include(request, response);
	
	   } catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	   RequestDispatcher rd=request.getRequestDispatcher("/message.jsp");
		rd.forward(request, response);		   
	
	 }else{
		 
		    request.setAttribute("message","<font color=red>You have to login first</font>");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
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
