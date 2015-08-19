<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<html>
  <head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    var month = [];
	var sales = [];
	<c:forEach items="${month}" var="id">
	month.push("${id}");
	</c:forEach>
	
	<c:forEach items="${sales}" var="id1">
	sales.push("${id1}");
	</c:forEach>
	 var Combined = new Array();
	  Combined[0] = ['Month', 'Sales'];
	  for (var i = 0; i <sales.length; i++){
	    Combined[i + 1] = [ month[i], sales[i]];
	  }
      google.load("visualization", "1.1", {packages:["bar"]});
      google.setOnLoadCallback(drawStuff);

      function drawStuff() {
    	  
    	  //second parameter is false because first row is headers, not data.
    	  var data = google.visualization.arrayToDataTable(Combined, false);
       /*  var data = new google.visualization.arrayToDataTable([
          ['Move', 'Percentage'],
          ["King's pawn (e4)", 44],
          ["Queen's pawn (d4)", 31],
          ["Knight to King 3 (Nf3)", 12],
          ["Queen's bishop pawn (c4)", 10],
          ['Other', 3]
        ]); */

        var options = {
          title: 'Review of Sales per year',
          width: 900,
          legend: { position: 'none' },
          chart: { subtitle: 'By sales number' },
          axes: {
            x: {
              0: { side: 'top', label: 'White to move'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
    </script>
  </head>
  <body>
    <div id="top_x_div" style="width: 900px; height: 500px;"></div>
  </body>
</html>