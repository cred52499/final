<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>final project</title>

    <script>
        window.onload = function() {
        openDialog();
    };

    </script>
 	
 
</head>
<div id="overlay">
    <div id="dialog">
        <h2>請問您是否同意cookie條款</h2>
        <label for="agreeCheckbox">
        <input type="checkbox" id="agreeCheckbox" onchange="closeDialog()"> 我同意</label>
    </div>
  </div>
<div>
<body>

        <header>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </header>
        <nav>
            <div class="florig">
                <ul>
                    <li><a href="#">產品目錄</h5></a>
                    <ul>
                        <li><a href="brand_zone/brand_design/brand.html">品牌</a></li>
                        <li><a href="coloredLens/coloredLens.jsp">彩色隱形眼鏡</a></li>
                        <li><a href="transparentLens/transparentLens.jsp">透明隱形眼鏡</a></li>
                        <li><a href="liquid/liquid.jsp">保養液</a></li>
                    </ul>
                    </li>
                    <li><a href="aboutUs/aboutus.html">關於我們</a>
                    </li>
                    <li><a href="location/location.html">門市據點</a></li>
                    <li><form class="search-form">
                        <input type="text" class="search-input" placeholder="Search....">
                        <button type="submit" class="search-button">Search</button>
                        </form>
                    </li>
                    <li><a href="shpcart/shpcart copy.html">購物車</a></li>
					<%
					Cookie[] cookies = request.getCookies();
					String memberUsername = "";
					if(cookies != null){
						int count = cookies.length;
						for(int i=0; i < count; i++){
							if(cookies[i].getName().equals("memberUsername")){
								memberUsername = cookies[i].getValue();
							}
						}
						if(memberUsername == null || memberUsername.equals("")){%>
                    <li><a href="userLogin/login.jsp">登入</a></li>
					<%
						}
					else
					%>
					<li><a href=""><%=memberUsername%></a></li>
					<%}%>

                    <li><a href="member/member.html">會員</a></li>
                    <li><a href="">登入者您好</a></li>
                </ul>
            </div>
        </nav>

        <div class="clear"></div>
        <main class="container01">
            <div class="ad">
                <div class="slideshow-container">
                    <div class="singleSlide fade">
                        <img src="img/ad01.jpeg" style="width: 100%;">
                        
                    </div>
                    <div class="singleSlide fade">
                        <img src="img/ad02.jpeg"
                        style="width: 100%">
                        
                    </div>
                    <div class="singleSlide fade">
                        <img src="img/ad03.jpeg" style="width: 100%">
                        
                    </div>
                    <div class="singleSlide fade">
                         <img src="img/ad04.jpeg" style="width: 100%">
                        
                    </div>
                    <div class="singleSlide fade">
                        <img src="img/ad05.jpeg" style="width: 100%">
                        
                    </div>
                    <button class="prev" onclick="plusSlides(-1)">(</button>
                    <button class="next" onclick="plusSlides(1)">)</button>
                    </button>
                    <script>
                        plusSlides(slideIndex);
                    </script>
                </div>
                <script src="index.js"></script>
            </div>
            <div class="m02">
                <div class="gragh">
                    <a href=""><img src="img/ad01.jpeg" style="width: 250px;height: 250px;"></a>
                    <a href=""><img src="img/ad01.jpeg" style="width: 250px;height: 250px;"></a>
                    <a href=""><img src="img/ad01.jpeg" style="width: 250px;height: 250px;"></a>
                </div>
            </div>
            <div class="m03">
                <div class="graph">
                <a href="introduction/vippage.html"><img src="img/會員權益介紹.png" style="width: 300px;height: 300px;"></a>
                <a href="introduction/teach.html"><img src="img/下單教學.png" style="width: 300px;height: 300px;"></a>
                <a href="https://www.youtube.com/watch?v=K2XzOz_e9qI"><img src="img/衛教保健.png" style="width: 300px;height: 300px;"></a>
                </div>
            </div>
            <div class="m04">
            
            </div>
            <div class="act">
                <div class="gragh">
                    <a href="promotion/act01/act01.html"><img src="promotion/act01/image/act01.jpg" style="width: 350px;height: 250px;"></a>
                    <a href="promotion/act02/act02.html"><img src="promotion/act02/image/act02.jpg" style="width: 350px;height: 250px;"></a>
                    <a href="promotion/act03/act03.html"><img src="promotion/act03/image/act03.jpg" style="width: 350px;height: 250px;"></a>
            </div> 
            </div>
        </main>
        <footer>
            <div class="left">
            <h3>聯絡資訊</h3>
            <p>好累阿這個作業真累</p>
            <p>關於品牌</p>
            <p>客服中心</p>
            <p>聯絡方式</p>
            <p>訪客人數</p>
            </div>
            <div class="contantimg">
            <a href="https://instagram.com/chouiiin?igshid=MzMyNGUyNmU2YQ%3D%3D&utm_source=qr" target="_blank">
                <img class="contant" src="img/ig.png" >
            </a>

            <a href="https://line.me/ti/p/chj7qksWo3" target="_blank">
                <img class="contant" src="img/line.png" >
            </a>

            <a href="mailto:tyes40415@gmail.com" target="_blank">
                <img class="contant" src="img/mail.png" >
            </a>
            </div>
        </footer>
    </div>
</body>
</html>