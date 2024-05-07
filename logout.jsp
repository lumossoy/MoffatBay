<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalidating session</title>
</head>
<body>

	<%
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
			response.sendRedirect("landingPage.jsp");			
		}	
	%>

</body>
</html>
