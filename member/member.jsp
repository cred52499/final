<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder"%>
<%@ page import = "java.nio.charset.StandardCharsets" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員基本資料</title>
    <link rel="stylesheet" href="member.css">
    <script src="member.js"></script>
</head>

<body>
    <header>
    </header>
    <div class="containermember">
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
    try {
        String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url, "root", "1234");
        if (con.isClosed()) {
            out.println("連線建立失敗");
        } else {
            con.createStatement().execute("use `opticshop`");
			String sql = "SELECT memberUsername, memberGender, memberBirthday, memberLeftNearsighted, memberRightNearsighted, memberEmail FROM member";
			ResultSet resultSet = con.createStatement().executeQuery(sql);
			
			if (resultSet.next()) {
                // Retrieve values from the result set
                String username = resultSet.getString("memberUsername");
                String gender = resultSet.getString("memberGender");
                String birthday = resultSet.getString("memberBirthday");
                String left = resultSet.getString("memberLeftNearsighted");
                String right = resultSet.getString("memberRightNearsighted");
                String email = resultSet.getString("memberEmail");
                
                out.println("Username: " + username);
                out.println("Gender: " + gender);
                out.println("Birthday: " + birthday);
                out.println("Left: " + left);
                out.println("Right: " + right);
                out.println("Email: " + email);
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
</body>
</html>