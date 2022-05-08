<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Administrator Home</title>
</head>
<body>
	<h1>Administrator Page</h1>
	<h2>Manage customer representative accounts.</h2>
	<a href="createCustomerRep.jsp">Create customer representative account.</a> <br>
	<a href="deleteCustRep.jsp">Delete customer representative account.</a>
	<br>
	<h2>Generate Sales Reports</h2>
	<form action="salesReport.jsp" method="POST">
       <select name="select" id="selectbox"> 
       	<option value="Earnings">Total Earnings</option>
       	<option value="earnPerItem">Earnings Per Item</option>
       	<option value="earnPerIT">Earnings Per Item Type</option>
       	<option value="earnPerUser">Earnings Per End-User</option>
       	<option value="bestItem">Best Selling Items</option>
       	<option value="bestBuyer">Best Buyers</option>
       </select>
       <input type="submit" value="Generate Sales Report"/>
     </form>
	
	<a href="logout.jsp">Logout</a>
</body>
</html>
