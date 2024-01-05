<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<html>
    <head><title>Success!</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		out.print(birthday);
		String gender = request.getParameter("gender");
		String strlnearsighted = request.getParameter("lnearsighted");
		String strrnearsighted = request.getParameter("lnearsighted");
		double lnearsighted, rnearsighted;
		if(strlnearsighted != null && !strlnearsighted.equals("")){
			lnearsighted = Double.parseDouble(strlnearsighted);
		}
		else{
			lnearsighted = 0d;
		}
		if(strrnearsighted != null && !strrnearsighted.equals("")){
			rnearsighted = Double.parseDouble(strrnearsighted);
		}
		else{
			rnearsighted = 0d;
		}
		
		try { 
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234");   				
			if(con.isClosed()){
				out.println("連線建立失敗");
			}
			else{
				if(username == null || username.equals("")){
					response.sendRedirect("register.jsp?name=" + name + "&email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageUsername=" + "Please enter a username.");
									return;
				}
				if(password == null || password.equals("")){
					response.sendRedirect("register.jsp?username=" + username + "&name=" + name + "&email=" + email + "&birthday=" 
									+ birthday + "&gender=" + gender + "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messagePassword=" + "Please enter your password.");
									return;
				}
				if(name == null || name.equals("")){
					response.sendRedirect("register.jsp?username=" + username + "&email=" + email + "&birthday=" + birthday + "&gender=" 
									+ gender + "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageName=" + "Please enter your real name.");
									return;
				}
				if(email == null || email.equals("")){
					response.sendRedirect("register.jsp?username=" + username + "&name=" + name + "&email=" + email + "&birthday=" + birthday
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageEmail=" + "Please enter an email address.");
									return;
				}
				
				String sql = "INSERT INTO `member` (`memberUsername`, `memberName`, `memberPassword`, `memberEmail`, `memberBirthday`, `memberGender`, `memberLeftNearsighted`, `memberRightNearsighted`) " +
							 "VALUES ('"+username+"', '"+name+"', '"+password+"', '"+email+"', '"+birthday+"', '"+gender+"', '"+lnearsighted+"', '"+rnearsighted+"')";
				int no=con.createStatement().executeUpdate(sql); 
				if (no>0)
					out.println("<script>alert('註冊成功!');location.href='login.jsp'</script>");
				con.close();
            }
		}      
		catch (SQLException sExec) {
			response.sendRedirect("register.jsp?email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageUsername=" + "The username has been used, please choose other username." + "&duplicated=true");
		}     
    %>

    </body>
</html>


    </body>
</html>
