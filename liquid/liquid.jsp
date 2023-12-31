<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>保養液/護理液專區</title>
    <link rel="stylesheet" href="ha.css">
  </head>
  <body>
    <header>
      <h1>保養液/護理液專區</h1>
    </header>
	    <main>
  <%
  		try {
            Class.forName("com.mysql.jdbc.Driver");	  
			String url="jdbc:mysql://localhost/opticshop";
			Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	        if(con.isClosed()){
                out.println("連線建立失敗");
			}
			
            else{	 
				String sql = "SELECT * FROM `liquid`";
				PreparedStatement pstmt = null;
				pstmt=con.prepareStatement(sql);
				
				ResultSet dataset = pstmt.executeQuery();
				while(dataset.next()){
  %>
      <section class="card">
        <a href="goodspage.jsp?idLiquid=<%= dataset.getString("idLiquid") %>">
        <img src="image/<%=dataset.getString("liquidname")%>.png" height="300px" width="300px">
        <h3><%=dataset.getString("liquidname")%></h3></a>
        <p> </p><br>
        <h4><%="$" + dataset.getString("liquidprice")%></h4>
        <p> </p><br>
        <button class="add-to-cart-btn">加入購物車</button>
      </section>  
	  <%
	  				}
				con.close();
			} 
		}			
		catch (ClassNotFoundException err) {
			out.println("class錯誤"+err.toString());
		}
	  %>
	      <main>
  </body>
</html>
