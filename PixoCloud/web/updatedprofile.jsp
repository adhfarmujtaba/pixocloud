<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        // If not logged in, redirect to the login page or display a message
        response.sendRedirect("index.jsp"); // You can replace this with your login page
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Updated Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
          h1 {
            color: #333;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            margin: 5px;
            background-color: #007bff;
            color: #fff;
            border-radius: 3px;
        }
        .edit-link {
            background-color: #28a745;
        }
    </style>
</head>
<body>
   <div class="container">
        <h1>Updated Profile</h1>
        <label for="username">Username:</label>
        <p><%= session.getAttribute("username") %></p>
        <label for="fullName">Full Name:</label>
        <p><%= session.getAttribute("name") %></p>
        <label for="email">Email:</label>
        <p><%= session.getAttribute("email") %></p>
        <label for="mobile">Mobile:</label>
        <p><%= session.getAttribute("mobile_number") %></p>
        <label for="address">Address:</label>
        <p><%= session.getAttribute("address") %></p>
        <p>Your profile has been updated successfully.</p>
        <a href="home.jsp">Go to Home</a>
        <a class="edit-link" href="edit_profile.jsp">Edit Profile Again</a>
    </div>
</body>
</html>
