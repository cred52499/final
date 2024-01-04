<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>Logout Successful</title>
<style>
</style>
</head>
<body>
<%
Cookie cookies[] = request.getCookies();
int count = cookies.length;

for(int i=0; i < count; i++){
	if(cookies[i].getName().equals("memberName")){
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");
		cookies[i].setValue("");
		response.addCookie(cookies[i]);
	}
	if(cookies[i].getName().equals("memberUsername")){
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");
		cookies[i].setValue("");
		response.addCookie(cookies[i]);
	}
	if(cookies[i].getName().equals("memberID")){
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");
		cookies[i].setValue("");
		response.addCookie(cookies[i]);
	}
	if(cookies[i].getName().equals("cartID")){
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");
		cookies[i].setValue("");
		response.addCookie(cookies[i]);
	}
}

response.sendRedirect("..");
%>
</form>

</body>
</html>