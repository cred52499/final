<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
	<div class="a01">
		<div class="modal-content">
			<form id="back" action="cart.jsp" method="POST"><input type="submit" value="上一步" form="back"></form>
			<form method="post" action="">
				<h2>結帳清單</h2>
				<div id="selectedItemsContainer">
		<%
		try { 
			String cartID = request.getParameter("cartID");
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
					try {
						String cartDetailsID = dataset.getString("cartDetailsID");
						String sql2 = "UPDATE cartdetails SET `quantity` = ? WHERE `cartID` = ? AND `cartDetailsID` = ?;";
						//out.println("Result: " + productCategory + productID);
						PreparedStatement pstmt2 = con.prepareStatement(sql2);
						int quantity = Integer.valueOf(request.getParameter(cartDetailsID));
						pstmt2.setInt(1, quantity);
						pstmt2.setString(2, cartID);
						pstmt2.setString(3, cartDetailsID);
						pstmt2.executeUpdate();
						String sql3 = "SELECT `productPrice`, `productName` FROM `"+dataset.getString(3)+"` WHERE productID = '"+dataset.getString(4)+"';";
						ResultSet rs = con.createStatement().executeQuery(sql3);
						while(rs.next()){
							total += quantity * rs.getInt(1);
							String productName = rs.getString(2);
							out.print("<h4>"+productName+"<br>金額: $"+rs.getInt(1)+"<br>數量: "+quantity+"</h4>");
						}
					} catch (SQLException sExec2) {
						out.println("something wrong2" + sExec2.toString());
					} 
				}			
						%>
					</div>
					<label for="paymentMethod">付款方式:</label>
					<select name="paymentMethod">
						<option value="cash" name="cash">現金付款</option>
					</select><br>
					<label for="shippingMethod">運送方式:</label>
					<select name="shippingMethod">
						<option value="home" name="home">宅配到家</option>
					</select><br>
					<label for="shippingAddr">運送地址:</label>
					<input type="text" name="address" required><br>
					<label for="contact">連絡電話:</label>
					<input type="text" name="phone" required>
					<div id="total-amount">總金額: $<%=total%></div>
					<input type="submit" class="button" value="送出訂單">
				</div> 
			</form>
			<%
			}
		} catch (SQLException sExec) {
			out.println("something wrong");
		} 
	%>	
	</form>
	</div>
	
</body>
</html>