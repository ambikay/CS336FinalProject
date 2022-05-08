<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Home Page</title>

</head>
<body>


	<div class="frontend">
		<h1>User Home Page</h1>
		
		
		<h2>Auction Functions</h2>	
		<ul>
			<li><a href="">View All Open Auctions</a></li>
			<li><a href="">My Auctions</a></li>
			<li><a href="createVehiclePost.jsp">Create a New Vehicle Post</a></li>
			<li><a href="allVehiclesList.jsp">View All Vehicles</a></li>
		</ul>
		<h2>Account Functions</h2>
		<ul>
			<li><a href="">View My Alerts</a></li>
			<li><a href="">View My Bid History</a></li>
		</ul>
		<h2>Search Functions</h2>
		<ul>
			<li><a href="">Filter Items Based on Criteria</a></li>
			<li><a href="">Search Vehicles Based on Keywords</a></li>
			<li><a href="">Search Auctions By Users</a></li>
		</ul>
		<h2>Ask a Question</h2>	
		<ul>
			<li><a href="askQuestion.jsp">Ask us a Question!</a></li>
		</ul>
	</div>
	<button onclick="window.location.href='homepg.jsp';">Logout</button><br>
</body>
</html>