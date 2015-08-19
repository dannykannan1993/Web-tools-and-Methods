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
<title>Customer Homepage</title>
<script type="text/javascript">
	function validateForm() {
		var a = document.forms["newbook"]["name"].value;
		var b = document.forms["newbook"]["username"].value;
		var c = document.forms["newbook"]["password"].value;
		var d = document.forms["newbook"]["email"].value;
		var a = a.trim();
		var b = b.trim();
		var c = c.trim();
		var d = d.trim();
		var errorname = "", errorusername = "", errorpassword = "", erroremail = "";
		if (a == null || a == "") {
			errorname += "Enter name \n";
			document.getElementById("errorname").innerHTML = errorname;
		}

		if (b == null || b == "") {
			errorusername  += "Enter username  \n";
			document.getElementById("errorusername").innerHTML = errorusername;
		}
		if (c == null || c == "") {
			errorpassword += "Enter password \n";
			document.getElementById("errorpassword").innerHTML = errorpassword;
		}
		if (d == null || d == "") {
			erroremail += "Enter email \n";
			document.getElementById("erroremail").innerHTML = erroremail;
		}

		if ((errorname != "") || (errorusername != "") || (errorpassword != "")
				|| (erroremail != "")) {
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



		<div class="page-content inset" data-spy="scroll" data-target="#spy">
			<div class="row">
				<!-- class="jumbotron text-center" -->
				<div class="jumbotron text-center" id="content">
					<form class="form-group" action="AddNewEmployee" name="newbook"
						onsubmit="return validateForm()" method="post">
						<fieldset>

							<!-- Form Name -->
							<legend>New Employee Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Employee
									name</label>
								<div class="controls col-md-6">
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter name" class="input-xxlarge" required="">
									<div class="error" id="errorname" style="color: red;"></div>
								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">Department</label>
								<div class="controls col-md-6">
									<select id="department" name= "type" class="form-control">
										<option value="operator">Operator</option>
										<option value="admin">Admin</option>
									</select>
									<!-- <div class="error" id="errorauthor" style="color:red;"></div> -->

								</div>
							</div>
							</br>
							</br>
							</br>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="edition">Username</label>
								<div class="controls col-md-6">
									<input id="edition" class="form-control" name="username"
										type="text" placeholder="Enter Username" class="input-xxlarge"
										required="">
									<div class="error" id="errorusername" style="color: red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="quantity">Password</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="password"
										type="text" placeholder="Enter Password"
										class="input-xxlarge" min="0" required="">
									<div class="error" id="errorpassword" style="color: red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="quantity">Email
									ID</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="email"
										type="email" placeholder="Enter Email ID"
										class="input-xxlarge" required="">
									<div class="error" id="erroremail" style="color: red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>

							<!-- Button -->
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit"
										class="btn btn-primary" value="Submit">
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