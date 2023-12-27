<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
  <style>
    .navbar {
      background-color: #f8f9fa;
    }

    .navbar-brand {
      font-size: 24px;
      font-weight: bold;
    }

    .navbar-nav .nav-link {
      font-size: 18px;
      margin-right: 10px;
    } 

    .profile-section {
      margin-top: 10px;
      padding: 20px;
      color: white;
    }

    .profile-icon{
      width: 50px;
      height: 50px;
      border-radius: 35%;
      background-image: url();
    }

    .user-name {
      font-size: 15px;
      font-weight: bold;
    }

    .logout-btn {
      margin-top: 10px;
    }
    .custom-table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .custom-table th,
  .custom-table td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
  .custom-table th {
    background-color: #f2f2f2;
  }
  
  .custom-table td button {
    margin-right: 5px;
  }
  h1{
    text-align: center;
  }
  h3{
    padding-left: 160px;
  }
  </style>
</head>
<body>  
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <!-- <a class="navbar-brand" href="#">user</a> -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="#"> <i class="fa fa-home"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="registration.html">Registration</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="datatable1.jsp">Registration Details</a>
        </li>
      </ul>
       <a class="navbar-brand" href="#" >
        <h3>Admin</h3>
       </a>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <div class="profile-icon"> 
          
            <%@ page import="java.io.*, java.sql.*" %>
            <%@ page contentType="text/html;charset=UTF-8" %>
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
                        <img src="data:image/png;base64,<%= base64Image %>" alt="Image" width="45px" height="50px"  >
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

          </div>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
            <span class="dropdown-item">Ajeetkumar</span>
            <a class="dropdown-item" href="edit.jsp"><i class="fa fa-edit"></i> edit </a></i>
            </span>
            <a class="dropdown-item" href="down.jsp"> <i class="fa fa-download"></i> Download</a>
            <a class="dropdown-item" href="login.html"><i class="fa fa-sign-out-alt"></i> log out</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col">
        <h1>Registered Details</h1>
      </div>
    </div>
  </div>
  <div class="container">
  <table id="myTable" class="custom-table">
    <thead>
      <tr>
        <th>S_no</th>
        <th>Name</th>
        <th>Number</th>
        <th>Age</th>
        <th>Address</th>
	      <th>Role</th>
        <th>Gender</th>
        <th>image</th>
        <!-- <th>Action</th> -->
      </tr>
    </thead>
          
<%
Connection con;
Statement stmt;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");
stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from register ");
while(rs.next())
{
  out.println("<tr>");
    out.println("<td>"+rs.getString(1)+"</td>");
    %>
    <td>
      <i class="fa fa-user-circle fa-3x">
        <img src="" alt="">
      </i> <br>
    <%    
    out.println(""+rs.getString(2)+"</td>");
    out.println("<td>"+rs.getString(3)+"</td>");
    out.println("<td>"+rs.getString(4)+"</td>");
    out.println("<td>"+rs.getString(5)+"</td>");
    out.println("<td>"+rs.getString(6)+"</td>");
    out.println("<td>"+rs.getString(7)+"</td>");
    out.println("<td>"+rs.getString(8)+"</td>");

      
     /* if (rs.next()) {
          byte[] imageBytes = rs.getBytes("image");
          String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
%>
              <img src="data:image/png;base64,<%= base64Image %>" alt="Image">
<%
          }
        } */ 
    out.println("</tr>");
}
}//try
catch(Exception e)
{
out.println(e);
}
%>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script>
  $(document).ready(function() {
    $('#myTable').DataTable();
  });
</script>
</body>
</html>