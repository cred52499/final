<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="aboutus.css?time=<%=System.currentTimeMillis()%>">
    <title>關於我們</title>
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
    <div>
        <header>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </header>
        <nav>
            <div class="florig">
                <ul class="menu">
                    <li><a href="#">產品目錄</a>
                    <ul id="sb">
                        <li><a href="../coloredLens/coloredLens.jsp">彩色隱形眼鏡</a></li>
                        <li><a href="../transparentLens/transparentLens.jsp">透明隱形眼鏡</a></li>
                        <li><a href="../liquid/liquid.jsp">保養液</a></li>
                    </ul>
                    </li>
                    <li><a>關於我們</a>
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
            
            
           
            <main class="gridd">
    
    
                <div class="lens">
    
                    <img class="abimg" src="img/cyimcompany.png" width="400px" height="400px">
                    <h2>
                        <div class="links">
                        位於交通便捷的中原大學，<br>
                        是由資訊管理學系二年級的學生小本經營。<br>
                        穎新眼鏡致力幫助所有有視力困擾的帥哥、<br>
                        水水們能夠找到適合自己的隱形眼鏡，<br>
                        為此，穎新眼鏡提供豐富的選擇，<br>
                        搭配不定時活動，<br>
                        讓所有穎新眼鏡的會員好友們<br>
                        用最優惠的價格擁守護美麗的靈魂之窗。<br>
    
                    </div>
                    </h2>
                </div>
    
    
                <div class="cyim01" id="cyim001">
                    <hr color="white" size="15px">
                    <h1>前端</h1>
    
                <div class="outcard" ><!--要改的-->
                          
                    <div class="card-container">
                            <div class="card">
                                <div class="front">
                                <img src="img/one01.jpeg" width="300px" height="300px" style="border-radius: 15px;">
                                </div>
    
                                <div class="back">
                                    <!-- back -->
                                    <h3>11144121 資管二甲 周佩穎</h3>
                                    <h4>
                                        雖然這次做期末專案做電商網站有期中個人網站的經驗加持，
                                        但是因為是不同的類型，還是遇到了不少困難，
                                        幸運的是在解決問題的同時學習到很多寶貴的經驗，
                                        不論是軟實力還是硬實力，也發覺自己不足的部分，
                                        希望未來能夠慢慢加強程式與排版加快自己寫網頁的速度！
                                    </h4>
                                </div>
                            </div>
                    </div>     
    
                    <div class="card-container">
                            <div class="card">
                                <div class="front">
                                <img src="img/one02.jpg" width="300px" height="300px" style="border-radius: 15px;">  
                                </div>
    
                                <div class="back">
                                    <!-- back -->
                                    <h3>11144133 資管二甲 彭新祐</h3>
                                    <h4>
                                        這學期是我第一次寫關於網站的程式，
                                        HTML和CSS的程式和以往的程式邏輯都不相同，
                                        對我來說有一種全新的感覺。
                                        而在製作專案的過程中，
                                        大家也都是第一次參與到這樣的製作，
                                        對於前後端可能不太了解因此產生了一些問題，
                                        但這些都成為了我寶貴的經驗，
                                        期盼還有更多這樣的機會能夠歷練自己。
                                    </h4>
                                </div>
                            </div>
                    </div>     
    
                    <div class="card-container">
                        <div class="card">
                            <div class="front">
                            <img src="img/one03.jpg" width="300px" height="300px" style="border-radius: 15px;">
                        </div>
    
                        <div class="back">
                        <!--back-->
                        <h3>11144122 資管二甲 林吟珊</h3>
                        <h4>
                            在製作期末專題中，我們不僅需要將所學加以應用，
                            更是要透過額外的學習、與後端同學合作才能完成，
                            是一項困難的挑戰。在過程中，我也收穫了不少，
                            無論是技術方面，或是團隊合作部分，
                            都有了與以往不同的難得經驗，相信在完成專題後，
                            我能有所成長和進步！
    
                        </h4>
                        </div>
                    </div>
                  
                             
                        
                </div><!--outcard div-->
                 
                </div><!--cyim01 div-->
                
                <div class="cyim02" id="cyim002">
                    <h1>後端</h1>
                    
                    <div class="outcard02" ><!--要改的-->
                          
                        <div class="card-container">
                                <div class="card">
                                    <div class="front">
                                    <img src="img/tw01.jpg" width="300px" height="300px" style="border-radius: 15px;">
                                    </div>
            
                                    <div class="back">
                                        <!-- back -->
                                        <h3>11144238 資管二乙 王敏權</h3>
                                        <h4>此次期末專題，給予了我很多自我學習、
                                        團隊合作的機會。 除了要細心設計運作邏輯外，
                                        還要同時確保資料的安全， 學習透過網路資源、
                                        AI協作，最後很開心能順利完成專題！</h4>
                                    </div>
                                </div>
                        </div>     
            
                        <div class="card-container">
                                <div class="card">
                                      <div class="front">
                                      <img src="img/tw02.jpg" width="300px" height="300px" style="border-radius: 15px;">  
                                      </div>
            
                                      <div class="back">
                                          <!-- back -->
                                          <h3>11144231 資管二乙 高嘉駿</h3>
                                          <h4>這次的期末專題，讓我對於網頁的分工合作有了
                                          更多的體驗，也體悟到自己在於後端團隊中適合的定位。
                                          專案中有許多要注意的地方，除了程式本身之外，
                                          也需要考量到每個人不同的想法與專長，學習透過溝通
                                          技巧進行有效交流是我未來需要再精進的部分之一，很高興
                                          有這次的專題可以讓自己找到仍然不足的問題，也希望自己能夠有所成長。</h4>
                                      </div>
                                </div>
                        </div>     
            
                        <div class="card-container">
                                <div class="card">
                                    <div class="front">
                                    <img src="img/tw03.jpg" width="300px" height="300px" style="border-radius: 15px;">
                                </div>
            
                                <div class="back">
                                  <!--back-->
                                  <h3>11144202 資管二乙 楊禮澤</h3>
                                  <h4>這次的網路程式專題，是就讀資管以來第一次
                                  有較完整的程式專題實作，也是第一次有前後端分工的合作。 
                                  相較之前較為片段化的學習及程式撰寫，
                                  首次的專案練習剛開始非常難以適應，對於規劃上有很多的不確定，
                                  希望經過這次經驗可以讓自己有所進步成長，
                                  未來能夠更從容面對各種需要合作的程式專題或工作。</h4>
                                </div>
                                </div>
                        </div>  
    
                        <div class="card-container">
                            <div class="card">
                                <div class="front">
                                <img src="img/tw04.jpg" width="300px" height="300px" style="border-radius: 15px;">
                                </div>
        
                                <div class="back">
                                    <!-- back -->
                                    <h3>11144272 資管二乙 劉曦鴻</h3>
                                    <h4>這次的期末專題對我來說是一次全新的挑戰，
                                        也是我覺得整個課程中最有實際意義的內容。 
                                        由於全部人都是第一次實作，在合作上有一定的難度，
                                        其中也遇到了一些其他的問題。不過這次的經歷也算是非常不錯的經驗，
                                        希望未來也有更多類似的專題，這樣我才能從中學習和進步。</h4>
                                </div>
                            </div>
                    </div>    
                                  
                                
                        </div><!--outcard div-->
              
                </div>
                    
            
    
                
            </main>
            <footer>
                <h3>聯絡資訊</h3>
            </footer>
        
    </body>
    </html>