<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<body>
    <%
        String href = request.getParameter("href");
        String img = request.getParameter("img");
        String text = request.getParameter("text");
		if(href==null){
			out.print("<script>alert('新增失敗！活動頁面路徑不能為空!請重新輸入');location.href='admin.jsp'</script>");
			return;
		}
		if(img==null){
			out.print("<script>alert('新增失敗！活動圖片路徑不能為空!請重新輸入');location.href='admin.jsp'</script>");
			return;
		}
    	Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234");
        String sql1 ="INSERT INTO `campaign` (`href`,`img`,`text`)"+"values('"+href+"','"+img+"','"+text+"')"; 
        con.createStatement().executeUpdate(sql1);
        out.print("<script>alert('新增成功');location.href='admin.jsp'</script>");
    
		con.close();
    %>
</body>