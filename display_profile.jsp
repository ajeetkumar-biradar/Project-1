<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Display Image</title>
</head>
<body>
    <%
        String dbUrl = "jdbc:mysql://localhost:3306/task1";
        String dbUser = "root";
        String dbPassword = "";

        // The image ID you want to retrieve from the database
        int imageId = 1;

        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
            String sql = "SELECT image FROM images_table WHERE id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, imageId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        byte[] imageBytes = rs.getBytes("image");
                        String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
    %>
                        <img src="data:image/png;base64,<%= base64Image %>" alt="Image">
    <%
                    } else {
    %>
                        <p>No image found for the given ID.</p>
    <%
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error occurred while fetching the image from the database.");
        }
    %>
</body>
</html>
