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

<h1>Member Register</h1><br>

<form action="getReg.jsp" method = "post">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username"><br><br>
  
  <label for="password">Password:</label>
  <input type="password" id="password" name="password"><br><br>

  <label for="email">E-mail:</label>
  <input type="text" id="email" name="email"><br><br>

  <label for="birthday">Birthday:</label>
  <input type="text" id="birthday" name="birthday"><br><br>

  <label for="gender">Gender:</label>
  <select id="gender" name="gender">
    <option value="male">Male</option>
    <option value="female">Female</option>
  </select><br><br>
  
  <label for="nearsighted">Nearsighted:</label>
  <input type="text" id="nearsighted" name="nearsighted"><br><br>

  <input type="submit" value="Submit">
</form>

</body>
</html>