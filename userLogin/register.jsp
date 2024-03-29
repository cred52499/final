<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>會員註冊</title>
<style>
body {
  font-family: Arial;
  background-image: url("../img/login_background.png");
  background-size: cover;
  background-attachment: fixed;
}

h1 {
  text-align: center;
  margin: 0 auto; 
  color: #8751fb;
  font-size: 80px;
}


form {
  max-width: 500px;
  margin: 0 auto;
  padding: 20px;  
  border: 2px solid #9d70fe;
  border-radius: 15px;
  background-color: #d6c7f7;
}


label, .a01, select {
  display: block;
  width: 100%;  
  padding: 10px;
  box-sizing: border-box; 
  border-radius: 15px;
  font-size: 20px;
  color: #8751fb;
}

input[type="submit"] {
  background-color: #9d70fe;
  color: rgb(255, 255, 255);
  border: none;
  border-radius: 15px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #c7adff;
}

.a02 {
  text-align: center;
  font-size: 20px;  
  color: #8751fb;
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
String messageName=request.getParameter("messageName");
String messageEmail=request.getParameter("messageEmail");
boolean isDup = false;
if(request.getParameter("duplicated") != null){
	if(request.getParameter("duplicated").equals("true")){
		isDup = Boolean.parseBoolean(request.getParameter("duplicated"));
	}
}
%>


<form action="checkRegister.jsp" method = "post">
  <h1>會員註冊</h1><br>
  <label for="username">帳號:</label>
  <input class="a01" type="text" id="username" name="username" value="<%if(username != null)out.print(username);%>" placeholder="請輸入帳號" onfocus="this.placeholder=''" onblur="this.placeholder='請輸入帳號'" > 
  <p style="color:red;"><%if(messageUsername != null && !messageUsername.isEmpty())
		{out.print(messageUsername);
		}
		else if(isDup){
			out.print(messageUsername);
		}
	%> </p><br>
  
  <label for="password">密碼:</label>
  <input class="a01" type="password" id="password" name="password" placeholder="請輸入密碼" onfocus="this.placeholder=''" onblur="this.placeholder='請輸入密碼'" >
  <p style="color:red;"><%if(messagePassword != null && !messagePassword.isEmpty())
		{out.print(messagePassword);
		} 
	%> </p><br>
	
	<label for="name">姓名:</label>
	<input class="a01" type="text" id="name" name="name" value="<%if(name != null)out.print(name);%>" placeholder="輸入您的姓名" onfocus="this.placeholder=''" onblur="this.placeholder='輸入您的姓名'">
	<p style="color:red;"><%if(messageName != null && !messageName.isEmpty())
		{out.print(messageName);
		}
	%> </p><br>

  <label for="email">E-mail:</label>
  <input class="a01" type="text" id="email" name="email" value="<%if(email != null)out.print(email);%>" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" placeholder="輸入電子郵件" onfocus="this.placeholder=''" onblur="this.placeholder='輸入電子郵件'">
  <p style="color:red;"><%if(messageEmail != null && !messageEmail.isEmpty())
		{out.print(messageEmail);
		}
	%> </p><br>

  <label for="birthday">生日:</label>
  <input class="a01" type="date" id="birthday" name="birthday" required value="<%=birthday%>" ><br><br>

  <label for="gender">性別:</label>
  <select id="gender" name="gender">
	<option value="" selected disabled hidden>擇一</option>
    <option value="male" <% if("male".equals(gender)) { %> selected <% } %> >男</option>
    <option value="female" <% if("female".equals(gender)) { %> selected <% } %> >女</option>
  </select><br><br>
  
  <div style="display: flex; justify-content: center;">

  <div style="margin-right: 10px; width: calc(50% - 5px);">
    <label for="left_nearsighted">左眼視力:</label>
    <input class="a01" type="number" id="lnearsighted" name="lnearsighted" value="<%if(lnearsighted != null)out.print(lnearsighted);%>">
  </div>

  <div style="width: calc(50% - 5px);">  
    <label for="right_nearsighted">右眼視力:</label>
    <input class="a01" type="number" id="rnearsighted" name="rnearsighted" value="<%if(rnearsighted != null)out.print(rnearsighted);%>">
  </div>
  
</div>
<br/>
<div class="a02">
  <p>是否同意網站收集個人資料</p><br/> <!--增加一個收集是否收集個人資料的選項-->
  <input type="radio" name="privacy" value="agree" class="radio">同意
  <input type="radio" name="privacy" value="disagree" class="radio">不同意
</div>
<br><br>

  <input class="a01" type="submit" value="註冊">
  <br>
  <a href="login.jsp" style="color:#8751fb ;">已經成為會員?點這裡登入!</a>
  
</form>

</body>
</html>