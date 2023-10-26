<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 40px;
            text-align: center;
            width: 400px;
        }

        .container h1 {
            color: #333333;
            margin-bottom: 20px;
        }

        .container form {
            text-align: left; /* Set text alignment to left */
            margin-top: 20px;
        }

        .container label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            background-color: #f9f9f9;
            font-size: 16px;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .container input[type="text"]:focus,
        .container input[type="password"]:focus {
            border: 1px solid #3498db;
            outline: none;
        }

        .container input[type="submit"] {
            width: 100%;
            background-color: #3498db;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .container input[type="submit"]:hover {
            background-color: #2580b3;
        }

        .container p.logo {
            text-align: center;
        }

        .container img {
            max-width: 100px;
            max-height: 100px;
        }

        .container p.register-link {
            margin-top: 20px;
        }

        .container p.register-link a {
            color: #3498db;
            text-decoration: none;
        }

        .container p.register-link a:hover {
            text-decoration: underline;
        }
         video#background-video {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
        }
         body {
            background-color: transparent; /* Make the body background transparent */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="https://res.cloudinary.com/dzfcjmoon/image/upload/v1698131139/tlis1lumwv5rdz2hbxgl.png" alt="Your Logo">
        </div>
        <h1>Welcome Back!</h1>
        <%
        String notLoggedIn = request.getParameter("notLoggedIn");
        if ("true".equals(notLoggedIn)) {
        %>
            <p style="color: red;">You must log in first</p>
        <%
        }
        if ("incorrect".equals(notLoggedIn)) {
        %>
            <p style="color: red;">Incorrect username and password</p>
        <%
        }
        %>

        <form method="post" action="loginProcess.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br> <!-- Add line break for better spacing -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
            <p class="register-link">
                <a href="register.jsp">Register</a> if you don't have an account.
            </p>
        </form>
    </div>
   <video autoplay loop muted playsinline id="background-video">
        <source src="https://res.cloudinary.com/dzfcjmoon/video/upload/v1698303659/dt7cnqwhtldbokzfjzv5.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</body>
</html>
