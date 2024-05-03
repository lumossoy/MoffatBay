<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%if (request.isRequestedSessionIdValid() != true){ 
    	response.sendRedirect("landingPage.jsp");}%>
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
    width: 100%; /* Change to 100% for responsiveness */
    height: 59px;
    display: flex;
    justify-content: space-between; /* Align h1 and nav to opposite sides */
    align-items: center; /* Align items vertically */
    padding: 0 20px; /* Add padding for better spacing */
}

h1 {
    color: #1CADFB;
    font-family: "Berkshire Swash", cursive;
    font-size: 30px;
    line-height: 39px;
    margin: 0; /* Remove default margin */
}

.logo a {
    text-decoration: none;
    color: #1CADFB; /* Set color for link */
}

.logo a:hover {
    text-decoration: none;
}

.logo a:visited {
    color: #1CADFB; /* Set color for visited link */
}

nav ul {
    list-style-type: none; /* Remove default bullet points */
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
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

.topleft {
	color: red;
	position: absolute;
	top: 65px;
	left: 16px;
	font-size: 25px;
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
                    <li><a href="aboutUs.jsp">About Us</a></li>
					<%if (request.isRequestedSessionIdValid() != true){ %>
					<li><a href="login.jsp"><button type="submit">Login</button></a></li>
					<%}else {%>
					<li><a href="landingPage.jsp"><button type="submit">Logout</button></a></li>
					<%}%>
                </ul>
            </nav>
        </header>
    </div>
	<div class="content">

		<!-- Our content here -->
		<div class="topleft">
			<b>${user.firstName} (${user.email})</b>
		</div>
		<div class="centered">
			<h2>Enjoy out luxury Lodges</h2>
			<br>
			<h3>Book your vacation at a Dream Location</h3>
		</div>
		<!-- More content -->
	</div>
	<img class="bg" src="images/mountainLandingPage.jpg">
</body>
</html>