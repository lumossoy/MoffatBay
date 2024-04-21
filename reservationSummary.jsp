<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation Summary</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
        color: #47525E;
        background-image: url('images/mountainLandingPage.jpg');
        background-size: cover;
        height: 100vh;
    }
    #nav {
        background-color: white;
        color: #47525E;
        width: 100%;
        padding: 10px 0;
    }
    .nav {
        list-style: none;
        text-align: right;
        margin: 0;
        padding: 0;
    }
    .nav li {
        display: inline-block;
        padding: 10px;
    }
    .nav a {
        text-decoration: none;
        color: #47525E;
    }
    .nav a:hover {
        color: blue;
    }
    .centered {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 8px;
        min-height: 450px; 
    }
</style>
</head>
<body>
<div id='nav'>
    <nav>
			<ul class="nav">
				<li><a href="#attractions">Attractions</a></li>
				<li><a href="rooms.jsp">Rooms</a></li>
				<li><a href="reservation.jsp">Reservations</a></li>
				<li><a href="aboutUs.jsp">About Us</a></li>
				<li><a href="login.jsp"><button type="submit">Login</button></a></li>
			</ul>
    </nav>
</div>
<div class="centered">
    <h2>Reservation Summary</h2>
    <p>Name: ${reservationName}</p>
    <p>Check-In Date: ${Reservation.getCheckInDate()}</p>
    <p>Check-Out Date: ${Reservation.getCheckOutDate()}</p>
    <p>Room: ${Reservation.getRoomType()}</p>
    <p>Total Guests: ${Reservation.getTotalGuests()}</p>
    <p>Total Price: ${Reservation.getTotalCost()}</p>
</div>
</body>
</html>
