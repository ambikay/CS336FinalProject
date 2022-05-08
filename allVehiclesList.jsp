<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Show All Vehicles</title>

</head>
<body>

	<button onclick="window.location.href='userfirstpage.jsp';">Return to Home Page</button>
	
<h3> List of all available Vehicles </h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "select * from product;";
		ResultSet result = null;
		result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Product ID ");
		out.print("</th>");
		out.print("<th>");
		out.print("Category");
		out.print("</th>");
		out.print("<th>");
		out.print("Brand");
		out.print("</th>");
		out.print("<th>");
		out.print("Name");
		out.print("</th>");
		out.print("<th>");
		out.print("Color");
		out.print("</th>");
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");
		out.print("<th>");
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("product_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("category"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("brand"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("color"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("login_name"));
			out.print("</td>");
			
			
			if(result.getString("login_name").equalsIgnoreCase(session.getAttribute("user").toString()))
			{
			
			out.print("<td>");
			out.print("<form action='createAuction.jsp' method='post'><button name='product_id' type='submit' value='"
			+ result.getInt("product_id") + "'>Create Auction</button></form>");
			out.print("</td>");
			}
			
			else{
			out.print("<td>");
			out.print("<form action='createAlertProduct.jsp' method='post'><button name='product_id' type='submit' value='"
			+ result.getInt("product_id") + "'> Alert Me! </button></form>");
			out.print("</td>");
			}
			
			out.print("</tr>");
		}
		out.print("</table>");
		con.close();
	} catch (Exception e) {
	}
	%>

</body>
</html>