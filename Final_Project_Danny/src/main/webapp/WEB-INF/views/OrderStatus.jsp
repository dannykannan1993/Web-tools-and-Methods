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
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<title>Customer Homepage</title>
<link rel="stylesheet" type="text/css" href="resources/css/buybooks.css">
<script src="resources/js/buybooks.js" type="text/javascript"></script>
<script src="resources/js/buybooksTable.js" type="text/javascript"></script>
<script src="resources/js/popUp.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="resources/css/popUp.css">
<style type="text/css">
.table-sortable tbody tr {
	cursor: move;
}
</style>

<script type="text/javascript">
	function validateForm() {
		var a = document.forms["searchForm"]["search"].value;
		var a = a.trim();
		var errorname = "";
		if (a == null || a == "") {
			errorname += "Enter Search term. \n";
			document.getElementById("errorname").innerHTML = errorname;
		}

		if ((errorname != "")) {
			//document.getElementById("errorsinform").innerHTML=error;
			return false;
		}
	}
</script>
</head>
<body>
	<div id="wrapper">

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
				<!-- style="margin-left: 10px;" -->
				<div id="content"></div>
				Buying Orders:
				<br>Existing:
				<c:choose>
				<c:when test="${existingsize > 0}">
					<form action="GetExistingOrderItems" method="post">
						<div class="row clearfix" id="book-table">
							<div class="col-md-10 table-responsive">
								<table class="table table-bordered table-hover table-sortable"
									id="tab_logic">
									<thead>
										<tr>
											<th class="text-center">Order ID</th>
											<th class="text-center">Date</th>
											<th class="text-center">Status</th>
											<th class="text-center">Amount</th>
											<th class="text-center">View Order Items</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${existingOrderList}" var="difforder">
											<tr id='addr0'>
												<td>${difforder.orderId}</td>
												<td>${difforder.orderDate}</td>
												<td>${difforder.orderStatus}</td>
												<td>${difforder.orderAmount}<input type="hidden"
													name="difforder" value="${difforder}" /></td>

												<td><button type="submit" name="action"
														value="${difforder.orderId}"
														class="btn btn-block btn-lg btn-default">View
														items</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
		<div>
		<c:choose>
				<c:when test="${itemlistsize > 0}">
					<form action="CheckInventory">
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
											<th class="text-center">Status</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${itemlist}" var="oi">
											<tr>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.quantity}</td>
												<td>${oi.itemStatus}</td>
												
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
				
				<br>New:
				
					<c:choose>
				<c:when test="${newsize > 0}">
					<form action="GetCustomerNewOrderItems"  method="post">
						<div class="row clearfix" id="book-table">
							<div class="col-md-10 table-responsive">
								<table class="table table-bordered table-hover table-sortable"
									id="tab_logic">
									<thead>
										<tr>
											<th class="text-center">Order ID</th>
											<th class="text-center">Date</th>
											<th class="text-center">Status</th>
											<th class="text-center">Amount</th>
											<th class="text-center">View Order Items</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${newOrderList}" var="difforder">
											<tr id='addr0'>
												<td>${difforder.orderId}</td>
												<td>${difforder.orderDate}</td>
												<td>${difforder.orderStatus}</td>
												<td>${difforder.orderAmount}<input type="hidden"
													name="difforder" value="${difforder}" /></td>

												<td><button type="submit" name="action"
														value="${difforder.orderId}"
														class="btn btn-block btn-lg btn-default">View
														items</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
		<div>
		<c:choose>
				<c:when test="${newitemlistsize > 0}">
					<form action="CheckInventory">
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
											<th class="text-center">Status</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${newitemlist}" var="oi">
											<tr>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.quantity}</td>
												<td>${oi.itemStatus}</td>
												
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
			
		
		

	</div>
</body>
</html>