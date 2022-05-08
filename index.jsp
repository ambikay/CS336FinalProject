<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe</title>
	</head>
	
	<body>

		<h1>Welcome to BuyMe</h1>
		
		<form method="get" action="loginVerify.jsp">
			<table>
				<tr>    
					<td>Login Name</td><td><input type="text" name="login_name"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="login">
		</form>

		<form method="post" action="loginForm.jsp">
		  <input type="radio" name="command" value="register"/>Don't have an account yet? Register now!
		    <!-- when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters -->
		  <input type="submit" value="submit" />
		</form>
	</body>
</html>