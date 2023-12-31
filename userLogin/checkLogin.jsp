<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
    <head><title>Login Success!</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
			
		try {
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	        if(con.isClosed()){
                out.println("連線建立失敗");
			}
			
            else{	 
				if(username == null || username.equals("")){
					response.sendRedirect("/final/login.jsp?&message=Please enter your username.");
				}
				else if(password == null || password.equals("")){
					response.sendRedirect("/final/login.jsp?&message=Please enter your password.");
				}
				else{
					String sql = "SELECT * FROM `member` WHERE `username`=? AND `password`=?";
					PreparedStatement pstmt = null;
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,username);
					pstmt.setString(2,password);
				
					ResultSet dataset = pstmt.executeQuery();
					if(dataset.next()){
						Cookie usernameCookie = new Cookie("username",username);
						usernameCookie.setMaxAge(-1);
						response.addCookie(usernameCookie);
						//session.setAttribute("username",request.getParameter("username"));
						con.close();//結束資料庫連結
						response.sendRedirect("/final/user.jsp") ;
					}
					
					else{
						con.close();//結束資料庫連結
						response.sendRedirect("/final/login.jsp?&message=Username or password incorrect, please try again.");
						
					}
				}
			}
		}        
	catch (ClassNotFoundException err) {
          out.println("class錯誤"+err.toString());
	}

    %>

    </body>
</html>
