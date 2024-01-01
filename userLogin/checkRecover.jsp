<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
    <head><title>get</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String email=request.getParameter("email");
		String birthday=request.getParameter("birthday");
		String gender=request.getParameter("gender");
			
		try {
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	        if(con.isClosed()){
                out.println("連線建立失敗");
			}
			
            else{
				if(username == null || username.equals("")){
					response.sendRedirect("recover.jsp?&message=Incorrect credentials.");
				}				
				else if(email == null || email.equals("")){
					response.sendRedirect("recover.jsp?&message=Incorrect credentials.");
				}
				else if(birthday == null || birthday.equals("")){
					response.sendRedirect("recover.jsp?&message=Incorrect credentials.");
				}
				else if(gender == null || gender.equals("")){
					response.sendRedirect("recover.jsp?&message=Incorrect credentials.");
				}
				else{
					String sql = "SELECT * FROM `member` WHERE `username`=? AND `email`=? AND `birthday`=? AND `gender`=?";
					PreparedStatement pstmt = null;
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,username);
					pstmt.setString(2,email);
					pstmt.setString(3,birthday);
					pstmt.setString(4,gender);
				
					ResultSet dataset = pstmt.executeQuery();
					if(dataset.next()){ 
						Cookie usernameCookie = new Cookie("username",username);
						usernameCookie.setMaxAge(-1);
						response.addCookie(usernameCookie);
						//session.setAttribute("username",request.getParameter("username"));
						con.close();//結束資料庫連結
						response.sendRedirect("changePassword.jsp") ;
					}
					
					else{
						con.close();//結束資料庫連結
						response.sendRedirect("recover.jsp?&message=Incorrect credentials.");
						
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
