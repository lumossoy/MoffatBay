<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Landing Page</title>
</head>
<body>
    <div style="text-align: center">
        <h1>Home page</h1>
        <b>${user.firstName} (${user.email})</b>
        <br><br>
        <a href="/logout">Logout</a>
    </div>
</body>
</html>