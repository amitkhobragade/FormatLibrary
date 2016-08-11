package logic;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 




import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import beans.UploadedFileInfo;
import beans.UploadedFiles;
import dao.UserDao;
import beans.users;
/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2000MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2000MB
 
    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    if(request.getSession().getAttribute("user_id") != null)
    {	  
      	  
    	 Random random = new Random(System.nanoTime());
		  int randomInt = random.nextInt(1000000000);
		  System.out.println("randomno="+randomInt);
		  
		  String finalfol=null;
		  String actual_video_size = null;
		  
    	UploadedFileInfo vidinfo = null; 
    	int user_session_id= (Integer) request.getSession().getAttribute("user_id");	
    	
    	
    	
       /* for uploading video file */
        
     // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
 
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        /*String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;*/
        
        String uploadPath ="C:/Users/Admin/Desktop/";
        System.out.println(uploadPath);
        
        // creates the directory if it does not exist
        /*File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }*/
 
        try {
        	//String[] fieldnames = new String[100000];
        	String array_values[] = new String[13]; // use for for 13 formfields i.e. Video file information 
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            System.out.println("allformdata=="+formItems);
            System.out.println("formItems size=="+formItems.size());
            
            //formItems.get(13);
            System.out.println("vvv=="+formItems.get(13).getName());
            int i = 0;
            List<UploadedFiles> listOfUploadedFiles = new ArrayList<>();
            if (formItems != null && formItems.size() > 0)
            {
               // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                	
                	try {
						if (item.isFormField())
						{
						    String name = item.getFieldName();// Gives field names from form
						    
						    String value = item.getString();// Gives user inputs from fields
						    //System.out.println(name);
						   // System.out.println(" i =" + i + " value =" + value);
						    array_values[i]=value;
						    
							//fieldnames[i]=name;
						   // array_values.add(value);
       
						    i++;
						 }
						else{
							float upload_video_size = item.getSize();
							float size_MB =  (upload_video_size/(1024*1024));
							actual_video_size=Float.toString(size_MB);
							//System.out.println("videosize="+upload_video_size);
							//System.out.println("videosize in MB="+size_MB);
							System.out.println("Actual videosize in MB="+actual_video_size);
							
							String sss= item.getName();
						    String[] s1=sss.split("/");
						    finalfol=s1[0];
						    for(int ii=1;ii<s1.length-1;ii++)
						    {
						    	finalfol=finalfol+"/"+s1[ii];
						    }
						    	
						    System.out.println(finalfol);
						    
						 /*
						  * removes last part of index  i.e => ask
						   String str="http://stackoverflow.com/questions/ask";
						    int index=str.lastIndexOf('/');
						    System.out.println(str.substring(0,index)); */
						    
						    String fileName = new File(item.getName()).getName();
						    String filePath = uploadPath + File.separator + user_session_id+ File.separator + finalfol ;
						    File storeFile = new File(filePath);
						    
						    if (!storeFile.exists()) {
						    	storeFile.mkdirs();
						    	}
						   
						    						    	
						  System.out.println("mypath=="+item.getName());
						    filePath = filePath + File.separator + fileName;
						    
							storeFile = new File(filePath);
					         
						    // saves the file on disk
						    item.write(storeFile);
						    request.setAttribute("message",
						        "Upload has been done successfully!");
						    
						    //array_values[i]=filePath; // storing destination path of uploaded video.
						    //i++;
						    UploadedFiles uploadedFiles = new UploadedFiles();
						    uploadedFiles.setFile_size(actual_video_size);
						    uploadedFiles.setVideo_file_path(filePath);
						    listOfUploadedFiles.add(uploadedFiles);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
               /* for(i=0;i<13;i++)
                	System.out.println(" i =" + i + " value of array =" + array_values[i]);*/
            }
            
            /*System.out.println(array_values[0]);
            System.out.println(array_values[1]);
            System.out.println(array_values[2]);*/
            
            /*for (int j = 0; j < fieldnames.length; j++) {
            	String fields = fieldnames[j];
            	System.out.println("field name is=="+fields);
			}*/
            
            UserDao usedao=new UserDao();
        	
        	String email=((users)request.getSession().getAttribute("userinfo")).getEmail();
        	String password=((users)request.getSession().getAttribute("userinfo")).getPassword();
        	int user_id;
        	
        	System.out.println("x="+user_session_id);
        	if(user_session_id!=0)
        	{
        		user_id=user_session_id;
        		System.out.println("inside (x!=0)"+user_id);
        		vidinfo = new UploadedFileInfo();
        		
        		vidinfo.setUser_id(user_id);
        		vidinfo.setPrimary_file_ext(array_values[0]);
                vidinfo.setSec_file_ext(array_values[1]);
            	vidinfo.setPlayer_name(array_values[2]);
            	vidinfo.setVersion_name(array_values[3]);
                vidinfo.setManufacturer(array_values[4]);
                vidinfo.setManufacture_web(array_values[5]);
                vidinfo.setModelno(array_values[6]);
                vidinfo.setVideofile_type(array_values[7]);
                vidinfo.setDecoder_conv(array_values[8]);
                vidinfo.setConv_file(array_values[9]);
                vidinfo.setFile_source(array_values[10]);
                vidinfo.setTotal_size(actual_video_size);
                vidinfo.setNo_of_cameras(array_values[11]);
                //vidinfo.setVideo_path(array_values[12]);
                vidinfo.setUser_id(user_session_id);
                vidinfo.setListOfUploadedFiles(listOfUploadedFiles);
        	}
        	/*else{
    			ResultSet rs;
    			System.out.println("inside else");
    				rs = usedao.checkUser(email,password);
    				while(rs.next())
    				{  
    				 if(email.equals(rs.getString("email")) && password.equals(rs.getString("password")))
    					{ 
    					  user_id=rs.getInt("id");
    					   vidinfo=new Videofileinfo();
    					   vidinfo.setUser_id(user_id);
    					}    	
    	    	
    				}
    			
        	}	*/
            
            
           // Videofileinfo vidinfo=new Videofileinfo();
        	
           // vidinfo.setFile_id(randomInt);
           
            //vidinfo.setUser_id(user_id);
           // UserDao usedao=new UserDao(); we already created above
            int n=usedao.addFileinfo(vidinfo);
           // int m=usedao.addFilePath(array_values, user_session_id);
            System.out.println("nnn="+n);
            List<Object> al = new ArrayList<Object>() ;
            
            if(n==1)
			{  System.out.println("inside if(n==1)");
				//request.setAttribute("videoinfo", vidinfo);
				ResultSet info=usedao.getUserVideoinfo(user_session_id);
				
				/*while (info.next())
				  { 
					  int as=0;
					UploadedFileInfo vidinfo1=new UploadedFileInfo();
				    vidinfo1.setPrimary_file_ext(info.getString("primary_file_ext"));
				   // vidinfo1.setTotal_size(info.getString("size"));
				    //vidinfo1.setVideo_path(info.getString("video_path"));
				    vidinfo1.setUser_id(info.getInt("user_id"));
				   // vidinfo1.setFile_id(info.getInt("file_id"));
				    
				    UploadedFiles upfile=new UploadedFiles();
				    System.out.println("file_id :::"+info.getInt("file_id"));
				    System.out.println("file_size :::"+info.getString("file_size"));
				    upfile.setFile_id(info.getInt("file_id"));
				    upfile.setFile_size(info.getString("file_size"));
				    
				    vidinfo1.setu
				    //al.add(as++, vidinfo1);
				    al.add(as++,vidinfo1);
				    al.add(as++,upfile);
				    System.out.println("again in fileupload servlet ");
				    System.out.println(info.getString("primary_file_ext"));
				   // System.out.println(info.getString("size"));
				    //System.out.println(info.getString("video_path"));
				     
				  }*/
				HashMap<Integer, UploadedFileInfo> hashMap = new HashMap<>();
				//List<UploadedFiles> uploadedFiles = new ArrayList<>();
				while(info.next()){
					int video_info_id = info.getInt("video_info_id");
					System.out.println("video_info_id ::"+video_info_id +"::"+info.getInt("file_id"));
					if(hashMap.containsKey(video_info_id)){
						UploadedFileInfo uploadedFileInfo = hashMap.get(video_info_id);
						List<UploadedFiles> uploadedFiles = uploadedFileInfo.getListOfUploadedFiles();
						if(uploadedFiles !=null && !uploadedFiles.isEmpty()){
							uploadedFiles.add(getUploadedFiles(info));   // method is created below at end
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
				RequestDispatcher rd=request.getRequestDispatcher("/upload.jsp");
				rd.include(request, response);
				
			}
			else
			{   
				PrintWriter out=response.getWriter();
				out.println("<font color=red>Please Enter valid details</font>");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        
    }else{
    	
    	request.setAttribute("message","<font color=red>You have to login first</font>");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
    	
    }
       
    }
    private UploadedFiles getUploadedFiles(ResultSet info) throws SQLException{
		UploadedFiles uploadedFiles = new UploadedFiles();
		uploadedFiles.setFile_id(info.getInt("file_id"));
		uploadedFiles.setFile_size(info.getString("file_size"));
		uploadedFiles.setVideo_file_path(info.getString("video_file_path"));
		return uploadedFiles;
	}
}
