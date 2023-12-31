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
<h1>Forget password?</h1><br>

<form action="checkRecover.jsp" method = "post">
  <label for="username">What is your username?:</label>
  <input type="text" id="username" name="username"><br><br>

  <label for="email">What is your E-mail?:</label>
  <input type="text" id="email" name="email"><br><br>

  <label for="birthday">When is your birthday?:</label>
  <input type="date" id="birthday" name="birthday"><br><br>
  
    <label for="gender">Gender:</label>
  <select id="gender" name="gender">
	<option value="" selected disabled hidden>Select one</option>
    <option value="male">Male</option>
    <option value="female">Female</option>
  </select><br><br>

  <input type="submit" value="Submit"> </input>
  <br>
	<p style="color:red;">
		<%if(message != null && !message.isEmpty()){
			out.print(message);
			}
		%>
	</p>
</form>

</body>
</html>