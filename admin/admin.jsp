<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<head>
    <meta charset="UTF-8">
    <title>後台管理</title>
    <link rel="stylesheet" href="admin.css">
    <script src="admin.js"></script>
    <%-- <link rel="stylesheet" href="styles.css"> --%>
</head>

<body>
    <header>
        <h1>後台管理系統</h1>
    </header>
    <main>
        <section class="product-add">
            <section class="card">
            <h2>新增商品</h2>
            <h3>保養液</h3>
            <form action="add_liquid.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱" required>
                <input type="number" name="price" placeholder="商品價格" required><br>
                <input name="content" placeholder="商品內容">
                <input name="features" placeholder="商品特性">
                <input name="indications" placeholder="商品指示">
                <input name="notes" placeholder="商品警示">
                <br>
                <input type="number" name="stock" placeholder="商品庫存" required>
                <button type="submit">新增</button>
            </form>
            </section>
            <section class="card">
            <h3>彩色隱眼</h3>
            <form action="add_coloredlens.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱" required>
                <input type="number" name="price" placeholder="商品價格" required><br>
                <input name="watercontent" placeholder="含水量">
                <input name="basecurve" placeholder="基弧">
                <input name="diameter" placeholder="鏡片直徑">
                <input name="graphicdiameter" placeholder="著色直徑">
                <br>
                <input type="number" name="stock" placeholder="商品庫存" required>
                <button type="submit">新增</button>
            </form>
            </section>
            <section class="card">
            <h3>透明隱眼</h3>
            <form action="add_transparentlens.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱" required>
                <input type="number" name="price" placeholder="商品價格" required><br>
                <input name="watercontent" placeholder="含水量">
                <input name="basecurve" placeholder="基弧">
                <input name="diameter" placeholder="鏡片直徑">
                <input name="graphicdiameter" placeholder="著色直徑">
                <br>
                <input type="number" name="stock" placeholder="商品庫存" required>
                <button type="submit">新增</button>
            </form>
            </section>
        </section>
        <section class="product-management">
            <section class="card">
            <h2>商品管理</h2>
            <h3>保養液</h3>
            <form action="edit_liquid.jsp" method="post">
                <select name="goods">
                    <%
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost/opticshop";
			        Connection con=DriverManager.getConnection(url,"root","1234"); 
                    String sql1 = "SELECT `productID`, `productName` FROM `liquid`";
                    ResultSet rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
            </section>
            <section class="card">
            <h3>彩色隱眼</h3>
            <form action="edit_coloredlens.jsp" method="post">
                <select name="goods">
                    <%
                    sql1 = "SELECT `productID`, `productName` FROM `coloredlens`";
                    rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
            </section>
            <section class="card">
            <h3>透明隱眼</h3>
            <form action="edit_transparentlens.jsp" method="post">
                <select name="goods">
                    <%
                    sql1 = "SELECT `productID`, `productName` FROM `transparentlens`";
                    rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
            </section>
        </section>
        <section class="campaign-add">
            <section class="card">
            <h2>新增活動</h2>
            <form action="add_campaign.jsp" method="post">
                <input type="text" name="href" placeholder="頁面路徑" required>
                <input type="text" name="img" placeholder="圖片路徑" required>
                <input name="text" placeholder="活動跑馬燈文字" required><br>
                <button type="submit">新增</button>
            </form>
            </section>
        </section>
        <section class="order-receiving">
            <section class="card">
            <h2>接收訂單</h2>
            <ul class="order-list">
                <%
                    sql1 = "SELECT * FROM `order` WHERE `status` = '0' ORDER BY `orderID`;";
                    rs1 = con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        String sql2 = "SELECT `productName`, `productPrice` FROM `"+rs1.getString(4)+"` WHERE `productID` = '"+rs1.getString(3)+"'";
                        ResultSet rs2 =con.createStatement().executeQuery(sql2);
                        rs2.next();
                        out.print("<form action=\"update_order.jsp\" method=\"POST\">");
                        out.print("<input type=\"hidden\" name=\"orderID\" value=\""+rs1.getString(1)+"\"");
                        out.print("<li><h3>訂單編號#"+rs1.getString(1)+"</h3>商品："+rs2.getString(1)+"<br>價錢：$"+rs2.getInt(2)+" x"+rs1.getInt(5)+"   共: $"+rs1.getInt(10)+"<br>會員編號#"+rs1.getInt(6)+"<br>地址："+rs1.getString(7)+"<br>電話："+rs1.getString(8)+"<br><button>完成訂單</button></li>");
                        out.print("</form>");
                    }
                    con.close();
                } catch (ClassNotFoundException err){
                    out.println("class錯誤"+err.toString());
                }
                %>

            </ul>
            </section>
        </section>
    </main>

    <footer>
        <p>2024 cyim demo</p>
    </footer>
</body>

</html>
