<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Handle Questions</title>
</head>
<body>
<% 
PreparedStatement ps = null;
Connection conn = null;
try {
	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();
	String username = (session.getAttribute("user")).toString();
	String question = request.getParameter("question");
	if (question != null) {
		String insert = "INSERT INTO assists (username, question, answer)" + "VALUES (?, ?, ?)";
		ps = conn.prepareStatement(insert);
		ps.setString(1, username);
		ps.setString(2, question);
		ps.setString(3, "Customer rep hasn't answered yet");
		int result = 0;
		result = ps.executeUpdate();
		if (result < 1) {
	out.println("Insert failed");
		} else {
	out.print("<h3>Your question has been submitted successfully. Please wait for a representative to answer your question shortly.</h3>");
	out.print("<a href='userfirstpage.jsp'>Return to homepage</a>");
	return;
		}
	} else {
		%>
		<h2>Please input a question</h2>
		<p><%=session.getAttribute("user")%>, <a href="askQuestion.jsp">Click
				here to ask a question.</a>
		</p>
		<p>
			Otherwise, <a href="userfirstpage.jsp">click here to return to the
				home page.</a><% 
		return;
	}
} catch (Exception e) {
	out.print("<p>Error connecting to MYSQL server.</p>" + e);
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