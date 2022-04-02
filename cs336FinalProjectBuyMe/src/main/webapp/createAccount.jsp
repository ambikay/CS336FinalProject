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

		//Get parameters from the HTML form at the loginForm.jsp
		String newLogin_name = request.getParameter("login_name");
		String newEmail = request.getParameter("email");
		String newPassword = request.getParameter("password");


		//Make an insert statement for the Sells table:
		PreparedStatement ps = con.prepareStatement("SELECT count(*) cnt FROM enduser");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("cnt");
		rs.close();

		ps = con.prepareStatement("SELECT max(eid) mx FROM enduser");
		ResultSet rs1 = ps.executeQuery();
		rs1.next();
		int max = rs1.getInt("mx") + 1;

		
		String insert;
		if (count == 0) {
			insert = "INSERT INTO enduser(eid, login_name, email, password)"
				+ "VALUES (1,?, ?, ?)";
		} else {
			insert = "INSERT INTO enduser(eid, login_name, email, password)"
					+ "VALUES (? ,?, ?, ?)";
		}
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		if (count == 0) {
			ps.setString(1, newLogin_name);
			ps.setString(2, newEmail);
			ps.setString(3, newPassword);
		} else {
			ps.setInt(1, max);
			ps.setString(2, newLogin_name);
			ps.setString(3, newEmail);
			ps.setString(4, newPassword);
		}
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		rs.close();
		stmt.close();
		con.close();

		out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>