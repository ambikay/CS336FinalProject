<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Vehicle</title>

</head>
<body>
   	<button onclick="window.location.href='userfirstpage.jsp';">Return to Homepage</button>
   	<h2> Create a new vehicle</h2>
	<div class="content">
		<form action="vehiclePostVerify.jsp" method="POST">
			<label for="category">Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Car">Car</option>
				<option value="Motorbike">Motorbike</option>
				<option value="Truck">Truck</option>
			</select> <br>
			<table>
				<tr>
					
					<td>Brand:</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
						<td>Name:</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>Color:</td>
					<td><input type="text" name="color" required></td>
				</tr>
				<tr>
			</table>
			<input type="submit" value="Create Vehicle">
		</form>
	</div>
</body>
</html>