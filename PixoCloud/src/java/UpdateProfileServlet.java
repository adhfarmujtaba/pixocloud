import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateProfile.jsp")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address"); // Add this line to get the address
        String mobile = request.getParameter("mobile"); // Add this line to get the mobile number

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");

            // Update the SQL query to include the new fields (name, email, address, mobile)
            String query = "UPDATE users SET name=?, email=?, address=?, mobile_number=? WHERE username=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, address); // Set the address
            pstmt.setString(4, mobile); // Set the mobile number
            pstmt.setString(5, username);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            if (rowsAffected > 0) {
                // Update the session attributes with the new information
                session.setAttribute("name", fullName);
                session.setAttribute("email", email);
                session.setAttribute("address", address); // Set the address in the session
                session.setAttribute("mobile_number", mobile); // Set the mobile number in the session
                response.sendRedirect("updatedprofile.jsp");
            } else {
                response.getWriter().println("Profile update failed.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
