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

.navigation header {
    background-color: #FFFFFF;
    width: 100%;
    height: 59px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 20px;
}

h1 {
    color: #1CADFB;
    font-family: "Berkshire Swash", cursive;
    font-size: 30px;
    line-height: 39px;
    margin: 0;
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

.container h2 {
    color: #47525E;
    font-family: "Bree Serif", sans-serif;
    font-size: 30px;
    text-align: center;
}

.content {
    padding: 20px;
    text-align: center;
}

.content .room {
    margin-bottom: 20px;
}

.content .room img {
    max-width: 100%;
    height: auto;
    display: block;
}

.content .room p {
    color: black;
    margin-top: 10px;
}

    
    </style>
</head>
<body>
    <div class="navigation">
        <header>
            <h1>Moffat Bay Lodge</h1>
            <nav>
                <ul>
                    <li><a href="#attractions">Attractions</a></li>
                    <li><a href="rooms.jsp">Rooms</a></li>
                    <li><a href="#reservations">Reservations</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><button class="login-button"> <a href="login.jsp">Login</a></button></li>
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
            <button class="learn-more"> <a href="#learnMore">Learn More</a></button>
        </div>
        <hr width="100%" size="2">
        <div class="room">
            <img src="images/roomsQueen.png" alt="Queen Bed">
            <p>Queen Bed</p>
            <button class="learn-more"> <a href="#learnMore">Learn More</a></button>
        </div>
    </div>
</body>
</html>
