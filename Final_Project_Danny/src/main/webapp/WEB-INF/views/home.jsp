<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Homepage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" -->
<!-- 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script -->
<!-- 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Rye' rel='stylesheet' type='text/css'>

<link href="resources/FlatUI/dist/css/vendor/bootstrap.min.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="resources/FlatUI/dist/css/flat-ui.css" rel="stylesheet">
<link href="resources/FlatUI/docs/assets/css/demo.css" rel="stylesheet">

<link rel="shortcut icon" href="img/favicon.ico">
<style>


#header {
	height: 215px;
	background-color: #ECF0F1;
	font-family: cursive;
}

#body1 {
	height: 300px;
	color: white;
	background-color: black;
	background-image: url("resources/images/open-bookr.jpg");
	font-weight: bold;
}

#body1_1 {
	height: 300px;
	color: white;
	background-color: rgba(0,0,0,0.2);
	//background-image: url("resources/images/open-bookr.jpg");
	font-weight: bold;
}
#search {
	height: 300px;
	margin-top: 50px;
}

#login {
	height: 300px;
	margin-top: 30px;
}

#details {
	
	height: 400px;
	background-color: #ECF0F1;
}

#footer {
	height: 20px;
	background-color: #ECF0F1;
}

</style>

<script type="text/javascript">
function validateForm()
{
var a=document.forms["home"]["userName"].value;
var b=document.forms["home"]["password"].value;
var a= a.trim();
var b= b.trim();
var errorname="",errorpass="";
if (a==null || a=="")
  {
   errorname+="Username must be filled out. \n";
   document.getElementById("errorname").innerHTML=errorname;
  }
if (b==null || b=="")
  {
   errorpass+="Password must be filled out. \n";
   document.getElementById("errorpass").innerHTML=errorpass;
  }
if((errorname!="")||(errorpass!=""))
{
 //document.getElementById("errorsinform").innerHTML=error;
 return false;
}
}
</script>
</head>
<body style="font-family: 'Fanwood Text', serif;">
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
			<div id="body1_1">

				<div id="search" class="col-md-6">
					<!-- <div class="col-md-12" style="margin-left: 10px;">

						<p>Search Books:</p>
						<input class="form-control" id="navbarInput-01" type="search"
							placeholder="Enter Book or Author name" name="search" />
					</div>
					<br> <br> <br> <br>
					<div class="col-md-6">
						<div class="col-md-3">
							<input type="submit" class="btn btn-primary" value="Search" />
						</div>
					</div> -->
				</div>
				<div id="login" class=" col-md-6">
					 Username:
					<form method="POST" onsubmit="return validateForm()" name="home" method="post">
						<input class="form-control" id="navbarInput-01" type="text"
							placeholder="Username" name="userName" required/>
							<div class="error" id="errorname" style="color:red;"></div>
							
							 Password: <input class="form-control" id="navbarInput-01" type="password" placeholder="Password" name="password" required/>
							<div class="error" id="errorpass" style="color:red;"></div> <br> <input
							type="submit" class="btn btn-primary" value="Login" />
							<div class="error" value="${error}" style="color:red;"></div>
		
							<input type="checkbox" name="remember" 
					value="remember" /> Remember me for a week  &nbsp &nbsp <a href="ForgotPassword"> Forgot Password?</a>
					</form>
				</div>
			</div>
		</div>
		<div id="details" class="col-md-12">
			<div class="col-sm-6">
				<h3>Sell Books</h3>
				<p>Not bought books from us but want to sell ? Follow these
					steps:</p>
				<span class="fui-check-circle">Login or Register</span><br> <span
					class="fui-check-circle">Enter the books detail</span><br> <span
					class="fui-check-circle">You will get a quote from us</span><br>
				<span class="fui-check-circle">Confirm sale & drop books at
					our nearest store</span>
			</div>
			<div class="col-sm-6">
				<h3>Buy Books</h3>
				<p>Want to buy used or new books? Follow these steps:</p>
				<br> <span class="fui-check-circle">Login or Register</span><br>
				<span class="fui-check-circle">Select the books you want</span><br>
				<span class="fui-check-circle">Make payment</span><br> <span
					class="fui-check-circle">Books will be delivered</span>

			</div>
		</div>
		<div id="footer" class="col-md-12"></div>
	</div>
</body>
</html>
