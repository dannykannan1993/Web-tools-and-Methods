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
<style>
.submit-button {
  margin-top: 10px;
}
</style>
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
				<li><a href="AdvanceSearch"> <span class="fa fa-anchor solo">Advance
							Search</span>
				</a></li>
				<li><a href="ManageProfile"> <span class="fa fa-anchor solo">Manage
							Profile</span>
				</a></li>
				<li><a href="SesrchStore"> <span class="fa fa-anchor solo">Contact Us</span>
				</a></li>
				<li><a href="ChangePasswsord"> <span class="fa fa-anchor solo">Change
							Password</span>
				</a></li>
				<li><a href="Logout"> <span class="fa fa-anchor solo">Logout</span>
				</a></li>
			</ul>
			</nav>
		</div>

		
<br><br><br><br>
			<div class="container">
    <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'>
          <form:form action="SummaryDetails" commandName="card">
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card</label>
                <form:input path="holderName" class='form-control' name="holderName" size='4' type='text'/>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Card Number</label>
                <form:input path="cardNumber" autocomplete='off' name="cardNumber" class='form-control' size='20' type='number'/>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>CVC</label>
                <form:input path="cvc" autocomplete='off' name="cvc" class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'/>
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Expiration</label>
                <form:input path="expiryMonth" class='form-control card-expiry-month' name="expiryMonth" placeholder='MM' size='2' type='text'/>
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'> </label>
                <form:input path="expiryYear" class='form-control card-expiry-year' name="expiryYear" placeholder='YYYY' size='4' type='text'/>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12'>
                <div class='form-control total btn btn-info'>
                  Total:
                  <span class='amount'>$300</span>
                </div>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' type='submit'>Pay</button>
              </div>
            </div>
            <div class='form-row'>
              
            </div>
          </form:form>
        </div>
        <div class='col-md-4'></div>
    </div>
</div>

		</div>

	</div>
</body>
</html>