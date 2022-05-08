<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Auctions</title>
	</head>
	<body>
		<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String str1 = "SELECT id FROM current_users WHERE user_type=?";
			PreparedStatement ps = con.prepareStatement(str1);
			ps.setString(1, "enduser");
			ResultSet rs1 = ps.executeQuery();
			rs1.next();
			int id = rs1.getInt("id");
			rs1.close();
			
			String str2 = "SELECT * FROM buys b, items i WHERE i.item_id=b.item_id AND b.eid=?";
			ps = con.prepareStatement(str2);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
		%>
	Items you placed bid on:
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>Initial_Bid</td>
			<td>Current_Bid</td>
			<td>End_date</td>
			<td>End_time</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("initial_bid")%></td>
					<td><%= result.getString("current_bid")%></td>
					<td><%= result.getString("end_date")%></td>
					<td><%= result.getString("end_time")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<% String str3 = "SELECT * FROM items WHERE eid=?";
		ps = con.prepareStatement(str2);
		ps.setInt(1, id);
		ResultSet result1 = ps.executeQuery(); %>
		
	Items you placed on sale:
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>Initial_Price</td>
			<td>Current_Bid</td>
			<td>End_date</td>
			<td>End_time</td>
		</tr>
			<%
			//parse out the results
			while (result1.next()) { %>
				<tr>
					<td><%= result1.getString("item_id") %></td>    
					<td><%= result1.getString("initial_price")%></td>
					<td><%= result1.getString("current_bid")%></td>
					<td><%= result1.getString("end_date")%></td>
					<td><%= result1.getString("end_time")%></td>
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