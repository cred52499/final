<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>您的購物車</title>
    <link rel="stylesheet" href="shpcart.css?time=<%=System.currentTimeMillis()%>">
    <script src="cart.js?time=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<header>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </header>
	<form action="checkOut.jsp" method = "post">
	<%
		Cookie[] cookies = request.getCookies();
		String cartID = "";
		String memberName ="";
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
				} else if (cookies[i].getName().equals("memberName")){
					memberName = cookies[i].getValue();
				}
			}
		}
	%>
	<nav>
        <div class="florig">
            <ul class="menu">
                <li><a href="#">產品目錄</h5></a>
                <ul id="sb">
                    <li><a href="../coloredLens/coloredLens.jsp">彩色隱形眼鏡</a></li>
                    <li><a href="../transparentLens/transparentLens.jsp">透明隱形眼鏡</a></li>
                    <li><a href="../liquid/liquid.jsp">保養液</a></li>
                </ul>
                </li>
                <li><a href="../aboutUs/aboutus.jsp">關於我們</a>
                </li>
                    <%
					    if(memberName == null || memberName.equals("")){%>
                        <li><a href="../userLogin/login.jsp">登入</a></li>
					    <%
					    } else {
                        %>
                        <li><a href="">你好<%=memberName%></a></li>
                        <li><a href="../member/member.jsp"><img src="../img/profile.png" style="height:50px; width:50px;" ></a></li>
                        <li><a href="../userLogin/logout.jsp">登出</a></li>
                        <%
                        }
					    %>
                <li><a href="../cart/cart.jsp"><img src="../img/cart.png" style="height:50px; width:50px;"  ></a></li>
            </ul>
        </div>
    </nav>
	<div class="clear"></div>
    <div class="shpall">
		<div class="a01">
		<%
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
				int id = 1;
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
						
						dataset2.next();
						//out.println("Result: " + dataset2.getString("productName") + "<br>" + dataset2.getString("productID") + "<br>");
						productName = dataset2.getString("productName");
						productID = dataset2.getString("productID");
						productStock = dataset2.getString("productStock");
						productPrice = dataset2.getString("productPrice");
						
					%>
						<div class="a02" id="item<%=id%>">
							<img src="../<%=productCategory%>/image/<%=productID%>.png" alt="" width="250px" height="250px">
							<div class="title"><h3><%=productName%></h3></div>               <!-- 商品名稱 -->
							<div> 
								<%
								if(!productCategory.equals("liquid"))
									out.print("<h4>度數:</h4>");
								%>
								<h4>庫存數量: <%=productStock%></h4>
								<h4>價格: <span class="price<%=id%>">$<%=productPrice%></span></h4>
								<label>數量:</label><input type="number" name="<%=cartDetailsID%>" min="0" max="<%=productStock%>" required value="1">
							</div>
						</div>
					
					<%				
					}
					catch (SQLException sExec) {
						out.println("something wrong2" + sExec.toString());
					} 
					id++;
				}						
			}
		}
		catch (SQLException sExec) {
			out.println("something wrong");
		} 
		%>	
			<br><div class="centered"><button>結帳</button></div>
		</form>
		</div>
	</div>
</body>
</html>