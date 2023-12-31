<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>個人網頁排版</title>
    <link rel="stylesheet" href="styles.css?v=1">
  </head>


  <body>
    <header>
      <h1>保養液/護理液專區</h1>
    </header>
    <nav>
      <ul>
        <li><a href="#"><h3>產品目錄</h3></a>
          <ul>
            <li><a href="brand_zone/brand_design/brand.html"><h4>品牌</h4></a></li>
            <li><a href="color/layout_demo.html"><h4>彩色隱形眼鏡</h4></a></li>
            <li><a href="transparent/test.html"><h4>透明隱形眼鏡</h4></a></li>
            <li><a href="maintenance/haha.html"><h4>保養液</h4></a></li>
          </ul>
        </li>
        <li><a href="aboutuss/aboutus.html"><h3>關於我們</h3></a>
        </li>
        <li><a href="place_design/place.html"><h3>門市據點</h3></a></li>
        <li><form class="search-form">
            <input type="text" class="search-input" placeholder="Search...">
            <button type="submit" class="search-button">Search</button>
        </form>
        </a></li>
        <li><a href="shpcart/shpcart copy.html"><h3>購物車</h3></a></li>
        <li><a href="login/login.html"><h3>登入</h3></a></li>
        <li><a href="member/member.html"><h3>會員</h3></a></li>
		</ul>
    </nav>
	
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
      <footer>
        <table>
          <tr>
            <td>
              <a href="">關於品牌</a>
            </td>
            <td>
              <a href="">客服中心</a>
            </td>
            <td>
              <a href="">聯絡方式</a>
            </td>
          </tr>
        </table>
      </footer>
  </body>
</html>