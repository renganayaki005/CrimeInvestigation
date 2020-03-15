<%-- 
    Document   : addCasetoDB
    Created on : Mar 15, 2020, 3:25:06 PM
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
           String caseId=request.getParameter("caseId");
           String caseType=request.getParameter("caseType");
           String caseDesc=request.getParameter("caseDesc");
           Class.forName("oracle.jdbc.driver.OracleDriver");  
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","renga");  
           PreparedStatement pstmt=con.prepareStatement("insert into case(caseId,caseType,caseDesc) values(?,?,?)");  
           pstmt.setString(1,caseId);
           pstmt.setString(2,caseType);
           pstmt.setString(3,caseDesc);
           pstmt.executeUpdate();
           %><script>alert("<%out.print("Case Added!");%>");</script><%  
           RequestDispatcher rd=request.getRequestDispatcher("addCase.jsp");  
           rd.include(request, response);  
 
           
         %>
    </body>
</html>
