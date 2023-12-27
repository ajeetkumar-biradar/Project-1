<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
// Get the parameters from the request
String userid = request.getParameter("userid");
String username = request.getParameter("username");
String location = request.getParameter("location");
String expertise = request.getParameter("expertise");
String rating = request.getParameter("rating");
String imageFileName = request.getParameter("image");

// Set up the database connection and statement
Connection con = null;
PreparedStatement pstmt = null;
try {
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task1", "root","");

  // Prepare the SQL statement with parameters for the image file
  String sql = "INSERT INTO talent (userid, username, location, expertise, rating, image) VALUES (?, ?, ?, ?, ?, ?)";
  pstmt = con.prepareStatement(sql);
  pstmt.setString(1, userid);
  pstmt.setString(2, username);
  pstmt.setString(3, location);
  pstmt.setString(4, expertise);
  pstmt.setString(5, rating);

  // Read the image file from disk and set it as a parameter to the statement
  File imageFile = new File(imageFileName);
  FileInputStream fis = new FileInputStream(imageFile);
  pstmt.setBinaryStream(6, fis, (int) imageFile.length());

  // Execute the SQL statement to insert the data
  int rowsAffected = pstmt.executeUpdate();

  // Check if the insertion was successful
  if (rowsAffected > 0) {
    out.println("Data inserted successfully!");
  } else {
    out.println("Data insertion failed!");
  }

  // Close the statement and database connection
  pstmt.close();
  con.close();
} catch (Exception e) {
  out.println("Error: " + e.getMessage());
  e.printStackTrace();
}
%>
