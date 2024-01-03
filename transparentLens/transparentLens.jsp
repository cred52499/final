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
    <link rel="stylesheet" href="styles.css?time=<%=System.currentTimeMillis()%>">
  </head>

  <body>
    <header>
      <ul>
		<li><a href=".."><h3>首頁</h3></a>
        <li><a href="#"><h3>產品目錄</h3></a>
          <ul>
            <li><a href="../coloredLens/coloredLens.jsp"><h4>彩色隱形眼鏡</h4></a></li>
            <li><a href="../transparentLens/transparentLens.jsp"><h4>透明隱形眼鏡</h4></a></li>
            <li><a href="../liquid/liquid.jsp"><h4>保養液</h4></a></li>
          </ul>
        </li>
        <li><a href="../aboutUs/aboutus.html"><h3>關於我們</h3></a>
        </li>
        <li><form class="search-form">
            <input type="text" class="search-input" placeholder="Search...">
            <button type="submit" class="search-button">Search</button>
        </form>
        </a></li>
		<li><a href="../location/location.html"><h3>門市據點</h3></a></li>
        <li><a href="shpcart/shpcart copy.html"><h3>購物車</h3></a></li>
        <%
		Cookie[] cookies = request.getCookies();
		String memberName = "";
		if(cookies != null){
			int count = cookies.length;
			for(int i=0; i < count; i++){
				if(cookies[i].getName().equals("memberName")){
					memberName = cookies[i].getValue();
				}
			}
		}
		if(memberName == null || memberName.equals("")){%>
		<li><a href="../userLogin/login.jsp?&redirectUrl=../transparentLens/transparentLens.jsp"><h3>登入</h3></a></li>
		<%
			}
		else{
		%>
		<li><a><h3>你好，<%=memberName%></h3></a></li>
		<li><a href="member/member.html"><h3>會員</h3></a></li>
		<li><a href="../userLogin/logout.jsp"><h3>登出</h3></a></li>
		<%
		}
		%>
		</ul>
		
		
		
	</header>
	
	<nav>
     <h1>透明隱形眼鏡專區</h1>
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
				String sql = "SELECT * FROM `transparentlens`";
				PreparedStatement pstmt = null;
				pstmt=con.prepareStatement(sql);
				
				ResultSet dataset = pstmt.executeQuery();
				while(dataset.next()){
		%>
		<section class="card">
			<a href="goodspage.jsp?transparentLensID=<%= dataset.getString("transparentLensID")%>">
			<img src="image/<%=dataset.getString("transparentLensID")%>.png?time=<%=System.currentTimeMillis()%>" height="300px" width="300px">
			<h3><%=dataset.getString("transparentLensnAME")%></h3></a>
			<p> </p><br>
			<h4><%="$" + dataset.getString("transparentLensPrice")%></h4>
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
  </body>
</html>
