<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Homepage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" -->
<!-- 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script -->
<!-- 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<link href='http://fonts.googleapis.com/css?family=Fanwood+Text'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Rye' rel='stylesheet'
	type='text/css'>

<link href="resources/FlatUI/dist/css/vendor/bootstrap.min.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="resources/FlatUI/dist/css/flat-ui.css" rel="stylesheet">
<link href="resources/FlatUI/docs/assets/css/demo.css" rel="stylesheet">

<link rel="shortcut icon" href="img/favicon.ico">
<style>
#header {
	height: 215px;
	background-color: #ECF0F1;
	font-family: cursive;
}

#body1 {
	height: 400px;
	color: white;
	background-color: #ECF0F1 /* background-color: black;
	/* background-image: url("resources/images/open-bookr.jpg"); */
	 */font-weight: bold;
}

/* #body1_1 {
	height: 300px;
	color: white;
	background-color: rgba(0, 0, 0, 0.2);
	font-weight: bold;
} */
#details {
	font-weight: bold;
	height: 100px;
	background-color: #ECF0F1;
}

#footer {
	height: 20px;
	background-color: #ECF0F1;
}
</style>

<script type="text/javascript">
	function validateForm() {
		var a = document.forms["about"]["name"].value;
		var b = document.forms["about"]["email"].value;
		var c = document.forms["about"]["message"].value;
		var a = a.trim();
		var b = b.trim();
		var c = c.trim();

		var errorname = "", errormail = "", errormessage = "";
		if (a == null || a == "") {
			errorname += "Name must be filled out. \n";
			document.getElementById("errorname").innerHTML = errorname;
		}
		if (b == null || b == "") {
			errormail += "Mail must be filled out. \n";
			document.getElementById("errormail").innerHTML = errorpass;
		}
		if (c == null || c == "") {
			errormessage += "Message must be filled out. \n";
			document.getElementById("errormessage").innerHTML = errorpass;
		}
		if ((errorname != "") || (errorpass != "") || (errormessage != "")) {
			//document.getElementById("errorsinform").innerHTML=error;
			return false;
		}
	}
</script>
</head>
<body style="font-family: 'Fanwood Text', serif;">
	<div class="container">
		<div id="header" class="col-md-12">
			<h2 style="font-family: 'Rye', cursive;">BookBucket</h2>
			<blockquote style="font-family: 'Rye', cursive;">A place
				to buy and sell your books, the easiest way!</blockquote>
			<div id="nav" class="col-md-12">
				<nav class="navbar navbar-inverse navbar-embossed" role="navigation">
					<div class="collapse navbar-collapse" id="navbar-collapse-01">
						<ul class="nav navbar-nav navbar-left">
							<li><a href="/bookbucket/">Home<span
									class="navbar-unread">1</span></a></li>
							<li><a href="Details">Stores and Info<span class="navbar-unread">1</span></a></li>
							<li><a href="Registration">Register<span
									class="navbar-unread">1</span></a></li>
							<li><a href="AboutUs">Contact Us<span
									class="navbar-unread">1</span></a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div id="body1" class="col-md-12">
			Contact Us:

			<div class=" col-md-6">
				<p style="font-family: 'Rye', cursive;">Contact Us:</p>
			</div>
			<br>
			<br>
			<form class="form" action="Feedback" method="post" name="about"
				onsubmit="return validateForm()">
				<div class=" col-md-6">
					<input type="text" id="inputEmail" class="form-control"
						placeholder="Name" name="name" required autofocus>
					<div class="error" id="errorname" style="color: red;"></div>
				</div>

				<div class=" col-md-6">
					<input type="email" id="inputPassword" class="form-control"
						placeholder="Email Id" name="email" required>
					<div class="error" id="errormail" style="color: red;"></div>
				</div>
				<br>
				<br>
				<br>
				<div class="col-md-12">
					<!-- <input type="text" name="message" class="form-control"
							placeholder="Comments" required /> -->
					<textarea class="form-control" name="message"
						placeholder="Comments" rows="5" id="comment" required></textarea>
					<div class="error" id="errormessage" style="color: red;"></div>
					<br>
				</div>
				<div class="col-md-offset-5 col-md-2 col-md-offset-5">
					<button class="btn btn-lg btn-primary btn-block btn-signin"
						type="submit">Submit</button>
				</div>
			</form>
		</div>
		<!-- </div> -->
		<!-- </div> -->
		<div id="details" class="col-md-12">
			<br>
			<div class="col-md-offset-3 col-sm-6 col-md-offset-3"
				style="text-align: center">
				<p>Email us at: bookbucket@nav.com</p>
				<p>Call us at: + 617-345-6785</p>
			</div>

		</div>
		<div id="footer" class="col-md-12"></div>
	</div>
</body>
</html>
