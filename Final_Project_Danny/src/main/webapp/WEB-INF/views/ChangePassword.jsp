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
<script>
function validateForm() {
	var currentPassword = document.pass.currentpassword.value;
	var oldPassword = document.pass.oldpassword.value;
	var newPassword = document.pass.newpassword.value;
	var newPassword2 = document.pass.newpassword2.value;
	currentPassword= currentPassword.trim();
	oldPassword= oldPassword.trim();
	newPassword= newPassword.trim();
	newPassword2= newPassword2.trim();
	if (currentPassword != oldPassword) {
		document.getElementById("oldpassword").innerHTML = "Password is incorrect."
		return false;
	}
	if (newPassword != newPassword2) {
		document.getElementById("newpassword").innerHTML = "Re-entered password doesn't match"
		return false;
	}
	if(oldPassword==""){
		document.getElementById("oldpassword").innerHTML = "Enter old password"
			return false;
	}
	if(newPassword==""){
		document.getElementById("newpassword").innerHTML = "Enter new password"
			return false;
	}
	if(newPasword2==""){
		document.getElementById("newpassword2").innerHTML = "Enter confirm password"
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
				<li><a href="CustomerHomepage"> <span class="fa fa-anchor solo">Buy
							Books</span>
				</a></li>
				<li><a href="SellBooks"> <span class="fa fa-anchor solo">Sell
							Books</span>
				</a></li>
				<li><a href="OrderStatus"> <span class="fa fa-anchor solo">Manage
							Buy Orders</span>
				</a></li>
				<li><a href="ManageSellOrders"> <span class="fa fa-anchor solo">Manage
							Sell Orders</span>
				</a></li>
				<li><a href="ChangePassword"> <span class="fa fa-anchor solo">Change
							Password</span>
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
					<form class="form-group" action="UpdatePassword" name="pass" onsubmit="return validateForm()" method="post">
						<fieldset>
							<input type="hidden" value="${user.password}" name="currentpassword"/>
							<!-- Form Name -->
							<legend>Change Password</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Old Password</label>
								<div class="controls col-md-6" >
									<input id="password" name="oldpassword" class="form-control" type="text"
										placeholder="Enter existing password" class="input-xxlarge" required="">
										<div id="oldpassword" style="color:red;"></div>
								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">New Password</label>
								<div class="controls col-md-6">
									<input id="newpassword" class="form-control" name="newpassword" type="text"
										placeholder="Enter new password" class="input-xxlarge"
										required="">
										<div id="newpassword" style="color:red;"></div>

								</div>
							</div>
							</br></br></br>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="edition">Confirm Password</label>
								<div class="controls col-md-6">
									<input id="newpassword2" class="form-control" name="newpassword2" type="text"
										placeholder="Confirm new password" class="input-xxlarge" required="">
										<div id="newpassword2" style="color:red;"></div>

								</div>
							</div>
							
							</br></br></br>
							<!-- Button -->
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Update">
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