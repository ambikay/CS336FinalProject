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

		//check if login_name already exists	
		String search1 = "CREATE TEMPORARY TABLE result1 SELECT login_name FROM enduser WHERE login_name=?";
		PreparedStatement ps = con.prepareStatement(search1);
		ps.setString(1, newLogin_name);
		ps.executeUpdate();
		
		ps = con.prepareStatement("SELECT count(*) cnt1 FROM result1");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count1 = rs.getInt("cnt1");
		rs.close();
		boolean login_unique = false;
		if(count1 == 0) {
			out.print("login_name unique");
			login_unique = true;
		} else {
			out.print("login_name not unique");
		}
		
		//check of email unique
		String search2 = "CREATE TEMPORARY TABLE result2 SELECT password FROM enduser WHERE email=?";
		ps = con.prepareStatement(search2);
		ps.setString(1, newEmail);
		ps.executeUpdate();
		
		ps = con.prepareStatement("SELECT count(*) cnt2 FROM result2");
		rs = ps.executeQuery();
		rs.next();
		int count2 = rs.getInt("cnt2");
		rs.close();
		boolean email_unique = false;
		if(count2 == 0) {
			out.print("email unique");
			email_unique = true;
		} else {
			out.print("email not unique");
		}


		if(login_unique && email_unique) {
			//Make an insert statement for the enduser table:
			ps = con.prepareStatement("SELECT count(*) cnt FROM enduser");
			rs = ps.executeQuery();
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
			
			out.print("Insert succeeded!");
		}
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		rs.close();
		stmt.close();
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>