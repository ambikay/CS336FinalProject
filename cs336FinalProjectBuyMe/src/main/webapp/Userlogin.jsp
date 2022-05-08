<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Page</title>

</head>
<body>
<h2>User Login</h2>
	
		<form method="get" action="UserLoginVerify.jsp">
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

</body>
