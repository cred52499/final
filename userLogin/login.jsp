<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder"%>

<html>
<head>
<title>會員登入</title>
<script>

</script>
<link rel="stylesheet" href="login.css">
<style>
body {
  font-family: Arial;  
}


form {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
   
  
}

</style>
</head>
<body>
<%
String message=request.getParameter("message");
String redirectUrl = request.getParameter("redirectUrl");
if(redirectUrl == null || redirectUrl.equals("")){
	redirectUrl = "..";
}

String encodedUrl = URLEncoder.encode(redirectUrl, "UTF-8");
%>


<form action="checkLogin.jsp?&redirectUrl=<%=encodedUrl%>" method = "post">
   <h1>會員登入</h1><br> 
  <label for="username">帳號:</label>
  <input type="text" id="username" name="username" placeholder="請輸入帳號" onfocus="this.placeholder=''" onblur="" placeholder='請輸入帳號'"> 
  <p style="color:red;"><%
    if(message != null && !message.isEmpty()){
      out.print(message);
		}
	%> </p><br>
  
  <label for="password">密碼:</label>
  <input type="password" id="password" name="password" placeholder="請輸入密碼" onfocus="this.placeholder=''" onblur="" placeholder='請輸入密碼'"><br><br>

  <input type="submit" value="登入"></input>
  <br>
  <a href="register.jsp" style="color:#8751fb ;">尚未成為會員?點這裡註冊!</a>
  <a href="recover.jsp" style="float:right ;color:#8751fb">忘記密碼</a>
</form>

</body>
</html>