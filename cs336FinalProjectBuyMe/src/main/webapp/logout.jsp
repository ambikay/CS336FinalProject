<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>createAccount</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str= "DELETE FROM current_users WHERE user_type = ?";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, "enduser");
		ps.executeUpdate();
		out.print("logout successful");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		stmt.close();
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("login failed :()");
	}
%>
		<a href="index.jsp"><button type="button">Go back to login page</button></a>
</body>
</html>