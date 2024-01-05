<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="styles.css?time=<%=System.currentTimeMillis()%>">
    <script src="cart.js?time=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<div class="a01">
	<form action="checkOut.jsp" method = "post">
	<%
		Cookie[] cookies = request.getCookies();
		String cartID = "";
		String productName = "";
		String productStock = "";
		String productPrice = "";
		int totalItem = 0;
		
		if(cookies != null){
			int count = cookies.length;
			for(int i=0; i < count; i++){
				if(cookies[i].getName().equals("cartID")){
					cartID = cookies[i].getValue();
					out.print("<input type=\"hidden\" name=\"cartID\" value=\""+cartID+"\">");
				}
			}
		}
	
	try { 
        Class.forName("com.mysql.jdbc.Driver");	  
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234");   				
		if(con.isClosed()){
			out.println("連線建立失敗");
		} else {
			String sql = "SELECT * FROM `cartdetails` WHERE `cartID`=?";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,cartID);
			ResultSet dataset = pstmt.executeQuery();	
			while(dataset.next()){
				try {
					String cartDetailsID = dataset.getString(1);
					String productCategory = dataset.getString("productCategory");
					String productID = dataset.getString("productID");
					String sql2 = "SELECT * FROM `"+productCategory+"` WHERE `productID`=?";
					//out.println("Result: " + productCategory + productID);
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1, productID);
					ResultSet dataset2 = pstmt2.executeQuery();
					
					if(dataset2.next()){
						//out.println("Result: " + dataset2.getString("productName") + "<br>" + dataset2.getString("productID") + "<br>");
						productName = dataset2.getString("productName");
						productID = dataset2.getString("productID");
						productStock = dataset2.getString("productStock");
						productPrice = dataset2.getString("productPrice");
					}
						
	%>
        <div class="a02" id="item">
            <img src="../<%=productCategory%>/image/<%=productID%>.png" alt="" width="250px" height="250px">
            <div class="title"><h1><%%></h1></div>               <!-- 商品名稱 -->
            <div> 
				<%
				if(!productCategory.equals("liquid")){
					out.print("<h4>度數:"+"</h4>");
				}
				%>
                <h4>庫存數量: <%=productStock%></h4>
                <h4>價格: <span class="price1">$<%=productPrice%></span></h4>
                <label>數量:</label><input type="text" name="<%=cartDetailsID%>" value="1">
            </div>
        </div>
    
	<%				
				}
				catch (SQLException sExec) {
					out.println("something wrong2" + sExec.toString());
				} 
			}						
		}
	}
	catch (SQLException sExec) {
		out.println("something wrong");
	} 
	%>	
		<input type ="submit" value = "結賬">
	</form>
	</div>
	
</body>
</html>