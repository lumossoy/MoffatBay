<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms</title>
    <link rel="stylesheet" href="rooms.css">
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
                    <li><a href="#contact">Contact Us</a></li>
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
            <img src="roomsDoubleFull.png" alt="Double Full Bed">
            <p>Double Full Bed</p>
            <button class="learn-more"> <a href="#learnMore">Learn More</a></button>
        </div>
        <hr width="100%" size="2">
        <div class="room">
            <img src="roomsQueen.png" alt="Queen Bed">
            <p>Queen Bed</p>
            <button class="learn-more"> <a href="#learnMore">Learn More</a></button>
        </div>
    </div>
</body>
</html>