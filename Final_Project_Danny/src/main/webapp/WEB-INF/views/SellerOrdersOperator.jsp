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

function update(ID){
	
	var statusname = "#status"+ID;
	var status = $(statusname).val();
	
	$.ajax({
		type : "POST",
		url: "updateOrderStatus",
		data: "status="+status+"&orderId="+ID,
		
		success: function(response){
			
			if(response == "success"){	
				$('#status').css("background","green");
				
			}else{
				
			}	
		}
	});
}


function updateCost(ID){
	
	var costnumber = "#cost"+ID;
	var cost = $(costnumber).val();
	
	$.ajax({
		type : "POST",
		url: "UpdateCostStatus",
		data: "cost="+cost+"&orderItemId="+ID,
		
		success: function(response){
			
			if(response == "success"){	
				$('#status').css("background","green");
				
			}else{
				
			}	
		}
	});
}
</script>

</head>
<body>
	<div id="wrapper">
SELLER ORDERS:
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<nav id="spy">
			<ul class="sidebar-nav nav">
				<li class="sidebar-brand"><a href="#"><span
						class="fa fa-home solo"></span></a></li>
				<li><a href="OperatorHomepage"> <span
						class="fa fa-anchor solo">Buyer Old Book Orders</span>
				</a></li>
				<li><a href="NewBookOrders"> <span
						class="fa fa-anchor solo">Buyer New Book Orders</span>
				</a></li>
				<li><a href="SellerOrdersOperator"> <span
						class="fa fa-anchor solo">Seller Orders</span>
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
					<form action="GetSellOrderItems"  method="post">
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
											<th class="text-center">Update Status</th>
											<th class="text-center">View Order Items</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sellOrderList}" var="difforder">
											<tr id='addr0'>
												<td>${difforder.orderId}</td>
												<td>${difforder.orderDate}</td>
												<td><input type="text" id="status${difforder.orderId}"
													name="status" value="${difforder.orderStatus}"
													class="form-control" /></td>
												<td>${difforder.orderAmount}<input type="hidden"
													name="difforder" value="${difforder}" /></td>
												<td><button type="button"
														onclick="update(${difforder.orderId})"
														class="btn btn-block btn-lg btn-default">Update</button></td>
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
		<div class="container">
			<c:choose>
				<c:when test="${itemlistsize > 0}">
					<form action="UpdateItem"  method="post">
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
											<th class="text-center">Cost</th>
											<th class="text-center">Update Cost</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${itemlist}" var="oi">
											<tr>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.quantity}</td>
												<td><input type="number" id="cost${oi.productId}"
													step="0.01" name="cost" value="${oi.itemStatus}"
													class="form-control" required="required" /></td>
												
												<td><button type="button" onclick="updateCost(${oi.productId})"
														class="btn btn-block btn-lg btn-default">Update Cost</button></td>
										
														
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
			<%-- <div style="color: red;">
				<c:choose>
					<c:when test="${message =='Not in stock'}">
					Order items not in stock. Place an order to distributor? 
					<a href="#" onclick="popup('popUpDiv')">Click here.</a>
					</c:when>
					<c:when test="${message =='All items delivered'}">
					Items Delivered!
					</c:when>
				</c:choose>
			</div> --%>
		</div>

	</div>

</body>
</html>