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
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"] {
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
            margin-top: 10px;
        }
        
 
        a {
            text-decoration: none;
            padding: 5px 10px;
            margin: 5px;
            background-color: #007bff;
            color: #fff;
            border-radius: 3px;
            position: absolute; /* Add this */
            top: 10px; /* Adjust this value as needed */
            right: 10px; /* Adjust this value as needed */
        }
    </style>
</head>
<body>
    <h1>Edit Your Profile</h1>
    <form method="post" action="UpdateProfileServlet">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= session.getAttribute("username") %>" readonly>
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" value="<%= session.getAttribute("name") %>" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= session.getAttribute("email") %>" required>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= session.getAttribute("address") %>" required>
        <label for="mobile">Mobile Number:</label>
        <input type="text" id="mobile" name="mobile" value="<%= session.getAttribute("mobile_number") %>" required>
        <input type="submit" value="Save Changes">
     <a href="home.jsp">Go to Home</a>

    </form>
        </body>
</html>
