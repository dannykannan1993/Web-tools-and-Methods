<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Homepage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" -->
<!-- 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->

<link rel="shortcut icon" href="img/favicon.ico">
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

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
	function loadMap() {

		var lat = [];
		var lon = [];
		var name = [];
		<c:forEach items="${lat}" var="id">
		lat.push("${id}");
		</c:forEach>
		
		<c:forEach items="${lon}" var="id1">
		lon.push("${id1}");
		</c:forEach>
		
		<c:forEach items="${name}" var="id2">
		name.push("${id2}");
		</c:forEach>
		
		var latlng = new google.maps.LatLng(lat[0], lon[0]);

		var myOptions = {
			zoom : 13,
			center : latlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_container"),
				myOptions);

		for (i = 0; i < lat.length; i++) {
			var latlng = new google.maps.LatLng(lat[i], lon[i]);
			var marker = new google.maps.Marker({
				position : latlng,
				map : map,
				title : " "+name[i]
			});

		}

		/* var marker = new google.maps.Marker({
			position : new google.maps.LatLng(coord1, coord2),
			map : map,
			title : ""
		}); */

	}
	/*for (i = 0; i < lat.length; i++) {
	            marker = new google.maps.Marker({
	                position: new google.maps.LatLng(lat[i], lon[i]),
	                map: map
	            });
	        }    */
</script>
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

div#map_container {
	height: 400px;
}

#footer {
	height: 20px;
	background-color: #ECF0F1;
}
</style>
</head>
<body style="font-family: 'Fanwood Text', serif;" onload="loadMap()">
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
						<li><a href="Details">Stores and Info<span
								class="navbar-unread">1</span></a></li>
						<li><a href="Registration">Register<span
								class="navbar-unread">1</span></a></li>
						<li><a href="AboutUs">Contact Us<span
								class="navbar-unread">1</span></a></li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
		<input type="hidden" value="${lat}" name="lat" id="lat" /> <input
			type="hidden" value="${lon}" name="lon" id="lon" />
		<div id="body1" class="col-md-12">
			<div id="map_container"></div>
		</div>
		<div id="details" class="col-md-12">
			<br>
			<div class="col-md-offset-3 col-sm-6 col-md-offset-3"
				style="text-align: center"></div>

		</div>
		<div id="footer" class="col-md-12"></div>
	</div>
</body>
</html>
