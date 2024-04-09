<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  
<title>Landing Page</title>

<style>
        /* Basic CSS for layout and styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: white;
            color: lightskyblue;
            font-family: Georgia;
            padding: 10px;
            text-align: left;
        }
        
        nav {
            float: right;
            backg
        }

        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        
        nav ul li a {
            color: lightslategrey;
            display: inline;
            text-decoration: none;
        }
        
        nav ul li a:hover {
            text-decoration: underline;
        }
        
        .content {
            padding: 20px;
            text-align: center;
            display: center;
        }
        
        .login-button {
            top: 10px;
            right: 10px;
            background-color: blue;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }
 </style>
 
</head>
<body>
	<header>
      <h1>Moffat Bay Lodge</h1>
        <div>
          <nav>
             <ul>
               <li><a href="#attractions">Attractions</a></li>
               <li><a href="#rooms">Rooms</a></li>
               <li><a href="#reservations">Reservations</a></li>
               <li><a href="#about">About Us</a></li>
               <li><a href="#contact">Contact Us</a></li>
               <li><button class="login-button"> <a href="login.jsp">Login</a></button></li>
             </ul>
          </nav>
        </div>
    </header>
    <div class="content">
        <!-- Our content here -->
        <h2>Welcome to Moffat Bay Lodge!</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida orci sed ultrices feugiat.</p>
        <!-- More content -->
    </div>
</body>
</html>