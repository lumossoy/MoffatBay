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
    
	// Function for calendar choice of reservation
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

    // Disable the "Complete Reservation" button initially
    $("#completeReservationBtn").prop("disabled", true);

    // Enable the button when both dates are selected
    $("#checkInDate, #checkOutDate").on("change", function() {
        const checkInDate = $("#checkInDate").val();
        const checkOutDate = $("#checkOutDate").val();

        if (checkInDate && checkOutDate) {
            $("#completeReservationBtn").prop("disabled", false);
        } else {
            $("#completeReservationBtn").prop("disabled", true);
        }
    });
    
    // Disable the Complete Reservation button initially
    $("#completeReservationBtn").prop("disabled", true);

    // Enable the button when both dates are selected
    $("#checkInDate, #checkOutDate").on("change", function() {
        const checkInDate = $("#checkInDate").val();
        const checkOutDate = $("#checkOutDate").val();

        if (checkInDate && checkOutDate) {
            $("#completeReservationBtn").prop("disabled", false);
        } else {
            $("#completeReservationBtn").prop("disabled", true);
        }
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

    // Add a room to the list
    $("#addRoomBtn").click(function() {
        roomCounter++;
        $("#additionalRooms").append(addRoom(roomCounter));
        if (roomCounter > 1) {
            $("#removeRoomBtn").show(); 
        }
    });

    // Remove the most recent room button
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
    window.location.href = "login.jsp";
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
            <button type="submit" id="completeReservationBtn" name="action" value="createReservation" disabled>
            Complete Reservation</button><br><br>
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
