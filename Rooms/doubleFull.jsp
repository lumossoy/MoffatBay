<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Double Full Bed</title>
    <style>
        body {
            font-family: "Bree Serif", sans-serif;
            margin: 0;
            padding: 0;
        }
        
        * {
			box-sizing: border-box;
		}

		#logo {
			float: left;
			display: inline-block;
			width: 2%;
		}

        .navigation {
            background-color: #FFFFFF;
            width: 100%;
            height: 59px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .navigation h1 {
            color: #1CADFB;
            font-family: "Berkshire Swash", cursive;
            font-size: 30px;
            line-height: 39px;
            margin: 0;
            display: flex;
            align-items: center;
        }

        .navigation h1 img {
            margin-right: 10px;
            width: 50px; /* Adjust size as needed */
            height: auto;
        }

        .nav {
            list-style: none;
            text-align: right;
            margin: 0;
            padding: 0;
        }

        .nav>li {
            display: inline-block;
            margin-left: 10px;
        }

        .nav>li>a {
            text-decoration: none;
            color: #47525E;
            font-size: 14px;
            padding: 5px 10px;
        }

        .nav>li>a:hover {
            color: black;
        }

        .nav a.active {
            background-color: #f7f8fa;
            color: #019fc2;
            cursor: default;
        }

        button {
            background-color: #1CADFB;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
        .container h2 {
            color: #47525E;
            font-family: "Bree Serif", sans-serif;
            font-size: 30px;
            text-align: center;
        }
        
        .roomNav {
            text-align: center; 
            margin-top: 10px;
        }

        .roomNav ul {
            padding: 0;
            margin: 0;
            list-style-type: none;
        }

        .roomNav ul li {
            display: inline;
            margin-right: 10px;
        }

        .roomNav ul li a {
            text-decoration: none;
            color: #47525E;
            font-size: 14px;
            padding: 5px 10px;
        }

        .roomNav ul li a:hover {
            color: black;
        }

        .content {
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start; 
            flex-wrap: wrap;
        }

        .top {
            flex: 0 0 40%; 
            text-align: center;
            margin-bottom: 20px; 
        }

        .top img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: .3s;
            width: 50%; 
            margin-top: 20px;
        }

        .card-title {
            text-align: center;
            font-size: 2em;
            color: #0BAAFF;
            font-weight: 400;
            background-color: white;
        }

        .card-content {
            padding: 2px 16px;
            text-align: left;
            color: black;
            background-color: white;
        }
    </style>
</head>
<body>
    <div id='nav'>
        <img src="images/SalishSalmon.png" alt="Moffat Bay Logo" id="logo">
        <nav>
            <ul class="nav">
                <li><a href="#attractions">Attractions</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="#reservations">Reservations</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="login.jsp"><button type="submit">Login</button></a></li>
            </ul>
        </nav>
    </div>
    
    <div class="container">
        <hr width="100%" size="2">
        <h2>ROOMS</h2>
        <hr width="100%" size="2">
        <div class="roomNav">
            <ul>
                <li><a href="doubleFull.jsp" style="color: #1CADFB">Double Full Bed</a></li>
                <li><a href="queen.jsp">Queen</a></li>
                <li><a href="doubleQueen.jsp">Double Queen Bed</a></li>
                <li><a href="king.jsp">King</a></li>
            </ul>
        </div>
        <hr width="100%" size="2">
    </div>
    <div class="content">
        <div class="top">
            <img src="images/roomsDoubleFull.png" alt="Double Full Bed" style="width:325px">
            <p style="color: #1CADFB">Two Full Sized Beds</p>
        </div>
        <div class="card">
            <div class="card-title">Amenities</div>
            <div class="card-content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin massa ex, elementum ut nisi sed, ullamcorper tristique ante. Proin justo odio, lobortis in augue eu, efficitur pellentesque nulla. Maecenas sagittis feugiat finibus. Donec ac nulla ac nulla semper venenatis in quis purus. Duis tempor viverra ligula posuere scelerisque. Donec sit amet tellus eget leo consectetur dictum vehicula non leo.</p>
                <p>Suspendisse et nibh ut quam consectetur interdum in ac augue. Vestibulum viverra tincidunt augue, quis aliquet eros. Aliquam mauris lectus, dictum eu elit at, tempus mattis massa. Vivamus ac nunc vestibulum, consectetur quam eget, tristique nibh. Ut ultricies nulla at euismod tincidunt.</p>
                <p>Mauris iaculis augue a purus efficitur, in pharetra urna tempus.</p>
            </div>
        </div>
    </div>
</body>
</html>
