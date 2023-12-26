<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
    <head><title>Success!</title></head>
    <body>
    <%	
		Cookie cookies[] = request.getCookies();
		int count = cookies.length;
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String username = "";
		
		for(int i=0; i<count; i++){
			if(cookies[i].getName().equals("username")){
				username = cookies[i].getValue();
			}
		}
			
		try {
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	        if(con.isClosed()){
                out.println("連線建立失敗");
			}
			
            else{	 
				if(password == null && password.equals("")){
					response.sendRedirect("/final/changePassword.jsp?&message=Please type in the same password.");
				}
				else if(password2 == null && password2.equals("")){
					response.sendRedirect("/final/changePassword.jsp?&message=Please type in the same password.");
				}
				else if(!password.equals(password2)){
					response.sendRedirect("/final/changePassword.jsp?&message=Please type in the same password.");
				}
				else{
					String sql = "UPDATE member SET password=? WHERE username=?";
					PreparedStatement pstmt = null;
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,password);
					pstmt.setString(2,username);
				
					pstmt.executeUpdate();
					con.close();//結束資料庫連結
					out.print("Password changed successfully. Click <a href = '/final/user.jsp'>here</a> to proceed to main page");
					}
				}
			}        
		catch (ClassNotFoundException err) {
			out.println("class錯誤"+err.toString());
		}

    %>

    </body>
</html>
