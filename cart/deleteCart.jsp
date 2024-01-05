<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>

<%	
	String cartdetailsID = request.getParameter("cartdetailsID");

	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/opticshop";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("連線建立失敗！");
				else{
					String sql="DELETE from `cartdetails` WHERE cartdetailsID=" + cartdetailsID; 
					
					con.createStatement().execute(sql);
				
					con.close();
				}
			}
			catch (SQLException sExec) {
				out.println("MySQL 錯誤！"+sExec.toString()); 
			}
		}
	catch (ClassNotFoundException err) {
		  out.println("class 錯誤！"+err.toString()); 
		}
	response.sendRedirect("../cart/cart.jsp");
%>