<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品頁</title>
	<link rel="stylesheet" href="goodspage.css?time=<%=System.currentTimeMillis()%>">
</head>

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
			Cookie[] cookies = request.getCookies();
			String memberName = "";
      		String memberID = "";
			if(cookies != null){
				int count = cookies.length;
				for(int i=0; i < count; i++){
					if(cookies[i].getName().equals("memberName")){
						memberName = cookies[i].getValue();
					} else if(cookies[i].getName().equals("memberID")){
						memberID = cookies[i].getValue();
					}
				}
			}
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
			
		</ul>
    </header>
    <%
	String productID = request.getParameter("productID");
			
	try {
        Class.forName("com.mysql.jdbc.Driver");	  
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	    if(con.isClosed()){
          out.println("連線建立失敗");
		      return;
		  } 
			String sql = "SELECT * FROM `liquid` WHERE `productID`=?";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,productID);
				
			ResultSet dataset = pstmt.executeQuery();
			dataset.next();
	%>

	<main>
	<section>
	<table class="infor">
		<tr>
		<td></td>
		<td>
			<img class="pp" src="image/<%=dataset.getString("productID")%>.png?time=<%=System.currentTimeMillis()%>" width="350px" height="350px">
		</td>
		<td>
			<ul class="other">
			<li><h2><%=dataset.getString("productName")%></h2><br> 
				<h4><br>規格說明:<br>  
				<br>全成分:<%=dataset.getString("liquidContents")%><br>  
				<br>產品特點:<%=dataset.getString("liquidFeatures")%><br>  
				<br>適應症:<%=dataset.getString("liquidIndications")%><br>  
				<br>注意事項:<%=dataset.getString("liquidNotes")%><br></h4></li>		
			</ul>
		</td>
		</tr>
	</table>
	</section>
		<section>
			<div class="fedback">
                <form id="feedback" action="../admin/comment.jsp" method="POST">
					<h3>留言板</h3><br>
					<h4>請對商品評分</h4><br>
					<span class="star" data-rating="1">&#9733;</span>
					<span class="star" data-rating="2">&#9733;</span>
					<span class="star" data-rating="3">&#9733;</span>
					<span class="star" data-rating="4">&#9733;</span>
					<span class="star" data-rating="5">&#9733;</span><br>
					<h3>   </h3><br>
					<h4>請給予我們您的寶貴意見:</h4><br>
					<textarea name="comment" cols="60" rows="6" form="feedback"></textarea><br>
					<h3>    </h3><br>
					<input type="hidden" name="type" value="liquid">
					<input type="hidden" name="href" value="liquid/goodspage.jsp?productID=<%=productID%>">
					<input type="hidden" name="memberID" value="<%=memberID%>">
					<input type="hidden" name="productID" value="<%=productID%>">
					<input type="hidden" name="rate" id="rate">
					<%
						if(memberName == null || memberName.equals("")){
							out.print("</form><form method=\"POST\" action=\"../userLogin/login.jsp\"> <input type=\"submit\" value=\"請先登入\"> </form>");
						} else {
							out.print("<input type=\"submit\" value=\"送出\"></form>");
						}
					%>
            </div>
        </section>
		<section>
            <div class="comments1">
                <h3>顧客回饋</h3><br>
                <div class="comments">
					<%
						sql = "SELECT * FROM `comment` WHERE `category` = 'liquid' AND `productID` = '"+productID+"' ORDER BY commentID DESC";
						ResultSet rs =con.createStatement().executeQuery(sql);
						int amt = 1;
						while(rs.next()){
							out.print("<div class=\"comment\" id=\"comment"+amt+"\">");
							String memberNameQuery = "SELECT `memberUsername` FROM member WHERE memberID = '"+rs.getString(4)+"';";
							ResultSet rs1 =con.createStatement().executeQuery(memberNameQuery);
							rs1.next();
							out.print("<h4>"+rs1.getString(1)+"</h4>");
							int star = rs.getInt(5);
							for(int i =0;i<star;i++)
								out.print("<span class=\"star active\">&#9733;</span>");
							for(int j=0;j<5-star;j++)
								out.print("<span class=\"star\">&#9733;</span>");
							out.print("<br><p>"+rs.getString(6)+"</p></div>");
							amt++;
						}
					} catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
					}
					%>
                </div>
                <div class="scrollbar" id="scrollbar">

                </div>
            </div>
		</section>
	</main>
       
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
<script>
        const stars = Array.from(document.querySelectorAll('.star')).filter(star => star.getAttribute('data-rating') != null);
		const ratingValue = document.getElementById('rating-value');

		let rating = 0;
		
		stars.forEach(star => {
			star.addEventListener('click', () => {
				rating = parseInt(star.getAttribute('data-rating'));
				document.getElementById("rate").value = rating;
				updateRating();
			});

			star.addEventListener('mouseover', () => {
				resetStarsColor();
				highlightStars(parseInt(star.getAttribute('data-rating')));
			});

			star.addEventListener('mouseout', () => {
				resetStarsColor();
				highlightStars(rating);
			});
		});

		function highlightStars(count) {
			for (let i = 0; i < count; i++) {
				stars[i].classList.add('active');
			}
		}

		function resetStarsColor() {
			for (let i = 0; i < 5; i++) {
				stars[i].classList.remove('active');
			}
		}

		// 選取留言區塊和拉條
		const comments = document.querySelector('.comments');
		const scrollbar = document.getElementById('scrollbar');

		// 更新拉條高度
		function updateScrollbar() {
			const totalHeight = comments.scrollHeight;
			const visibleHeight = comments.clientHeight;
			const scrollHeight = totalHeight - visibleHeight;
			const percentage = (comments.scrollTop / scrollHeight) * 100;
			scrollbar.style.height = `${percentage}%`;
		}

		// 監聽滾動事件
		comments.addEventListener('scroll', updateScrollbar);

	</script>
	</body>
</html>