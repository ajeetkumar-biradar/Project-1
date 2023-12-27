<%@ page import="java.sql.*"%>
<%
    String id;
    id=request.getParameter("cid");
    Connection con;
    Statement stmt;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");
    stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select*from register where name='"+id+"'");
    while(rs.next())
    {
        
%>

<!DOCTYPE html>
<html>
<head>
  <title>Updation Form</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    body{
      background-color: aliceblue;
    }
    h2{
        text-align: center;
        margin-top: 50px;
    }
    .error-message {
      color: red;
      font-size: 12px;
      margin-top: 5px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Updation Form</h2>
    <form action="update_reg2.jsp">
        <div class="form-group">
            <label for="name">Serial Number</label>
            <input type="text" class="form-control" id="name" name="t1" required>
            <span id="name-error" class="error-message"></span>
        </div>
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" class="form-control" id="name" name="t2" required>
        <span id="name-error" class="error-message"></span>
      </div>
      <div class="form-group">
        <label for="number">Number:</label>
        <input type="text" class="form-control" id="number" name="t3" required>
        <span id="number-error" class="error-message"></span>
      </div>
      <div class="form-group">
        <label for="age">Age:</label>
        <input type="text" class="form-control" id="age" name="t4" required> 
        <span id="number-error" class="error-message"></span>
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" class="form-control" id="address" name="t5" required>
        <span id="address-error" class="error-message"></span>
      </div>
      <div class="form-group">
        <label for="role">Role:</label>
        <select class="form-control" id="role" name="t6" required>
          <option value="">Select your role</option>
          <option value="Admin">Admin</option>
          <option value="user">User</option>
        </select>
        <div class="form-group">
            <label for="role">Select Gender:</label>
            <select class="form-control" id="role" name="t7" required>
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
            <span id="role-error" class="error-message"></span>
        </div>
        <span id="role-error" class="error-message"></span>
      </div>
      <button type="submit" class="btn btn-primary">Update</button>
    </form>
  </div>

<%
}
}
catch(Exception e)
{
    out.println(e);
}
%>
</body>
</html>
