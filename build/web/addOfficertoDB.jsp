<%-- 
    Document   : addOfficertoDB
    Created on : Mar 16, 2020, 12:12:06 AM
    Author     : RengaNayagi
--%>

<%@page import="javax.xml.ws.Response"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.Random"%>
       <%
           String officerId=request.getParameter("officerId");
           String password=request.getParameter("password");
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String phoneNo=request.getParameter("phoneNo");
           String agencyName=request.getParameter("agencyName");
           String deptId=request.getParameter("deptId");
           String userType=request.getParameter("userType");
           Class.forName("oracle.jdbc.driver.OracleDriver");  
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","renga");  
           PreparedStatement pstmt=con.prepareStatement("insert into Officer(Id, password, name, email, phoneNo, agencyName, deptId)values(?,?,?,?,?,?,?)");  
           pstmt.setString(1,officerId);
           pstmt.setString(2,password);
           pstmt.setString(3,name);
           pstmt.setString(4, email);
           pstmt.setString(5, phoneNo);
           pstmt.setString(6, agencyName);
           pstmt.setString(7, deptId);
           pstmt.executeUpdate();
           
           pstmt=con.prepareStatement("insert into signIn(Id, userType)values(?,?)");  
           pstmt.setString(1,officerId);
           pstmt.setString(2,userType);
           pstmt.executeUpdate();
           
           %><script>alert("<%out.print("Officer Added!");%>");</script><%  
           RequestDispatcher rd=request.getRequestDispatcher("addOfficer.jsp");  
           rd.include(request, response);  
 
           
         %>
    </body>
</html>
