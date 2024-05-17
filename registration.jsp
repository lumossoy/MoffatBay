<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    color: #47525E;
}

* {
    box-sizing: border-box
}

h1 {
    font-family: 'Berkshire Swash';
    font-size: 55px;
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

.fname, .lname {
    display: inline-flex;
    margin-bottom: 5px;
    justify-content: center;
    align-items: center;
}

.lnameLabel {
    padding-left: 190px;
}

input[type=text], input[type=tel], input[type=email], input[type=password] {
    width: 50%;
    padding: 15px;
    margin: 5px 0 22px 225px;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

.lname input[type=text] {
    margin-left: 60px;
    width: 70%
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

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
    opacity: 1;
}

.createAcctbtn {
    margin-left: 225px;
    padding: 20px;
    width: 50%;
    background-color: lightgrey; 
    cursor: not-allowed; 
}

.createAcctbtn:disabled {
    opacity: 0.5; 
}

.bg-img {
    position: absolute;
    right: 0px;
    width: 950px;
  	height: 930px;
  	object-fit: cover;
}

.container {
    width: 50%;
    position:absolute;
    left: 30px;
    height: 100%;
    padding-left: 25px;
}

.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

@media screen and (max-width: 300px) {
    .createAcctbtn {
        width: 100%;
    }
}
</style>
<script>
function validateForm() {
    var firstName = document.getElementsByName("firstName")[0].value;
    var lastName = document.getElementsByName("lastName")[0].value;
    var telephone = document.getElementsByName("telephone")[0].value;
    var email = document.getElementsByName("email")[0].value;
    var passwordInitial = document.getElementsByName("password")[0].value;
    var passwordConfirm = document.getElementsByName("passwordConfirm")[0].value;
    var submitButton = document.querySelector(".createAcctbtn");
    var passwordMessage = document.getElementById("passwordMessage");
    var emailMessage = document.getElementById("emailMessage");
    var telephoneMessage = document.getElementById("telephoneMessage");

    passwordMessage.innerHTML = '';
    emailMessage.innerHTML = '';
    telephoneMessage.innerHTML = '';
    passwordMessage.style.color = 'red';
    emailMessage.style.color = 'red';
    telephoneMessage.style.color = 'red';
    submitButton.disabled = true;

    if (!email.includes('@') && email.trim() !== '') {
        emailMessage.innerHTML = 'Invalid email';
        return;
    }
    if (!/^\d{3}-\d{3}-\d{4}$/.test(telephone) && telephone.trim() !== '') {
        telephoneMessage.innerHTML = 'Telephone must be written as XXX-XXX-XXXX';
        return;
    }
    if (passwordInitial !== passwordConfirm && passwordInitial.trim() !== '' && passwordConfirm.trim() !== '') {
        passwordMessage.innerHTML = 'Passwords do not match';
        return;
    }
    if (passwordInitial.length < 8 && passwordInitial.trim() !== '') {
        passwordMessage.innerHTML = 'Password must be at least 8 characters long!';
        return;
    }
    if (!/[A-Z]/.test(passwordInitial) && passwordInitial.trim() !== '') {
        passwordMessage.innerHTML = 'Password must contain at least one uppercase letter!';
        return;
    }
    if (!/\d/.test(passwordInitial) && passwordInitial.trim() !== '') {
        passwordMessage.innerHTML = 'Password must contain at least one integer!';
        return;
    }
    if (firstName.trim() !== '' && lastName.trim() !== '' && telephone.trim() !== '' && email.trim() !== '' && passwordInitial.trim() !== '' && passwordConfirm.trim() !== '' && passwordMessage.innerHTML === '' && emailMessage.innerHTML === '' && telephoneMessage.innerHTML === '') {
        passwordMessage.innerHTML = '';
        submitButton.disabled = false;
        submitButton.style.backgroundColor = '#1CADFB';
    }
}
</script>
</head>
<body>
<img src="images/registerImage2.png" alt="registerImage" class="bg-img">
<form action="signup" method="POST">
    <div class="container">
        <h1>Moffat Bay Lodge</h1>
        <p>Welcome GUEST</p>
        <p style="padding-bottom: 15px;">Please complete the sign up form.</p>
        <label for="fname"><b>First Name</b></label><label for="lname" class="lnameLabel"><b>Last Name</b></label><br>
        <div class="fname">
            <input type="text" placeholder="Enter First Name" name="firstName" required onkeyup="validateForm()" onchange="validateForm()">
        </div>
        <div class="lname">
            <input type="text" placeholder="Enter Last Name" name="lastName" required onkeyup="validateForm()" onchange="validateForm()"><br>
        </div>
        <br> <label for="telephone"><b>Telephone</b></label><br>
        <input type="tel" placeholder="Enter Telephone" name="telephone" required onkeyup="validateForm()" onchange="validateForm()"><br>
        <div id="telephoneMessage" style="padding-left: 225px;"></div>
        <label for="email"><b>Email</b></label><br>
        <input type="email" placeholder="Enter Email" name="email" required onkeyup="validateForm()" onchange="validateForm()"><br>
        <div id="emailMessage" style="padding-left: 225px;"></div>
        <label for="password"><b>Password</b></label><br>
        <input type="password" placeholder="Enter Password" name="password" required onkeyup="validateForm()" onchange="validateForm()"><br>
        <label for="passwordConfirm"><b>Confirm Password</b></label><br>
        <input type="password" placeholder="Confirm Password" name="passwordConfirm" required onkeyup="validateForm()" onchange="validateForm()"><br>
        <div id="passwordMessage" style="padding-left: 225px;"></div>
        <div class="clearfix">
            <button type="submit" class="createAcctbtn" disabled>Create Account</button>
        </div>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <div style="color: red; text-align: center;"><%= message %></div>
        <%
            }
        %>
        <p>
            Already have an account? <a href="login.jsp">Login! </a>
        </p>
    </div>
</form>
</body>
</html>
