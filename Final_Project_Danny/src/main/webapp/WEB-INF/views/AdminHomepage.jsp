<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="resources/js/popUp.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="resources/css/popUp.css">
<title>Customer Homepage</title>
<script>
function validateForm()
{
var a=document.forms["newbook"]["name"].value;
var b=document.forms["newbook"]["author"].value;
var c=document.forms["newbook"]["edition"].value;
var d=document.forms["newbook"]["quantity"].value;
var a= a.trim();
var b= b.trim();
var c= c.trim();
var d= d.trim();
var errorname="", errorauthor="", erroredition="", errorquantity="";
if (a==null || a=="")
  {
   errorname+="Enter book name \n";
   document.getElementById("errorname").innerHTML=errorname;
  }  
  
if (b==null || b=="")
{
 errorauthor+="Enter author name \n";
 document.getElementById("errorauthor").innerHTML=errorauthor;
}  
if (c==null || c=="")
{
 erroredition+="Enter edition. \n";
 document.getElementById("erroredition").innerHTML=erroredition;
}  
if (d==null || d=="")
{
 errorquantity+="Enter quantity \n";
 document.getElementById("errorquantity").innerHTML=errorquantity;
}  

if((errorname!="")||(errorauthor!="")||(erroredition!="")||(errorquantity!=""))
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
				<li><a href="AdminHomepage"> <span
						class="fa fa-anchor solo">Add Books</span>
				</a></li>
				<li><a href="AddEmployee"> <span
						class="fa fa-anchor solo">Add Employee</span>
				</a></li>
				<li><a href="ReviewSalesYear">Review Books <span
						class="fa fa-anchor solo"></span>
				</a></li>

				<li><a href="ChangePassword"> <span
						class="fa fa-anchor solo">Change Password</span>
				</a></li>
				<li><a href="Logout"> <span class="fa fa-anchor solo">Logout</span>
				</a></li>
			</ul>
			</nav>
		</div>

		<br> <br> <br>
		<div class="container">
			<div class="jumbotron text-center" id="content">
					<form class="form-group" action="AddNewBook" name="newbook" onsubmit="return validateForm()" method="post">
						<fieldset>

							<!-- Form Name -->
							<legend>New Book Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Book Name</label>
								<div class="controls col-md-6" >
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter Book Name" class="input-xxlarge" required="">
									<div class="error" id="errorname" style="color:red;"></div>
								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">Author</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="author" type="text"
										placeholder="Enter Author Name" class="input-xxlarge"
										required="">
										<!-- <div class="error" id="errorauthor" style="color:red;"></div> -->

								</div>
							</div>
							</br></br></br>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="edition">Edition</label>
								<div class="controls col-md-6">
									<input id="edition" class="form-control" name="edition" type="text"
										placeholder="Enter Edition" class="input-xxlarge" required="">
										<div class="error" id="erroredition" style="color:red;"></div>

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="quantity">Quantity</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="quantity" type="number"
										placeholder="Enter Quantity" class="input-xxlarge" min="0"
										required="">
										<div class="error" id="errorquantity" style="color:red;"></div>

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

</body>
</html>