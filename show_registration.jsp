<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registered Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.7.0.slim.js"></script>
  <style>
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

.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: 4px;
}

.btn-delete {
  background-color: #dc3545;
  color: #fff;
  border-color: #dc3545;
}

.btn-update {
  background-color: #007bff;
  color: #fff;
  border-color: #007bff;
}
</style>
<script>
  $(document).ready(function() {
    $('').DataTable();
  });
</script>
<script>

function search_name() {
    let input = document.getElementById('searchbar').value
    input=input.toLowerCase();
    let x = document.getElementsByTagName('td');
      
    for (i = 0; i < x.length; i++) { 
        if (!x[i].innerHTML.toLowerCase().includes(input))
        {
            x[i].style.display="none";
        }
        // else {
        //     x[i].style.display="list-item";                 
        // }
    }
}
</script>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Admin Page</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="login.html">Home</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="registration.html">Registaration</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="show_registration.jsp">Registaration Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="show_registration.jsp">Registaration Details</a>
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
  <table class="custom-table" id="mytable">
    <thead>
      <tr>
        <th>Sr_No</th>
        <th>Image</th>
        <th>Name</th>
        <th>Number</th>
        <th>Age</th>
        <th>Address</th>
        <th>Role</th>
        <th>Gender</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
          
<%
Connection con;
Statement stmt;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");
stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from register");
while(rs.next())
{
  out.println("<tr>");
    out.println("<td>"+rs.getString(1)+"</td>");

    out.println("<td>"+rs.getString(2)+"</td>");
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
</body>
</html>