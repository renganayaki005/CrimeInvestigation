<%-- 
    Document   : addSuspectinDB
    Created on : Mar 29, 2020, 11:12:31 PM
    Author     : RengaNayagi
--%>

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
           String suspectId=request.getParameter("suspectId");
           String caseId=request.getParameter("caseId");
           String name=request.getParameter("name");
           String address=request.getParameter("address");
           String phoneNo=request.getParameter("phoneNo");
           String city=request.getParameter("city");
           String state=request.getParameter("state");
           String country=request.getParameter("country");
           String association=request.getParameter("association");
           String Id=(String)session.getAttribute("Id");
           String History="Added suspect "+suspectId;
           Class.forName("oracle.jdbc.driver.OracleDriver");  
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","renga");  
           PreparedStatement pstmt=con.prepareStatement("insert into suspect(suspectId,caseId, name, address, city, state, country, phoneNo, association)values(?,?,?,?,?,?,?,?,?)");  
           pstmt.setString(1,suspectId);
           pstmt.setString(2,caseId);
           pstmt.setString(3,name);
           pstmt.setString(4, address);
           pstmt.setString(5, city);
           pstmt.setString(6, state);
           pstmt.setString(7, country);
           pstmt.setString(8, phoneNo);
           pstmt.setString(9, association);
           pstmt.executeUpdate();
           
           pstmt= con.prepareStatement("insert into caseHistory(caseId, History, updatedDate, Id)values(?,?,SYSDATE,?)");
           pstmt.setString(1,caseId);
           pstmt.setString(2, History);
           pstmt.setString(3, Id);
           pstmt.executeUpdate();
           

           %><script>alert("<%out.print("Suspect Added!");%>");</script><%  
           RequestDispatcher rd=request.getRequestDispatcher("addSuspect.jsp");  
           rd.include(request, response);     
         %>
    </body>
</html>
