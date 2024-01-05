<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
String paymentMethod = request.getParameter("paymentMethod");
String shippingMethod = request.getParameter("shippingMethod");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
long millis=System.currentTimeMillis(); 
Date date = new Date(millis);

out.print(paymentMethod + shippingMethod + address + phone + date + "<br>");

/*
不要重新送一樣的order
*/

try { 
	String cartID = request.getParameter("cartID");
	String memberID = "";
	int subtotal = 0;
	Class.forName("com.mysql.jdbc.Driver");	  
	String url="jdbc:mysql://localhost/opticshop";
	Connection con=DriverManager.getConnection(url,"root","1234");   				
	if(con.isClosed()){
		out.println("連線建立失敗");
	} else {
		int total = 0;
		String sql = "SELECT * FROM `cartdetails` WHERE `cartID` = ?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,cartID);
		ResultSet dataset = pstmt.executeQuery();	
		
		while(dataset.next()){
			out.print("cartdetailsid:" + dataset.getString(1) + "<br>");
			String sql2 = "SELECT * FROM `cart` WHERE `cartID` = ?;";
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1,cartID);
			ResultSet dataset2 = pstmt2.executeQuery();
			out.print("pass <br>");
			if(dataset2.next()){
				memberID = dataset2.getString(2);
			}
			
			String sql3 = "SELECT `productPrice`, `productName` FROM `"+dataset.getString(3)+"` WHERE productID = '"+dataset.getString(4)+"';";
			ResultSet dataset3 = con.createStatement().executeQuery(sql3);
			out.print("pass <br>");
			if(dataset3.next()){
				subtotal = dataset3.getInt(1);
			}
			
			out.print(dataset.getString(4) + dataset.getInt(5) + dataset.getString(3));
			String sql4 = "UPDATE `" + dataset.getString(3) + "` SET `productStock` = `productStock`-" + dataset.getInt(5) + " WHERE productID = " + dataset.getString(4) + ";";
			con.createStatement().executeUpdate(sql4);
			out.print("pass <br>");
			
			String sql5 = "INSERT INTO `order` (`orderDate`, `productID`, `productCategory`, `orderQty`, `memberID`, `memberAddress`, `memberPhoneNum`, `status`, `subtotal`, `cartID`) " +
						"VALUES ('" + date + "', '" + dataset.getString(4) + "', '" + dataset.getString(3) + "', '" + dataset.getString(5) + "', '"
						+ memberID + "', '" + address + "', '" + phone + "', '" + "0" + "', '" + (subtotal*dataset.getInt(5)) + "', '" + cartID + "')";
			con.createStatement().executeUpdate(sql5);
			out.print("pass <br>");
			
			String sql6 = "DELETE FROM cartdetails WHERE cartDetailsID=?;";
			PreparedStatement pstmt6 = con.prepareStatement(sql6);
			out.print(dataset.getString(1) + "<br>");
			pstmt6.setString(1,dataset.getString(1));
			pstmt6.executeUpdate();
			out.print("pass <br>");
		}
	}
	con.close();	
	response.sendRedirect("../member/member.jsp");
} catch (SQLException sExec2) {
	out.println("something wrong2" + sExec2.toString());
}














%>