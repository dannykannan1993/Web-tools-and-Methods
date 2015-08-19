<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Rye' rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link href="resources/FlatUI/dist/css/vendor/bootstrap.min.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="resources/FlatUI/dist/css/flat-ui.css" rel="stylesheet">
<link href="resources/FlatUI/docs/assets/css/demo.css" rel="stylesheet">

<link rel="shortcut icon" href="img/favicon.ico">

<link rel="stylesheet" type="text/css" href="resources/css/register.css">
<script src="resources/js/register.js" type="text/javascript"></script>


<style>
#header {
	height: 215px;
	background-color: #ECF0F1;
	font-family: cursive;
}

#body1 {
	height: 800px;
	color: white;
	background-color: #ECF0F1
	/* background-color: black;
	/* background-image: url("resources/images/open-bookr.jpg"); */
	 */font-weight: bold;
}

</style>

<script type="text/javascript">
function validateForm()
{
var a=document.forms["register"]["username"].value;
var b=document.forms["register"]["email"].value;
var c=document.forms["register"]["password"].value;
var d=document.forms["register"]["confirm"].value;
var a= a.trim();
var b= b.trim();
var c= c.trim();
var d= d.trim();

var errorname="",errormail="",errorpass="", errorpass2="";
if (a==null || a=="")
  {
   errorname+="Name must be filled out. \n";
   document.getElementById("errorname").innerHTML=errorname;
  }
if (b==null || b=="")
  {
   errormail+="Mail must be filled out. \n";
   document.getElementById("errormail").innerHTML=errorpass;
  }
if (c==null || c=="")
{
 errorpass+="Password must be filled out. \n";
 document.getElementById("errorpass").innerHTML=errorpass;
} 
if (d==null || d=="")
{
 errorpass2+="Confirm password must be filled out. \n";
 document.getElementById("errorpass2").innerHTML=errorpass;
} 
if (!(c == d))
{
 errorpass+="Password don't match. \n";
 document.getElementById("errorpass").innerHTML=errorpass;
} 
if((errorname!="")||(errorpass!="")||(errormail!="")||(errorpass2!=""))
{
 //document.getElementById("errorsinform").innerHTML=error;
 return false;
}
}
</script>
</head>
<body>
	<div class="container">
		<div id="header" class="col-md-12">
			<h2 style="font-family: 'Rye', cursive;">BookBucket</h2>
			<blockquote style="font-family: 'Rye', cursive;">A place to buy and sell your books, the
				easiest way!</blockquote>
			<div id="nav" class="col-md-12">
				<nav class="navbar navbar-inverse navbar-embossed" role="navigation">
					<div class="collapse navbar-collapse" id="navbar-collapse-01">
						<ul class="nav navbar-nav navbar-left">
							<li><a href="/bookbucket/">Home<span class="navbar-unread">1</span></a></li>
							<li><a href="Details">Stores and Info<span class="navbar-unread">1</span></a></li>
							<li><a href="Registration">Register<span class="navbar-unread">1</span></a></li>
							<li><a href="AboutUs">Contact Us<span class="navbar-unread">1</span></a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div id="body1" class="col-md-12">
			<hr>
			<form action="Register" name="register" onsubmit="return validateForm()">
		<div class="row">
			<div class="col-lg-6">
				<div class="form-group">
					<label>Username</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input type="text"
							class="form-control" name="username" id="Username"
							placeholder="Requested Username" required="required">
							<div class="error" id="errorname" style="color:red;"></div>
					</div>
				</div>
				<div class="form-group">
					<label>Email</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-envelope"></span></span> <input type="email"
							class="form-control" name="email" id="Email"
							placeholder="Requested Email" required>
							<div class="error" id="erroremail" style="color:red;"></div>
					</div>
				</div>
				<div class="form-group">
					<label>Password</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input type="text"
							class="form-control" name="password" id="password"
							placeholder="Password" required data-toggle="popover"
							title="Password Strength" data-content="Enter Password...">
							<div class="error" id="errorpass" style="color:red;"></div>
					</div>
				</div>
				<div class="form-group">
					<label>Confirm Password</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-resize-vertical"></span></span> <input
							type="password" class="form-control" name="confirm" id="confirm"
							placeholder="Confirm Password" required>
							<div class="error" id="errorpass2" style="color:red;"></div>
					</div>
				</div>
				<input type="submit" name="submit" id="submit" value="Submit"
					class="btn btn-primary pull-right">
			</div>
		</div>
		</form>
		</div>

	</div>
</body>
</html>