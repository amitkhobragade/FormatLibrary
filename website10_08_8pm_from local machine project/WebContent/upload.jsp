<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app lang="en">
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/css/main.css" type="text/css" />
  <link rel="stylesheet" href="/css/style.css" type="text/css" />
  <!-- <link rel="stylesheet" href="/css/botstrap.min.css" type="text/css" /> -->
   <link rel="stylesheet" href="/css/botstrap.css" type="text/css" />

  <link rel="icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
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
                        <a href="#"><font style="color: green;">Upload</font></a>
                    </li>
                    <li>
                        <a href="Myaccount">My Account</a>
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
   



<div class="container" style="margin-top:80px">
<div class="row">
<div class="col-sm-8"><h2 style="margin-bottom: 50px;float: right;">Upload file for Conversion </h2></div>
    <div class="col-sm-4">
      <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" style="float:right;">Help!</button>
    </div> 	
		
</div>
<div class="row" >
	
<form id="Form"  method="post" role="form" action=FileUploadServlet enctype="multipart/form-data">
             <center>
		        <b style="font-size:large;">${message}</b><br/><br/>
		     </center>
	<script>	     
		     $(function() {
    // setTimeout() function will be fired after page is loaded
    // it will wait for 5 sec. and then will fire
    // $("#successMessage").hide() function
    setTimeout(function() {
        $("#successMessage").hide('blind', {}, 500)
    }, 5000);
});
		     </script>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Primary file extension</label>
            <input type="text" class="form-control" id="" name="primary_file_ext" required />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Secondary file extensions</label>
            <input type="text" class="form-control" id="" name="sec_file_ext"  required />
        </div>
    </div>
     <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Name of player</label>
            <input type="text" class="form-control" id="" name="player_name" required  />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Version of player</label>
            <input type="text" class="form-control" id="" name="version_name"  required />
        </div>
    </div>
     <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Manufacturer</label>
            <input type="text" class="form-control" id="" name="manufacturer" required  />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Manufacturer website</label>
            <input type="text" class="form-control" id="" name="manufacture_web"  required />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Model No.</label>
            <input type="text" class="form-control" id="" name="modelno" required  />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Video File types: (CCTV / Non-CCTV)*</label>
            <input type="text" class="form-control" id="" name="videofile_type" required />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Decoder / Conversions</label>
            <input type="text" class="form-control" id="" name="decoder_conv" required />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Converted file M4V</label>
            <input type="text" class="form-control" id="" name="conv_file" required />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Source of file</label>
            <input type="text" class="form-control" id="" name="file_source" required />
        </div>
         <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">No of cameras</label>
            <input type="text" class="form-control" id="" name="no_of_cameras" required />
        </div>
        <!-- <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Size</label>
            <input type="text" class="form-control" id="" name="size"  />
        </div> -->
    </div>
    <!-- <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">No of cameras</label>
            <input type="text" class="form-control" id="" name="no_of_cameras"  />
        </div>
        
        <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6">
            <label class="control-label">Converted file M4V</label>
            <input type="text" class="form-control" id="field-firstName" required />
        </div>
   </div> -->
   <div class="row form-group col-lg-6 col-md-6 col-xs-6 col-sm-6"> 
		  <input type="file" name="uploadFolder"  multiple webkitdirectory id="fileURL"  value="Choose folder" required/>
		  <input type="file" name="uploadFile"  multiple id="" value="Choose file"  /> 
		   <br/>
		   <h4>Files to upload:</h4>
            <ul id="fileOutput"></ul>
		    <!-- <input type="file" id="uploadFile" name="uploadFile1" required/> 
		   <br/> -->
		   <!-- <input type="file" id="uploadFile" name="uploadFile"/>
		   <br/>  -->
		  
		 <!--  <input type="submit" value="Submit" name="submit" class="btn btn-primary" /> -->
		  <button type="submit"  name="submit" class="btn btn-primary" >Submit</button>
   </div>


  <!--  <input type="submit" value="Submit" name="submit" class="btn btn-primary" /> -->


</form>

<!-- <div class="row">
    <form id="videoupload" method="post" action="FileUploadServlet" enctype="multipart/form-data">
	     <div class="form-group col-lg-6 col-md-6 col-xs-6 col-sm-6"> 
		   <input type="file" id="uploadFile" name="uploadFile"/> 
		    <br/>
		   <input type="submit" value="Upload" name="submit" class="btn btn-primary" />
	     </div>
    </form>
</div> -->
<!-- <button id="submitUpload" type="submit" value="Submit" name="submit" class="btn btn-primary" >BUTTON</button> -->

</div>
</div>
<script type="text/javascript">
var files, 
file, 
extension, 
input = document.getElementById("fileURL"),
output = document.getElementById("fileOutput"),
holder = document.getElementById("fileHolder");

input.addEventListener("change", function (e) {
files = e.target.files;

 /* var relativePath =files[1].webkitRelativePath;
var folder = relativePath.split("/");
alert(folder);

for (var i = 0, len = folder.length; i < len; i++) {
	alert(folder[i]);
}
 */
output.innerHTML = "";

for (var i = 0, len = files.length; i < len; i++) {
    file = files[i];
    extension = file.name.split(".").pop();
    output.innerHTML += "<li class='type-" + extension + "'>" + file.name + " (" +  Math.floor(file.size/1024 * 100)/100 + "KB)</li>";
}
}, false);



/* // This event is fired as the mouse is moved over an element when a drag is occuring
input.addEventListener("dragover", function(e) {
  holder.classList.add("highlightOver");
  holder.classList.remove("highlightOut");
});

// This event is fired when the mouse leaves an element while a drag is occuring
input.addEventListener("dragleave", function(e) {
  holder.classList.remove("highlightOver");
  holder.classList.add("highlightOut");
});

// Fires when the user releases the mouse button while dragging an object.
input.addEventListener("dragend", function(e) {
  holder.classList.remove("highlightOver");
  holder.classList.add("highlightOut");
});

// The drop event is fired on the element where the drop was occured at the end of the drag operation
input.addEventListener("drop", function(e) {
  holder.classList.remove("highlightOver");
  holder.classList.add("highlightOut");
});
 */


</script>

<style>

/* 
.container {
  margin: 20px;
}

.highlightOver {
  font-weight: bold;
	border: 2px solid #000;
  border-radius: 7px;
	//box-shadow: inset 0 3px 4px #888;
}

.highlightOut {
  font-weight: bold;
	border: 2px dashed #555;
	border-radius: 7px;
	cursor: default;
}

.type-png {
  background-image: url(http://cdn5.iconfinder.com/data/icons/fatcow/16x16/file_extension_png.png)
}

.type-css {
  background-image: url(http://cdn5.iconfinder.com/data/icons/FileTypesIcons/16/css.png);
}

.type-js {
  background-image: url(http://cdn1.iconfinder.com/data/icons/CS5/16/ExtendScript_JSX_file_document.png);
}

.row {
  margin: 0px
}

input[type="file"] {
  width: 400px;
  height: 145px;
  margin-top: -80px;
  
  background: transparent;
    //background-color: blue;
}

#fileHolder {
  width: 400px;
  height: 80px;
  overflow: hidden;
  // background-color: yellow;
}

.folder-icon {
  margin: auto;
  background-image: url('http://findicons.com/files/icons/1018/pixelicious/32/folder_down.png');
  background-repeat:no-repeat;
  //background-color: orange;
  height: 32px;
  margin-top: 30px;
  width: 200px;
}

ul {
  list-style-type: none
}

li {
  background-image: url(http://cdn1.iconfinder.com/data/icons/CrystalClear/16x16/mimetypes/unknown.png);
  background-repeat: no-repeat;
  padding-left: 1.6em;
}

 */
 
</style>
<!-- <script>
	$(document).ready(function() {
	    $("#submitUpload").click(function() {
	  document.getElementById("Form").submit();
	  document.getElementById("videoupload").submit();
	 });
</script> -->

    <!-- <form>
  <div class="form-group row">
    <label for="exampleInputEmail1" class="col-sm-6 col-md-6">Name of Player</label>
    <input type="email" class="form-control col-sm-6 col-md-6" id="exampleInputEmail1" placeholder="Name of Player">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="col-sm-6">File Extensions</label>
    <input type="password" class="form-control col-sm-6 col-md-6" id="exampleInputPassword1" placeholder="File Extensions">
  </div>
  <div class="form-group">
    <label for="exampleInputFile" class="col-sm-6">File input</label>
    <input type="file" id="exampleInputFile" class="col-sm-6 col-md-6">
    <!-- <p class="help-block">Example block-level help text here.</p> -->
  <!-- </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Check me out
    </label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form> --> 
        
       <!--  <div class="col-md-12">
        <h4>Encoding</h4>
        <div class="table-responsive table table-bordered ">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>File ID</th>
                    <th>Job ID</th>
                     <th>File</th>
                     <th>Format</th>
                     <th>Size</th>
                      <th>Status</th>
                      
                       <th>Delete</th>
                   </thead>
    <tbody>
    
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>282366026</td>
    <td>282336968</td>
    <td>  https://zen...6e1b7ec5f158e636386a0f34423be394a88e</td>
    <td>mpeg4</td>
    <td>2 MB</td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >Pending</button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    
<tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>282366026</td>
    <td>282336968</td>
    <td>  https://zen...6e1b7ec5f158e636386a0f34423be394a88e</td>
    <td>mpeg4</td>
    <td>2 MB</td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >Finished</button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    
    
    
 
    
   
    
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
            
        </div> -->
	<!-- </div>
</div> -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title" style="
    color: #fff;
    font-weight: 800;
">Help!</h4> 
      </div>
      <div class="modal-body">
        <p>Primary file extension:</p>
        <p>Secondary file extensions:</p>
        <p>Name of player:</p>
        <p>Version of player:</p>
        <p>Manufacturer:</p>
        <p>Model No:</p>
        <p>Video File types: (CCTV / Non-CCTV):</p>

      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div> -->
    </div>

  </div>
</div> 




<!-- <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
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
    /.modal-content 
  </div>
      /.modal-dialog 
    </div> -->
    
    
    
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

    <script>
      
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});


    </script>
