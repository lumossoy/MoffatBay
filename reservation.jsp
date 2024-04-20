<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%if (request.isRequestedSessionIdValid() != true){ 
    	response.sendRedirect("landingPage.jsp");}%>
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
        // Initialize the check-in datepicker
        $("#checkInDate").datepicker({
            minDate: 0, // Disallow dates before today
            onSelect: function(selectedDate) {
                // Set the minimum date for the check-out datepicker to be the day after the selected start date
                var minDate = new Date(selectedDate);
                minDate.setDate(minDate.getDate() + 1);
                $("#checkOutDate").datepicker("option", "minDate", minDate);
            }
        });

        // Initialize the check-out datepicker
        $("#checkOutDate").datepicker({
            minDate: '+1d' // Disallow dates before tomorrow
        });
    });
    
    function getPrice() {
    	var price;
    	let arrivalDate = new Date(document.getElementById("checkInDate").value);
    	let departDate = new Date(document.getElementById("checkOutDate").value);
    	
    	let daysDiff = departDate.getTime() - arrivalDate.getTime();
    	let Difference_In_Days = Math.round(daysDiff / (1000 * 3600 * 24));
    	
    	console.log("Total number of days between dates:\n" + arrivalDate + " and " +
        		departDate + " is: " + Difference_In_Days + " days");
    	
    	let guest = document.getElementById("totalGuests").value;
    	console.log(guest);
    	if (guest >= 3) {
    		console.log("this is a test for 3 or more");
    		price = 157.50;
    		price = price * Difference_In_Days;
    		console.log(price);
    		document.getElementById("totalPrice").innerHTML = "$" + price;
    		document.getElementById("totalPrice").value = price;
    	} else {
    		price = 120.75;
    		price = price * Difference_In_Days;
    		console.log(price);
    		document.getElementById("totalPrice").innerHTML = "$" + price;
    		document.getElementById("totalPrice").value = price;
    	}
    	
    }

    // Redirect if not signed in
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
    .nav a {
        text-decoration: none;
        color: #47525E;
    }
    .nav a:hover {
        color: black;
    }
    .centered {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 8px;
    }
    input, select {
        margin: 10px 0;
        padding: 10px;
        width: 200px;
    }
    button {
        background-color: #1CADFB;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }
</style>
</head>
<body>
    <div id='nav'>
        <nav>
            <ul class="nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="reservation.jsp">Reservations</a></li>
                <li><a href="about.jsp">About</a></li>
				<li><a href="landingPage.jsp"><button type="submit">Logout</button></a></li>
            </ul>
        </nav>
    </div>
    <div class="centered">
        <form action="reserve" method="post">
            <h2>Book Your Stay</h2>
            <label for="checkInDate">Check-in:</label>
            <input type="text" id="checkInDate" name="checkInDate" class="datepicker" required><br>
            <label for="checkOutDate">Check-out:</label>
            <input type="text" id="checkOutDate" name="checkOutDate" class="datepicker" required><br>
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <option value="doublefull">Double Full</option>
                <option value="queen">Queen</option>
                <option value="doublequeen">Double Queen</option>
                <option value="king">King</option>
            </select><br>
            <label for="totalGuests">Number of Guests:</label>
            <select id="totalGuests" name="totalGuests" onchange="getPrice()">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option >5</option>
            </select><br>
			<label for="totalPrice" >Price:</label>
            <input id = "totalPrice" value="${totalPrice}" disabled><br><br>
            <button type="submit">Book</button>
        </form>
        <!-- Add this section after your form -->
        <div>
            <% if (request.getAttribute("confirmationNum") != null) { %>
                <p>Confirmation Number: <%= request.getAttribute("confirmationNum") %></p>
            <% } %>
            <% if (request.getAttribute("totalPrice") != null) { %>
                <p>Total Cost: $<%= request.getAttribute("totalPrice") %></p>
            <% } %>
        </div>
        
    </div>
</body>
</html>
