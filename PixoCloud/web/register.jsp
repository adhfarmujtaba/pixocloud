<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        video#background-video {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
        }
        
        body {
            background-color: transparent;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: white;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
        
        .container h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        
        .container label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
            font-size: 14px;
             font-weight: bold;
        }
        
        .container input[type="text"],
        .container input[type="password"],
        .container input[type="email"],
        .container textarea {
            width: 98%;
            padding: 10px;
            border: none;
            background-color: transparent;
            border-bottom: 1px solid #4caf50;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        
        .container input[type="text"]:focus,
        .container input[type="password"]:focus,
        .container input[type="email"]:focus,
        .container textarea:focus {
            border-bottom: 1px solid #3498db;
        }
        
        .container input[type="submit"] {
            width: 100%;
            background-color: #3498db;
            color: #ffffff;
            border: none;
            padding: 12px;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .container input[type="submit"]:hover {
            background-color: #2580b3;
        }
    </style>
</head>
<body>
    <video autoplay loop muted playsinline id="background-video">
        <source src="https://res.cloudinary.com/dzfcjmoon/video/upload/v1698303659/dt7cnqwhtldbokzfjzv5.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <div class="container">
        <h1>User Registration</h1>
        <form method="post" action="registerProcess.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea><br>
            <label for="mobile_number">Mobile Number:</label>
            <input type="text" id="mobile_number" name="mobile_number" required><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
