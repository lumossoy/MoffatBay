<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	color: #47525E;
}
* {box-sizing: border-box}

h1 {
    font-family: 'Berkshire Swash';
    font-size: 25px;
    color: #1CADFB;
    text-align: center;
    margin-bottom: 15px;
}

p {
	text-align: center;
	font-weight: bold;
}

label {
	padding-left: 225px;
}

.fname {
	display: inline-flex;
 	margin-bottom: 5px;
 	justify-content: center;
 	align-items: center;

}
.lname {
	display: inline-flex;
 	margin-bottom: 5px;
 	margin-left: -150px;
 	justify-content: center;
 	align-items: center;

}

.lnameLabel {
	padding-left: 190px;
}

/* editing the size of the input fields */
input[type=text], input[type=tel], input[type=email], input[type=password] {
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


/* setting position of create account button */
.createAcctbtn {
  margin-left: 225px;
  padding: 20px;
  width: 50%;
}

/* image set to the right of the web page */
.bg-img {
  background-image: url("images/registerImage.png");
  background-repeat: no-repeat;
   width: 40%;
   position: absolute;
   right: 0px;
   height: 100%;
}

/* container elements */
.container {
   width: 50%;
   position: absolute;
   left: 30px;
   height: 100%;
   padding-left: 25px;
}


.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for create button when using small screens */ 
@media screen and (max-width: 300px) {
	.createAcctbtn {
     width: 100%;
  }
}
</style>
<body>
<div class="bg-img"></div> 
<form action="" method="POST">
  <div class="container">
    <h1>Moffat Bay Lodge</h1>
    <p>Welcome GUEST</p>
    <p style="padding-bottom: 15px;">Please complete the sign up form.</p>


    <label for="fname"><b>First Name</b></label><label for="lname"  class="lnameLabel"><b>Last Name</b></label><br>
    <div class="fname">
    <input type="text" placeholder="Enter First Name" name="fname" required>
    </div>
    <div class="lname">
    <input type="text" placeholder="Enter Last Name" name="lname" required><br>
    </div><br>
    <label for="telephone"><b>Telephone</b></label><br>
    <input type="tel" placeholder="Enter Telephone" name="telephone" required><br>

    <label for="email"><b>Email</b></label><br>
    <input type="email" placeholder="Enter Email" name="email" required><br>

    <label for="psw"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="psw" required><br>

    <label for="psw-confirm"><b>Confirm Password</b></label><br>
    <input type="password" placeholder="Confirm Password" name="psw-confirm" required><br>
    <div class="clearfix">
      <button type="submit" class="createAcctbtn">Create Account</button>
    </div>
    <p> Already have an account? <a href="login.jsp">Login! </a> </p>
  </div>
</form>


</body>
</html>
