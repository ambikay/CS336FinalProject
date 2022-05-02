<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sorting Items</title>
	</head>
	<body>
		<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String entity = request.getParameter("criteria");
			String str1 = "SELECT * FROM items i, car c WHERE i.item_id=c.item_id ORDER BY "+entity+" ASC";
			ResultSet result = stmt.executeQuery(str1);
		%>
			
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>Make</td>
			<td>Model</td>
			<td>Year</td>
			<td>Current_bid</td>
			<td>Start_date</td>
			<td>End_date</td>
			<td>End_time</td>

		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("make")%></td>
					<td><%= result.getString("model")%></td>
					<td><%= result.getString("year")%></td>
					<td><%= result.getString("current_bid")%></td>
					<td><%= result.getString("start_date")%></td>
					<td><%= result.getString("end_date")%></td>
					<td><%= result.getString("end_time")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<%//close the connection.
			db.closeConnection(con); %>
			

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		
			<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String entity = request.getParameter("criteria");
			String str1 = "SELECT * FROM items i, motorbike m WHERE i.item_id=m.item_id ORDER BY "+entity+" ASC";
			ResultSet result = stmt.executeQuery(str1);
		%>
			
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>Type</td>
			<td>Color</td>
			<td>Company</td>
			<td>Current_bid</td>
			<td>Start_date</td>
			<td>End_date</td>
			<td>End_time</td>

		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("company_name")%></td>
					<td><%= result.getString("color")%></td>
					<td><%= result.getString("current_bid")%></td>
					<td><%= result.getString("start_date")%></td>
					<td><%= result.getString("end_date")%></td>
					<td><%= result.getString("end_time")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<%//close the connection.
			db.closeConnection(con); %>
			

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		
			<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String entity = request.getParameter("criteria");
			String str1 = "SELECT * FROM items i, truck t WHERE i.item_id=t.item_id ORDER BY "+entity+" ASC";
			ResultSet result = stmt.executeQuery(str1);
		%>
			
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>Capacity</td>
			<td>Size</td>
			<td>Dimensions</td>
			<td>Current_bid</td>
			<td>Start_date</td>
			<td>End_date</td>
			<td>End_time</td>

		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("capacity")%></td>
					<td><%= result.getString("size")%></td>
					<td><%= result.getString("dimensions")%></td>
					<td><%= result.getString("current_bid")%></td>
					<td><%= result.getString("start_date")%></td>
					<td><%= result.getString("end_date")%></td>
					<td><%= result.getString("end_time")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<%//close the connection.
			db.closeConnection(con); %>
			

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>