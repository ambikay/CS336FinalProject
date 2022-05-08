<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Customer Rep Account Check Details</title>

</head>
<body>
	<%
	String admin_id = request.getParameter("admin_id");
	String rep_id = request.getParameter("rep_id");
	String email = request.getParameter("rep_email");
	String userid = request.getParameter("rep_username");
	String pwd = request.getParameter("rep_password");
	

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	rs = stmt.executeQuery("select * from customer_rep where login_name='" + userid + "'");
	if (rs.next()) {
		out.println("Username exists, please try another <a href='createCustomerRepAccount.jsp'>try again</a>");
	} else {
		
		int y = stmt.executeUpdate("insert into customer_rep values('" + rep_id + "', '" + admin_id + "', '" + email + "', '" + userid + "', '" + pwd + "')");
		out.println("Customer Representative account created");
		out.println("<br><a href = 'adminAccount.jsp'>Go back to homepage</a>");
	}
	%>

</body>
</html>