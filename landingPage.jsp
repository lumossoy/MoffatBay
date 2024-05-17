<!-- Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez  -->
<!-- Purpose: Landing page which welcomes visitors  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Landing Page</title>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
	color: #47525E;
}

h2 {
	color: red;
	text-align: center;
	font-weight: bolder;
	font-size: x-large;
}

h3 {
	color: white;
	text-align: center;
	font-weight: 900;
	font-size: xx-large;
	margin-top: -15px;
}

#logo {
	float: left;
	display: inline-block;
	width: 5%;
}

header {
    background-color: #FFFFFF;
    width: 100%; 
    height: 59px;
    display: flex;
    justify-content: space-between; 
    align-items: center; 
    padding: 0 20px; 
}

h1 {
    color: #1CADFB;
    font-family: "Berkshire Swash", cursive;
    font-size: 30px;
    line-height: 39px;
    margin: 0; 
}

.logo a {
    text-decoration: none;
    color: #1CADFB; 
}

.logo a:hover {
    text-decoration: none;
}

.logo a:visited {
    color: #1CADFB; 
}

nav ul {
    list-style-type: none; 
    margin: 0; 
    padding: 0; 
}

nav ul li {
    display: inline;
    margin-right: 10px;
}

nav ul li a {
    color: #47525E;
    text-decoration: none;
}

nav ul li a:hover {
    text-decoration: underline;
}

button {
    background-color: #1CADFB;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    text-decoration: none; 
}

.register {
    padding: 14px 55px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    opacity: 0.9;
    position: absolute;
    left: 46%;
    bottom: 350px;
}

.bg {
    height: 100vh;
    width: 100%;
}

.centered {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>

</head>
<body>
    <div class="navigation">
        <header>
            <h1 class="logo"><a href="landingPage.jsp"><img src="images/SalishSalmon.png" alt="Moffat Bay Logo" id="logo">Moffat Bay Lodge</a></h1>
            <nav>
                <ul>
                    <li><a href="attractions.jsp">Attractions</a></li>
                    <li><a href="rooms.jsp">Rooms</a></li>
                    <li><a href="reservation.jsp">Reservations</a></li>
                    <li><a href="aboutUS.jsp">About Us</a></li>
	                <%if (session.getAttribute("user") != null){ %>
	                <li><a href="logout.jsp"><button type="submit"> (${user.email}) Logout</button></a></li>
	                <%}else {%>
	                <li><a href="login.jsp"><button type="submit">Login</button></a></li>
	                <%}%>
                </ul>
            </nav>
        </header>
    </div>
    <div class="content">

        <!-- Our content here -->
        <div class="centered">
            <h2>Enjoy our luxury Lodges</h2>
            <br>
            <h3>Book your vacation at a Dream Location</h3>
        </div>
        <!-- More content -->
    </div>
    <img class="bg" src="images/mountainLandingPage.jpg" alt="Background Image">
    <%if (session.getAttribute("user") == null){ %>
    <a href="registration.jsp"><button class="register" type="submit">Sign up</button></a>
    <%}else {%>
    <p></p>
    <%}%>
</body>
</html>
