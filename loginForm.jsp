<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a New Account</title>
</head>
<body>
<h2> Create a New Account !</h2>
	<br>
		<form method="get" action="createAccount.jsp">
			<table>
				<tr>    
					<td>Login Name</td><td><input type="text" name="login_name"></td>
				</tr>
				<tr>
					<td>Email</td><td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
				
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
</body>
</html>