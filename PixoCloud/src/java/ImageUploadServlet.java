import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.UUID;
import java.util.List;

@WebServlet("/ImageUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 10024, // 1MB
                 maxFileSize = 1024 * 1024 * 100, // 10MB
                 maxRequestSize = 1024 * 1024 * 500) // 50MB
public class ImageUploadServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "images"; // Directory to store uploaded files
    private static final String[] allowedImageTypes = { "image/jpeg", "image/png", "image/gif", "image/WebP", "image/SVG"};

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Get the username from the session
        String username = (String) session.getAttribute("username");

        // Create directory if it doesn't exist
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Get the uploaded files
        List<Part> fileParts = (List<Part>) request.getParts();

        for (Part part : fileParts) {
            if (isAllowedImageType(part.getContentType())) {
                String originalFileName = getSubmittedFileName(part);
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String uniqueFileName = UUID.randomUUID().toString() + fileExtension; // Generate a unique filename
                String filePath = uploadPath + File.separator + uniqueFileName;

                // Check if the file with the same original filename already exists in the database
                if (isDuplicateOriginalFileName(username, originalFileName)) {
                    response.getWriter().println("File with the same original filename already exists.");
                    return;
                }

                // Save the file to the server with the unique filename
                try (InputStream input = part.getInputStream();
                     OutputStream output = new FileOutputStream(filePath)) {
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = input.read(buffer)) > 0) {
                        output.write(buffer, 0, length);
                    }
                } catch (Exception e) {
                    response.getWriter().println("Error uploading file: " + e.getMessage());
                    return;
                }

                // Save the file information (both unique and original filenames) to the database
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");
                    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO cloudimg (unique_filename, original_filename, username) VALUES (?, ?, ?)");
                    pstmt.setString(1, uniqueFileName);
                    pstmt.setString(2, originalFileName);
                    pstmt.setString(3, username);
                    pstmt.executeUpdate();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    response.getWriter().println("Error inserting into the database: " + e.getMessage());
                    return;
                }
            }
        }

        // Redirect to home.jsp
        response.sendRedirect("home.jsp");
    }

    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private boolean isDuplicateOriginalFileName(String username, String originalFileName) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name", "root", "");
            PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM cloudimg WHERE username = ? AND original_filename = ?");
            pstmt.setString(1, username);
            pstmt.setString(2, originalFileName);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                rs.close();
                pstmt.close();
                conn.close();
                return true; // Duplicate original filename found
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // No duplicate original filename found
    }

    private boolean isAllowedImageType(String contentType) {
        for (String allowedType : allowedImageTypes) {
            if (allowedType.equals(contentType)) {
                return true;
            }
        }
        return false;
    }
}
