<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.*"%>
    <%@page import="java.util.ArrayList" %>
     <%@page import="beans.UploadedFileInfo"%>
    <%@page import="beans.UploadedFiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>

  <meta name="description" content="">

  <meta name="author" content="">

  <link type="text/plain" rel="author" href="/humans.txt" />
  <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <meta name="viewport" content="width=device-width,initial-scale=1">

  <link rel="stylesheet" href="/css/main.css" type="text/css" />
  <link rel="stylesheet" href="/css/style.css" type="text/css" />
  <!-- <link rel="stylesheet" href="/css/botstrap.min.css" type="text/css" /> -->
   <link rel="stylesheet" href="/css/botstrap.css" type="text/css" />

  <link rel="icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
</head>
</head>
<body>

 <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#/home" class="smooth"><img src="images/main-logo.png" alt="SeeQuestor" border="0"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                     <li>
                        <a href="#"><font color="green">User Uploads</font></a>
                    </li>
                    
                    <li>
                        <a href="ApprovalServlet">Approval</a>
                    </li>
                    <li>
                        <a href="LogoutServlet">Log out</a>
                    </li>
                    <!-- <li>
                        <a href="signup.html" >Sign Up</a>
                    </li>
                    <li>
                        <a href="login.html" >Log In</a>
                    </li> -->
                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
      
          <div class="col-md-12" style="margin-top: 80px;">
       <!--  <h4>Encoding</h4> -->
        <h2 style="margin-bottom:50px;text-align:center;">User Video Upload History</h2>
        <div class="table-responsive table table-bordered ">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>User ID</th>
                    <th>File ID</th>
                     <th>File</th>
                     <th>Format</th>
                     <th>Size</th>
                      <th>Status</th>
                      
                       <th>Delete</th>
                   </thead>
    <tbody>
    <%--  <% 
		ArrayList al = (ArrayList) request.getAttribute("allinfo");
		 Iterator it = al.iterator();
		 while(it.hasNext ()){
		 Videofileinfo rb =  (Videofileinfo)  it.next ();
	 %>    
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td><%= rb.getUser_id()%></td>
    <td><%= rb.getFile_id() %></td>
    <td>   https://<%= rb.getVideo_path() %></td>
    <td><%= rb.getPrimary_file_ext() %></td>
    <td><%= rb.getSize() %></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >Pending</button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
     <%} %> --%>
     
    <!-- <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>282366026</td>
    <td>282336968</td>
    <td>  https://zen...6e1b7ec5f158e636386a0f34423be394a88e</td>
    <td>mpeg4</td>
    <td>2 MB</td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >Finished</button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr> -->
    
     <% 
   HashMap<Integer, UploadedFileInfo> hashMap = (HashMap<Integer, UploadedFileInfo>) request.getAttribute("allinfo");
   for (Map.Entry<Integer, UploadedFileInfo> entry : hashMap.entrySet()) {
	   UploadedFileInfo uploadedFileInfo = entry.getValue();
	   for(UploadedFiles UploadedFiles : uploadedFileInfo.getListOfUploadedFiles()){
		   
	 %>
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td><%= uploadedFileInfo.getUser_id() %></td>
    <td><%= UploadedFiles.getFile_id() %></td>
    <td>https://<%= UploadedFiles.getVideo_file_path() %></td>
    <td><%= uploadedFileInfo.getPrimary_file_ext() %></td>
    <td><%= UploadedFiles.getFile_size() %></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >Pending</button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
<% }} %>    
    
 
    
   
    
    </tbody>
        
</table>

<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
                
            </div>
            
        </div>
        
        
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
        
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
      <!-- footer section start -->

			<section class="footer" style="bottom: 0px; position: fixed;width: 100%;">
			    <div class="container">
			        <div class="row">
			          <div class="col-lg-12  col-md-12 col-sm-12" style="text-align:center;">
			             
			              <span style="color: #818181;">© 2016 SeeQuestor. All rights Reserved.</span>
			                 
			      
			    </div>
			   </div>
			 </div>
			</section>
			
<!-- footer section end -->
    
</body>
</html>