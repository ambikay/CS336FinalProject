<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Administrator Home</title>
</head>
<body>

	<h1>Administrator Home Page</h1>
	
	<br>
	<h2>Generate Sales Reports:</h2>

	<a href="totalEarnings.jsp">By Total Earnings</a>
	<br>
	<a href="earningPerItem.jsp">By Earning per Item</a>
	<br>
	<a href="earningPerItemType.jsp">By Earning per Item Type</a>
	<br>
	<a href="earningPerEndUser.jsp">By Earning per End-User</a>
	<br>
	<a href="bestSellingItems.jsp">By Best-Selling Items</a>
	<br>
	<a href="bestBuyers.jsp">By Best Buyers</a>
	<br>
	<h2>Manage customer representative accounts:</h2>
	<a href="createCustomerRep.jsp">Create customer representative account</a> <br>
	

<p><p>
	<button onclick="window.location.href='homepg.jsp';">Logout</button><br>
</body>
</html>
