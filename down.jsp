<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>DataTable Example</title>
  <!-- Include the required stylesheets for DataTables and Buttons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">
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
      background-image: url(IMG_1165.HEIC);
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
      <!-- <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <div class="profile-icon">  </div>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
            <span class="dropdown-item">Ajeetkumar</span>
            <a class="dropdown-item" href="edit.jsp"><i class="fa fa-edit"></i> edit </a></i>
            </span>
            <a class="dropdown-item" href="download_doc.jsp"> <i class="fa fa-download"></i> Download</a>
            <a class="dropdown-item" href="login.html"><i class="fa fa-sign-out-alt"></i> log out</a>
          </div>
        </li>
      </ul> -->
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
      <table id="datatable">
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
    
        out.println("</tr>");
    }
    }//try
    catch(Exception e)
    {
    out.println(e);
    }
    %>
  </table>

  <!-- Include the required JavaScript libraries for DataTables, Buttons, and jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
  <script src="script.js"></script> <!-- Your custom script to initialize DataTables -->
</body>
</html>
