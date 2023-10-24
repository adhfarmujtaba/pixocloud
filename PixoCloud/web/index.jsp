<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page session="true"%>

<%
    String username = (String)session.getAttribute("username");
    if (username != null) {
        response.sendRedirect("home.jsp");
        return; // Stop further processing
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
        .container input[type="password"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-bottom: 1px solid #dddddd;
            background-color: #f9f9f9;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        
        .container input[type="text"]:focus,
        .container input[type="password"]:focus {
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
        <h1>Welcome Back!</h1>
        <%
String notLoggedIn = request.getParameter("notLoggedIn");
if ("true".equals(notLoggedIn)) {
%>
    <p style="color: red;">You must log in first</p>
<%
}
%>
<!-- Rest of your "index.jsp" content -->

        <form method="post" action="loginProcess.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
            <p>
        <a href="register.jsp">Register</a> if you don't have an account.
    </p>
        </form>
    </div>
    
</body>
</html>
