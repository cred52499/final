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
    <%
                try{
                    request.setCharacterEncoding("UTF-8");
                    String id = request.getParameter("orderID");
                    if(id==null)
                        out.print("<script>location.href='admin.jsp'</script>");
                    String url="jdbc:mysql://localhost/opticshop";
			        Connection con=DriverManager.getConnection(url,"root","1234"); 
                    String sql1 = "UPDATE `order` SET `status` = '"+String.valueOf(1)+"' WHERE `orderID` = '" + id + "';";
                    con.createStatement().executeUpdate(sql1);
                    out.print("<script>alert('更新成功');location.href='admin.jsp'</script>");
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
