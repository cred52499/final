<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../styles.css">
</head>

<body>
    <%
                try {
                    request.setCharacterEncoding("UTF-8");
                    String rate = request.getParameter("rate");
                    String memberID = request.getParameter("memberID");
                    String type = request.getParameter("type");
                    String href = request.getParameter("href");
                    String productID = request.getParameter("productID");
                    String comment = request.getParameter("comment");
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost/opticshop";
                    Connection con=DriverManager.getConnection(url,"root","1234");
                    String sql1 ="INSERT INTO `comment` (`productID`,`category`,`memberID`,`rate`,`content`) values ('"+productID+"', '"+type+"', '"+memberID+"','"+rate+"','"+comment+"')"; 
                    con.createStatement().executeUpdate(sql1);
                    out.print("<script>alert('留言成功');location.href='../"+href+"'</script>");
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
