<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

</head>
<body>
	<div id="wrapper">
	<form action="PrintForm"  method="post">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<nav id="spy">
			<ul class="sidebar-nav nav">
				<li class="sidebar-brand"><a href="#"><span
						class="fa fa-home solo"></span></a></li>
				<li><a href="CustomerHomepage"> <span
						class="fa fa-anchor solo">Buy Books</span>
				</a></li>
				<li><a href="SellBooks"> <span class="fa fa-anchor solo">Sell
							Books</span>
				</a></li>
				<li><a href="AdvanceSearch"> <span
						class="fa fa-anchor solo">Advance Search</span>
				</a></li>
				<li><a href="ManageProfile"> <span
						class="fa fa-anchor solo">Manage Profile</span>
				</a></li>
				<li><a href="SesrchStore"> <span class="fa fa-anchor solo">Contact
							Us</span>
				</a></li>
				<li><a href="ChangePasswsord"> <span
						class="fa fa-anchor solo">Change Password</span>
				</a></li>
				<li><a href="Logout"> <span class="fa fa-anchor solo">Logout</span>
				</a></li>
			</ul>
			</nav>
		</div>



		<div class="container">
			<br> <br> <br> <br>
				
			<c:choose>
				<c:when test="${listsize > 0}">
						<div class="row clearfix" id="book-table">
							<div class="col-md-10 table-responsive">
								<table class="table table-bordered table-hover table-sortable"
									id="tab_logic">
									<thead>
										<tr>
											<th class="text-center">Name</th>
											<th class="text-center">Author</th>
											<th class="text-center">Edition</th>
											<th class="text-center">Type</th>
											<th class="text-center">Price</th>
											<th class="text-center">Quantity</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="oi">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.book.productType}</td>
												<td>${oi.book.productCost}</td>
												<td>${oi.quantity}</td>
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${newlistsize > 0}">
						<div class="row clearfix" id="book-table">
							<div class="col-md-10 table-responsive">
								<table class="table table-bordered table-hover table-sortable"
									id="tab_logic">
									<thead>
										<tr>
											<th class="text-center">Name</th>
											<th class="text-center">Author</th>
											<th class="text-center">Edition</th>
											<th class="text-center">Type</th>
											<th class="text-center">Price</th>
											<th class="text-center">Quantity</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${newlist}" var="oi">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.book.productType}</td>
												<td>Not reviewed yet</td>
												<td>${oi.quantity}</td>
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
				</c:when>
			</c:choose>
		</div>
		
		
		<div class="jumbotron text-center" id="content">
						<fieldset>

							<!-- Form Name -->
							<legend>Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">First Name: ${user.personFName }</label>
							</div>
							</br></br></br>
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">Last Name: ${user.personLName }</label>
							</div>
							</br></br></br>
							<div class="col-md-12">
								<label class="control-label col-md-offset-3 col-md-6 col-md-offset-3" for="name">Shipping Address:</label>
							</div>
							</br></br></br>
							
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">Address Line 1:${address.streetName }</label>
							</div>
							</br></br></br>
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">Address Line 2:${address.addressLine2 }</label>
						    </div>
							</br></br></br>
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">City:${address.city}</label>
							</div>	
							</br></br></br>
							<div class="col-md-12">
								<label class="control-label col-md-12" for="name">State:${address.state }</label>
							</div>
							</br></br></br>
							<div class="col-md-12">
							<label class="control-label col-md-12" for="name">Pincode:${address.zipcode}</label>
							</div>	
							</br></br></br>	
						</fieldset>
				</div>
				<legend>Payment Details</legend>
				<div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card: ${card.holderName}</label>
                </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>Card Number: ${card.cardNumber}</label>
                </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>CVC: ***</label>
                </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Expiration : ${card.expiryMonth} / ${card.expiryYear}</label>
                </div>
              
            </div>
            <div class="col-md-offset-2 col-md-3 col-md-offset-1">
							<input type="button" value="Submit Order"
								onclick="location.href='ConfirmOrder'"
								class="btn btn-block btn-lg btn-default" />
			</div>
            <input type="submit" value="Print Receipt"/>
            </form>
		
</div>
	
</body>
</html>