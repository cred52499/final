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

<body onload="displayData(),displayShoppingList(shoppingData),displaytextarea() ">
    <header>
    </header>
    <div class="containermember">
        <div class="per">
	<%
	String memberID = "";
	String returnMessage = request.getParameter("returnMessage");
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		int count = cookies.length;
		for(int i=0; i < count; i++){
			if(cookies[i].getName().equals("memberID")){
				memberID = cookies[i].getValue();
				//out.print("get cookie memberID: " + memberID);
			}
		}
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
    try {
        String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url, "root", "1234");
        if (con.isClosed()) {
            out.println("連線建立失敗");
        } else {
            con.createStatement().execute("use `opticshop`");
			String sql = "SELECT * FROM member WHERE memberID=" + memberID;
			ResultSet resultSet = con.createStatement().executeQuery(sql);
			
			if (resultSet.next()) {
                // Retrieve values from the result set
				String name = resultSet.getString("memberName");
                String gender = resultSet.getString("memberGender");
                String birthday = resultSet.getString("memberBirthday");
                String left = resultSet.getString("memberLeftNearsighted");
                String right = resultSet.getString("memberRightNearsighted");
                String email = resultSet.getString("memberEmail");

	%>  
				<fieldset>
                    <legend><h2>會員基本資料</h2></legend>
					<a href="../index.jsp"">回首頁</a>
                    <table class="pertable" border="1">
                        <tr>
                            <th>姓名</th>
                            <td><%=name%></td>
                        </tr>
                        <tr>
                            <th>性別</th>
                            <td><%
							if (gender.equalsIgnoreCase("male")){
								out.print("男");
							}else if (gender.equalsIgnoreCase("female")){
								out.print("女");
							}%>
							</td>
                        </tr>
                        <tr>
                            <th>生日</th>
                            <td><%=birthday%></td>
                        </tr>

                        <tr>
                            <th>度數</th>
                            <td>
                                左眼:
								<%=left%>
                                右眼:
                                <%=right%>
                            </td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><%=email%></td>
                        </tr>
                    </table>
                    <a href="setMember.jsp">修改資料</a>
                </fieldset>
				<%
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
        <div class="shp" id="shoppingList"> <!--購物清單-->
                <!--顯示紀錄位置-->
        </div>
        <div class="art">
            <form class="textarea" id="textarea" action="" method=""> <!--記事本表單-->
                <table class="arttable">
                    <tr>
                        <th style="text-align: left;">記事本</th>    
                    </tr>
                    <tr>
                        <td><textarea></textarea></td>
                    </tr>
                </table>
                <input type="button" value="記錄" onclick="updatetextarea()">
            </form>
        </div>
    </div>
</body>
</html>

