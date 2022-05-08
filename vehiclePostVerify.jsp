<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Check Create Vehicle Post</title>
</head>
<body>

<%

PreparedStatement ps = null;
ResultSet rs = null;
Connection conn = null;
try {
	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();

	String category = request.getParameter("category");
	String brand = request.getParameter("brand");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	int userid = (Integer) session.getAttribute("user");
	
	String insert = "INSERT INTO product (category, brand, name,color, eid)" + "VALUES(?, ?, ?, ?, ?)";
	ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);

	ps.setString(1, category);
	ps.setString(2, brand);
	ps.setString(3, name);
	ps.setString(4, color);
	ps.setInt(5, userid);
	int result = 0;
	result = ps.executeUpdate();
	if (result < 1) {
		out.println("Error: Vehicle creation failed.");
	} else {
		rs = ps.getGeneratedKeys();
		rs.next();
		int product_id = rs.getInt(1);
		response.sendRedirect("allVehiclesList.jsp");
		return;
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		ps.close();
	} catch (Exception e) {
	}
	try {
		conn.close();
	} catch (Exception e) {
	}
}
%>
</body>
</html>