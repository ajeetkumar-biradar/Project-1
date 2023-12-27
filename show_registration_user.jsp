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
      background-image: url(IMG_1165.HEIC);
      background-size: cover;
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
  h3{
    padding-left: 280px;
  }
  </style>
</head>
<body>
  <script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>
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
          <a class="nav-link" href="show_registration_user.jsp">Registration Details</a>
        </li>
      </ul>
       <a class="navbar-brand" href="#" >
        <h3>User</h3>
       </a>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <div class="profile-icon"></div>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
            <span class="dropdown-item">Ajeetkumar</span>
            <!-- <a class="dropdown-item" href="#">Settings</a>
            <div class="dropdown-divider"></div> -->
            <a class="dropdown-item" href="login.html"> <i class="fa fa-sign-out-alt"></i> </a>
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
ResultSet rs=stmt.executeQuery("select * from register where name like 'soumya%' ");
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