<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
    <head><title>get</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		double lnearsighted = Double.parseDouble(request.getParameter("lnearsighted"));
		double rnearsighted = Double.parseDouble(request.getParameter("rnearsighted"));
			
		try {
//Step 1: 載入資料庫驅動程式 
            Class.forName("com.mysql.jdbc.Driver");	  
        try {
//Step 2: 建立連線 
           String url="jdbc:mysql://localhost/opticshop";
           Connection con=DriverManager.getConnection(url,"root","1234");   				
	        if(con.isClosed())
                out.println("連線建立失敗");
            else{	
//Step 3: 選擇資料庫
                //con.createStatement().execute("use `opticshop`");  
//Step 4: 執行 SQL 指令        
            String sql = "INSERT INTO `member` (`username`, `password`, `email`, `birthday`, `gender`, `lnearsighted`, `rnearsighted`) " +
                       "VALUES ('"+username+"', '"+password+"', '"+email+"', '"+birthday+"', '"+gender+"', '"+lnearsighted+"', '"+rnearsighted+"')";
                    //SQL語法，這裡需要用單引號, 59有無單引號都可
                    //con.createStatement().execute(sql);
            int no=con.createStatement().executeUpdate(sql); //可回傳異動數
            if (no>0)
//Step 5: 顯示結果 
                out.println("新增成功");
//Step 6: 關閉連線
                con.close();
               }
        }        
          catch (SQLException sExec) {
			  response.sendRedirect("/final/register.jsp?email=" + email + "&birthday=" + birthday + "&gender=" + gender
									+ "&lnearsighted=" + lnearsighted + "&rnearsighted=" + rnearsighted + "&message=" + "The username has been used, please choose other username.");
              //out.println("SQL錯誤"+sExec.toString());
			  
        }
    }     
    catch (ClassNotFoundException err) {
          out.println("class錯誤"+err.toString());
    }

    %>

    </body>
</html>
