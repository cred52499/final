<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
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
        <p><%=System.currentTimeMillis()%></p>
        <section class="product-add">
            <h2>產品管理 [保養液]</h2>
            <form action="edit_liquid.jsp" method="post">
            <%
                try{
                    request.setCharacterEncoding("UTF-8");
                    String id = request.getParameter("goods");
                    String url="jdbc:mysql://localhost/opticshop";
			        Connection con=DriverManager.getConnection(url,"root","1234"); 
                    String sql1 = "SELECT * FROM `liquid` WHERE idLiquid = '"+id+"' LIMIT 1";
                    ResultSet rs1 =con.createStatement().executeQuery(sql1);
                    rs1.next();
                    out.print("<input type=\"hidden\" name=\"goods\" value=\""+id+"\">");
                    out.print("商品名稱：<input type=\"text\" name=\"name\" size=\"45\" maxlength=\"45\" value=\""+rs1.getString(2)+"\"><br>");
                    out.print("商品價格：<input type=\"number\" name=\"price\" value=\""+rs1.getInt(3)+"\"><br>");
                    out.print("商品內容：<input name=\"content\" value=\""+rs1.getString(5)+"\"><br>");
                    out.print("商品特性：<input name=\"features\" value=\""+rs1.getString(6)+"\"><br>");
                    out.print("商品指示：<input name=\"indications\" value=\""+rs1.getString(7)+"\"><br>");
                    out.print("商品警示：<input name=\"notes\" value=\""+rs1.getString(8)+"\"><br>");
                    out.print("商品庫存：<input name=\"stock\" value=\""+rs1.getInt(4)+"\"><br>");
                    boolean inStock = rs1.getInt(9) == 1 ? true : false;
                    out.print("是否上架：<input type=\"checkbox\" name=\"instock\" " + ( inStock ? "checked" : "" ) + ">");
                %>
                <br>
                <button type="submit">完成</button>
            </form><form action="admin.jsp" method="post">
                <button type="submit">上一步</button>
            </form><form action="product_delete.jsp" method="post">
                <input type="hidden" name="delete" value="liquid">
                <input type="hidden" name="id" value="<%=id%>">
                <input type="hidden" name="tableid" value="idLiquid">
                <button type="submit">刪除此產品</button>
            </form>
        </section>
    </main>
    <%
        String name = request.getParameter("name");
        if(name != null){
            String price = request.getParameter("price");
            String content = request.getParameter("content");
            String features = request.getParameter("features");
            String indi = request.getParameter("indications");
            String note = request.getParameter("notes");
            String stock = request.getParameter("stock");
            String instock = request.getParameter("instock");
            sql1 ="INSERT INTO `liquid` (`idLiquid`,`liquidName`,`liquidPrice`,`liquidContents`,`liquidFeatures`,`liquidIndications`,`liquidNotes`,`liquidStock`)"+"values('"+id+"','"+name+"','"+price+"','"+content+"','"+features+"','"+indi+"','"+note+"','"+stock+"')" + " ON DUPLICATE KEY UPDATE liquidName = '"+name+"', liquidPrice = '"+price+"', liquidContents = '"+content+"', liquidFeatures = '"+features+"', liquidIndications = '"+indi+"', liquidNotes = '"+note+"', liquidStock = '"+stock+"', instock = '"+(instock==null ? "0" : "1")+"';"; 
            con.createStatement().executeUpdate(sql1);
            out.print("<script>alert('修改成功');location.href='admin.jsp'</script>");
        }
    %>
    <%
    con.close();
    } catch (Exception e){ 
        out.println(e.toString());
    }
    %>
    <footer>
        <p>2023 cyim demo</p>
    </footer>
</body>

</html>
