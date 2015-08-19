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
				<li><a href="OperatorHomepage"> <span
						class="fa fa-anchor solo">Buyer Orders</span>
				</a></li>
				<li><a href="SellerOrders"> <span class="fa fa-anchor solo">Seller Orders</span>
				</a></li>
				<li><a href="DistributorOrders"> Manufacturer Orders<span
						class="fa fa-anchor solo"></span>
				</a></li>
				<li><a href="ReceivedOrders"> <span
						class="fa fa-anchor solo">Delivered Orders</span>
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
			<c:choose>
				<c:when test="${sellsize > 0}">
					<form action="SellOrderSend"  method="post">
						<div class="row clearfix" id="book-table">
							<div class="col-md-10 table-responsive">
								<table class="table table-bordered table-hover table-sortable"
									id="tab_logic">
									<thead>
										<tr>
											<th class="text-center">Name</th>
											<th class="text-center">Author</th>
											<th class="text-center">Edition</th>
											<th class="text-center">Quantity</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${selllist}" var="oi">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.quantity}</td>
												
												<c:set var="book" value="${oi.book}" scope="session" />
												<td><input type="button" value="Remove" onclick="location.href='DeleteSellOrder'" class="btn btn-block btn-lg btn-default" />
			                                    </td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<input type="submit" id="submit" name="submit"
										class="btn btn-primary" value="Submit Order">
					</form>
				</c:when>
			</c:choose>
		</div>

	</div>

</body>
</html>