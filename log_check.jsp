<%@ page import="java.sql.*"%>
<%

    Connection con;
    Statement stmt;


  String s1,s2;

 s1=request.getParameter("t1");
 s2=request.getParameter("t2");

 try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");
    stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from login where username='"+s1+"' ");
    if(rs.next())
    {
        session.setAttribute("uname",s1);
        String pwd=rs.getString(2);
        String type=rs.getString(3);
        if(s2.equals(pwd))
        {
            if(type.equals("admin"))
            {
                %>
                <jsp:forward page="admin.html" />
                <%
            }
            else if(type.equals("user"))
            {
                %>
                <jsp:forward page="user.html" />
                <%
            }
        }
        else
        {
            out.println("check password");
            
        }
        }
        else
        {
            out.println("user not found");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
    
    %>
