<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  
<title>Landing Page</title>

<style>
body {
	margin:0;
    padding: 0;
	font-family: Arial, Helvetica, sans-serif;
	color: #47525E;
}

h1 {
    font-family: 'Berkshire Swash';
    color: #1CADFB;
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

* {box-sizing: border-box;}

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
.nav > li {                                                             
    display:Inline-block;
    padding: 10px 9px 10px 9px;                               
}

/*nav bar text*/
.nav > li a {                                               
	text-decoration: none;
	color: #47525E;
	font-size: 14px;
	padding: 5px 0px 5px 0px
 }

 .nav > li > a:hover {
     color: black;*/
 }
 
 /* Set a style for all buttons */
button {
  background-color: #1CADFB;
  color: white;
  border: none;
  
}

.register {
	padding: 14px 55px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	opacity: 0.9;
	position:absolute; 
	left:46%;
	bottom:350px;
  
 }
 
.bg {
	height: 100vh;
	width: 100%;
}

.centered {
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
}

 </style>
 
</head>
<body>
	<div id='nav'>	
    	<img src="images/SalishSalmon.jpg" id="logo">
		<nav>   
			<ul class="nav">
				<li><a href="#attractions">Attractions</a></li>
				<li><a href="#rooms">Rooms</a></li>
	      		<li><a href="#reservations">Reservations</a></li>
	      		<li><a href="#about">About Us</a></li>
	      		<li><a href="login.jsp"><button type="submit">Login</button></a></li>
	   		</ul>
		</nav>
	<div class="clear"></div>
	</div>
	<div class="content">
		
        <!-- Our content here -->
        <div class="centered"><h2>Enjoy out luxury Lodges</h2><br><h3>Book your vacation at a Dream Location</h3></div>
        <!-- More content -->
    </div><img class="bg" src="images/mountainLandingPage.jpg">
    <a href="registration.jsp"><button class="register" type="submit">Sign up</button></a>
</body>
</html>
