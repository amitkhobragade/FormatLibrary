<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.*"%>
    <%@page import="java.util.ArrayList" %>
     <%@page import="beans.UploadedFileInfo"%>
    <%@page import="beans.UploadedFiles"%>
    <%@page import="beans.users"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Format Library</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

    <link type="text/plain" rel="author" href="/humans.txt" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
    <link rel="stylesheet" href="/css/style.css" type="text/css" />
    <link rel="stylesheet" href="/css/botstrap.css" type="text/css" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

</head>

<body>

 <!-- Navigation header start-->
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
                   <!--  <li>
                        <a href="#about">Encoding</a>
                    </li> -->
                   <li>
                        <a href="AdminServ">User Uploads</a>
                    </li>
                    <li>
                        <a href="#"><font color="green">Approval</font></a>
                    </li>
                     <li>
                        <a href="LogoutServlet">Log out</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

 <!-- Navigation header end-->
 <div style="margin-top:80px">
     <h2 style="margin-bottom:50px;text-align:center;">User Authorization</h2>
     
      </div>
 
 <table id="mytable" class="table table-bordred table-striped  table-hover table-responsive" >
                 
                   <thead>
                   
                    <th><input type="checkbox" id="checkall" /></th>
                   <th>User ID</th>
                    <th>First Name</th>
                     <th>Last Name</th>
                     <th>Email</th>
                     <th>Company</th>
                      <th>Address</th>
                      <th>Country</th>
                       <th>Status</th>
                      
                       <th>Created On</th>
                   </thead>
    <tbody>
    <% 
		ArrayList al = (ArrayList) request.getAttribute("allinfo");
		 Iterator<Object> it = al.iterator();
		 while(it.hasNext ()){
		 users rb =  (users)  it.next ();
	 %>
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td><%= rb.getId()  %></td>
    <td><%= rb.getFirst_name() %></td>
    <td><%= rb.getLast_name() %></td>
    <td><%= rb.getEmail() %></td>
    <%  request.getSession().setAttribute("usermail", rb.getEmail()); %>
    <td><%= rb.getCompany() %></td>
    <td class="addressdot"><%= rb.getAddress() %></td>
    <td><%= rb.getCountry() %></td>
   
    <td>
    <!-- <div class="onoffswitch">
    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
    <label class="onoffswitch-label" for="myonoffswitch">
        <span class="onoffswitch-inner"></span>
        <span class="onoffswitch-switch"></span>
    </label>
</div> -->
 <!-- Indicates a successful or positive action -->
        <button type="button" class="btn btn-warning btn-sm btn3d"  ><span class="glyphicon glyphicon-ok"></span><a href="UserApproved?param=<%= rb.getEmail() %>">Click to Approve</a></button>
</td>
    <td><%= rb.getCreated_on() %></td>
    </tr>
    
   <%} %> 
    

    
    </tbody>
        
</table>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><span>Account approval confirmation</span></h4>
      </div>
      <div class="modal-body">
      <h4>Please send below massage to ___________</h4>
      <div style="
    border: 1px solid #e6e6e6;
    padding: 15px;
    background-color: #fafaff;">
        <h4>Hi <b>amit</b>,</h4>
        <p>Congratulation !! Your SeeQuestor account Sign up is Sucsessfull...you can now login using below credential </p>
          <p>User ID:____________</p>
            <p>Password: As specified during signup</p>

    <h4>Enjoy your video  conversion service</h4>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
      </div> 
    </div>

  </div>
</div> 


<!-- footer section start -->



<section class="footer" style="bottom: 0px; position: fixed;width: 100%;">
    <div class="container">
        <div class="row">
          <div class="col-lg-12  col-md-12 col-sm-12" style="text-align:center;">
             
              <span style="color: #818181;">© 2016 SeeQuestor. All rights Reserved.</span>
                 
      
    </div>
</section>

<!-- footer section end -->
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.5/angular.min.js"></script>
<script>
  function ExampleController($scope) {

  }
</script>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>