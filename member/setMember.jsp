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
            <form method="post" action="updateMember.jsp">
			
	<%
	String memberID = "";
	//String returnMessage = request.getParameter("returnMessage");
	
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
                    <table class="pertable" border="1">
                        <tr>
                            <th>姓名</th>
                            <td><input type="text" name="name" id="name" value = "<%=name%>"></td>
                        </tr>
                        <tr>
                            <th>性別</th>
                            <td><input type="radio" class="sex" name="gender" value="male" <%if(gender.equals("male")){%> checked <%}%> >男
								<input type="radio" class="sex" name="gender" value="female" <%if(gender.equals("female")){%> checked <%}%> >女
							</td>
                        </tr>
                        <tr>
                            <th>生日</th>
                            <td><input type="date" id="birthday" name="birthday" value="<%=birthday%>"></td>
                        </tr>

                        <tr>
                            <th>度數</th>
                            <td>
                                左眼:
								<input type="text" name="left" id="left" value = "<%=left%>" min="0">
                                右眼:
                                <input type="text" name="right" id="right" value = "<%=right%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><input type="text" name="email" id="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required value = "<%=email%>"></td>
                        </tr>
                    </table>
                    <input type="submit" value="更新資料">
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
            </form>       
        </div>    
    </div>
</body>
</html>

