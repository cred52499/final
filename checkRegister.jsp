<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<html>
    <head><title>Success!</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		double lnearsighted = Double.parseDouble(request.getParameter("lnearsighted"));
		double rnearsighted = Double.parseDouble(request.getParameter("rnearsighted"));
		
		try { 
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234");   				
			if(con.isClosed()){
				out.println("連線建立失敗");
			}
			else{
				if(username == null || username.equals("")){
					response.sendRedirect("/final/register.jsp?email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageUsername=" + "Please enter a username.");
									return;
				}
				if(password == null || password.equals("")){
					response.sendRedirect("/final/register.jsp?username=" + username + "&email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messagePassword=" + "Please enter your password.");
									return;
				}
				if(email == null || email.equals("")){
					response.sendRedirect("/final/register.jsp?username=" + username + "&lnearsighted="
									+ lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageEmail=" + "Please enter an email address.");
									return;
				}
				String sql = "INSERT INTO `member` (`username`, `password`, `email`, `birthday`, `gender`, `lnearsighted`, `rnearsighted`) " +
							 "VALUES ('"+username+"', '"+password+"', '"+email+"', '"+birthday+"', '"+gender+"', '"+lnearsighted+"', '"+rnearsighted+"')";
				int no=con.createStatement().executeUpdate(sql); 
				if (no>0){
					out.println("新增成功，點擊<a href = '/final/login.jsp'>這裏</a>回到登入界面");
				}
				con.close();
            }
		}      
		catch (SQLException sExec) {
			response.sendRedirect("/final/register.jsp?email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted 
									+ "&messageUsername=" + "The username has been used, please choose other username." + "&duplicated=true");
		}     
    %>

    </body>
</html>


    </body>
</html>
