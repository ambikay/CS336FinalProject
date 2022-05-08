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
		String newPassword = request.getParameter("password");


		//Make an insert statement for the Sells table:
		String search = "CREATE TEMPORARY TABLE result SELECT login_name, password FROM enduser WHERE login_name=? and password=?";
		PreparedStatement ps = con.prepareStatement(search);
		ps.setString(1, newLogin_name);
		ps.setString(2, newPassword);
		ps.executeUpdate();
		
		ps = con.prepareStatement("SELECT count(*) cnt FROM result");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("cnt");
		rs.close();
		
		if(count == 0) {
			out.print("account not found");
		} else if(count > 1) {
			out.print("duplicate accounts found: "+count);
		} else {
			out.print("login successful");
		}
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		rs.close();
		stmt.close();
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("login failed :()");
	}
%>

<%--
		<form method="post" action="loginForm.jsp">
		  <input type="radio" name="command" value="register"/>Don't have an account yet? Register now!
		    <!-- when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters -->
		  <input type="submit" value="submit" />
		</form>
--%>
		
		<a href="index.jsp"><button type="button">Log out</button></a>
</body>
</html>