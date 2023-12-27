<%@ page import="java.io.OutputStream, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
// Replace these with your database credentials
String dbURL = "jdbc:mysql://your_database_host:your_database_port/task1";
String dbUser = "task1";
String dbPassword = "";

// Replace this with your table name
String tableName = "documents";

// Get the document ID from the request
String documentId = request.getParameter("id");

// Set the MIME type and file name for the downloaded document
response.setContentType("application/octet-stream");
response.setHeader("Content-Disposition", "attachment; filename=\"downloaded_document.pdf\""); // Replace with the desired filename and appropriate file extension

// Establish the database connection
Connection connection = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");

    // Prepare the SQL query to fetch the document data
    String sql = "SELECT document_data FROM " + register + " WHERE id = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, documentId);

    // Execute the query
    ResultSet resultSet = statement.executeQuery();
    if (resultSet.next()) {
        // Fetch the document data from the result set
        byte[] documentData = resultSet.getBytes("document_data");

        // Get the output stream to write the document data to the response
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(documentData);
        outputStream.close();
    } else {
        // Document ID not found, handle it accordingly
        response.getWriter().println("Document not found");
    }

} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close the database connection
    try {
        if (connection != null) {
            connection.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
