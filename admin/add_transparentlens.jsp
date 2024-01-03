<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<body>
    <%
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String content = request.getParameter("watercontent");
        String basecurve = request.getParameter("basecurve");
        String dia = request.getParameter("diameter");
        String gd = request.getParameter("graphicdiameter");
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
		if(content.isEmpty())
			content = "0.00";
		if(basecurve.isEmpty())
			basecurve = "0.00";
		if(dia.isEmpty())
			dia = "0.00";
		if(gd.isEmpty())
			gd = "0.00";
    	Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/opticshop";
		Connection con=DriverManager.getConnection(url,"root","1234");
        String sql1 ="INSERT INTO `transparentlens` (`productName`,`productPrice`,`productStock`,`transparentLensWaterContent`,`transparentLensBaseCurve`,`transparentLensDiameter`,`transparentLensGraphicDiameter`)"+"values('"+name+"','"+price+"','"+stock+"','"+content+"','"+basecurve+"','"+dia+"','"+gd+"')"; 
        con.createStatement().executeUpdate(sql1);
        out.print("<script>alert('新增成功');location.href='admin.jsp'</script>");
       
		con.close();
    %>
</body>