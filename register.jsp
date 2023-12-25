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
String email=request.getParameter("email");
String birthday=request.getParameter("birthday");
String gender=request.getParameter("gender");
String nearsighted=request.getParameter("nearsighted");
String message=request.getParameter("message");
%>
<h1>Member Register</h1><br>

<form action="getReg.jsp" method = "post">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username"> 
  <p style="color:red;"><%if(message != null && !message.isEmpty())
		{out.print(message);
		}
	%> </p><br>
  
  <label for="password">Password:</label>
  <input type="password" id="password" name="password"><br><br>

  <label for="email">E-mail:</label>
  <input type="text" id="email" name="email" value="<%if(email != null)out.print(email);%>" ><br><br>

  <label for="birthday">Birthday:</label>
  <input type="date" id="birthday" name="birthday" value="<%=birthday%>" ><br><br>

  <label for="gender">Gender:</label>
  <select id="gender" name="gender">
	<option value="" selected disabled hidden>Select one</option>
    <option value="male" <% if("male".equals(gender)) { %> selected <% } %> >Male</option>
    <option value="female" <% if("female".equals(gender)) { %> selected <% } %> >Female</option>
  </select><br><br>
  
  <label for="nearsighted">Nearsighted:</label>
  <input type="text" id="nearsighted" name="nearsighted" value="<%if(nearsighted != null)out.print(nearsighted);%>"><br><br>

  <input type="submit" value="Submit">
  <br>
  <a href="/final/login.jsp">Already a member? Sign in here!</a>
  
</form>

</body>
</html>