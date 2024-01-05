<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>下單教學</title>
    <link rel="stylesheet" href="teach.css">
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
        <li><a href="../aboutUs/aboutus.jsp"><h3>關於我們</h3></a></li>
        <li><a href="../cart/cart.jsp"><h3>購物車</h3></a></li>
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
		<li><a href="../userLogin/login.jsp?&redirectUrl=../introduction/teach.jsp"><h3>登入</h3></a></li>
		<%
		} else {
		%>
		<li><a><h3>你好，<%=memberName%></h3></a></li>
		<li><a href="../member/member.jsp"><h3>會員</h3></a></li>
		<li><a href="../userLogin/logout.jsp"><h3>登出</h3></a></li>
		<%
		}
		%>
		</ul>
	</header>
    <nav><h1>下單流程教學</h1></nav>



    <main>
      <section>
        <h2>step1:選取欲選購商品</h2>
        <img src="image/buy1.png" alt="">
    </section>
    <section>
        <h2>step2:選取運送物流</h2>
        <img src="image/buy2.png" alt="">
    </section>
    <section>
        <h2>step3:選擇付款方式</h2>
        <img src="image/buy3.png" alt="">
    </section>
    <section>
        <h2>step4:填寫訂購人資訊</h2>
        <img src="image/buy4.png" alt="">
    </section>
    <section>
        <h2>step5:點擊確認訂購即可成功下單</h2>
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
      