<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app lang="en">
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


<body ng-controller="ExampleController">

    <!-- Navigation header start-->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
           <%@include file="./header.html" %>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                   <!--  <li>
                        <a href="#about">Encoding</a>
                    </li> -->
                    <li>
                        <a href="./Signup.jsp" data-toggle="modal">Sign Up</a>
                    </li>
                    <li>
                        <a href="./login.jsp" data-toggle="modal">Log In</a>
                        <!-- data-target=".bs-example-modal-sm"  -->
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

 <!-- Navigation header end-->


<!-- container start -->
<div class="container">

<div class="row" style="margin-top:100px">
<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
<h2 style="text-align: center;">Request to Sign Up</h2>
<hr class="colorgraph">

<form class="form-horizontal" action="Signupserv" method="post">
                <center class="hidemsg">
		        <b class="hidemsg">${message}</b><br/><br/>
		        </center>
		        <script type="text/javascript">$('.hidemsg').show().delay(5000).fadeOut(1);</script>
  <div class="form-group form_pd">
    <label for="fname" class="col-sm-4 control-label" >First name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="firstname" name="first_name"  placeholder="full name" required="required">
    </div>
  </div>
  <div class="form-group form_pd">
    <label for="lname" class="col-sm-4 control-label">Last name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="last_name" id="lastname" placeholder="Last name" required="required">
    </div>
  </div>
   <div class="form-group form_pd">
    <label for="email" class="col-sm-4 control-label">Email</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" name="email"  id="email" placeholder="Email" required="required">
    </div>
  </div>
   <div class="form-group form_pd">
    <label for="password" class="col-sm-4 control-label">Password</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="required">
    </div>
  </div>
   <div class="form-group">
    <label for="repassword" class="col-sm-4 control-label">Re-enter Password</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" name="re_password" id="repassword" placeholder="Re-enter Password" onkeyup="checkPass(); return false;"  required="required">
      <span id="confirmMessage" class="confirmMessage"></span>
    </div>
  </div>
   <div class="form-group">
    <label for="company" class="col-sm-4 control-label">Company</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="company" name="company" placeholder="Company" required="required">
    </div>
  </div>
   <div class="form-group">
    <label for="address" class="col-sm-4 control-label">Address</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="address" name="address" placeholder="Address" required="required">
    </div>
  </div>
<div class="form-group">
  <label class="col-md-4 control-label" for="where">Country</label>
  <div class="col-md-8">
    <!-- <select id="where" name="where" class="form-control">
      <option value="1">United kingdom</option>
      <option value="2">USA</option>
      <option value="2">India</option>
    </select> -->
     <input type="text" class="form-control" id="country"  name="country" placeholder="Country" required="required">
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="where"></label>
  
   <div class="col-md-8">
  <label><input type="checkbox" name="terms" required="required"> I agree with the <a href="#" data-toggle="modal" data-target="#termmodel">Terms and Conditions</a>.</label>
  </div> 

  <div class="col-xs-4 col-sm-5 col-md-5 col-sm-offset-4 col-md-offset-4">
                        <input type="submit" class="btn btn-lg btn- btn-primary btn-block" value="Sign Up" >
                        <!-- data-toggle="modal" data-target="#myModal" -->
          </div>
          </div>
  </form>
  


</div>
</div>
</div>


<!-- container close -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <!-- <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
      </div>
      <div class="modal-body">
        <h4>Thank you ! Your Registration done scuessfully.</h4>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div> 




<div id="termmodel" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title" style="
    color: #fff;
    font-weight: 800;
">SeeQuestor Term and Condition</h4> 
      </div>
      <div class="modal-body">
        <p>They may be used to satisfy legal disclosure obligations, to grant users rights to use website materials, to impose acceptable use obligations, to limit (or attempt to limit) warranties and disclaim (or attempt to disclaim) liabilities, and more generally to structure the legal relationships between the website operator and users</p>

      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div> -->
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
<script >
  
function checkPass()
{
    //Store the password field objects into variables ...
    var password = document.getElementById('password');
    var repassword = document.getElementById('repassword');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(password.value == repassword.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        repassword.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        repassword.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  


</script> 

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