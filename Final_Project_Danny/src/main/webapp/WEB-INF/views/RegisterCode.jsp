<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

var a= a.trim();


var errorname="";
if (a==null || a=="")
  {
   errorname+="Number must be filled out. \n";
   document.getElementById("errorname").innerHTML=errorname;
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
			<form action="CheckRegistration" name="register" onsubmit="return validateForm()"  method="post">
		<div class="row">
			<div class="col-lg-6">
				<div class="form-group">
					<label>Username</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input type="number"
							class="form-control" name="code2" id="Username"
							placeholder="Requested Code" required="required">
							<div class="error" id="errorname" style="color:red;"></div>
					</div>
					<input type="hidden" name="code" value="${code}"/>
					<input type="hidden" name="name" value="${username}"/>
					<input type="hidden" name="password" value="${password}"/>
					<input type="hidden" name="email" value="${email}"/>
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