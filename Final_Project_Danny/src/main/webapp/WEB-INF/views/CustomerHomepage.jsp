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
function validateForm()
{
var a=document.forms["searchForm"]["search"].value;
var a= a.trim();
var errorname="";
if (a==null || a=="")
  {
   errorname+="Enter Search term. \n";
   document.getElementById("errorname").innerHTML=errorname;
  }  

if((errorname!=""))
{
 //document.getElementById("errorsinform").innerHTML=error;
 return false;
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
				<div id="content">
						<a href="ShoppingCart">View Shopping Cart</a>&nbsp &nbsp
&nbsp						<a href="NewBook">Place New Book Order</a>
					<div class="col-md-12 jumbotron text-center">
						<form action="SearchBooks" onsubmit="return validateForm()" name="searchForm" method="post">
							<p>Search Books to add to cart:</p>
							<br>
							<div class="col-md-offset-1 col-md-10 col-md-offset-1">
								<input class="form-control" id="navbarInput-01" type="search"
									placeholder="Enter Book or Author name" name="search" />
									<div class="error" id="errorname" style="color:red;"></div>
							</div>

							<br> <br><br><br> <input type="submit" class="btn"
								value="Search" /> <br>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<c:choose>
				<c:when test="${size > 0}">
					
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
											<th class="text-center">Add</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${booklist}" var="book">
										<form action="AddToCart" name="searchTable" method="post">
											<tr id='addr0'>
												<td>${book.productName}</td>
												<td>${book.author}</td>
												<td>${book.edition}</td>
												<td>${book.productType}</td>
												<td>${book.productCost}</td>
												<td>
						   						 <input type="number" name="quantity"  placeholder="Quantity" class="form-control" min="0"/>
						   						 <div class="error" id="errorquantity" style="color:red;"></div>
												</td>
												<td><button type="submit" name="action"
														value="${book.productId}"
														class="btn btn-block btn-lg btn-default">Add to Cart</button></td>
											</tr>
												</form>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

				
				</c:when>
				<c:when test="${size == 0}">
					<div style="color: red;">
						No records found. Enter a new book record? <a href="NewBook">Click
							here</a>
					</div>
				</c:when>
			</c:choose>
		</div>




		<div id="blanket" style="display: none;"></div>
		<div id="popUpDiv" style="display: none;">
			<a href="#" onclick="popup('popUpDiv')">Click me to close</a>
		</div>
	</div>
</body>
</html>