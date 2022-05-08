
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>rep delete Page</title>

</head>
<body>
<h2>Delete Customer Representative Account</h2>
	
		<form method="get" action="deleteRepVerify.jsp">
			<table>
				<tr>    
					<td>Login Name</td><td><input type="text" name="rep_username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="rep_password"></td>
				</tr>
			</table>
			<input type="submit" value="Delete Account">
		</form>

</body>

