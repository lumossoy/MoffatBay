<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>King Beds</title>
    <style>
    body {
    font-family: "Bree Serif", sans-serif;
    margin: 0;
    padding: 0;
}

.navigation header {
    background-color: #FFFFFF;
    width: 100%;
    height: 59px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 20px;
}

h1 {
    color: #1CADFB;
    font-family: "Berkshire Swash", cursive;
    font-size: 30px;
    line-height: 39px;
    margin: 0;
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

.login-button {
    background-color: #1CADFB;
    color: white;
    font-family: "Lato", sans-serif;
    border: none;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width: 118px;
    height: 30px;
}

.container h2 {
    color: #47525E;
    font-family: "Bree Serif", sans-serif;
    font-size: 30px;
    text-align: center;
}

.content {
    padding: 20px;
    text-align: center;
}

.content .top {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.content .top img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
}

.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: .3s;
    width: 75%;
    margin: auto;
    margin-top: 20px;
}

.card-title {
    text-align: center;
    font-size: 2em;
    color: #0BAAFF;
    font-weight: 400;
    background-color: #C8CDD2;
}

.card-content {
    padding: 2px 16px;
    text-align: left;
    color: #0BAAFF;
    background-color: #C8CDD2;
    
}
    </style>
</head>
<body>
    <div class="navigation">
        <header>
            <h1>Moffat Bay Lodge</h1>
            <nav>
                <ul>
                    <li><a href="#attractions">Attractions</a></li>
                    <li><a href="rooms.jsp">Rooms</a></li>
                    <li><a href="#reservations">Reservations</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><button class="login-button"><a href="login.jsp">Login</a></button></li>
                </ul>
            </nav>
        </header>
    </div>
    <div class="container">
        <hr width="100%" size="2">
        <h2>ROOMS</h2>
        <nav>
            <ul>
                <li><a href="doubleFull.jsp">Double Full Beds</a></li>
                <li><a href="queen.jsp">Queen</a></li>
                <li><a href="doubleQueen.jsp">Double Queen Bed</a></li>
                <li><a href="king.jsp">King</a></li>
            </ul>
        </nav>
        <hr width="100%" size="2">
    </div>
    <div class="content">
        <div class="top">
            <img src="images/king.png" alt="King Bed">
            <p>King Bed</p>
            <p>One King Sized Bed</p>
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
