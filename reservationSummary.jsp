<!-- Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez  -->
<!-- Purpose: Reservation summary page allowing users to view existing reservation information and delete if necessary  -->
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
    input, select, button {
        margin: 10px 0;
        padding: 10px;
        width: 200px;
    }
    .room {
    text-align: center;
    margin-top: 20px; /* Adds some spacing between rooms */
    }
    
    #completeReservationBtn:enabled {
        background-color: #1CADFB; 
        color: white;
    }
    
    #completeReservationBtn:disabled {
        background-color: #ccc;
        cursor: not-allowed; 
        color: white;
    }
    footer {
            position: fixed;
            bottom: 0;
            right: 0;
            background-color: #1CADFB;
            color: white;
            padding: 10px 20px;
            font-size: 14px;
        }

        footer a {
            color: white;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
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
                 <%if (session.getAttribute("user") != null){ %>
                <li><a href="logout.jsp"><button type="submit"> (${user.email}) Logout</button></a></li>
                <%}else {%>
                <li><a href="login.jsp"><button type="submit">Login</button></a></li>
                <%}%>
                </ul>
            </nav>
        </header>
    </div>
<div class="centered">
    <%-- Check if deleteMessage is present in request attributes --%>
    <% if (request.getAttribute("deleteMessage") != null) { %>
        <h2><%= request.getAttribute("deleteMessage") %></h2>
    <% } else { %>
        <h2>Reservation Summary</h2>
        <p>Name: <%= ((Reservation) session.getAttribute("Reservation")).getUserName() %></p>
        <p>Check-In Date: <%= ((Reservation) session.getAttribute("Reservation")).cleanDate(((Reservation) session.getAttribute("Reservation")).getCheckInDate()) %></p>
        <p>Check-Out Date: <%= ((Reservation) session.getAttribute("Reservation")).cleanDate(((Reservation) session.getAttribute("Reservation")).getCheckOutDate()) %></p>
        
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
        <% } %>
    <br>
    <p>Total Price: ${Reservation.getTotalPrice()}</p>
    <p>Confirmation Number: ${Reservation.getConfirmationNumber()}</p>
    <!-- Button to delete reservation -->
    <form action="ReservationSummaryServlet" method="post">
    <button type="submit">Delete Reservation</button>
    <% } %>
</form>
    
</div>
 <footer>
        <a href="landingPage.jsp">Back to Landing Page</a>
    </footer>
</body>
</html>

