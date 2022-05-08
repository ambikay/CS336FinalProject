<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Customer Representative</title>

</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		String rep_username = request.getParameter("rep_username");
		int result = st.executeUpdate("DELETE FROM customer_rep WHERE login_name='" + rep_username + "'");
		if (result > 0) {
			out.println("Representative deleted");
			out.println("<br><a href='homepg.jsp'>Return to dashboard.</a>");
		}
	} catch (SQLException se) {
		out.println("<a href='homepg.jsp'>Return to dashboard.</a>");
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>