<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>

<%	
	String productCategory = request.getParameter("productCategory");
	String previousPage = "../"+productCategory+"/"+productCategory+".jsp";
	String productID = request.getParameter("productID");
	String customerID = request.getParameter("customerID");
	String cartID = request.getParameter("cartID");
	//out.println(customerID + "<br>");
	//out.println(productID + "<br>");
	//out.println(cartID + "<br>");
	
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/opticshop";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("連線建立失敗！");
				else{
					String sql1="INSERT IGNORE into `cartdetails` (`cartID`,`productCategory`,`productID`)";//寫入購物車
					sql1+="VALUES('"+cartID+"','"+productCategory+"','"+productID+"')";      
					
					con.createStatement().execute(sql1);
				
					con.close();
					//out.print("已寫入購物車");
				}
			}
				
			catch (SQLException sExec) {
				out.println("MySQL 錯誤！"+sExec.toString()); 
			}
		}
	catch (ClassNotFoundException err) {
		  out.println("class 錯誤！"+err.toString()); 
		}

	response.sendRedirect(previousPage);
%>
