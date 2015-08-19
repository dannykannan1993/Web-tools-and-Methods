<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<div class="jumbotron text-center" id="content">
					<form class="form-group" action="AddNewBooktoCart">
						<fieldset>

							<!-- Form Name -->
							<legend>New Book Details</legend>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="name">Book Name</label>
								<div class="controls col-md-6" >
									<input id="name" name="name" class="form-control" type="text"
										placeholder="Enter Book Name" class="input-xxlarge" required="">

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="author">Author</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="author" type="text"
										placeholder="Enter Author Name" class="input-xxlarge"
										required="">

								</div>
							</div>
							</br></br></br>

							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="edition">Edition</label>
								<div class="controls col-md-6">
									<input id="edition" class="form-control" name="edition" type="text"
										placeholder="Enter Edition" class="input-xxlarge" required="">

								</div>
							</div>
							</br></br></br>
							<!-- Text input-->
							<div class="col-md-12">
								<label class="control-label col-md-6" for="quantity">Quantity</label>
								<div class="controls col-md-6">
									<input id="author" class="form-control" name="quantity" type="text"
										placeholder="Enter Quantity" class="input-xxlarge"
										required="">

								</div>
							</div>
							</br></br></br>
							<!-- Button -->
							<div class="col-md-12">
								<label class="control-label" for="submit"></label>
								<div class="controls">
									<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Submit">
								</div>
							</div>

						</fieldset>
					</form>

				</div>

			</div>


		</div>

	</div>

	</div>
</body>
</html>