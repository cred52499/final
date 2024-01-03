<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<body>
    <%
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String content = request.getParameter("content");
        String features = request.getParameter("features");
        String indi = request.getParameter("indications");
        String note = request.getParameter("notes");
        String stock = request.getParameter("stock");
		if(name==""){
			out.print("<script>alert('新增失敗！產品名稱不能為空!請重新輸入');location.href='admin.jsp'</script>");
			return;
		}
		if(price==""){
			out.print("<script>alert('新增失敗！價錢不能為空!請重新輸入');location.href='admin.jsp'</script>");
			return;
		}
        if(stock==""){
			out.print("<script>alert('新增失敗！庫存不能為空!請重新輸入');location.href='admin.jsp'</script>");
			return;
		}
    	Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234");
        String sql1 ="INSERT INTO `liquid` (`productName`,`productPrice`,`productContents`,`liquidFeatures`,`liquidIndications`,`liquidNotes`,`liquidStock`)"+"values('"+name+"','"+price+"','"+content+"','"+features+"','"+indi+"','"+note+"','"+stock+"')"; 
        con.createStatement().executeUpdate(sql1);
        out.print("<script>alert('新增成功');location.href='admin.jsp'</script>");
       
		con.close();
    %>
</body>