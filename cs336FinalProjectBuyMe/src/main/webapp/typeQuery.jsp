<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Items by Type</title>
	</head>
	<body>
		<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String entity = request.getParameter("command");
			String str = "SELECT * FROM items i," + entity + " e WHERE i.item_id=e.item_id";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>
			<td>Item_Id</td>    
			<td>
				<%if (entity.equals("car"))
					out.print("Make");
				else if (entity.equals("motorbike"))
					out.print("Type");
				else
					out.print("Capacity");
				%>
			</td>
			<td>
				<%if (entity.equals("car"))
					out.print("Year");
				else if (entity.equals("motorbike"))
					out.print("Color");
				else
					out.print("Size");
				%>
			</td>
			<td>
				<%if (entity.equals("car"))
					out.print("Model");
				else if (entity.equals("motorbike"))
					out.print("Company");
				else
					out.print("Dimensions");
				%>
			</td>
			<td>Current_bid</td>
			
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<% String item = result.getString("item_id"); %>
				<tr>
					<td><%out.print(item);%></td>   
					<td>
						<% if (entity.equals("car")){ %>
							<%= result.getString("make")%>
						<% }else if (entity.equals("motorbike")){ %>
							<%= result.getString("type")%>
						<% }else { %>
							<%= result.getString("capacity")%>	
						<% } %>
					</td>
					<td>
						<% if (entity.equals("car")){ %>
							<%= result.getString("year")%>
						<% }else if (entity.equals("motorbike")){ %>
							<%= result.getString("color")%>
						<% }else { %>
							<%= result.getString("size")%>	
						<% } %>
					</td>
					<td>
						<% if (entity.equals("car")){ %>
							<%= result.getString("model")%>
						<% }else if (entity.equals("motorbike")){ %>
							<%= result.getString("company_name")%>
						<% }else { %>
							<%= result.getString("dimensions")%>	
						<% } %>
					</td>
					<td><%= result.getString("current_bid")%></td>
					<td><a href="item.jsp"><button type="button" value=<%=item%>>click to view</button></a></td>
				</tr>
			<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>