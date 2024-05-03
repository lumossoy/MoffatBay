<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1">

<title>Attractions Page</title>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
	color: #47525E;
}

h2 {
	color: red;
	text-align: center;
	font-weight: bolder;
	font-size: x-large;
}

h3 {
	color: white;
	text-align: center;
	font-weight: 900;
	font-size: xx-large;
	margin-top: -15px;
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

.register {
	padding: 14px 55px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	opacity: 0.9;
	position: absolute;
	left: 46%;
	bottom: 350px;
}

.bg {
	height: 100vh;
	width: 100%;
}

.topleft {
	color: red;
	position: absolute;
	top: 65px;
	left: 16px;
	font-size: 25px;
}

.centered {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}


/*Css for image slideshow*/

img {
	vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
	position: relative;
}

/* Hide the images by default */
.attractionSlides {
	display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
	cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
	cursor: pointer;
	position: absolute;
	top: 40%;
	width: auto;
	padding: 16px;
	margin-top: -50px;
	color: white;
	font-weight: bolder;
	font-size: 35px;
	border-radius: 0 10px 10px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Numbered text for images 1-4 */
.imgNum {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* Container for image text */
.caption-container {
	font-size: x-large;
	text-align: center;
	background-color: black;
	padding: 8px 16px;
	color: white;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Four columns side by side */
.column {
	float: left;
	width: 25%;
}

/* Add a transparency effect for thumnbail images */
.moffatTN {
	opacity: 0.6;
}

.active,
.moffatTN:hover {
	opacity: 1;
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
    <!-- Container for the image gallery -->
<div class="container">

  <!-- Full-width images with numbered text -->
  <div class="attractionSlides">
    <div class="imgNum">1 / 4</div>
      <img src="images/hiking1.png" style = "width:100%">
  </div>

  <div class="attractionSlides">
    <div class="imgNum">2 / 4</div>
      <img src="images/kayaking.png" style = "width:100%">
  </div>

  <div class="attractionSlides">
    <div class="imgNum">3 / 4</div>
      <img src="images/scuba-diving.png" style="width:100%">
  </div>

  <div class="attractionSlides">
    <div class="imgNum">4 / 4</div>
      <img src="images/whale-watching.png" style="width:100%">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="nextSlide(-1)">&#10094;</a>
  <a class="next" onclick="nextSlide(1)">&#10095;</a>

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  <div class="row">
    <div class="column">
      <img class="moffatTN cursor" src="images/hiking1.png" style = "width:100%;" onclick="currentSlide(1)" alt = "Have an adventure on our various hiking trails">
    </div>
    <div class="column">
      <img class="moffatTN cursor" src="images/kayaking.png" style = "width:100%" onclick = "currentSlide(2)"  alt = "Enjoy kayaking our illustrous rivers">
    </div>
    <div class="column">
      <img class="moffatTN cursor" src="images/scuba-diving.png" style = "width:100%" onclick = "currentSlide(3)"  alt = "Scuba dive and visit the world's finest wilderness benath the waves">
    </div>
    <div class="column">
      <img class="moffatTN cursor" src="images/whale-watching.png" style = "width:100%" onclick = "currentSlide(4)"  alt = "Relax and watch the whales">
    </div>
  </div>
</div>
<script>
let slideIndex = 1;
showSlides(slideIndex);

function nextSlide(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("attractionSlides");
  let dots = document.getElementsByClassName("moffatTN");
  let captionText = document.getElementById("caption");
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
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
</body>
</html>