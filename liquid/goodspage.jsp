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
	<link rel="stylesheet" href="goodspage.css">
</head>

<body>
    <header>
		<ul>
			<li><a href="#"><h3>產品目錄</h3></h5></a>
			<ul>
				<li><a href="../brand_zone/brand_design/brand.html"><h3>品牌</h3></a></li>
				<li><a href="../coloredLens/coloredLens.jsp"><h3>彩色隱形眼鏡</h3></a></li>
				<li><a href="../transparentLens/transparentLens.jsp"><h3>透明隱形眼鏡</h3></a></li>
				<li><a href="../liquid/liquid.jsp"><h3>保養液</h3></a></li>
			</ul>
			</li>
			<li><a href="aboutUs/aboutus.html"><h3>關於我們</h3></a>
			</li>
			<li><a href="location/location.html"><h3>門市據點</h3></a></li>
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
			<li><a href="userLogin/login.jsp"><h3>登入</h3></a></li>
			<%
				}
			else{
			%>
			<li><a href=""><h3>你好<%=memberName%></h3></a></li>
			<li><a href="member/member.html"><h3>會員</h3></a></li>
			<li><a href="userLogin/logout.jsp"><h3>登出</h3></a></li>
			<%
			}
			%>
			
		</ul>
    </header>
    <nav>
    </nav>
	
    <%
	String liquidID = request.getParameter("liquidID");
			
	try {
        Class.forName("com.mysql.jdbc.Driver");	  
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234"); 
			
	    if(con.isClosed()){
            out.println("連線建立失敗");
		}
			
        else{	 
			String sql = "SELECT * FROM `liquid` WHERE `liquidID`=?";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,liquidID);
				
			ResultSet dataset = pstmt.executeQuery();
			dataset.next();
			
	%>
	<main>
	<section>
	<table class="infor">
		<tr>
		<td>
			<img class="pp" src="image/<%=dataset.getString("liquidID")%>.png?time=<%=System.currentTimeMillis()%>" width="350px" height="400px">
		</td>
			<td>
			<ul class = "other">
			<li><h3>商品名稱: <%=dataset.getString("liquidname")%><br> 
				<br> 規格說明:<br>  
				<br>全成分:<%=dataset.getString("liquidContents")%><br>  
				<br>產品特點:<%=dataset.getString("liquidFeatures")%><br>  
				<br>適應症:<%=dataset.getString("liquidIndications")%><br>  
				<br>注意事項:<%=dataset.getString("liquidNotes")%><br></h3></li>			
	<%}
		}
       
	catch (ClassNotFoundException err) {
          out.println("class錯誤"+err.toString());
	}

    %>
			</ul>
		</td>
		</tr>

	</table>
		<section>
			<div class="fedback">
                <form id="feedback"></form>
                <h3>留言板</h3><br>
                <h3>請輸入姓名:</h3><input type="text"><br>
                <h3>   </h3><br>
                <h3>請對商品評分</h3>
                
                <span class="star" data-rating="1">&#9733;</span>
                <span class="star" data-rating="2">&#9733;</span>
                <span class="star" data-rating="3">&#9733;</span>
                <span class="star" data-rating="4">&#9733;</span>
                <span class="star" data-rating="5">&#9733;</span><br>
                <h3>   </h3><br>
                <h3>請給予我們您的寶貴意見:</h3><textarea name="" id="" cols="60" rows="6"></textarea><br>
                <h3>    </h3><br>
                <button class="send">送出</button>
                </form>
            </div>
        </section>
            <div class="comments1">
                <h3>顧客回饋</h3><br>
                <div class="comments">
					<div class="comment" id="comment1">
                    <h4>林0珊</h4><span class="star" data-rating="1">&#9733;</span>
                    <span class="star" data-rating="2">&#9733;</span>
                    <span class="star" data-rating="3">&#9733;</span>
                    <span class="star" data-rating="4">&#9733;</span>
                    <span class="star" data-rating="5">&#9733;</span><br>
                    <p>使用此商品保持眼部濕潤，讓我可以長時間配戴隱形眼鏡，而不感到乾澀。</p>
					</div>
                 <div class="comment" id="comment2">
                    <h4>周0穎</h4><span class="star" data-rating="1">&#9733;</span>
                    <span class="star" data-rating="2">&#9733;</span>
                    <span class="star" data-rating="3">&#9733;</span>
                    <span class="star" data-rating="4">&#9733;</span>
                    <span class="star" data-rating="5">&#9733;</span><br>
                    <p>真不錯</p> 
                </div>
                <div class="comment" id="comment3">
                    <h4>彭0祐</h4><span class="star" data-rating="1">&#9733;</span>
                    <span class="star" data-rating="2">&#9733;</span>
                    <span class="star" data-rating="3">&#9733;</span>
                    <span class="star" data-rating="4">&#9733;</span>
                    <span class="star" data-rating="5">&#9733;</span><br>
                    <p>太贊了</p>
                </div>
                <div class="comment" id="comment3">
                    <h4>周0穎</h4><span class="star" data-rating="1">&#9733;</span>
                    <span class="star" data-rating="2">&#9733;</span>
                    <span class="star" data-rating="3">&#9733;</span>
                    <span class="star" data-rating="4">&#9733;</span>
                    <span class="star" data-rating="5">&#9733;</span><br>
                    <p>真是太棒了，讓我可以長時間戴著而不感到乾澀。</p>
                </div>
                </div>
                <div class="scrollbar" id="scrollbar">

                </div>
            </div>
		</section>
		<h3> </h3>
		<h3> </h3>
		<h3>  </h3>
       
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
    <script>
        const stars = document.querySelectorAll('.star');
const ratingValue = document.getElementById('rating-value');

let rating = 0;

stars.forEach(star => {
 star.addEventListener('click', () => {
   rating = parseInt(star.getAttribute('data-rating'));
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
 stars.forEach(star => {
   star.classList.remove('active');
 });
}

function updateRating() {
 ratingValue.innerHTML = `你的評分是：${rating}顆星`;
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