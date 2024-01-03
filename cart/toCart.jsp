<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>

<%	
	String previousPage = "../liquid/liquid.jsp";
	String itemString = request.getParameter("itemString");
	String existedString = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i=0; i < cookies.length; i++){
			if(cookies[i].getName().equals("itemString")){
				existedString = cookies[i].getValue();
			}
		}
	}
	
	Cookie itemStringCookie = new Cookie("itemString", existedString + itemString);

    itemStringCookie.setMaxAge(60 * 60); // Set the cookie to last for one year (optional)

	//itemTableCookie.setPath(../);
	response.addCookie(itemStringCookie);

	response.sendRedirect(previousPage);
%>
