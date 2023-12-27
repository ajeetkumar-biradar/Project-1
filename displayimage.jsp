import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageDisplay {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/task1";
        String user = "root";
        String password = "";

        String outputPath = "output_image.jpg"; // Path to save the retrieved image

        try (Connection conn = DriverManager.getConnection(jdbc:mysql://localhost:3306/task1","root","")) {
            String sql = "SELECT image FROM images WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, 1); // Replace 1 with the desired image ID

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    try (InputStream is = rs.getBinaryStream("image");
                         OutputStream os = new FileOutputStream(outputPath)) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = is.read(buffer)) != -1) {
                            os.write(buffer, 0, bytesRead);
                        }
                    }
                }
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
}
