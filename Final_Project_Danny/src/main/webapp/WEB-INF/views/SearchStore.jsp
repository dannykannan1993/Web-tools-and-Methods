<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="resources/js/popUp.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="resources/css/popUp.css">
</head>


<body>

<div id="blanket" style="display:none;"></div>
<div id="popUpDiv" style="display:none;">
<a href="#" onclick="popup('popUpDiv')">Click me to close</a>
<form action="CustomerHomepage">
	<input type="text" name="name"/>
	<input type="submit" value="submit"/>
</form>

</div>
<a href="#" onclick="popup('popUpDiv')">Click me to open the popup</a>
</body>
</html>