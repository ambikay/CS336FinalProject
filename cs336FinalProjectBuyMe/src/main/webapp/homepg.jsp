<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to BuyMe</title>

</head>
<body>
<h2> Welcome to BuyMe! We have the largest selection of Cars,Trucks and Motorbikes.</h2>
<h4> Select an account type and login:</h4>
	<a href="adminLogin.jsp">Admin</a><br>
	<a href="Userlogin.jsp">User</a><br>
	<a href="customerreplogin.jsp">Customer Representative</a>
	<p><p>
	<form method="post" action="loginForm.jsp">
		  <input type="radio" name="command" value="register"/>Don't have an account yet? Register now!
		    <!-- when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters -->
		  <input type="submit" value="submit" />
		</form>
</body>
</html>