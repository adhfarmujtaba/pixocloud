import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;

@WebServlet("/ImageDeleteServlet")
public class ImageDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedImages = request.getParameter("selectedImages").split(",");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");

            for (String imageName : selectedImages) {
                File imageFile = new File(getServletContext().getRealPath("") + File.separator + "images" + File.separator + imageName);
                
                // Check if the file exists before attempting to delete
                if (imageFile.exists() && imageFile.delete()) {
                    PreparedStatement pstmt = conn.prepareStatement("DELETE FROM cloudimg WHERE unique_filename = ?");
                    pstmt.setString(1, imageName);
                    pstmt.executeUpdate();
                    pstmt.close();
                }
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database-related errors
            response.getWriter().println("Error deleting images: " + e.getMessage());
            e.printStackTrace();
            return;
        } catch (Exception e) {
            // Handle other exceptions
            response.getWriter().println("Error deleting images: " + e.getMessage());
            e.printStackTrace();
            return;
        }

        // Redirect back to home.jsp after successful deletion
        response.sendRedirect("home.jsp");
    }
}
