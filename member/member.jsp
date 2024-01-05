<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員基本資料</title>
    <link rel="stylesheet" href="member.css">
    <script src="member.js"></script>
</head>

<body onload="displayData(),displayShoppingList(shoppingData),displaytextarea()">
    <header>
    </header>
    <div class="containermember">
        <div class="per">
    <%
    String memberID = "";
    String returnMessage = request.getParameter("returnMessage");

    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
        for(int i=0; i < cookies.length; i++) {
            if(cookies[i].getName().equals("memberID")) {
                memberID = cookies[i].getValue();
            }
        }
    }

    Connection con = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        try {
            String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
            con = DriverManager.getConnection(url, "root", "1234");

            if (con.isClosed()) {
                out.println("連線建立失敗");
            } else {
                con.createStatement().execute("use `opticshop`");

                String sql = "SELECT * FROM member WHERE memberID=?";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, memberID);
                ResultSet resultSet = preparedStatement.executeQuery();

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
                        <a href="../index.jsp">回首頁</a>
                        <table class="pertable" border="1">
                            <tr>
                                <th>姓名</th>
                                <td><%=name%></td>
                            </tr>
                            <tr>
                                <th>性別</th>
                                <td><%
                                if (gender.equalsIgnoreCase("male")) {
                                    out.print("男");
                                } else if (gender.equalsIgnoreCase("female")) {
                                    out.print("女");
                                }
                                %></td>
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
    } finally {
        // Close resources in the finally block to ensure they are always closed
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                out.println("Error closing connection: " + ex.toString());
            }
        }
    }
    %>
        </div>    
        <div class="shp" id="shoppingList"> <!--購物清單-->
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
                con = DriverManager.getConnection(url, "root", "1234");

                if (con.isClosed()) {
                    out.println("連線建立失敗");
                } else {
                    con.createStatement().execute("use `opticshop`");

                    String sql = "SELECT * FROM `order` WHERE memberID=?";
                    PreparedStatement preparedStatement = con.prepareStatement(sql);
                    preparedStatement.setString(1, memberID);

                    ResultSet resultSet = preparedStatement.executeQuery();
                    ArrayList<String[]> shoppingList = new ArrayList<>();

                    while (resultSet.next()) {
                        // Retrieve values from the result set
                        String orderID = resultSet.getString("orderID");
                        String productID = resultSet.getString("productID");
                        String productCategory = resultSet.getString("productCategory");
                        String orderQty = resultSet.getString("orderQty");
                        String memberAddress = resultSet.getString("memberAddress");
                        String memberPhoneNum = resultSet.getString("memberPhoneNum");
                        String status = resultSet.getString("status");
                        String subtotal = resultSet.getString("subtotal");
                        String[] shoppingItem = {orderID, productID, productCategory, orderQty, memberAddress, memberPhoneNum, status, subtotal};
                        shoppingList.add(shoppingItem);
                    }

                    out.println("<table border='1'>");
                    out.println("<tr><th>Order ID</th><th>Product ID</th><th>Product Category</th><th>Order Quantity</th><th>Member Address</th><th>Member Phone Number</th><th>Status</th><th>Subtotal</th></tr>");

                    for (String[] shoppingItem : shoppingList) {
                        out.println("<tr>");
                        for (String item : shoppingItem) {
                            out.println("<td>" + item + "</td>");
                        }
                        out.println("</tr>");
                    }

                    out.println("</table>");
                } 
                con.close();
            } catch (SQLException e) {
                out.println("SQL錯誤: " + e.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("Class錯誤: " + err.toString());
        } finally {
            // Close resources in the finally block to ensure they are always closed
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    out.println("Error closing connection: " + ex.toString());
                }
            }
        }
        %>
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
                <input type="button" value="記錄"
