<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.Random"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css?time=<%=System.currentTimeMillis()%>">
    <title>final project</title>
    <script>
        window.onload = function() {
        <%
                if(request.getParameter("cookie")!=null)
                    session.setAttribute("remember", true);
                Object remember = session.getAttribute("remember");
                if (remember == null) 
                    out.print("openDialog();");
            %>
    };

    </script>
</head>
<div id="overlay">
    <div id="dialog">
        <h2>請問您是否同意cookie條款</h2>
        <label for="agreeCheckbox">
        <form id="form" method="POST" action="index.jsp">
            <input type="hidden" name="cookie" value="true">
            <input type="checkbox" id="agreeCheckbox" onchange="closeDialog()">我同意</label>
        </form>
    </div>
  </div>
<div>
<body>

<%	
	String sessionID = "";
	sessionID = request.getSession().getId();
	long millis=System.currentTimeMillis(); 
	Date date = new Date(millis);
	String memberName = "";
	String cartID = "";
	String memberID = "";
	String customerID = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		int count = cookies.length;
		for(int i=0; i < count; i++){
			if(cookies[i].getName().equals("memberID")){
				memberID = cookies[i].getValue();
				out.print("get cookie memberID: " + memberID);
			}
		}
	}

	
	//out.print(sessionID);
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/opticshop";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("連線建立失敗！");
				else{
					if(memberID == null || memberID.equals("")){
						customerID = sessionID;//注意，這邊應該是讀session存的ID
					}
					else{
						customerID = memberID;
					}
					
					try{
						String sql1="INSERT IGNORE into `cart` (`customerID`,`dateCreated`)";//寫入購物車
						sql1+="VALUES('"+customerID+"','"+date+"')";      
					
						con.createStatement().executeUpdate(sql1);
						out.print("已寫入購物車");
					}
					catch (SQLException sExec) {
						out.println("1111 錯誤！"+sExec.toString()); 
					}
					out.println(customerID); 
					String sql2 = "SELECT * FROM `cart` WHERE `customerID`=?";
					PreparedStatement pstmt = null;
					pstmt=con.prepareStatement(sql2);
					pstmt.setString(1,customerID);
					ResultSet dataset = pstmt.executeQuery();
					if(dataset.next()){
					cartID = dataset.getString("cartID");
					Cookie cartCookie = new Cookie("cartID",cartID);
					cartCookie.setMaxAge(-1);
					response.addCookie(cartCookie);
					}
					con.close();
				}
			}
				
			catch (SQLException sExec) {
				out.println("2222 錯誤！"+sExec.toString()); 
			}
		}
	catch (ClassNotFoundException err) {
		  out.println("class 錯誤！"+err.toString()); 
		}
%>
        <header>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </header>
        <nav>
            <div class="florig">
                <ul>
                    <li><a href="#">產品目錄</h5></a>
                    <ul>
                        <li><a href="coloredLens/coloredLens.jsp">彩色隱形眼鏡</a></li>
                        <li><a href="transparentLens/transparentLens.jsp">透明隱形眼鏡</a></li>
                        <li><a href="liquid/liquid.jsp">保養液</a></li>
                    </ul>
                    </li>
                    <li><a href="aboutUs/aboutus.html">關於我們</a>
                    </li>
                    <li><a href="location/location.html">門市據點</a></li>
                    <li><a href="cart/cart.jsp">購物車</a></li>
					<%
					if(cookies != null){
						int count = cookies.length;
						for(int i=0; i < count; i++){
							if(cookies[i].getName().equals("memberName")){
								memberName = cookies[i].getValue();
							}
						}
					}
					if(memberName == null || memberName.equals("")){%>
                    <li><a href="userLogin/login.jsp">登入</a></li>
					<%
						}
					else{
					%>
					<li><a href="">你好<%=memberName%></a></li>
					<li><a href="member/member.jsp">會員</a></li>
					<li><a href="userLogin/logout.jsp">登出</a></li>
					<%
					}
					%>
					
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
                <script src="index.js?time=<%=System.currentTimeMillis()%>"></script>
            </div>
            <div class="m02">
                <div class="gragh">
                    <div class="card-container">
                        <a href="introduction/vippage.html"><img src="img/會員權益1.png" style="width: 300px;height: 300px;"></a>
                        <a href="introduction/teach.html"><img src="img/下單教學(1).png" style="width: 300px;height: 300px;"></a>
                        <a href="https://www.youtube.com/watch?v=K2XzOz_e9qI&t=31s"><img src="img/衛教保健1.png" style="width: 300px;height: 300px;"></a>
                    </div>
                </div>
            </div>
                    <%
                        Random random = new Random();
                        String url="jdbc:mysql://localhost/opticshop";
                        Connection con=DriverManager.getConnection(url,"root","1234");
                        if(con.isClosed())
                            out.println("連線建立失敗！");
                        else {
                            try{
                                String sql="SELECT COUNT(*) FROM campaign;";
                                ResultSet rs = con.createStatement().executeQuery(sql);
                                rs.next();
                                int count = rs.getInt(1);
                                int num = random.nextInt(1,count+1);
                                sql="SELECT * FROM campaign WHERE id = '" + num +"';";
                                rs = con.createStatement().executeQuery(sql);
                                rs.next();
                                %>
                                    <div class="m03">
                                <%
                                out.print("<div class=\"marquee\"><ul><li>"+rs.getString(4)+"</li></ul></div>");
                                %>
                                        <div class="graph01">
                                <%  
                                out.print("<a href=\""+rs.getString(2)+"\"><img src=\""+rs.getString(3)+"\" style=\"width: 650px;height: 450px;\"></a>");
                            } catch (SQLException sExec) {
                                out.println("1111 錯誤！"+sExec.toString()); 
                            }
                            con.close();
                        }
                    %>
                </div>
            </div>
            
            <div class="act">
                <div class="gragh">
                    <div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1270.2788791790574!2d121.24351152577623!3d24.957450344334042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346822143c046009%3A0x63e3ef21e3beebac!2z6LOH6KiK566h55CG5a2457O7!5e0!3m2!1szh-TW!2stw!4v1704098187362!5m2!1szh-TW!2stw" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                    <div class="shpname">
                        <section>
                          <div class="outside">
                              <img src="image/route.jpg" class="imgposition" />
                              <img src="image/web.jpg" class="imgposition" />  
                            <h2>中原資管店</h2>
                            <p>營業時間11:00~20:00<br>
                              中原大學資管樓</p>  
                          </div>
                        </section>
                        <hr color="black">  
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
			<%
			try {
					Class.forName("com.mysql.jdbc.Driver");
				try {
					url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					con = DriverManager.getConnection(url, "root", "1234");
					if (con.isClosed()) {
						out.println("連線建立失敗");
					} else {
						con.createStatement().execute("use `opticshop`");
						String sql = "SELECT * FROM visitorcounter ";
						ResultSet resultSet = con.createStatement().executeQuery(sql);
						
						if (resultSet.next()) {
							String countString = resultSet.getString(1);
							Integer count = Integer.parseInt(countString);
							if (session.isNew()){
								count++;
								countString = String.valueOf(count);
								sql = "UPDATE visitorcounter SET visitorNum = " + countString;
								con.createStatement().execute(sql);
							}
							out.print("訪客人數:"+count);
						}
						con.close();
					}
				} catch (SQLException e) {
					out.println("SQL錯誤: " + e.toString());
				}
				} catch (ClassNotFoundException err) {
					out.println("Class錯誤: " + err.toString());
				}

			%>
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