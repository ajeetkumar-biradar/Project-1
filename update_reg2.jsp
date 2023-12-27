<%@ page import="java.sql.*" %>
<%
String s1,s2,s3,s4,s5,s6,s7;
s1=request.getParameter("t1");
s2=request.getParameter("t2");
s3=request.getParameter("t3");
s4=request.getParameter("t4");
s5=request.getParameter("t5");
s4=request.getParameter("t6");
s5=request.getParameter("t7");


Connection con;
Statement stmt;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task1","root","");
    stmt=con.createStatement();
    int k=stmt.executeUpdate("update register set name='"+s2+"',number='"+s3+"',age='"+s4+"',address='"+s5+"',role='"+s6+"',gender='"+s7"' where s_no='"+s1+"' ");
    %>
        <jsp:forward page="show_registration.jsp" />
    <%
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>