<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>後台管理</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <header>
        <h1>後台管理系統</h1>
    </header>

    <main>
        <section class="product-add">
            <h2>新增商品</h2>
            <h3>保養液</h3>
            <form action="upload_product_liquid.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱">
                <input type="number" name="price" placeholder="商品價格">
                <input type="text" name="image" placeholder="圖片路徑"><br>
                <input name="content" placeholder="商品內容">
                <input name="features" placeholder="商品特性">
                <input name="indications" placeholder="商品指示">
                <input name="notes" placeholder="商品警示">
                <br>
                <input type="number" name="stock" placeholder="商品庫存">
                <button type="submit">新增</button>
            </form>
            <h3>彩色隱眼</h3>
            <form action="upload_product_coloredlens.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱">
                <input type="number" name="price" placeholder="商品價格">
                <input type="text" name="image" placeholder="圖片路徑"><br>
                <input name="watercontent" placeholder="含水量">
                <input name="basecurve" placeholder="基弧">
                <input name="diameter" placeholder="鏡片直徑">
                <input name="graphicdiameter" placeholder="著色直徑">
                <br>
                <input type="number" name="stock" placeholder="商品庫存">
                <button type="submit">新增</button>
            </form>
            <h3>透明隱眼</h3>
            <form action="upload_product_transparentlens.jsp" method="post">
                <input type="text" name="name" placeholder="商品名稱">
                <input type="number" name="price" placeholder="商品價格">
                <input type="text" name="image" placeholder="圖片路徑"><br>
                <input name="watercontent" placeholder="含水量">
                <input name="basecurve" placeholder="基弧">
                <input name="diameter" placeholder="鏡片直徑">
                <input name="graphicdiameter" placeholder="著色直徑">
                <br>
                <input type="number" name="stock" placeholder="商品庫存">
                <button type="submit">新增</button>
            </form>
        </section>
        <section class="product-management">
            <h2>產品管理</h2>
            <h3>保養液</h3>
            <form action="modify_pd_liquid.jsp" method="post">
                <select name="goods">
                    <%
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                    Connection con=DriverManager.getConnection(url,"root","1234");
                    String sql1 = "SELECT `idLiquid`, `liquidName` FROM `liquid`";
                    ResultSet rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
            <h3>彩色隱眼</h3>
            <form action="modify_pd_coloredlens.jsp" method="post">
                <select name="goods">
                    <%
                    sql1 = "SELECT `idColoredLens`,`coloredLensName` FROM `coloredlens`";
                    rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
            <h3>透明隱眼</h3>
            <form action="modify_pd_transparentlens.jsp" method="post">
                <select name="goods">
                    <%
                    sql1 = "SELECT `idTransparentLens`, `transparentLensName` FROM `transparentlens`";
                    rs1 =con.createStatement().executeQuery(sql1);
                    while( rs1.next() ) {
                        out.print("<option value=" + rs1.getString(1) + ">" + rs1.getString(2) + "</option>");
                    }
                    con.close();
                    %>
                </select><br>
                <button type="submit">修改</button>
            </form>
        </section>
        <section class="order-receiving">
            <h2>接收訂單</h2>
         
           
            <ul class="order-list">
                <li>訂單標號: cyim01   商品A  $50  <button>更動訂單</button></li>
                <li>訂單編號: cyim02   商品B  $30  <button>更動訂單</button></li>

            </ul>
        </section>

        <section class="purchase-records">
            <h2>購物紀錄</h2>

            <table>
                <thead>
                    <tr>
                        <th>編號</th>
                        <th>姓名</th>
                        <th>商品</th>
                        <th>金额</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>cyim01</td>
                        <td>AAA</td>
                        <td>海昌彩色日拋</td>
                        <td>$150</td>
                    </tr>
                    <tr>
                        <td>cyim02</td>
                        <td>BBB</td>
                        <td>安儷透明月拋</td>
                        <td>$130</td>
                    </tr>
                    
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>2023 cyim demo</p>
    </footer>
</body>

</html>
