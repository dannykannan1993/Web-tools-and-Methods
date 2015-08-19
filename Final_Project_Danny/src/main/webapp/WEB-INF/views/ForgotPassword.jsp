<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link href="resources/FlatUI/dist/css/vendor/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/buybooks.css">
<script src="resources/js/buybooks.js" type="text/javascript"></script>

<script>
function validateForm()
{
var a=document.forms["password"]["name"].value;
var b=document.forms["password"]["emailID"].value;
var a= a.trim();
var b= b.trim();
var errorname="", erroremail="";
if (a==null || a=="")
  {
   errorname+="Enter username \n";
   document.getElementById("errorname").innerHTML=errorname;
  }  
  
if (b==null || b=="")
{
 erroremail+="Enter Email id \n";
 document.getElementById("erroremail").innerHTML=erroremail;
}  

if((errorname!="")||(erroremail!=""))
{
 //document.getElementById("errorsinform").innerHTML=error;
 return false;
}
return true;
}
</script>
</head>
<body>

<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<nav id="spy">
			<ul class="sidebar-nav nav">
				<li class="sidebar-brand"><a href="#"><span
						class="fa fa-home solo"></span></a></li>
				<li><a href="/bookbucket/"> <span class="fa fa-anchor solo">Home</span>
				</a></li>
			</ul>
			</nav>
		</div>



		<div class="page-content inset" data-spy="scroll" data-target="#spy">
			<div class="row">
				<!-- class="jumbotron text-center" -->
				<div class="jumbotron text-center" id="content">
					<form class="form-group" action="ForgotPasswordMail" name="password" onsubmit="return validateForm()" method="post">
						<fieldset>

							<!-- Form Name -->
							<legend>User Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">User name</label>
								<div class="controls col-md-6" >
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter Username" class="input-xxlarge" required="">
									<div class="error" id="errorname" style="color:red;"></div>
								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">Email ID</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="emailID" type="email"
										placeholder="Enter Email ID" class="input-xxlarge"
										required="">
										<div class="error" id="erroremail" style="color:red;"></div>

								</div>
							</div>
							</br></br></br>

							<!-- Button -->
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Submit">
								</div>
							</div>

						</fieldset>
					</form>

				</div>

			</div>


		</div>

	</div>

	</div>

</body>
</html>