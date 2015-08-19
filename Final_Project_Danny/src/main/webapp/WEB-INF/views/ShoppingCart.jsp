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
<title>Customer Homepage</title>

</head>
<body>
	<div id="wrapper">

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
				<br><br><br>
					Existing Book Orders:
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
											<th class="text-center">Quantity</th>
											<th class="text-center">Remove</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="oi">
										<form action="RemoveFromCart">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.book.productType}</td>
												<td>${oi.quantity}</td>
												<td><a href="RemoveFromCart?name=+${oi.book.productName}+&author=+${oi.book.author}+&edition=+${oi.book.edition}+&quantity=+${oi.quantity}+&type=+${oi.book.productType}+&active=+${oi.book.active}">Remove Item</a></td>
											</tr>
											</form>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

					
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${newlistsize > 0}">
					New Book Orders:
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
											<th class="text-center">Quantity</th>
											<th class="text-center">Remove</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${newlist}" var="oi">
										<form action="RemoveFromCart">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.book.productType}</td>
												<td>${oi.quantity}</td>
												<td><a href="RemoveFromCart?name=+${oi.book.productName}+&author=+${oi.book.author}+&edition=+${oi.book.edition}+&quantity=+${oi.quantity}+&type=+${oi.book.productType}+&active=+${oi.book.active}">Remove Item</a></td>
											
											</tr>
												</form>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

				
				</c:when>
			</c:choose>

			<c:choose>
				<c:when test="${newlistsize >0 || listsize >0}">
					<div class="col-md-10">
						<div class="col-md-offset-1 col-md-3">
							<input type="button" value="Continue Shopping"
								onclick="location.href='CustomerHomepage'"
								class="btn btn-block btn-lg btn-default" />
						</div>
						<div class="col-md-offset-2 col-md-3 col-md-offset-1">
							<input type="button" value="Checkout"
								onclick="location.href='CheckOut'"
								class="btn btn-block btn-lg btn-default" />
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-10" style="color: red;">
						No items found. Please add books.  <a href="CustomerHomepage">Click
							here</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>




	</div>
</body>
</html>