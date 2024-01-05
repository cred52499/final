<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>會員權益</title>
    <link rel="stylesheet" href="vippage.css">

  </head>
<%
    String memberName = "";
    Cookie[] cookies = request.getCookies();
	if(cookies != null){
		int count = cookies.length;
		for(int i=0; i < count; i++)
			if(cookies[i].getName().equals("memberName"))
				memberName = cookies[i].getValue();
	}
   %>

  <body>
    <header>
      <ul>
        <li><a href=".."><h3>首頁</h3></a>
			<li><a href="#"><h3>產品目錄</h3></h5></a>
			<ul>
				<li><a href="../coloredLens/coloredLens.jsp"><h3>彩色隱形眼鏡</h3></a></li>
				<li><a href="../transparentLens/transparentLens.jsp"><h3>透明隱形眼鏡</h3></a></li>
				<li><a href="../liquid/liquid.jsp"><h3>保養液</h3></a></li>
			</ul>
			</li>
			<li><a href="../aboutUs/aboutus.jsp"><h3>關於我們</h3></a>
			</li>
			<li><a href="../cart/cart.jsp"><h3>購物車</h3></a></li>
			<%
			if(memberName == null || memberName.equals("")){%>
			<li><a href="userLogin/login.jsp"><h3>登入</h3></a></li>
			<%
			}else{
			%>
			<li><a href=""><h3>你好<%=memberName%></h3></a></li>
			<li><a href="../member/member.jsp"><h3>會員</h3></a></li>
			<li><a href="../userLogin/logout.jsp"><h3>登出</h3></a></li>
			<%
			}
			%>
    </header>
    <nav><h1>會員權益介紹</h1></nav>



    <main>
      <section>
        <img src="image/vip1.png" width="700px" height="500px">
    </section>
    <section>
        <img src="image/vip2.png" width="700px" height="500px">
    </section>
    <section>
        
        <img src="image/vip3.png" width="700px" height="500px">
    </section>
    <section>
      
        <img src="image/vip4.png" width="700px" height="500px">
    </section>

       
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
            <td>
              <a href="https://instagram.com/chouiiin?igshid=MzMyNGUyNmU2YQ%3D%3D&utm_source=qr" target="_blank">
                  <img class="contant" src="../img/ig.png" >
              </a>
            </td>
            <td>
              <a href="https://line.me/ti/p/chj7qksWo3" target="_blank">
                  <img class="contant" src="../img/line.png" >
              </a>
            </td>
            <td>
              <a href="mailto:tyes40415@gmail.com" target="_blank">
                  <img class="contant" src="../img/mail.png" >
          </tr>
        </table>
      </footer>
      