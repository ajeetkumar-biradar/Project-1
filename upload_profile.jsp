
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%

Connection con=null;

ResultSet rs=null;

PreparedStatement psmt=null;

FileInputStream fis;

String url="jdbc:mysql://localhost:3306/task1";

try{

Class.forName("com.mysql.jdbc.Driver").newInstance();

con=DriverManager.getConnection(url,"root","");

File image=new File("D:\image.jpg");

psmt=con.prepareStatement("insert into images_table(image)"+"values(?)");

fis=new FileInputStream(image);

psmt.setBinaryStream(1, (InputStream)fis, (int)(image.length()));

int s = psmt.executeUpdate();

if(s>0) {

%>

<b><font color="Blue">

<% out.println("Image Uploaded successfully !"); %>

</font></b>
<a href=""></a>

<%

}

else {

out.println("unsucessfull to upload image.");

}

con.close();

psmt.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>