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
			String value = request.getParameter("value");
			String field = request.getParameter("field");
			String str1;
			if(field.equals("item_id") || field.equals("current_bid") || field.equals("start_date") || field.equals("end_date")){
				str1 = "SELECT * FROM items WHERE "+field+"="+value;
			} else if(field.equals("make") || field.equals("model") || field.equals("year")) {
				str1 = "SELECT * FROM items i, car c WHERE i.item_id=c.item_id AND c."+field+"="+value;
			} else if(field.equals("color") || field.equals("type") || field.equals("company_name")) {
				str1 = "SELECT * FROM items i, motorbike m WHERE i.item_id=m.item_id AND m."+field+"="+value;
			} else {
				str1 = "SELECT * FROM items i, truck t WHERE i.item_id=t.item_id AND t."+field+"="+value;
			}
			PreparedStatement ps = con.prepareStatement(str1);
			ResultSet result = stmt.executeQuery(str1);
		%>
		
	<% if(field.equals("item_id") || field.equals("current_bid") || field.equals("start_date") || field.equals("end_date")){ %>	
		<table>
			<tr>
				<td>Item_Id</td>    
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
					<td><%= result.getString("current_bid")%></td>
					<td><%= result.getString("start_date")%></td>
					<td><%= result.getString("end_date")%></td>
					<td><%= result.getString("end_time")%></td>
				</tr>
			<% }
			%>
		</table>
	<%} else if(field.equals("make") || field.equals("model") || field.equals("year")){ %>	
		<table>
			<tr>
				<td>Item_Id</td>    
				<td>Make</td>
				<td>Model</td>
				<td>Year</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("make")%></td>
					<td><%= result.getString("model")%></td>
					<td><%= result.getString("year")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<% String str2 = "SELECT * FROM items i, car c WHERE i.item_id=c.item_id AND i.start_date >= DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 2 MONTH)), INTERVAL 1 DAY)";
			ResultSet result2 = stmt.executeQuery(str2); %>
		<br>
		<br>
		Similar items:
		<table>
			<tr>
				<td>Item_Id</td>    
				<td>Make</td>
				<td>Model</td>
				<td>Year</td>
				<td>Start_date</td>
			</tr>
			<%
			//parse out the results
			while (result2.next()) { %>
				<tr>
					<td><%= result2.getString("item_id") %></td>    
					<td><%= result2.getString("make")%></td>
					<td><%= result2.getString("model")%></td>
					<td><%= result2.getString("year")%></td>
					<td><%= result2.getString("start_date")%></td>					
				</tr>
			<% }
			%>
		</table>
			
			
	<%} else if(field.equals("type") || field.equals("color") || field.equals("company_name")){ %>	
		<table>
			<tr>
				<td>Item_Id</td>    
				<td>Type</td>
				<td>Color</td>
				<td>Company</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("item_id") %></td>    
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("color")%></td>
					<td><%= result.getString("company_name")%></td>
				</tr>
			<% }
			%>
		</table>
		
		<% String str2 = "SELECT * FROM items i, motorbike m WHERE i.item_id=m.item_id AND i.start_date >= DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 2 MONTH)), INTERVAL 1 DAY)";
			ResultSet result2 = stmt.executeQuery(str2); %>
		<br>
		<br>
		Similar items:
		<table>
			<tr>
				<td>Item_Id</td>    
				<td>Type</td>
				<td>Color</td>
				<td>Company</td>
				<td>Start_date</td>
			</tr>
			<%
			//parse out the results
			while (result2.next()) { %>
				<tr>
					<td><%= result2.getString("item_id") %></td>    
					<td><%= result2.getString("type")%></td>
					<td><%= result2.getString("color")%></td>
					<td><%= result2.getString("company_name")%></td>
					<td><%= result2.getString("start_date")%></td>					
				</tr>
			<% }
			%>
		</table>
			
		<%} else if(field.equals("capacity") || field.equals("size") || field.equals("dimensions")) {%>
			<table>
				<tr>
					<td>Item_Id</td>    
					<td>Capacity</td>
					<td>Size</td>
					<td>Dimensions</td>
				</tr>
				<%
				//parse out the results
				while (result.next()) { %>
					<tr>
						<td><%= result.getString("item_id") %></td>    
						<td><%= result.getString("capacity")%></td>
						<td><%= result.getString("size")%></td>
						<td><%= result.getString("dimensions")%></td>
					</tr>
				<% }
				%>
			</table>
			
			<% String str2 = "SELECT * FROM items i, truck t WHERE i.item_id=t.item_id AND i.start_date >= DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 2 MONTH)), INTERVAL 1 DAY)";
				ResultSet result2 = stmt.executeQuery(str2); %>
			<br>
			<br>
			Similar items:
			<table>
				<tr>
					<td>Item_Id</td>    
					<td>Capacity</td>
					<td>Size</td>
					<td>Dimensions</td>
					<td>Start_date</td>
				</tr>
				<%
				//parse out the results
				while (result2.next()) { %>
					<tr>
						<td><%= result2.getString("item_id") %></td>    
						<td><%= result2.getString("capacity")%></td>
						<td><%= result2.getString("size")%></td>
						<td><%= result2.getString("dimensions")%></td>
						<td><%= result2.getString("start_date")%></td>					
					</tr>
				<% }
				%>
			</table>
		<%} %>
		
		<%//close the connection.
			db.closeConnection(con); %>
			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>