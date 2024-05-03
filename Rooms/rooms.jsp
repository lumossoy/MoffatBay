<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms</title>
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

        .container {
            text-align: center;
        }

        .container h2 {
            color: #47525E;
            font-family: "Bree Serif", sans-serif;
            font-size: 30px;
        }

        .content {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .room {
            margin: 10px;
            text-align: center;
            width: 300px; /* Adjust as needed */
        }

        .room img {
            width: 100%; 
            height: 200px; 
            object-fit: cover; 
            margin-bottom: 10px;
        }

        .room p {
            color: black;
            margin-top: 10px;
        }

        .learn-more {
            color: white;
            text-decoration: none;
        }

        .learn-more:hover {
        	color: white;
            text-decoration: none;
        }

        .learn-more:visited {
            color: white;
            text-decoration: none;
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
                    <li><a href="login.jsp"><button type="submit">Login</button></a></li>
                </ul>
            </nav>
        </header>
    </div>
    <div class="container">
        <hr width="100%" size="2">
        <h2>ROOMS</h2>
        <hr width="100%" size="2">
    </div>
    <div class="content">
        <div class="room">
            <img src="images/roomsDoubleFull.png" alt="Double Full Bed">
            <p>Double Full Bed</p>
            <button class="learn-more"><a href="doubleFull.jsp">Learn More</a></button>
        </div>
        <div class="room">
            <img src="images/roomsQueen.png" alt="Queen Bed">
            <p>Queen Bed</p>
            <button class="learn-more"><a href="queen.jsp">Learn More</a></button>
        </div>
        <div class="room">
            <img src="images/doubleQueen.png" alt="Double Queen Bed">
            <p>Double Queen Bed</p>
            <button class="learn-more"><a href="doubleQueen.jsp">Learn More</a></button>
        </div>
        <div class="room">
            <img src="images/king.png" alt="King Bed">
            <p>King Bed</p>
            <button class="learn-more"><a href="king.jsp">Learn More</a></button>
        </div>
    </div>
</body>
</html>
