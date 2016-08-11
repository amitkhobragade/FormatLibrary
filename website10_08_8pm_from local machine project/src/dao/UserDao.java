package dao;

import java.sql.*;
import java.util.List;

import beans.UploadedFileInfo;
import beans.UploadedFiles;
import beans.users;
import db_connection.Database;

public class UserDao {

	private Connection con;
	 
    public UserDao() {
        con = Database.getConnection();
    }
   
    
    PreparedStatement ps=null;
	    public int addUser(users u) throws SQLException
	    {   
	    	//System.out.println("in UserDao");
	    	//java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	//System.out.println(date);
			ps=con.prepareStatement("insert into users(first_name,last_name,email,password,company,address,country,created_on) values(?,?,?,?,?,?,?,now())");
			ps.setString(1, u.getFirst_name());
			ps.setString(2, u.getLast_name());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getCompany());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getCountry());
			//ps.setTimestamp(8, date);
			
			int n=ps.executeUpdate();
			return n;
	    }
    
        ResultSet rs=null;
    	public ResultSet checkUser(String email, String password) throws SQLException 
    	{
			ps=con.prepareStatement("select * from users where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			return rs;
	    }
    
    	private static java.sql.Timestamp getCurrentTimeStamp() {

    		java.util.Date today = new java.util.Date();
    		return new java.sql.Timestamp(today.getTime());
    		
    		

    	}
    	public int addFileinfo(UploadedFileInfo v) throws SQLException
	    {   
    		try{
    			System.out.println("in uderdao");
    	    	System.out.println(v.getUser_id());
    	    	System.out.println(v.getPrimary_file_ext());
    	    	System.out.println(v.getSec_file_ext());
    	    	System.out.println(v.getPlayer_name());
    	    	System.out.println(v.getVersion_name());
    	    	System.out.println(v.getManufacturer());
    	    	System.out.println(v.getManufacture_web());
    	    	System.out.println(v.getVideofile_type());
    	    	System.out.println(v.getDecoder_conv());
    	    	System.out.println(v.getConv_file());
    	    	System.out.println(v.getFile_source());
    	    	System.out.println(v.getTotal_size());
    	    	System.out.println(v.getNo_of_cameras());
    	    //	System.out.println(v.getVideo_path());
    	    	System.out.println("in uderdao query is firing ");
    	    	/*java.sql.Timestamp uploaded_date = new java.sql.Timestamp(new java.util.Date().getTime());
    	    	System.out.println(uploaded_date+","+con.isClosed());*/
    	    	java.sql.Timestamp uploaded_date = getCurrentTimeStamp();
    	    	java.util.Date starttijd = new java.util.Date(System.currentTimeMillis());
    	    	//java.util.Date date = new Date();
    	    	//Timestamp uploaded_date = new Timestamp(starttijd.getTime());
    	    	
    			ps=con.prepareStatement("insert into uploaded_file_info(user_id,primary_file_ext,sec_file_ext,player_name,version_name,manufacturer,manufacture_web,modelno,videofile_type,decoder_conv,conv_file,file_source,total_size,no_of_cameras,uploaded_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    			ps.setInt(1, v.getUser_id());
    			//ps.setInt(2,v.getFile_id());
    			ps.setString(2, v.getPrimary_file_ext());
    			ps.setString(3, v.getSec_file_ext());
    			ps.setString(4, v.getPlayer_name());
    			ps.setString(5, v.getVersion_name());
    			ps.setString(6, v.getManufacturer());
    			ps.setString(7, v.getManufacture_web());
    			ps.setString(8, v.getModelno());
    			ps.setString(9, v.getVideofile_type());
    			ps.setString(10, v.getDecoder_conv());
    			ps.setString(11, v.getConv_file());
    			ps.setString(12, v.getFile_source());
    			ps.setString(13, v.getTotal_size());
    			ps.setString(14, v.getNo_of_cameras());
    			ps.setTimestamp(15, uploaded_date);
    			//ps.setString(16, v.getVideo_path());
    			
    			int n=ps.executeUpdate();
    			System.out.println("n = "+n);
    			if(n==1){
    				ps=con.prepareStatement("select video_info_id from uploaded_file_info where uploaded_date = ?");
    				ps.setTimestamp(1, uploaded_date);
    				rs = ps.executeQuery();
    				int video_info_id = 0;
    				while(rs.next()){
    					video_info_id=rs.getInt("video_info_id");
    					
    				}
    				System.out.println("video_info_id = "+video_info_id);
    				if(video_info_id>0){
    					List<UploadedFiles> uploadedFilesList =v.getListOfUploadedFiles();
    					
    					for(UploadedFiles uploadedFiles :uploadedFilesList){
    						
    						ps=con.prepareStatement("insert into uploaded_files(video_info_id,video_file_path,file_size,file_uploaded_date) values(?,?,?,?)");
    						ps.setInt(1, video_info_id);
    						ps.setString(2, uploadedFiles.getVideo_file_path());
    						ps.setString(3, uploadedFiles.getFile_size());
    						ps.setTimestamp(4, uploaded_date);
    						int isUploadedFiles = ps.executeUpdate();
    						System.out.println("isUploadedFiles = "+isUploadedFiles);
    					}
    				}else{
    				}
    				
    			}
    			return n;
    		}catch(Exception e){
    			System.out.println("UserDao.addFileinfo()"+e.getMessage());
    			e.getStackTrace();
    			return 0;
    		}
    		
			
	    }

    	
    	/*public int addFilePath(String[] filePaths, int userId) throws SQLException
	    {   
	    	//java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	//System.out.println(date);
			ps=con.prepareStatement("insert into upload_videos(user_id,video1,video2) values(?,?,?)");
			ps.setInt(1, userId);
			ps.setString(2, filePaths[13]);
			ps.setString(3, filePaths[14]);

			int n=ps.executeUpdate();
			return n;
	    }*/

		public ResultSet checkAdmin(String email, String password) throws SQLException {
			ps=con.prepareStatement("select * from admin where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			return rs;
		
		}

     public ResultSet getVideoinfo(int user_id) throws SQLException
     {
    		/*ps=con.prepareStatement("select video_file_information.*,upload_videos.video1,upload_videos.video2 from video_file_information join upload_videos on video_file_information.user_id=upload_videos.user_id where user_id=?");
			ps.setInt(1, user_id);
			
			rs = ps.executeQuery();*/
			return rs;
    	 
     }
     
     public ResultSet getAllVideoinfo() throws SQLException
     {
    	 ps=con.prepareStatement("select uploaded_file_info.user_id,uploaded_file_info.video_info_id, uploaded_file_info.primary_file_ext,uploaded_files.file_id,uploaded_files.file_size,uploaded_files.video_file_path from uploaded_file_info inner join uploaded_files on uploaded_file_info.video_info_id=uploaded_files.video_info_id");	    	
    	 rs = ps.executeQuery();
			return rs;
    	 
     }
     
     public ResultSet getUserVideoinfo(int user_session_id) throws SQLException
     {
    	 ps=con.prepareStatement("select uploaded_file_info.user_id,uploaded_file_info.video_info_id, uploaded_file_info.primary_file_ext,uploaded_files.file_id,uploaded_files.file_size,uploaded_files.video_file_path from uploaded_file_info inner join uploaded_files on uploaded_file_info.video_info_id=uploaded_files.video_info_id where uploaded_file_info.user_id=?");	    	
    	 /*ps=con.prepareStatement("select video_file_information.primary_file_ext,video_file_information.size,video_file_information.video_path from video_file_information where user_id=?");*/
    	 ps.setInt(1, user_session_id);	
    	 rs = ps.executeQuery();
			return rs;
    	 
     }

	public ResultSet getAllusers() throws SQLException 
	{

		ps=con.prepareStatement("select * from users where approved=0");
		rs = ps.executeQuery();
		return rs;
	}

	public int approvedUser(String email) throws SQLException {

		ps=con.prepareStatement("UPDATE users SET approved = ? WHERE email = ?");
		ps.setInt(1, 1);
		ps.setString(2, email);
		
		int n=ps.executeUpdate();
		return n;
		
		
	}
     
    }

