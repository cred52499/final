<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder"%>
<%@ page import = "java.nio.charset.StandardCharsets" %>

<html>
    <head><title>Login Success!</title></head>
    <body>
    <%
		String memberUsername = request.getParameter("memberUsername");
		String memberPassword = request.getParameter("memberPassword");
		
		String redirectUrl = request.getParameter("redirectUrl");
			
		try {
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	        if(con.isClosed()){
                out.println("連線建立失敗");
			}
			
            else{	 
				if(memberUsername == null || memberUsername.equals("")){
					response.sendRedirect("login.jsp?&message=Please enter your username.");
				}
				else if(memberPassword == null || memberPassword.equals("")){
					response.sendRedirect("login.jsp?&message=Please enter your password.");
				}
				else{
					String sql = "SELECT * FROM `member` WHERE `memberUsername`=? AND `memberPassword`=?";
					PreparedStatement pstmt = null;
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,memberUsername);
					pstmt.setString(2,memberPassword);
				
					ResultSet dataset = pstmt.executeQuery();
					if(dataset.next()){
						Cookie usernameCookie = new Cookie("memberUsername",memberUsername);
						Cookie nameCookie = new Cookie("memberName",dataset.getString("memberName"));
						usernameCookie.setMaxAge(-1);
						usernameCookie.setPath("/");
						nameCookie.setMaxAge(-1);
						nameCookie.setPath("/");
						response.addCookie(usernameCookie);
						response.addCookie(nameCookie);
						con.close();//結束資料庫連結
						response.sendRedirect(redirectUrl);
					}
					
					else{
						con.close();//結束資料庫連結
						response.sendRedirect("/final/userLogin/login.jsp?&message=Username or password incorrect, please try again.");
						
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
