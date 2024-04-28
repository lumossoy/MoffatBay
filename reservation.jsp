<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Make a Reservation</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
    $("#checkInDate").datepicker({
        minDate: 0,
        onSelect: function(selectedDate) {
            var minDate = new Date(selectedDate);
            minDate.setDate(minDate.getDate() + 1);
            $("#checkOutDate").datepicker("option", "minDate", minDate);
        }
    });
    $("#checkOutDate").datepicker({ minDate: '+1d' });

    $("#searchToggle").click(function() {
        $("#searchForm").toggle();
    });

    var roomCounter = 1;

    // Function to create a room form with the correct number of rooms
    function addRoom(roomNumber) {
        var newRoomForm = "<div class='room' id='room" + roomNumber + "'><strong>Room " + roomNumber + "</strong>" +
            "<div>" +
            "<label>Room Type:</label>" +
            "<select name='roomType'>" +
            "<option value='double full beds'>Double Full</option>" +
            "<option value='queen'>Queen</option>" +
            "<option value='double queen'>Double Queen</option>" +
            "<option value='king'>King</option>" +
            "</select><br>" +
            "<label>Number of Guests:</label>" +
            "<select name='totalGuests'>" +
            "<option>1</option>" +
            "<option>2</option>" +
            "<option>3</option>" +
            "<option>4</option>" +
            "<option>5</option>" +
            "</select><br>" +
            "</div></div>";
        return newRoomForm;
    }

    // add a room to the list
    $("#addRoomBtn").click(function() {
        roomCounter++;
        $("#additionalRooms").append(addRoom(roomCounter));
        if (roomCounter > 1) {
            $("#removeRoomBtn").show(); 
        }
    });

    // remove the most recent button
    $("#removeRoomBtn").click(function() {
        if (roomCounter > 1) {
            $("#room" + roomCounter).remove(); 
            roomCounter--;
            if (roomCounter === 1) {
                $("#removeRoomBtn").hide(); 
            }
        }
    });

    // Add initial room
    $("#additionalRooms").append(addRoom(roomCounter));  
});

//Redirect if not signed in
<% if (session.getAttribute("user") == null) { %>
    window.location.href = "login.jsp";  // Redirect to login page if user not signed in
<% } %>
</script>
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
    .nav a, #searchToggle a {
        text-decoration: none;
        color: #47525E;
        cursor: pointer;
    }
    .nav a:hover, #searchToggle a:hover {
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
        min-height: 450px;  // Set a minimum height to maintain form size
    }
    input, select, button {
        margin: 10px 0;
        padding: 10px;
        width: 200px;
    }
    button {
        background-color: #1CADFB;
        color: white;
        border: none;
        cursor: pointer;
    }
    .room {
    text-align: center;
    margin-top: 20px; /* Adds some spacing between rooms */
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
        <form action="ReservationServlet" method="post">
            <h2>Book Your Stay</h2>
            <label for="checkInDate">Check-in:</label>
            <input type="text" id="checkInDate" name="checkInDate" class="datepicker" required readonly><br>
            <label for="checkOutDate">Check-out:</label>
            <input type="text" id="checkOutDate" name="checkOutDate" class="datepicker" required readonly><br>
            <div id="roomsContainer">
                <div id="additionalRooms"></div>
            </div>
            <button type="button" id="addRoomBtn">Add Room</button><br>
            <button type="button" id="removeRoomBtn" style="display:none;">Remove Room</button><br>
            <button type="submit" name="action" value="createReservation">Complete Reservation</button><br><br>
        </form>
        <div id="searchToggle">Already have a reservation? <a>Click Here</a></div>
        <div id="searchForm" style="display:none;">
            <form action="ReservationServlet" method="POST">
                <label for="searchReservation">Confirmation Number: </label>
                <input type="search" id="searchReservation" name="searchReservation"><br>
                <button type="submit" name="action" value="searchReservation">Search Reservation</button>
            </form>
        </div>
        <!-- Display messages if any -->
        <div>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
