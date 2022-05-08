<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View Item</title>
	</head>
	<body>
		<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String item = request.getParameter("value");
			out.print(item);
			String str = "SELECT * FROM items i, car c WHERE i.item_id=c.item_id AND i.item_id="+item;
			ResultSet result = stmt.executeQuery(str);
			if (result.next()) {%>
				
			Auction Item Details:
			
			<ul>
				<li>Item_id:</li>
				<li>Start_date:<%=result.getString("start_date")%></li>
				<li>Start_time:<%=result.getString("start_time")%></li>
				<li>End_date:<%=result.getString("end_date")%></li>
				<li>End_time:<%=result.getString("end_time")%></li>
				<li>Initial_price:<%=result.getString("initial_price")%></li>
				<li>Current_bid:<%=result.getString("current_bid")%></li>
			    <li>Make:<%=result.getString("make")%></li>
			    <li>Model:<%=result.getString("model")%></li>
			    <li>Year:<%=result.getString("year")%></li>
			</ul>
			<%} else { out.print("hello");}%>
			
		
			<%
			//close the connection.
			db.closeConnection(con);
			%>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>