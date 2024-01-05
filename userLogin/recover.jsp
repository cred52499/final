<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>忘記密碼</title>
<link rel="stylesheet" href="login.css">
<style>
body {
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
 
}

input {
  display: block;
  width: 100%;  
  padding: 10px;
  box-sizing: border-box; 
} 

</style>
</head>
<body>
<%
String message=request.getParameter("message");
%>


<form action="checkRecover.jsp" method = "post">
  <h1>忘記密碼?</h1><br>
  <label for="username">請問您的帳號?</label>
  <input type="text" id="username" name="username" placeholder="輸入帳號" onfocus="this.placeholder=''" onblur="this.placeholder='輸入帳號'"><br><br>

  <label for="email">請問您的電子郵件?</label>
  <input type="text" id="email" name="email" placeholder="輸入電子郵件" onfocus="this.placeholder=''" onblur="this.placeholder='輸入電子郵件'"><br><br>

  <label for="birthday">請問您的生日?</label>
  <input type="date" id="birthday" name="birthday"><br><br>
  
    <label for="gender">性別:</label>
  <select id="gender" name="gender">
	<option value="" selected disabled hidden>擇一</option>
    <option value="male">男</option>
    <option value="female">女</option>
  </select><br><br>

  <input type="submit" value="送出"> </input>
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