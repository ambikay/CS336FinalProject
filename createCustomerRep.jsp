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
	<form action="createCustomerRepVerify.jsp" method="POST">
      		
   	   	Admin Id:<input type="text" name="admin_id"/> <p> <br/> 	
   	   	Customer Representative Id:<input type="text" name="rep_id"/> <p> <br/> 	
   	   	Representative Email: <input type="text" name="rep_email"/> <p> <br/> 	
		Username: <input type="text" name="rep_username"/> <p> <br/>
		Password: <input type="password" name="rep_password"/> <br/>
      	<p>	<input type="submit" value="Create Account">
     	</form>
</body>
</html>