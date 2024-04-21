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

        * {
            box-sizing: border-box;
        }

        #logo {
            float: left;
            display: inline-block;
            width: 2%;
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

        #nav {
            background-color: white;
            color: #47525E;
            width: 100%;
            padding: 10px 0;
        }

        .nav {
            float: right;
            list-style: none;
            text-align: left;
            margin: 0;
            padding: 0;
        }

        .nav>li {
            display: inline-block;
            margin-right: 10px;
        }

        .nav>li>a {
            text-decoration: none;
            color: #47525E;
            font-size: 14px;
            padding: 5px 10px;
        }

        .nav>li>a:hover {
            color: black;
        }

        .nav a.active {
            background-color: #f7f8fa;
            color: #019fc2;
            cursor: default;
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
    <div id='nav'>
        <img src="images/SalishSalmon.png" alt="Moffat Bay Logo" id="logo">
        <nav>
            <ul class="nav">
                <li><a href="#attractions">Attractions</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="#reservations">Reservations</a></li>
                <li><a href="aboutUs.jsp">About Us</a></li>
                <li><a href="login.jsp"><button type="submit">Login</button></a></li>
            </ul>
        </nav>
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
