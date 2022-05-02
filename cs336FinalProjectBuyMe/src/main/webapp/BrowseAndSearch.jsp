<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse and Search</title>
</head>
<body>
		<h1>Browse And Search Auction Items</h1>
		<br>
		1. Browse different types of vehicles available:
		<form method="post" action="typeQuery.jsp">
		  <input type="radio" name="command" value="car"/>Cars
		  <br>
		  <input type="radio" name="command" value="motorbike"/>Motorbikes
		  <br>
		  <input type="radio" name="command" value="truck"/>Trucks
		  <br>
		  <input type="submit" value="submit" />
		</form>
		<br>
		2. Sort by:
		<form method="get" action="Sort.jsp">
			<select name="criteria" size=1>
				<option value="current_bid">Current bid</option>
				<option value="start_date">Start Date</option>
				<option value="end_date">End Date</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
		<br>
		3. Search by field
		<form method="get" action="Search.jsp">
			Enter search phrase:
			<table>
			<tr>
				<td></td><td><input type="text" name="value"></td>
			</tr>
			</table>
			Which field are you searching for:
			<select name="field" size=1>
				<option value="item_id">Item Id</option>
				<option value="current_bid">Current bid</option>
				<option value="start_date">Start Date</option>
				<option value="end_date">End Date</option>
				<option value="make">Make</option>
				<option value="model">Model</option>
				<option value="year">Year</option>
				<option value="color">Color</option>
				<option value="type">Type</option>
				<option value="company_name">Company</option>
				<option value="capacity">Capacity</option>
				<option value="size">Size</option>
				<option value="dimensions">Dimensions</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
		<br>
		4. My Auctions: see all the auctions you have participated in
		<a href="myAuctions.jsp"><button type="button">click to view</button></a>
		<br>
		<br>
		5. History of Bids
		<form method="get" action="historyOfBids.jsp">
			Enter the item_id you want to search bid history for:
			<table>
			<tr>
				<td><input type="text" name="item_id"></td>
				<td><input type="submit" value="submit" /></td>
			</tr>
			</table>
		</form>
		
</body>
</html>