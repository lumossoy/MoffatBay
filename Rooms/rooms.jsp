<!-- Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez  -->
<!-- Purpose: Rooms page displaying all available room types with clickable buttons for more information  -->
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
            width: 100%;
            height: 59px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        h1 {
            color: #1CADFB;
            font-family: "Berkshire Swash", cursive;
            font-size: 30px;
            line-height: 39px;
            margin: 0;
        }

        .logo a {
            text-decoration: none;
            color: #1CADFB;
        }

        .logo a:hover {
            text-decoration: none;
        }

        .logo a:visited {
            color: #1CADFB;
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

        .slideshow-container {
            position: relative;
            max-width: 900px;
            margin: auto;
        }

        .mySlides {
            display: none;
            text-align: center;
        }

        .mySlides img {
            width: 100%;
            height: 450px;
            object-fit: cover;
        }

        .text {
            color: #333333;
            font-size: 20px;
            padding: 8px 12px;
            text-align: center;
        }

        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        .learn-more {
            display: inline-block;
            margin-top: 10px;
        }

        .learn-more a {
            color: white;
            text-decoration: none;
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
                    <li><a href="aboutUS.jsp">About Us</a></li>
                    <%if (session.getAttribute("user") != null){ %>
                        <li><a href="logout.jsp"><button type="submit"> (${user.email}) Logout</button></a></li>
                    <%}else {%>
                        <li><a href="login.jsp"><button type="submit">Login</button></a></li>
                    <%}%>
                </ul>
            </nav>
        </header>
    </div>
    <div class="container">
        <hr width="100%" size="2">
        <h2>ROOMS</h2>
        <hr width="100%" size="2">
    </div>
    <div class="slideshow-container">

        <div class="mySlides">
            <img src="images/roomsDoubleFull.png" alt="Double Full Bed">
            <div class="text">Double Full Bed</div>
            <div class="learn-more"><button><a href="doubleFull.jsp">Learn More</a></button></div>
        </div>
      
        <div class="mySlides">
            <img src="images/roomsQueen.png" alt="Queen Bed">
            <div class="text">Queen Bed</div>
            <div class="learn-more"><button><a href="queen.jsp">Learn More</a></button></div>
        </div>
      
        <div class="mySlides">
            <img src="images/doubleQueen.png" alt="Double Queen Bed">
            <div class="text">Double Queen Bed</div>
            <div class="learn-more"><button><a href="doubleQueen.jsp">Learn More</a></button></div>
        </div>
      
        <div class="mySlides">
            <img src="images/king.png" alt="King Bed">
            <div class="text">King Bed</div>
            <div class="learn-more"><button><a href="king.jsp">Learn More</a></button></div>
        </div>
      
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
        <span class="dot" onclick="currentSlide(4)"></span> 
    </div>

    <script>
        let slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none"; 
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block"; 
            dots[slideIndex-1].className += " active";
        }
    </script>
    <!-- Footer -->
    <footer>
        <a href="landingPage.jsp">Back to Landing Page</a>
    </footer>
</body>
</html>
