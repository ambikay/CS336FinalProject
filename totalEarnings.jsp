<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Report</title>

</head>
<body>
	<button onclick="window.location.href='adminAccount.jsp';">Return
		to Home Page</button>

	<h2>Total Earnings</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	try {
		out.print("<b>Total earnings: </b>");
		String str = "select sum(current_bid) as total_earnings from auction where status = 'close' and current_bid >= min_price";
		result = stmt.executeQuery(str);
		while (result.next()) {
			out.print(result.getFloat("total_earnings"));
		}
	} catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (ps != null)
			ps.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>


</body>
</html>