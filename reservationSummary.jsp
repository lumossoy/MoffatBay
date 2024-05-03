<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="myBean.Reservation" %>
<%@ page import="myBean.Room" %>
<%@ page import="java.util.ArrayList" %>
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
    * {
	box-sizing: border-box;
	}

	#logo {
	float: left;
	display: inline-block;
	width: 2%;
	}

	.clear {
	clear: both;
	}

	#nav {
	background-color: white;
	color: #47525E;
	width: 100%;
	}

	.nav {
	float: right;
	list-style: none;
	text-align: left;
	/*padding: 0px -10px 0px -10px; */
	margin: 0;
	}

	/*max-width: 768px*/
	.nav>li {
	display: Inline-block;
	padding: 10px 9px 10px 9px;
	}

	/*nav bar text*/
	.nav>li a {
	text-decoration: none;
	color: #47525E;
	font-size: 14px;
	padding: 5px 0px 5px 0px
	}

	.nav>li>a:hover {
	color: black;
	}

	.nav a.active {
	background-color: #f7f8fa;
	color: #019fc2;
	cursor: default;
	}

	/* Set a style for all buttons */
	button {
	background-color: #1CADFB;
	color: white;
	border: none;
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
		<a href="landingPage.jsp" target="blank"><img src="images/SalishSalmon.png" alt="Moffat Bay Logo" id="logo"></a>
		<nav>
			<ul class="nav">
				<li><a href="#attractions.jsp">Attractions</a></li>
				<li><a href="rooms.jsp">Rooms</a></li>
				<li><a href="reservation.jsp">Reservations</a></li>
				<li><a href="aboutUs.jsp">About Us</a></li>
				<li><a href="login.jsp"><button type="submit">Login</button></a></li>
			</ul>
		</nav>
		<div class="clear"></div>
	</div>
<div class="centered">
    <h2>Reservation Summary</h2>
    <p>Name: ${Reservation.getUserName()}</p>
    <p>Check-In Date: ${Reservation.cleanDate(Reservation.getCheckInDate())}</p>
    <p>Check-Out Date: ${Reservation.cleanDate(Reservation.getCheckOutDate())}</p>

<%
    ArrayList<Room> roomBookings = ((Reservation) session.getAttribute("Reservation")).getRoomBookings();
    for (int i = 0; i < roomBookings.size(); i++) {
        Room room = roomBookings.get(i);
%>
    <br>
    <h3>Room <%= i + 1 %></h3>
    <p>Room Type: <%= room.getRoomType() %></p>
    <p>Guests: <%= room.getTotalGuests() %></p>
    <p>Price: <%= room.getRoomPrice() %> per night</p>
<%
    }
%>
    <br>
    <p>Total Price: ${Reservation.getTotalPrice()}</p>
    <p>Confirmation Number: ${Reservation.getConfirmationNumber()}</p>
</div>
</body>
</html>

