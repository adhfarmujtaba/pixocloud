<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-top: 50px;
        }
        
        .container h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 30px;
        }
        
        .container form {
            margin-top: 20px;
        }
        
        .container label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
            font-size: 14px;
        }
        
        .container input[type="text"],
        .container input[type="password"],
        .container input[type="email"],
        .container textarea {
            width: 100%;
            padding: 12px;
            border: none;
            border-bottom: 1px solid #dddddd;
            background-color: #f9f9f9;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        
        .container input[type="text"]:focus,
        .container input[type="password"]:focus,
        .container input[type="email"]:focus,
        .container textarea:focus {
            border-bottom: 1px solid #4caf50;
            outline: none;
        }
        
        .container input[type="submit"] {
            width: 100%;
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            padding: 12px;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
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
