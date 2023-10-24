<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Process</title>
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
        
        .container p {
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String mobile_number = request.getParameter("mobile_number");

            // Establish a database connection
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");
                
                // Check if the username already exists
                pstmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
                pstmt.setString(1, username);
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    // Username already exists, display an error message
        %>
                    <h1>Registration Error</h1>
                    <p>Username already exists. Please choose a different username.</p>
        <%
                } else {
                    // Check if the email already exists
                    pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
                    pstmt.setString(1, email);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        // Email already exists, display an error message
        %>
                            <h1>Registration Error</h1>
                            <p>Email is already registered. Please use a different email.</p>
        <%
                    } else {
                        // Check if the mobile number already exists
                        pstmt = conn.prepareStatement("SELECT * FROM users WHERE mobile_number = ?");
                        pstmt.setString(1, mobile_number);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            // Mobile number already exists, display an error message
        %>
                            <h1>Registration Error</h1>
                            <p>Mobile number is already registered. Please use a different mobile number.</p>
        <%
                        } else {
                            // Insert the new user into the database
                            pstmt = conn.prepareStatement("INSERT INTO users (username, password, email, name, address, mobile_number) VALUES (?, ?, ?, ?, ?, ?)");
                            pstmt.setString(1, username);
                            pstmt.setString(2, password);
                            pstmt.setString(3, email);
                            pstmt.setString(4, name);
                            pstmt.setString(5, address);
                            pstmt.setString(6, mobile_number);
                            int rowsInserted = pstmt.executeUpdate();
                            
                            if (rowsInserted > 0) {
                                // Registration successful, display success message
        %>
                                <h1>Registration Successful</h1>
                                <p>User successfully registered.</p>
                                <p>You will be redirected to the home page in <span id="countdown">5</span> seconds.</p>
                                <script>
                                    var seconds = 5; // Set the number of seconds for the countdown
                                    var countdown = document.getElementById("countdown");
                                    var interval = setInterval(function() {
                                        seconds--;
                                        countdown.textContent = seconds;
                                        if (seconds <= 0) {
                                            clearInterval(interval);
                                            // Redirect to index.jsp
                                            window.location.href = "index.jsp";
                                        }
                                    }, 1000);
                                </script>
        <%
                            } else {
                                // Registration failed, display an error message
        %>
                                <h1>Registration Error</h1>
                                <p>Registration failed. Please try again.</p>
        <%
                            }
                        }
                    }
                }
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("An error occurred while closing resources: " + e.getMessage());
                }
            }
        %>
    </div>
</body>
</html>
