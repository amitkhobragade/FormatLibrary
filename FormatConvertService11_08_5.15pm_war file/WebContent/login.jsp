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
                    <!-- <li>
                        <a href="#about">Encoding</a>
                    </li> -->
                    <li>
                        <a href="./Signup.jsp" data-toggle="modal">Sign Up</a>
                    </li>
                    <li>
                        <a href="./login.jsp" ng-click="login() data-toggle="modal" data-target=".bs-example-modal-sm">Log In</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


 <!-- Navigation header end-->

 <!-- body container start -->

<div class="container">

<div class="row" style="margin-top:100px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form class="form-horizontal" role="form" action="login" method="post">
			<fieldset>
			
				<h2 style="text-align: center;">Log In</h2>
				<hr class="colorgraph">
				<center>
		        <b>${message}</b><br/><br/>
		        </center>
        <div class="form-group form_pd">
                    <label for="email" class="col-sm-4 control-label">User Id</label>
                    <div class="col-sm-8">
                    <input type="email" name="email" id="email" class="form-control " placeholder="Email Address">
				</div>
        </div>

				<div class="form-group form_pd">
         <label for="password" class="col-sm-4 control-label">Password</label>
                     <div class="col-sm-8">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
				</div>
          </div>
        <div class="col-sm-5 col-lg-offset-4 col-sm-offset-4">  
              <div class="checkbox">
                    <label>
                      <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                    </label>
                </div>

        </div>
			
				
					<div class="col-sm-5 col-lg-offset-4 col-sm-offset-4" style="margin-top: 15px;">
                        <input type="submit" class="btn btn-lg btn- btn-primary btn-block" name="submit" value="Log In">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6" style="display: none;">
						<a href="./Signup.jsp" class="btn btn-lg btn-primary btn-block">Register</a>
					</div>
				
			</fieldset>
		</form>
	</div>
</div>

</div>
<!-- body container close -->

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