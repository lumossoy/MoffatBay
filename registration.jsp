<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="registration.css">
<title>Registration Page</title>
</head>
<body>
<div class="bg-img"></div> 
<form action="signup" method="POST">
  <div class="container">
    <h1>Moffat Bay Lodge</h1>
    <p>Welcome GUEST</p>
    <p style="padding-bottom: 15px;">Please complete the sign up form.</p>
	<!-- also need to add password verification to ensure password matches and meet requirements//hashing ensure 
         * users cannot enter undesired elements or characters into the fields-->
    <label for="fname"><b>First Name</b></label><label for="lname"  class="lnameLabel"><b>Last Name</b></label><br>
    <div class="fname">
    <input type="text" placeholder="Enter First Name" name="firstName" required>
    </div>
    <div class="lname">
    <input type="text" placeholder="Enter Last Name" name="lastName" required><br>
    </div><br>
    <label for="telephone"><b>Telephone</b></label><br>
    <input type="tel" placeholder="Enter Telephone" name="telephone" required><br>

    <label for="email"><b>Email</b></label><br>
    <input type="email" placeholder="Enter Email" name="email" required><br>

    <label for="password"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="password" required><br>

    <label for="psw-confirm"><b>Confirm Password</b></label><br>
    <input type="password" placeholder="Confirm Password" name="psw-confirm" required><br>
    <div class="clearfix">
      <button type="submit" class="createAcctbtn">Create Account</button>
    </div>
    <p> Already have an account? <a href="login.jsp">Login! </a> </p>
  </div>
</form>