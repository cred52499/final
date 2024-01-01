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
String username=request.getParameter("username");
String name=request.getParameter("name");
String email=request.getParameter("email");
String birthday=request.getParameter("birthday");
String gender=request.getParameter("gender");
String lnearsighted=request.getParameter("lnearsighted");
String rnearsighted=request.getParameter("rnearsighted");

String messageUsername=request.getParameter("messageUsername");
String messagePassword=request.getParameter("messagePassword");
String messageEmail=request.getParameter("messageEmail");
String messageName=request.getParameter("messageName");
boolean isDup = false;
if(request.getParameter("duplicated") != null){
	if(request.getParameter("duplicated").equals("true")){
		isDup = Boolean.parseBoolean(request.getParameter("duplicated"));
	}
}
%>
<h1>Member Register</h1><br>

<form action="checkRegister.jsp" method = "post">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" value="<%if(username != null)out.print(username);%>"> 
  <p style="color:red;"><%if(messageUsername != null && !messageUsername.isEmpty())
		{out.print(messageUsername);
		}
		else if(isDup){
			out.print(messageUsername);
		}
	%> </p><br>
  
  <label for="password">Password:</label>
  <input type="password" id="password" name="password">
  <p style="color:red;"><%if(messagePassword != null && !messagePassword.isEmpty()){
			out.print(messagePassword);
		} 
	%> </p><br>
	
	<label for="name">Real name:</label>
	<input type="text" id="name" name="name" value="<%if(name != null)out.print(name);%>"> 
	<p style="color:red;"><%if(messageName != null && !messageName.isEmpty()){
		out.print(messageName);
		}
	%> </p><br>

  <label for="email">E-mail:</label>
  <input type="text" id="email" name="email" value="<%if(email != null)out.print(email);%>">
  <p style="color:red;"><%if(messageEmail != null && !messageEmail.isEmpty()){
		out.print(messageEmail);
		}
	%> </p><br>

  <label for="birthday">Birthday:</label>
  <input type="date" id="birthday" name="birthday" value="<%=birthday%>" ><br><br>

  <label for="gender">Gender:</label>
  <select id="gender" name="gender">
	<option value="" selected disabled hidden>Select one</option>
    <option value="male" <% if("male".equals(gender)) { %> selected <% } %> >Male</option>
    <option value="female" <% if("female".equals(gender)) { %> selected <% } %> >Female</option>
  </select><br><br>
  
  <div style="display: flex; justify-content: center;">

  <div style="margin-right: 10px; width: calc(50% - 5px);">
    <label for="left_nearsighted">Left Eye Nearsighted:</label>
    <input type="number" id="lnearsighted" name="lnearsighted" value="0.0"<%if(lnearsighted != null)out.print(lnearsighted);%>">
  </div>

  <div style="width: calc(50% - 5px);">  
    <label for="right_nearsighted">Right Eye Nearsighted:</label>
    <input type="number" id="rnearsighted" name="rnearsighted" value="0.0"<%if(rnearsighted != null)out.print(rnearsighted);%>">
  </div>

</div>

<br><br>

  <input type="submit" value="Submit">
  <br>
  <a href="login.jsp">Already a member? Sign in here!</a>
  
</form>

</body>
</html>