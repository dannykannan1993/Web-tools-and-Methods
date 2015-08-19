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
						class="fa fa-anchor solo">Buyer Old Book Orders</span>
				</a></li>
				<li><a href="NewBookOrders"> <span
						class="fa fa-anchor solo">Buyer New Book Orders</span>
				</a></li>
				<li><a href="SellerOrdersOperator"> <span class="fa fa-anchor solo">Seller
							Orders</span>
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
			<br><br><br>
			<form action="PlaceNewInventoryOrder" method="post">
				<div class="col-md-12">
					<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="name">Book Name</label>
								</div>
								<div class="controls col-md-6" >
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter Book Name" value="${name}" class="input-xxlarge" required="">

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
							<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="author">Author</label></div>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="author" type="text"
										placeholder="Enter Author Name" value="${author}" class="input-xxlarge"
										required="">

								</div>
							</div>
							</br></br></br>

							<!-- Text input-->
							<div class="col-md-12">
							<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="edition">Edition</label></div>
								<div class="controls col-md-6">
									<input id="edition" class="form-control" name="edition" type="text"
										placeholder="Enter Edition" value="${edition}" class="input-xxlarge" required="">

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
							<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="quantity">Quantity</label></div>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="quantity" type="text"
										placeholder="Enter Quantity"  value="${quantity}" class="input-xxlarge"
										required="">

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
							<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="Price">Price</label></div>
								<div class="controls col-md-6">
									<input id="price" class="form-control" step="0.01" name="price" type="number" value=${cost}
										placeholder="Enter Cost"  class="input-xxlarge"
										required="">
								</div>
							</div>
							<input type="hidden" name="item" value="${item}"/>
							</br></br></br>
							<!-- Button -->
							<div class="col-md-12">
							<div class="col-md-offset-3 col-md-3">
								<label class="control-label" for="submit"></label></div>
								<div class="controls">
									<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Submit">
								</div>
							</div>

			</form>
		</div>

	</div>

</body>
</html>