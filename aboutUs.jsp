<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
    
    	body {
    font-family: "Bree Serif", sans-serif;
    margin: 0;
    padding: 0;
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

.login-button {
    background-color: #1CADFB;
    color: white;
    font-family: "Lato", sans-serif;
    border: none;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width: 118px;
    height: 30px;
}

.container {
    width: 80%;
    padding: 20px;
    margin: auto; /* Center container */
    max-width: 1170px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Adjust for responsive layout */
    gap: 20px; /* Add gap between grid items */
}

p {
    color: #47525E;
  	font-family: Bree Serif;
  	font-size: 17px;
  	line-height: 22px;
  	text-align: left; /* Justify text for better readability */
}

img {
    max-width: 100%; /* Ensure image responsiveness */
    height: auto; /* Maintain aspect ratio */
    display: block; /* Remove default inline display */
}

h2 {
    color: #1CADFB;
    font-family: "Berkshire Swash", cursive;
    font-size: 30px;
    line-height: 35px; /* Increase line height for better spacing */
    text-align: center;
}
h3 {
	color: #1CADFB;
  	font-family: Bree Serif;
  	font-size: 25px;
 	line-height: 32px;
  	text-align: left;
}
    	
    </style>
</head>
<body>
    <div class="navigation">
        <header>
            <h1><img src="images/SalishSalmon.png" alt="Moffat Bay Logo" id="logo" >Moffat Bay Lodge</h1>
            <nav>
                <ul>
                    <li><a href="#attractions">Attractions</a></li>
                    <li><a href="rooms.jsp">Rooms</a></li>
                    <li><a href="reservation.jsp">Reservations</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><button class="login-button"><a href="login.jsp">Login</a></button></li>
                </ul>
            </nav>
        </header>
    </div>
        
    <div class="container">
        <div class="left">
            <div class="content">
                <h2>Contact Us</h2>
                <h3>Address</h3>
                <p>265 Arrancar Ave, Menos Grande, Espada, 25019, San Juan Islands</p>
                <h3>Phone Number</h3>
                <p>Service Staff<br> Hours: 5am - 1am <br> 787-443-4500</p>
                <p>IT Staff <br>Hours: 8am - 10pm <br> 787-443-4511</p>
                <h3>Email</h3>
                <p>service@moffatbaylodge.com</p>
            </div>
        </div>
        <div class="right">
            <h2>The Owners and Staff<br> at <br> Moffat Bay Lodge.</h2>
            <img src="images/aboutUs.png" alt="Owners and Staff">
        </div>
    </div>
</body>
</html>
