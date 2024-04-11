<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Moffat Bay Test Login</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	color: #47525E;
}
* {box-sizing: border-box}

h1 {
    font-family: 'Berkshire Swash';
    font-size: 35px;
    color: #1CADFB;
    text-align: center;
    margin-top: 105px;
    margin-bottom: 25px;
}

p {
	text-align: center;
}

label {
	padding-left: 225px;
}

.container {
	align-content: center;
	justify-items: center;
}

.bg-img {
	float: left;
	background-repeat: no-repeat;
	height:100vh;
	width: 50%;
}

/* editing the size of the input fields */
input[type=email], input[type=password] {
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 225px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* setting the style for button */
button {
  background-color: #1CADFB;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}


/* setting position of login button */
.loginbtn {
  margin-left: 225px;
  padding: 20px;
  width: 50%;
}

</style>
</head>
<body>
	<img src="images/loginImage.png" alt="loginImage" class="bg-img">
    <div class = "container">
        <h1>Moffat Bay Lodge</h1>
        <p style="font-weight: bold;">Welcome GUEST!</p>
        <p style="font-weight: bold;">Please login to continue.</p><br><br><br>
        <form action="login" method="post">
            <label for="email">Email:</label><br>
            <input type="email" placeholder="Enter Email" name="email" size="30">
            <br><br>
            <label for="password">Password:</label><br>
            <input type="password" placeholder="Password" name="password" size="30"><br>
            <br>${message}          
            <button type="submit" class="loginbtn">Login</button>
            <p>Don't have an account? <a href="registration.jsp">Sign Up!</a> </p>
        </form>
    </div>
</body>
</html>
