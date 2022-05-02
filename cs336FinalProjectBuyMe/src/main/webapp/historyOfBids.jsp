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
			String entity = request.getParameter("item_id");
			String str1 = "SELECT * FROM bid_history WHERE item_id ="+entity+" ORDER BY bid_id ASC";
			PreparedStatement ps = con.prepareStatement(str1);
			ResultSet result = ps.executeQuery();
			result.next();
		%>
	Bids placed in order:
	<table>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>
					<td><%= result.getString("bid_id")%></td>
					<td><%= result.getString("bid")%></td>
				</tr>
			<% }
			%>
		</table>
		
		

		<%//close the connection.
			result.close();
			db.closeConnection(con); %>
			

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		
	</body>
</html>