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
<script type="text/javascript">
function validateForm()
{
var a=document.forms["sellerForm"]["name"].value;
var b=document.forms["sellerForm"]["author"].value;
var c=document.forms["sellerForm"]["edition"].value;
var d=document.forms["sellerForm"]["quantity"].value;
var a= a.trim();
var b= b.trim();
var c= c.trim();
var d= d.trim();
var errorname="";
var errorauthor="";
var erroredition="";
var errorquantity="";
if (a==null || a=="")
  {
   errorname+="Enter Book Name. \n";
   document.getElementById("errorname").innerHTML=errorname;
  }
  
if (b==null || b=="")
{
 errorauthor+="Enter Author name. \n";
 document.getElementById("errorauthor").innerHTML=errorauthor;
} 


if (c==null || c=="")
{
 erroredition+="Enter Edition name. \n";
 document.getElementById("erroredition").innerHTML=erroredition;
}  


if (d==null || d=="" || d<1)
{
 errorquantity+="Enter proper Quantity \n";
 document.getElementById("errorquantity").innerHTML=errorquantity;
}  

if((errorname!="")||(errorquantity!="")||(erroredition!=""))
{
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
				<!-- class="jumbotron text-center" -->
				<div class="jumbotron text-center" id="content">
					<form class="form-group" action="AddSellingBooks" onsubmit="return validateForm()" name="sellerForm"  method="post">
						<fieldset>

							<!-- Form Name -->
							<legend>Enter Book Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Book
									Name</label>
								<div class="controls col-md-6">
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter Book Name" class="input-xxlarge"
										required="">
										<div class="error" id="errorname" style="color:red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">Author</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="author"
										type="text" placeholder="Enter Author Name"
										class="input-xxlarge" required="">
										<!-- <div class="error" id="errorauthor" style="color:red;"></div> -->

								</div>
							</div>
							</br>
							</br>
							</br>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="edition">Edition</label>
								<div class="controls col-md-6">
									<input id="edition" class="form-control" name="edition"
										type="text" placeholder="Enter Edition" class="input-xxlarge"
										required="">
										<div class="error" id="erroredition" style="color:red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="quantity">Quantity</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="quantity"
										type="text" placeholder="Enter Quantity" class="input-xxlarge"
										required="">
										<div class="error" id="errorquantity" style="color:red;"></div>

								</div>
							</div>
							</br>
							</br>
							</br>
							<!-- Button -->
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit"
										class="btn btn-primary" value="Submit">
								</div>
							</div>

						</fieldset>
					</form>

				</div>

			</div>
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
											<th class="text-center">Remove</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${selllist}" var="oi">
											<tr id='addr0'>
												<td>${oi.book.productName}</td>
												<td>${oi.book.author}</td>
												<td>${oi.book.edition}</td>
												<td>${oi.quantity}</td>
												<td><a href="DeleteSellProduct?name=+${oi.book.productName}+&author=+${oi.book.author}+&edition=+${oi.book.edition}+&quantity+${oi.quantity}">Remove Item</a>
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