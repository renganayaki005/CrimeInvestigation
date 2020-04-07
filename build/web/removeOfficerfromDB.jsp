<%-- 
    Document   : removeOfficerfromDB
    Created on : Mar 21, 2020, 2:26:00 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
             String Id=request.getParameter("officerId");
             out.print(Id);
             Class.forName("oracle.jdbc.OracleDriver");
             Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
             Statement st=con.createStatement();
             ResultSet rs;
             int i=st.executeUpdate("delete from officer where Id='"+Id+"'");
             i=st.executeUpdate("delete from signIn where Id='"+Id+"'");
             %><script>alert("<%out.print("Officer Removed!");%>");</script><%  
             RequestDispatcher rd=request.getRequestDispatcher("removeOfficer.jsp");  
             rd.include(request, response);
            %>   
    </body>
</html>
