<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>訪客人數記錄</title>
</head>
<body>
    <h1>歡迎使用</h1>

    <% 
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            //連接MySQL 並在裡面建立visitors的表 擁有id和timestamp作為欄位
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/visitor_tracking";
            String username = "root";
            String password = "1234";
            connection = DriverManager.getConnection(url, username, password);

            //新增訪客紀錄
            statement = connection.createStatement();
            String insertQuery = "INSERT INTO visitors (timestamp) VALUES (NOW())";
            statement.executeUpdate(insertQuery);

            //取得總訪客人數
            String countQuery = "SELECT COUNT(*) FROM visitors";
            resultSet = statement.executeQuery(countQuery);
            resultSet.next();
            int totalVisitors = resultSet.getInt(1);
    %>

    <p>您是第 <%= totalVisitors %> 位訪客。</p>

    <%
        } catch (Exception e) {
            e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
