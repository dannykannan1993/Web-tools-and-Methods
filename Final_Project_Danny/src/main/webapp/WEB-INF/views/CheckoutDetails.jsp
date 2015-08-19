<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	function ReverseDisplay(d) {
		if (document.getElementById(d).style.display == "none") {
			document.getElementById(d).style.display = "block";
		} else {
			document.getElementById(d).style.display = "none";
		}
	}

	function HideContent(d) {
		document.getElementById(d).style.display = "none";
	}
	function ShowContent(d) {
		document.getElementById(d).style.display = "block";
	}

	function HideAllShowOne(d) {
		// Between the quotation marks, list the id values of each div.

		var IDvaluesOfEachDiv = "content payment";

		//-------------------------------------------------------------
		IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/[,\s"']/g, " ");
		IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/^\s*/, "");
		IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/\s*$/, "");
		IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/  +/g, " ");
		var IDlist = IDvaluesOfEachDiv.split(" ");
		for (var i = 0; i < IDlist.length; i++) {
			HideContent(IDlist[i]);
		}
		ShowContent(d);
	}

	function validateForm() {

		var a = document.forms["details"]["firstname"].value;
		var b = document.forms["details"]["lastname"].value;
		var c = document.forms["details"]["streetName"].value;
		var d = document.forms["details"]["addressLine2"].value;
		var e = document.forms["details"]["city"].value;
		var f = document.forms["details"]["state"].value;
		var g = document.forms["details"]["zipcode"].value;
		var h = document.forms["details"]["holderName"].value;
		var i = document.forms["details"]["cardNumber"].value;
		var j = document.forms["details"]["cvc"].value;
		var k = document.forms["details"]["expiryMonth"].value;
		var l = document.forms["details"]["expiryYear"].value;
		var a = a.trim();
		var b = b.trim();
		var c = c.trim();
		var d = d.trim();
		var e = e.trim();
		var f = f.trim();
		var g = g.trim();
		var h = h.trim();
		var i = i.trim();
		var j = j.trim();
		var k = k.trim();
		var l = l.trim();
		var errorfirstname = "", errorlastname = "", errorstreet = "", errorline2 = "";
		var errorcity = "", errorstate = "", errorholdername = "", errorcard = "";
		var errorcvc = "",errormonth = "",erroryear = "",errorpincode = "";
		if (a == null || a == "") {
			errorfirstname += "Enter first name \n";
			document.getElementById("errorfirstname").innerHTML=errorfirstname;
// 			$('#firstName').addClass("has-error");
// 			$('#firstName').html("Enter book name");
		}

		if (b == null || b == "") {
			errorlastname += "Enter last name \n";
			document.getElementById("errorlastname").innerHTML = errorlastname;
		}
		if (c == null || c == "") {
			errorstreet += "Enter street. \n";
			document.getElementById("errorstreet").innerHTML = errorstreet;
		}
		if (d == null || d == "") {
			errorline2 += "Enter address line2 \n";
			document.getElementById("errorline2").innerHTML = errorline2;
		}
		
		
		if (e == null || e== "") {
			errorcity += "Enter city \n";
			document.getElementById("errorcity").innerHTML = errorcity;
		}
		
		if (f == null || f== "") {
			errorstate += "Enter state \n";
			document.getElementById("errorstate").innerHTML = errorstate;
		}
		if (g == null || g == "") {
			errorpincode += "Enter pincode \n";
			document.getElementById("errorpincode").innerHTML = errorpincode;
		}
		if (h == null || h == "") {
			errorholdername += "Enter holder name \n";
			document.getElementById("errorholdername").innerHTML = errorholdername;
		}
		if (i == null || i == "") {
			errorcard += "Enter card number \n";
			document.getElementById("errorcard").innerHTML = errorcard;
		}
		if (j == null || j == "") {
			errorcvc += "Enter CVC \n";
			document.getElementById("errorcvc").innerHTML = errorcvc;
		}
		if (k == null || k == "" || k<0 || k>12) {
			errormonth += "Enter expiry month \n";
			document.getElementById("errormonth").innerHTML = errormonth;
		}
		if (l == null || l == "" || l<2015) {
			erroryear += "Enter expiry year \n";
			document.getElementById("erroryear").innerHTML = erroryear;
		}

		if ((errorfirstname != "")|| (errorlastname != "")|| (errorstreet != "")||(errorline2 != "")||
				(errorcity != "")||(errorstate != "")(errorholdername != "")||(errorcard != "")||(errorcvc != "")||
				(errormonth != "")||(erroryear != "")||(errorpincode != "")) {
			//document.getElementById("errorsinform").innerHTML=error;
			return false;
		}
		else{
		return true;
		}
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
				<li><a href="Login" target="content"> <span
						class="fa fa-anchor solo">Buy Books</span>
				</a></li>
				<li><a href="#anch2"> <span class="fa fa-anchor solo">Sell
							Books</span>
				</a></li>
				<li><a href="#anch3"> <span class="fa fa-anchor solo">Advance
							Search</span>
				</a></li>
				<li><a href="#anch4"> <span class="fa fa-anchor solo">Manage
							Profile</span>
				</a></li>
				<li><a href="#anch4"> <span class="fa fa-anchor solo">Logout</span>
				</a></li>
			</ul>
			</nav>
		</div>



		<div class="page-content inset" data-spy="scroll" data-target="#spy">
			<div class="row">
				<!-- class="jumbotron text-center" -->
				<a href="javascript:ReverseDisplay('content')">Personal Details</a>
				|| <a href="javascript:ReverseDisplay('payment')">Payment
					Details</a>
				<form:form class="form-group" commandName="address"
					action="AddressDetails" name="details"
					onsubmit="return (validateForm())" method="post">
					<div class="jumbotron text-center" id="content">

						<fieldset>


							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">First
									Name</label>
								<div class="controls col-md-6" id="firstName">
									<input name="firstname" class="form-control" type="text"
										placeholder="Enter First Name" class="input-xxlarge"
										required="" />
									<div class="error" id="errorfirstname" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Last
									Name</label>
								<div class="controls col-md-6">
									<input name="lastname" class="form-control" type="text"
										placeholder="Enter Last Name" class="input-xxlarge"
										required="">
									<div class="error" id="errorlastname" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label
									class="control-label col-md-offset-3 col-md-6 col-md-offset-3"
									for="name">Shipping Address:</label>
							</div>
							</br> </br> </br>

							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Address
									Line 1</label>
								<div class="controls col-md-6">
									<form:input path="streetName"
										class="form-control input-xxlarge" type="text"
										placeholder="Enter Street Name" required="" />
									<div class="error" id="errorstreet" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Address
									Line 2</label>
								<div class="controls col-md-6">
									<form:input path="addressLine2"
										class="form-control input-xxlarge" type="text"
										placeholder="Enter Apt/House No." required="" />
									<div class="error" id="errorline2" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">City</label>
								<div class="controls col-md-6">
									<form:input path="city" class="form-control input-xxlarge"
										type="text" placeholder="Enter City" required="" />
									<div class="error" id="errorcity" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">State</label>
								<div class="controls col-md-6">
									<form:input path="state" class="form-control input-xxlarge"
										type="text" placeholder="Enter State" required="" />
									<div class="error" id="errorstate" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Pincode</label>
								<div class="controls col-md-6">
									<form:input path="zipcode" class="form-control input-xxlarge"
										type="text" placeholder="Enter Pincode" required="" />
									<div class="error" id="errorpincode" style="color: red;"></div>

								</div>
							</div>
							</br> </br> </br>
							<p>Fill out the card details next</p>
							<!-- Button
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit"
										class="btn btn-primary" value="Submit">
								</div>
							</div>
 -->
						</fieldset>


					</div>

					<div class="container" id="payment">
						<div class='row'>
							<div class='col-md-4'></div>
							<div class='col-md-4'>
								<div class='form-row'>
									<div class='col-xs-12 form-group required'>
										<label class='control-label'>Name on Card</label> <input
											class='form-control' name="holderName" size='4' type='text' />
										<div class="error" id="errorholdername" style="color: red;" required=""></div>
									</div>
								</div>
								<div class='form-row'>
									<div class='col-xs-12 form-group required'>
										<label class='control-label'>Card Number</label> <input
											autocomplete='off' name="cardNumber" class='form-control'
											size='20' min="0" type='number' required="" />
										<div class="error" id="errorcard" style="color: red;"></div>
									</div>
								</div>
								<div class='form-row'>
									<div class='col-xs-4 form-group cvc required'>
										<label class='control-label'>CVC</label> <input
											autocomplete='off' name="cvc" class='form-control card-cvc'
											placeholder='ex. 311' size='4' type='text' required=""/>
										<div class="error" id="errorcvc" style="color: red;"></div>
									</div>
									<div class='col-xs-4 form-group expiration required'>
										<label class='control-label'>Expiration</label> <input
											class='form-control card-expiry-month' name="expiryMonth"
											placeholder='MM' size='2' type='text' required=""/>
										<div class="error" id="errormonth" style="color: red;"></div>
									</div>
									<div class='col-xs-4 form-group expiration required'>
										<label class='control-label'> </label> <input
											class='form-control card-expiry-year' name="expiryYear"
											placeholder='YYYY' size='4' type='text' required=""/>
										<div class="error" id="erroryear" style="color: red;"></div>
									</div>
								</div>
								<div class='form-row'>
									<div class='col-md-12'>
										<div class='form-control total btn btn-info'>
											Total: <span class='amount'></span>
										</div>
									</div>
								</div>

								<div class='form-row'>
									<div class='col-md-offset-4 col-md-4  form-group'>
										&nbsp &nbsp &nbsp &nbsp &nbsp
										<button class='form-control btn btn-primary submit-button'
											type='submit'>Submit</button>
									</div>
								</div>
				</form:form>
			</div>
			<div class='col-md-4'></div>
		</div>
	</div>
	<br>
	<br>
	</div>


	</div>

	</div>

	</div>
</body>
</html>