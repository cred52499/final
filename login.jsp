<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>Member Register</title>
<style>
body {
  background-color: #fff;
  font-family: Arial;  
}

h1 {
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
<h1>Member Login</h1><br>

<form action="checkLogin.jsp" method = "post">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username"> 
  <p style="color:red;"><%if(message != null && !message.isEmpty())
		{out.print(message);
		}
	%> </p><br>
  
  <label for="password">Password:</label>
  <input type="password" id="password" name="password"><br><br>

  <input type="submit" value="Login"> </input>
  <br>
  <a href="/final/register.jsp">New member? Register here!</a>
  <a href="/final/recover.jsp" style="float:right">Forget password.</a>
</form>

</body>
</html>