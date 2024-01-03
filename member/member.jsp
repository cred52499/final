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
	<%
	Class.forName("com.mysql.jdbc.Driver")
	String url="jdbc:mysql://localhost/?serverTimezone=UTC"
	Connection con=DriverManager.getConnection(url,"root","1234");
	%>
        <div class="per">
            <form method="post" action="">
                
                <fieldset>
                    <legend><h2>會員基本資料</h2></legend>
                    <table class="pertable" border="1">
                        <tr>
                            <th>帳號</th>
                            <td><input type="text" name="id" id="id"></td>
                        </tr>
                        <tr>
                            <th>性別</th>
                            <td><input type="radio" class="sex" name="gender" value="男">男<input type="radio" class="sex" name="gender" value="女">女</td>
                        </tr>
                        <tr>
                            <th>生日</th>
                            <td><input type="date" name="birth" id="birth"></td>
                        </tr>

                        <tr>
                            <th>度數</th>
                            <td>
                                左眼:
                                <select size="1" name="lefteye" id="lefteye">  <!--先放這樣，根據商品的度數還會在增加-->
                                    <option>1.00</option>
                                    <option>1.25</option>
                                    <option>1.50</option>
                                    <option>1.75</option>
                                </select>
                                右眼:
                                <select size="1" name="righteye" id="righteye"> <!--先放這樣，根據商品的度數還會在增加-->
                                    <option>1.00</option>
                                    <option>1.25</option>
                                    <option>1.50</option>
                                    <option>1.75</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>地址</th>
                            <td><input type="text" id="address"></td>
                        </tr>
                    </table>
                    <input type="button" value="更新資料" onclick="updateData()">
                </fieldset>
            </form>       
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