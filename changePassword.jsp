<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>Login Successful</title>
<style>
body {
  background-color: #fff;
  font-family: Arial;  
}

h1 {
  text-align: center;
  margin: 0 auto;  
}

h2 {
  text-align: center;
  margin: 0 auto;  
}

form {
  max-width: 500px;
  margin: 0 auto;
  padding: 20px;  
  border: 1px solid #ddd;
}

label, input, select {
  display: block;
  width: 100%;  
  padding: 10px;
  box-sizing: border-box; 
} 

input[type="submit"] {
  background-color: #ffff00;
  color: #333;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #ffdb4d;
}
</style>
</head>
<body>
<%
String message=request.getParameter("message");

%>
<h1>Login Successful</h1><br>
<h2>Please change your password.</h2><br>

<form action="checkChangePassword.jsp" method = "post">
  <label for="password">New password:</label>
  <input type="password" id="password" name="password"> 
  <p style="color:red;"><%if(message != null && !message.isEmpty())
		{out.print(message);
		}
	%> </p><br>
  
  <label for="password2">Please confirm your password:</label>
  <input type="password" id="password2" name="password2"><br><br>

  <input type="submit" value="Submit"> </input>
</form>

</body>
</html>