<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Download in Word Format</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    h2{
      text-align: center;
      color: #45a049;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    .download-btn {
      display: inline-block;
      padding: 8px 12px;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 10px;
    }

    .download-btn:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<h2>Download in Word Format</h2>
<div id="docx">
<div class="WordSection1">
  <table> 
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
  </div>
  </div>    
  <button class="download-btn" id="export">Download Table</button>
  <script>
    window.export.onclick = function() {

if (!window.Blob) {
  alert('Your legacy browser does not support this action.');
  return;
}

var html, link, blob, url, css;

// EU A4 use: size: 841.95pt 595.35pt;
// US Letter use: size:11.0in 8.5in;

css = (
 '<style>' +
 '@page WordSection1{size: 841.95pt 595.35pt;mso-page-orientation: landscape;}' +
 'div.WordSection1 {page: WordSection1;}' +
 'table{border-collapse:collapse;}td{border:1px gray solid;width:5em;padding:2px;}'+
 '</style>'
);

html = window.docx.innerHTML;
blob = new Blob(['\ufeff', css + html], {
 type: 'application/msword'
});
url = URL.createObjectURL(blob);
link = document.createElement('A');
link.href = url;
// Set default file name. 
// Word will append file extension - do not add an extension here.
link.download = 'Document';   
document.body.appendChild(link);
if (navigator.msSaveOrOpenBlob ) navigator.msSaveOrOpenBlob( blob, 'Document.doc'); // IE10-11
   else link.click();  // other browsers
document.body.removeChild(link);
};
  </script>
</body>
</html>
