<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>


<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver (if not done already)
        Class.forName("com.mysql.jdbc.Driver");

        // Create a database connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");

        // Prepare an SQL statement to retrieve user information
        pstmt = conn.prepareStatement("SELECT username, name, email, address, mobile_number FROM users WHERE username = ? AND password = ?");

        pstmt.setString(1, username);
        pstmt.setString(2, password);

        // Execute the query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Login successful, set session attributes with user information
            String name = rs.getString("name");
            String email = rs.getString("email");
            String address = rs.getString("address");
            String mobileNumber = rs.getString("mobile_number");
            
            session.setAttribute("username", username);
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("address", address);
            session.setAttribute("mobile_number", mobileNumber);
            
            response.sendRedirect("home.jsp");
        } else {
            // Invalid username or password, show an error message
        response.sendRedirect("index.jsp?notLoggedIn=incorrect");
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("An error occurred while closing resources: " + e.getMessage());
        }
    }
%>
