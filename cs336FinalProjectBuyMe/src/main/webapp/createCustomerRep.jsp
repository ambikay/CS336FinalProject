<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer Representative Account</title>
</head>
<body>
	<h1>Create Customer Representative Account</h1>
	<form action="checkRepDetails.jsp" method="POST">
      		Representative Full Name: <input type="text" name="name"/> <p> <br/>
      		
   	   	Representative Email: <input type="text" name="email"/> <p> <br/> 	
		Username: <input type="text" name="username"/> <p> <br/>
		Password: <input type="password" name="password"/> <br/>
      	<p>	<input type="submit" value="Create Account">
     	</form>
</body>
</html>