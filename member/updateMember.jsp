<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder"%>
<%@ page import = "java.nio.charset.StandardCharsets" %>

<%
	String memberID = "";
	
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
	
	String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthday");
    String left = request.getParameter("left");
    String right = request.getParameter("right");
    String email = request.getParameter("email");
	out.print(name + gender + birthday + left + right + email);
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
    try {
        String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url, "root", "1234");
        if (con.isClosed()) {
            out.println("連線建立失敗");
        } else {
            con.createStatement().execute("use `opticshop`");
			String sql = "UPDATE `member` SET `memberName`=?, `memberGender`=?, `memberBirthday`=?, `memberLeftNearsighted`=?, `memberRightNearsighted`=?, `memberEmail`=? WHERE `memberID`=?";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,gender);
			pstmt.setString(3,birthday);
			pstmt.setString(4,left);
			pstmt.setString(5,right);
			pstmt.setString(6,email);
			pstmt.setString(7,memberID);
			
			pstmt.executeUpdate();
			con.close();
			
			response.sendRedirect("member.jsp?returnMessage=Change successful!");
		}
    } catch (SQLException e){
        out.println("SQL錯誤: " + e.toString());
    }
	} catch (ClassNotFoundException err){
		out.println("Class錯誤: " + err.toString());
	}
%>